Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568863A9A66
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbhFPMa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232628AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83533613B4;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=qKUbLk0xtnNadKlXdn/EeO4oDJ93Ar0xXfQmBBziOFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LJBiwanojbjXEXQ1rsgZyz8GPR5HEiyli45zosz5ZYXdP8vToDNOM/5o6uI12mqxl
         7NBcSooKly+DENF273JuXeFepx8edWo/hQpTY3oq1U/XXeTCt1AM+X6U7T3llQSKNd
         QvzDccmMqsmQDq1MpsVqSNhLia7YaYWj4U3UqjEXoS2aF7V8JXP+9YBN0rpC9LOvBM
         ya2bMTBOXc8V52PgclWb3n28M9JSqxUAyGA7k4cCfxBiT7ehor6GOGGrLzb16oEaSK
         jnWyEUMkWwj/9h7Xa/sKunN1tY6kWJW5xz/DBkKvTLUnaL5Jqx2DD+rLgksq9VOiND
         F4OrLKK0+k7gw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oiz-Gn; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 10/11] media: dvb-core: frontend: make GET/SET safer
Date:   Wed, 16 Jun 2021 14:28:36 +0200
Message-Id: <85bf8ff8a08f9c716ab856465f9939957f901f06.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The implementation for FE_SET_PROPERTY/FE_GET_PROPERTY has
a debug code that might be explored via spectre.
Improve the logic in order to mitigate such risk.

It should be noticed that, before this patch, the logic
which implements FE_GET_PROPERTY doesn't check the length passed
by the user, which might lead to expose some information. This
is probably not exploitable, though, as the frontend drivers
won't rely on the buffer length value set by userspace, but
it helps to return a valid value back to userspace.

The code was changed to only try to access an array based on
userspace values only when DVB debug is turned on, helping to
reduce the attack surface, as a speculation attack would work
only if DVB dev_dbg() macros are enabled, which is usually
enabled only on test Kernels or by the root user.

As a side effect, a const array size can now be reduced by
~570 bytes, as it now needs to contain just the name of each
DTV command.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 213 ++++++++++++++------------
 1 file changed, 113 insertions(+), 100 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index a6915582d1a6..3dccd3af385e 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -23,6 +23,7 @@
 #include <linux/poll.h>
 #include <linux/semaphore.h>
 #include <linux/module.h>
+#include <linux/nospec.h>
 #include <linux/list.h>
 #include <linux/freezer.h>
 #include <linux/jiffies.h>
@@ -1063,107 +1064,98 @@ static int dvb_frontend_clear_cache(struct dvb_frontend *fe)
 	return 0;
 }
 
-#define _DTV_CMD(n, s, b) \
-[n] = { \
-	.name = #n, \
-	.cmd  = n, \
-	.set  = s,\
-	.buffer = b \
-}
+#define _DTV_CMD(n) \
+	[n] =  #n
 
