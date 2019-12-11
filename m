Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4FD211B888
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730462AbfLKQWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:37 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41433 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730297AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbs; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=ycAUlqLqyKSQuI4E7fR3wCQCMMKQ6P3CaRvswAcxWDg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ph7x9iYy5yWRhDhCHshj12Z9CX/ofcMG4l0/+asH55p9zL2vL1eESHp/g1P2OnkL/
         Bf5N6w7b1QM/DvIA3l91tFScWFop+nekEeMO3KwuTuBnSb8AoAsOgJBcDppxkcLyCU
         eyAg0/QViPbDDhX+xkDwQqqxUSL8B2QWxi6w8Wuk1Kys1k4ZwELSASoyckGWtgviqm
         hBG3D/1v+ozkJcfLKy19Mty14NSBQHFvPwT9gsAfKt65+MgDB1kyNCdQ1KnmmeFsTk
         7nbAD9TG3FdUm394t0aS0m0swOcicZ/sg7m5J7uVJvXF8PLFU1JdYQKDjuK5NvwPNR
         VZ5iYXWTwcd9Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 08/10] pulse8-cec: use adap_free callback
Date:   Wed, 11 Dec 2019 17:22:29 +0100
Message-Id: <20191211162231.99978-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191211162231.99978-1-hverkuil-cisco@xs4all.nl>
References: <20191211162231.99978-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLIuqXjK/nGb1Cb9ikFROFqZEzmt2J7yWvtecDDS5F8o0dP/p5K1rS7xn74w8YDg+F2LT4hgg+nqsiYVn6jFki0p7KwOiFZnBesw3h0xLBDnPalo5IY5
 VE+BRsUOL/dTfjcMEXZaO0UO85SHdk3joVWdbVzGvBitF0wQ/jRdl3yVeoOAHWlm/vId6aznsElobMYLfIEpn3iaJQofMu7Ff0yBVsZU13kbY/HhVOPo+iWy
 g37kMwDBkMBOeTCpyTbJCXcq6WTZP2Nx9SBniQpCoEQXnYw0jbEhMLZgFEue0gc4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't free everything in the disconnect callback, instead use
the adap_free callback, which is called when the last open
filehandle is closed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 961b34dfaf6d..d18d1f456576 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -624,10 +624,23 @@ static int pulse8_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return 0;
 }
 
+static void pulse8_cec_adap_free(struct cec_adapter *adap)
+{
+	struct pulse8 *pulse8 = cec_get_drvdata(adap);
+
+	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
+	cancel_work_sync(&pulse8->irq_work);
+	cancel_work_sync(&pulse8->tx_work);
+	serio_close(pulse8->serio);
+	serio_set_drvdata(pulse8->serio, NULL);
+	kfree(pulse8);
+}
+
 static const struct cec_adap_ops pulse8_cec_adap_ops = {
 	.adap_enable = pulse8_cec_adap_enable,
 	.adap_log_addr = pulse8_cec_adap_log_addr,
 	.adap_transmit = pulse8_cec_adap_transmit,
+	.adap_free = pulse8_cec_adap_free,
 };
 
 static void pulse8_disconnect(struct serio *serio)
@@ -635,13 +648,6 @@ static void pulse8_disconnect(struct serio *serio)
 	struct pulse8 *pulse8 = serio_get_drvdata(serio);
 
 	cec_unregister_adapter(pulse8->adap);
-	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
-	cancel_work_sync(&pulse8->irq_work);
-	cancel_work_sync(&pulse8->tx_work);
-	dev_info(&serio->dev, "disconnected\n");
-	serio_close(serio);
-	serio_set_drvdata(serio, NULL);
-	kfree(pulse8);
 }
 
 static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
-- 
2.23.0

