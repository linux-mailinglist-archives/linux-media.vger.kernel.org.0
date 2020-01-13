Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87CC813935C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgAMOPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:15:49 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:49669 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgAMOPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:46 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOQu6-1j1Meb0nyI-00PtQg; Mon, 13 Jan 2020 15:15:39 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id DDDF164F293;
        Mon, 13 Jan 2020 14:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FJJfW3vl2UUn; Mon, 13 Jan 2020 15:15:38 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 8BB4264E2AB;
        Mon, 13 Jan 2020 15:15:38 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:38 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 46F3E804E9; Mon, 13 Jan 2020 15:15:38 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:38 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 5/8] media: adv748x: add an ASoC DAI definition to the driver
Message-ID: <20200113141538.GF3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1578924232.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:6FJRURYFpLuIRnEqV7dHBObZJ3W8OMcOPQAWg4QF66BHJHHtoET
 vvNJ/DpF9AH0ZK9nJjKSY3pUcd9KMZwwegHhqK/fG/HjCk6gqyenXtHW1ZHcVyXKEWrN4M5
 faY+QfS2otL/SMtO8GxCQRi33P3hdnbxEE/tKevsVELh5DhBdsvYNV+/QgTcoO1u/IND1mY
 AymYw4G00G1+nY8y5Iwmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OvP7KTwnn7I=:y61Rba4svO+wcAEAOhC5z5
 qVkYWGWDNB9JQ1Gumiy2jAUvKUA8JPLEvDP1fpQyYwrFR63tG3a2F0hwrSndL6xO6R0sgyvL+
 XrDgr3oP1d0KGmkUqttVQU5O3JbM8txu5gue3mazLXiHYssrZnWkoBuCrwz+K/8+9TGgzn/Jl
 Xlr6sSoEM5YvUP/GrtPm1qIbE2RRnESvhKET2x/fddKaok867Y1jRGHllMJhOlSkezk79zgm9
 QjtSG3QfLexY7tc5DsN22XiUDiAlmlvJkcrtyNlPTGOnC9i2Sr9pu83/kNW4NBd0J2T04tMG/
 5X01zGWVwny6Lp3BvhAD+mE1oNCyMImI/mHfwU+PsOIsGlrCsLQIBGwI9U0WtAsWMAH1X3ohu
 PGz5IRn/XGqUWhj77eOIFesAWOK0YsIyZf9yiYlIlCt7Y63KBvufXrR1ikKqIRAH6PU8ynZ4a
 3HDlIKHup7lZTOPyCs9MltB+OULHqhUEy2KybSXGK/wnuiB1p0oTYNnUIGwi0aSdnzMRBhd1N
 mAM/RkHnJjlIHfJFO9BkoBW06OC3RjcboaklD4XqCVri+ZaYehQftGpC8VxuDsb3eqHZ3az+4
 AajZGmSMO/kG8XcnkBBhkSafTFxKMf4VQgnrtWg17rt/gDoREORu5pUzAFX/K388p2XXBCdZh
 hMYt0Woila84XH6Hx5HpSps8nSgc1goL9Kmw1itmjJbpF44J4EWGJ76pgrngi1kU5Tnvof1mk
 pUtxRfWX1Qq9sK5SRQcpc6Iz+8y4xGIi4X4JGR5lXooMiMtQSfCbxIPa7F7+nA/Qwrt03Wlvi
 YX19uHWYhFLtf133uOoSIY71rz4mIr7oQRDUIjBPUK/CULWHzRYRrLqwUKfwiLlvrtEsTqehk
 uKDV0jgWN5/c/3TGSDWdnQMTYiatEf5SzqWqO1xy4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The definition is used to publish hardware constraints and can be used
to implement in-demand device configuration.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index b6067ffb1e0d..75e4bf144ad7 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -25,6 +25,7 @@
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
+#include <sound/soc.h>
 
 #include "adv748x.h"
 
@@ -689,6 +690,30 @@ static void adv748x_dt_cleanup(struct adv748x_state *state)
 		of_node_put(state->endpoints[i]);
 }
 
+static struct snd_soc_dai_driver adv748x_dai = {
+	.name = "adv748x-i2s",
+	.capture = {
+		.stream_name	= "Capture",
+		.channels_min	= 8,
+		.channels_max	= 8,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE,
+	 },
+};
+
+static	int adv748x_of_xlate_dai_name(struct snd_soc_component *component,
+				      struct of_phandle_args *args,
+				      const char **dai_name)
+{
+	if (dai_name)
+		*dai_name = adv748x_dai.name;
+	return 0;
+}
+
+static const struct snd_soc_component_driver adv748x_codec = {
+	.of_xlate_dai_name = adv748x_of_xlate_dai_name,
+};
+
 static int adv748x_probe(struct i2c_client *client)
 {
 	struct adv748x_state *state;
@@ -782,8 +807,16 @@ static int adv748x_probe(struct i2c_client *client)
 		goto err_cleanup_txa;
 	}
 
+	ret = devm_snd_soc_register_component(state->dev, &adv748x_codec,
+					      &adv748x_dai, 1);
+	if (ret < 0) {
+		adv_err(state, "Failed to register the codec");
+		goto err_cleanup_txb;
+	}
 	return 0;
 
+err_cleanup_txb:
+	adv748x_csi2_cleanup(&state->txb);
 err_cleanup_txa:
 	adv748x_csi2_cleanup(&state->txa);
 err_cleanup_afe:
-- 
2.24.1.508.g91d2dafee0