-struct dtv_cmds_h {
-	char	*name;		/* A display name for debugging purposes */
-
-	__u32	cmd;		/* A unique ID */
-
-	/* Flags */
-	__u32	set:1;		/* Either a set or get property */
-	__u32	buffer:1;	/* Does this property use the buffer? */
-	__u32	reserved:30;	/* Align */
-};
-
-static struct dtv_cmds_h dtv_cmds[DTV_MAX_COMMAND + 1] = {
-	_DTV_CMD(DTV_TUNE, 1, 0),
-	_DTV_CMD(DTV_CLEAR, 1, 0),
+static char *dtv_cmds[DTV_MAX_COMMAND + 1] = {
+	_DTV_CMD(DTV_TUNE),
+	_DTV_CMD(DTV_CLEAR),
 
 	/* Set */
-	_DTV_CMD(DTV_FREQUENCY, 1, 0),
-	_DTV_CMD(DTV_BANDWIDTH_HZ, 1, 0),
-	_DTV_CMD(DTV_MODULATION, 1, 0),
-	_DTV_CMD(DTV_INVERSION, 1, 0),
-	_DTV_CMD(DTV_DISEQC_MASTER, 1, 1),
-	_DTV_CMD(DTV_SYMBOL_RATE, 1, 0),
-	_DTV_CMD(DTV_INNER_FEC, 1, 0),
-	_DTV_CMD(DTV_VOLTAGE, 1, 0),
-	_DTV_CMD(DTV_TONE, 1, 0),
-	_DTV_CMD(DTV_PILOT, 1, 0),
-	_DTV_CMD(DTV_ROLLOFF, 1, 0),
-	_DTV_CMD(DTV_DELIVERY_SYSTEM, 1, 0),
-	_DTV_CMD(DTV_HIERARCHY, 1, 0),
-	_DTV_CMD(DTV_CODE_RATE_HP, 1, 0),
-	_DTV_CMD(DTV_CODE_RATE_LP, 1, 0),
-	_DTV_CMD(DTV_GUARD_INTERVAL, 1, 0),
-	_DTV_CMD(DTV_TRANSMISSION_MODE, 1, 0),
-	_DTV_CMD(DTV_INTERLEAVING, 1, 0),
+	_DTV_CMD(DTV_FREQUENCY),
+	_DTV_CMD(DTV_BANDWIDTH_HZ),
+	_DTV_CMD(DTV_MODULATION),
+	_DTV_CMD(DTV_INVERSION),
+	_DTV_CMD(DTV_DISEQC_MASTER),
+	_DTV_CMD(DTV_SYMBOL_RATE),
+	_DTV_CMD(DTV_INNER_FEC),
+	_DTV_CMD(DTV_VOLTAGE),
+	_DTV_CMD(DTV_TONE),
+	_DTV_CMD(DTV_PILOT),
+	_DTV_CMD(DTV_ROLLOFF),
+	_DTV_CMD(DTV_DELIVERY_SYSTEM),
+	_DTV_CMD(DTV_HIERARCHY),
+	_DTV_CMD(DTV_CODE_RATE_HP),
+	_DTV_CMD(DTV_CODE_RATE_LP),
+	_DTV_CMD(DTV_GUARD_INTERVAL),
+	_DTV_CMD(DTV_TRANSMISSION_MODE),
+	_DTV_CMD(DTV_INTERLEAVING),
 
-	_DTV_CMD(DTV_ISDBT_PARTIAL_RECEPTION, 1, 0),
-	_DTV_CMD(DTV_ISDBT_SOUND_BROADCASTING, 1, 0),
-	_DTV_CMD(DTV_ISDBT_SB_SUBCHANNEL_ID, 1, 0),
-	_DTV_CMD(DTV_ISDBT_SB_SEGMENT_IDX, 1, 0),
-	_DTV_CMD(DTV_ISDBT_SB_SEGMENT_COUNT, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYER_ENABLED, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERA_FEC, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERA_MODULATION, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERA_SEGMENT_COUNT, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERA_TIME_INTERLEAVING, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERB_FEC, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERB_MODULATION, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERB_SEGMENT_COUNT, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERB_TIME_INTERLEAVING, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERC_FEC, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERC_MODULATION, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERC_SEGMENT_COUNT, 1, 0),
-	_DTV_CMD(DTV_ISDBT_LAYERC_TIME_INTERLEAVING, 1, 0),
+	_DTV_CMD(DTV_ISDBT_PARTIAL_RECEPTION),
+	_DTV_CMD(DTV_ISDBT_SOUND_BROADCASTING),
+	_DTV_CMD(DTV_ISDBT_SB_SUBCHANNEL_ID),
+	_DTV_CMD(DTV_ISDBT_SB_SEGMENT_IDX),
+	_DTV_CMD(DTV_ISDBT_SB_SEGMENT_COUNT),
+	_DTV_CMD(DTV_ISDBT_LAYER_ENABLED),
+	_DTV_CMD(DTV_ISDBT_LAYERA_FEC),
+	_DTV_CMD(DTV_ISDBT_LAYERA_MODULATION),
+	_DTV_CMD(DTV_ISDBT_LAYERA_SEGMENT_COUNT),
+	_DTV_CMD(DTV_ISDBT_LAYERA_TIME_INTERLEAVING),
+	_DTV_CMD(DTV_ISDBT_LAYERB_FEC),
+	_DTV_CMD(DTV_ISDBT_LAYERB_MODULATION),
+	_DTV_CMD(DTV_ISDBT_LAYERB_SEGMENT_COUNT),
+	_DTV_CMD(DTV_ISDBT_LAYERB_TIME_INTERLEAVING),
+	_DTV_CMD(DTV_ISDBT_LAYERC_FEC),
+	_DTV_CMD(DTV_ISDBT_LAYERC_MODULATION),
+	_DTV_CMD(DTV_ISDBT_LAYERC_SEGMENT_COUNT),
+	_DTV_CMD(DTV_ISDBT_LAYERC_TIME_INTERLEAVING),
 
-	_DTV_CMD(DTV_STREAM_ID, 1, 0),
-	_DTV_CMD(DTV_DVBT2_PLP_ID_LEGACY, 1, 0),
-	_DTV_CMD(DTV_SCRAMBLING_SEQUENCE_INDEX, 1, 0),
-	_DTV_CMD(DTV_LNA, 1, 0),
+	_DTV_CMD(DTV_STREAM_ID),
+	_DTV_CMD(DTV_DVBT2_PLP_ID_LEGACY),
+	_DTV_CMD(DTV_SCRAMBLING_SEQUENCE_INDEX),
+	_DTV_CMD(DTV_LNA),
 
 	/* Get */
-	_DTV_CMD(DTV_DISEQC_SLAVE_REPLY, 0, 1),
-	_DTV_CMD(DTV_API_VERSION, 0, 0),
+	_DTV_CMD(DTV_DISEQC_SLAVE_REPLY),
+	_DTV_CMD(DTV_API_VERSION),
 
-	_DTV_CMD(DTV_ENUM_DELSYS, 0, 0),
+	_DTV_CMD(DTV_ENUM_DELSYS),
 
-	_DTV_CMD(DTV_ATSCMH_PARADE_ID, 1, 0),
-	_DTV_CMD(DTV_ATSCMH_RS_FRAME_ENSEMBLE, 1, 0),
+	_DTV_CMD(DTV_ATSCMH_PARADE_ID),
+	_DTV_CMD(DTV_ATSCMH_RS_FRAME_ENSEMBLE),
 
-	_DTV_CMD(DTV_ATSCMH_FIC_VER, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_NOG, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_TNOG, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_SGN, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_PRC, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_RS_FRAME_MODE, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_RS_CODE_MODE_PRI, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_RS_CODE_MODE_SEC, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_SCCC_BLOCK_MODE, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_A, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_B, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_C, 0, 0),
-	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_D, 0, 0),
+	_DTV_CMD(DTV_ATSCMH_FIC_VER),
+	_DTV_CMD(DTV_ATSCMH_NOG),
+	_DTV_CMD(DTV_ATSCMH_TNOG),
+	_DTV_CMD(DTV_ATSCMH_SGN),
+	_DTV_CMD(DTV_ATSCMH_PRC),
+	_DTV_CMD(DTV_ATSCMH_RS_FRAME_MODE),
+	_DTV_CMD(DTV_ATSCMH_RS_CODE_MODE_PRI),
+	_DTV_CMD(DTV_ATSCMH_RS_CODE_MODE_SEC),
+	_DTV_CMD(DTV_ATSCMH_SCCC_BLOCK_MODE),
+	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_A),
+	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_B),
+	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_C),
+	_DTV_CMD(DTV_ATSCMH_SCCC_CODE_MODE_D),
 
 	/* Statistics API */
