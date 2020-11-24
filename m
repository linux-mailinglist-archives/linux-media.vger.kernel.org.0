Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD672C23B3
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732659AbgKXLHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:33782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732510AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 647542224B;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=O5YA2daQ2PVF7S6o+dJ6lOfdvKBuryeRKLtdPfVwqkA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VM3bV33qqRzmRbnLZTvgJ4J9olIbMCfQ4T3LX/yWRhLeg26LaqgdBvd6sxxMeuBt7
         f0AdBq8Lc//YzJU6KbgmeM/WS14j8JYoI1Yd+7l1zgBtYOp+kw3qoXXAsA8SU0dVXl
         1cQJSZxe2JnEcoCNhucHUBU77ndmkOkPt05gqJZY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000Fal-F3; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 31/31] media: vidtv: cleanup a few coding style issues
Date:   Tue, 24 Nov 2020 12:06:27 +0100
Message-Id: <639aa44f09966ff300dee3564872e79efa82b021.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a few warnings produced by checkpatch.pl on
strict mode.

They're all trivial. Address them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c  |  1 -
 drivers/media/test-drivers/vidtv/vidtv_channel.c |  2 --
 drivers/media/test-drivers/vidtv/vidtv_demod.c   |  1 -
 drivers/media/test-drivers/vidtv/vidtv_pes.c     |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c     | 10 +++++-----
 drivers/media/test-drivers/vidtv/vidtv_psi.h     |  2 --
 6 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index ff9333dfa772..fc64d0c8492a 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -367,7 +367,6 @@ static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
 	u32 freq;
 	int i;
 
-
 	/* TODO: check if the frequencies are at a valid range */
 
 	memcpy(cfg.vidtv_valid_dvb_t_freqs,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 023e3dc04ce2..8ad6c0744d36 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -395,7 +395,6 @@ static struct vidtv_psi_desc_service_list_entry
 				return NULL;
 			}
 
-
 			curr_e->service_id = s->service_id;
 			curr_e->service_type = s_desc->service_type;
 
@@ -460,7 +459,6 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 	if (!m->si.eit)
 		goto free_nit;
 
-
 	/* assemble all programs and assign to PAT */
 	vidtv_psi_pat_program_assign(m->si.pat, programs);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 63ac55b81f39..b7823d97b30d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -193,7 +193,6 @@ static void vidtv_demod_update_stats(struct dvb_frontend *fe)
 
 	c->cnr.stat[0].svalue = state->tuner_cnr;
 	c->cnr.stat[0].svalue -= prandom_u32_max(state->tuner_cnr / 50);
-
 }
 
 static int vidtv_demod_read_status(struct dvb_frontend *fe,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
index 42464d842e95..782e5e7fbb02 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -307,7 +307,7 @@ u32 vidtv_pes_write_into(struct pes_write_args *args)
 		.dest_buf		= args->dest_buf,
 		.dest_buf_sz		= args->dest_buf_sz,
 		.pid			= args->pid,
-		.pcr		  	= args->pcr,
+		.pcr			= args->pcr,
 		.continuity_counter	= args->continuity_counter,
 	};
 	struct pes_header_write_args pes_header_args = {
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 9df6bca4e0a4..4511a2a98405 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -645,7 +645,7 @@ static u32 vidtv_psi_desc_write_into(struct desc_write_args *args)
 		.is_crc             = false,
 		.dest_buf_sz        = args->dest_buf_sz,
 		.crc                = args->crc,
-		.len 		    = sizeof_field(struct vidtv_psi_desc, type) +
+		.len		    = sizeof_field(struct vidtv_psi_desc, type) +
 				      sizeof_field(struct vidtv_psi_desc, length),
 	};
 	struct vidtv_psi_desc_service_list_entry *serv_list_entry = NULL;
@@ -1869,9 +1869,9 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args *args)
 	struct psi_write_args psi_args  = {
 		.dest_buf        = args->buf,
 		.len             = sizeof_field(struct vidtv_psi_table_eit, transport_id) +
-			           sizeof_field(struct vidtv_psi_table_eit, network_id)   +
-			           sizeof_field(struct vidtv_psi_table_eit, last_segment) +
-			           sizeof_field(struct vidtv_psi_table_eit, last_table_id),
+				   sizeof_field(struct vidtv_psi_table_eit, network_id)   +
+				   sizeof_field(struct vidtv_psi_table_eit, last_segment) +
+				   sizeof_field(struct vidtv_psi_table_eit, last_table_id),
 		.pid             = VIDTV_EIT_PID,
 		.new_psi_section = false,
 		.is_crc          = false,
@@ -1971,7 +1971,7 @@ struct vidtv_psi_table_eit_event
 
 	mjd = 14956 + time.tm_mday;
 	mjd += (time.tm_year - l) * 36525 / 100;
-	mjd += (time.tm_mon + 2 + l * 12) *306001 / 10000;
+	mjd += (time.tm_mon + 2 + l * 12) * 306001 / 10000;
 	mjd_be = cpu_to_be16(mjd);
 
 	/*
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 3103e7ba5cb3..340c9fb8d583 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -681,7 +681,6 @@ struct vidtv_psi_table_nit
 			  char *network_name,
 			  struct vidtv_psi_desc_service_list_entry *service_list);
 
-
 /**
  * struct vidtv_psi_nit_write_args - Arguments for writing a NIT section
  * @buf: The destination buffer.
@@ -746,7 +745,6 @@ struct vidtv_psi_table_eit
 			  u16 transport_stream_id,
 			  u16 service_id);
 
-
 /**
  * struct vidtv_psi_eit_write_args - Arguments for writing an EIT section
  * @buf: The destination buffer.
-- 
2.28.0

