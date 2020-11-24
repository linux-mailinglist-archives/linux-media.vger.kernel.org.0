Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41BF2C23C2
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732727AbgKXLHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:33784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732256AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D498A20866;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=zJ7FMVeTSgK/rMUfd3h8Ux7PgJe3tKDQtxM+uNJAv7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OH3UM8Z1VDRx8tsYE5CWrlaR+NIMzlXSMFprAScFsfWeleMJ+uGbKLCfchC5R4e9O
         NIEKktNIGW773jIiXdLABF8Q2HFS3hpN1iJnPPVYPt57tnRUdvXnsABocImnGW+G91
         rWBQG8I1FybU8mo+aKFY6gvToTT/XhLWPfUS6P4Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZT-Lo; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 04/31] media: vidtv: fix the name of the program
Date:   Tue, 24 Nov 2020 12:06:00 +0100
Message-Id: <03e3c6b73a23aa27f5f602ef235df835c25d8b23.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the original plan was to use the first movement of
the 5th Symphony, it was opted to use the Für Elise song,
instead.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_s302m.c   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index b2d44d7e78b6..d80b1a56c90c 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -61,7 +61,7 @@ struct vidtv_channel
 	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
 	char *iso_language_code = ENCODING_ISO8859_15 "eng";
 	char *event_name = ENCODING_ISO8859_15 "Beethoven Music";
-	char *event_text = ENCODING_ISO8859_15 "Beethoven's 5th Symphony";
+	char *event_text = ENCODING_ISO8859_15 "Beethoven's Für Elise";
 	const u16 s302m_beethoven_event_id  = 1;
 	struct vidtv_channel *s302m;
 	struct vidtv_s302m_encoder_init_args encoder_args = {};
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 146e4e9d361b..cbf89530aafe 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -79,7 +79,7 @@ struct tone_duration {
 };
 
 #define COMPASS 120		/* beats per minute (Allegro) */
-static const struct tone_duration beethoven_5th_symphony[] = {
+static const struct tone_duration beethoven_fur_elise[] = {
 	{ NOTE_E_6, 128},  { NOTE_DS_6, 128}, { NOTE_E_6, 128},
 	{ NOTE_DS_6, 128}, { NOTE_E_6, 128},  { NOTE_B_5, 128},
 	{ NOTE_D_6, 128},  { NOTE_C_6, 128},  { NOTE_A_3, 128},
@@ -238,14 +238,14 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
 	if (!e->src_buf) {
 		/*
 		 * Simple tone generator: play the tones at the
-		 * beethoven_5th_symphony array.
+		 * beethoven_fur_elise array.
 		 */
 		if (ctx->last_duration <= 0) {
-			if (e->src_buf_offset >= ARRAY_SIZE(beethoven_5th_symphony))
+			if (e->src_buf_offset >= ARRAY_SIZE(beethoven_fur_elise))
 				e->src_buf_offset = 0;
 
-			ctx->last_tone = beethoven_5th_symphony[e->src_buf_offset].note;
-			ctx->last_duration = beethoven_5th_symphony[e->src_buf_offset].duration *
+			ctx->last_tone = beethoven_fur_elise[e->src_buf_offset].note;
+			ctx->last_duration = beethoven_fur_elise[e->src_buf_offset].duration *
 					     S302M_SAMPLING_RATE_HZ / COMPASS / 5;
 			e->src_buf_offset++;
 			ctx->note_offset = 0;
-- 
2.28.0