-	_DTV_CMD(DTV_STAT_SIGNAL_STRENGTH, 0, 0),
-	_DTV_CMD(DTV_STAT_CNR, 0, 0),
-	_DTV_CMD(DTV_STAT_PRE_ERROR_BIT_COUNT, 0, 0),
-	_DTV_CMD(DTV_STAT_PRE_TOTAL_BIT_COUNT, 0, 0),
-	_DTV_CMD(DTV_STAT_POST_ERROR_BIT_COUNT, 0, 0),
-	_DTV_CMD(DTV_STAT_POST_TOTAL_BIT_COUNT, 0, 0),
-	_DTV_CMD(DTV_STAT_ERROR_BLOCK_COUNT, 0, 0),
-	_DTV_CMD(DTV_STAT_TOTAL_BLOCK_COUNT, 0, 0),
+	_DTV_CMD(DTV_STAT_SIGNAL_STRENGTH),
+	_DTV_CMD(DTV_STAT_CNR),
+	_DTV_CMD(DTV_STAT_PRE_ERROR_BIT_COUNT),
+	_DTV_CMD(DTV_STAT_PRE_TOTAL_BIT_COUNT),
+	_DTV_CMD(DTV_STAT_POST_ERROR_BIT_COUNT),
+	_DTV_CMD(DTV_STAT_POST_TOTAL_BIT_COUNT),
+	_DTV_CMD(DTV_STAT_ERROR_BLOCK_COUNT),
+	_DTV_CMD(DTV_STAT_TOTAL_BLOCK_COUNT),
 };
 
