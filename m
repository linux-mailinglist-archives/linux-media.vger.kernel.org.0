Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522CB269F8B
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 09:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgIOHWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 03:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:43466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgIOHWO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 03:22:14 -0400
Received: from mail.kernel.org (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 356292080C;
        Tue, 15 Sep 2020 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600154533;
        bh=6qPomrYty0ynUFfaleIaujbyDH6LqlXrj62ixs2/gQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YDTdFPDvJWwoPud9FSBwsSUJLYGHPO0HrjkWW6lfRw7vBu3NOkrrufvP+5uOh2Bvu
         WojjSHQac6Wi7BaNPVjgPIuyLf7ItKkRyOR4UFhEXXVV+dt9CXK3iq01MyrQ0QE53g
         IbcqMbMspy/3rx4jVek5im4e9vcRpwGx8IPZOtDA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kI5I2-004XJf-Mo; Tue, 15 Sep 2020 09:22:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: vidtv: add DiSEqC dummy ops
Date:   Tue, 15 Sep 2020 09:22:07 +0200
Message-Id: <84f1cd09c78e62219cfe5f23bf833586f20ed02f.1600154449.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600154449.git.mchehab+huawei@kernel.org>
References: <cover.1600154449.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those are needed for real applications to work with Satellite
systems.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_demod.c    | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index c825842758f0..8afdfb369ed1 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -320,6 +320,32 @@ static int vidtv_demod_set_voltage(struct dvb_frontend *fe,
 	return 0;
 }
 
+/*
+ * NOTE:
+ * This is implemented here just to be used as an example for real
+ * demod drivers.
+ *
+ * Should only be implemented if the demod has support for DVB-S or DVB-S2
+ */
+static int vidtv_send_diseqc_msg(struct dvb_frontend *fe,
+				 struct dvb_diseqc_master_cmd *cmd)
+{
+	return 0;
+}
+
+/*
+ * NOTE:
+ * This is implemented here just to be used as an example for real
+ * demod drivers.
+ *
+ * Should only be implemented if the demod has support for DVB-S or DVB-S2
+ */
+static int vidtv_diseqc_send_burst(struct dvb_frontend *fe,
+				   enum fe_sec_mini_cmd burst)
+{
+	return 0;
+}
+
 static void vidtv_demod_release(struct dvb_frontend *fe)
 {
 	struct vidtv_demod_state *state = fe->demodulator_priv;
@@ -376,8 +402,11 @@ static const struct dvb_frontend_ops vidtv_demod_ops = {
 	.read_signal_strength = vidtv_demod_read_signal_strength,
 
 	/* For DVB-S/S2 */
-	.set_voltage = vidtv_demod_set_voltage,
-	.set_tone    = vidtv_demod_set_tone,
+	.set_voltage		= vidtv_demod_set_voltage,
+	.set_tone		= vidtv_demod_set_tone,
+	.diseqc_send_master_cmd	= vidtv_send_diseqc_msg,
+	.diseqc_send_burst	= vidtv_diseqc_send_burst,
+
 };
 
 static const struct i2c_device_id vidtv_demod_i2c_id_table[] = {
-- 
2.26.2