+static char *dtv_cmd_name(u32 cmd)
+{
+	cmd = array_index_nospec(cmd, DTV_MAX_COMMAND);
+	return dtv_cmds[cmd];
+}
+
+
 /* Synchronise the legacy tuning parameters into the cache, so that demodulator
  * drivers can use a single set_frontend tuning function, regardless of whether
  * it's being used for the legacy or new API, reducing code and complexity.
@@ -1346,6 +1338,7 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 				    struct file *file)
 {
 	int ncaps;
+	unsigned int len = 1;
 
 	switch (tvp->cmd) {
 	case DTV_ENUM_DELSYS:
@@ -1355,6 +1348,7 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 			ncaps++;
 		}
 		tvp->u.buffer.len = ncaps;
+		len = ncaps;
 		break;
 	case DTV_FREQUENCY:
 		tvp->u.data = c->frequency;
@@ -1532,27 +1526,51 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 	/* Fill quality measures */
 	case DTV_STAT_SIGNAL_STRENGTH:
 		tvp->u.st = c->strength;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	case DTV_STAT_CNR:
 		tvp->u.st = c->cnr;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	case DTV_STAT_PRE_ERROR_BIT_COUNT:
 		tvp->u.st = c->pre_bit_error;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	case DTV_STAT_PRE_TOTAL_BIT_COUNT:
 		tvp->u.st = c->pre_bit_count;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	case DTV_STAT_POST_ERROR_BIT_COUNT:
 		tvp->u.st = c->post_bit_error;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	case DTV_STAT_POST_TOTAL_BIT_COUNT:
 		tvp->u.st = c->post_bit_count;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	case DTV_STAT_ERROR_BLOCK_COUNT:
 		tvp->u.st = c->block_error;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	case DTV_STAT_TOTAL_BLOCK_COUNT:
 		tvp->u.st = c->block_count;
+		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
+			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
+		len = tvp->u.buffer.len;
 		break;
 	default:
 		dev_dbg(fe->dvb->device,
@@ -1561,18 +1579,13 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 		return -EINVAL;
 	}
 
-	if (!dtv_cmds[tvp->cmd].buffer)
-		dev_dbg(fe->dvb->device,
-			"%s: GET cmd 0x%08x (%s) = 0x%08x\n",
-			__func__, tvp->cmd, dtv_cmds[tvp->cmd].name,
-			tvp->u.data);
-	else
-		dev_dbg(fe->dvb->device,
-			"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
-			__func__,
-			tvp->cmd, dtv_cmds[tvp->cmd].name,
-			tvp->u.buffer.len,
-			tvp->u.buffer.len, tvp->u.buffer.data);
+	if (len < 1)
+		len = 1;
+
+	dev_dbg(fe->dvb->device,
+		"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
+		__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
+		tvp->u.buffer.len, tvp->u.buffer.len, tvp->u.buffer.data);
 
 	return 0;
 }
@@ -1870,7 +1883,7 @@ static int dtv_property_process_set(struct dvb_frontend *fe,
 	else
 		dev_dbg(fe->dvb->device,
 			"%s: SET cmd 0x%08x (%s) to 0x%08x\n",
-			__func__, cmd, dtv_cmds[cmd].name, data);
+			__func__, cmd, dtv_cmd_name(cmd), data);
 	switch (cmd) {
 	case DTV_CLEAR:
 		/*
-- 
2.31.1

