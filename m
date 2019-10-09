Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A1FD11B2
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730503AbfJIOtW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 10:49:22 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50275 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728019AbfJIOtW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 10:49:22 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IDHDihfQajZ8vIDHEiIaRr; Wed, 09 Oct 2019 16:49:20 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] cec-pin: add 'received' callback
Message-ID: <dc12566b-2fec-6735-cdbc-089e22e536c0@xs4all.nl>
Date:   Wed, 9 Oct 2019 16:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEfEzjn5b5tbe2ibNSTcQbCyI2gP+gIywLmqHqeAz5wrrxRCTuLcCUFnKlV2OwxIxXcj1v2luHkpgg2fgI/fpoFGqQUJYDzOvq8lhpFr7RrD8uFzsvJe
 D8NDbyDqjXybtjtqzq/o8HbKKDF1l4DtD6O+MCX1DZ7fEUTBJneJHktAvMoyQPw/X45QGgkqzLF9ui7vvOSTy6iAEtUlHIUHbfTjmxc1iI7gkGDu0R8nncB6
 EYMJH9ZRA4Gn+HwzJPZ+TzddWMwsYLehrbQx0Vf/aJr4KSjdtBtxYC1MJJ40GKF3y8uWNoERkeGhP8yY9DOtTA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers that use the CEC pin framework have no way of processing messages
themselves by providing the 'received' callback. This is present in cec_ops,
but not in cec_pin_ops.

Add support for this callback.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/cec-pin.c b/drivers/media/cec/cec-pin.c
index 8f987bc0dd88..660fe111f540 100644
--- a/drivers/media/cec/cec-pin.c
+++ b/drivers/media/cec/cec-pin.c
@@ -1279,6 +1279,15 @@ static void cec_pin_adap_free(struct cec_adapter *adap)
 	kfree(pin);
 }

+static int cec_pin_received(struct cec_adapter *adap, struct cec_msg *msg)
+{
+	struct cec_pin *pin = adap->pin;
+
+	if (pin->ops->received)
+		return pin->ops->received(adap, msg);
+	return -ENOMSG;
+}
+
 void cec_pin_changed(struct cec_adapter *adap, bool value)
 {
 	struct cec_pin *pin = adap->pin;
@@ -1301,6 +1310,7 @@ static const struct cec_adap_ops cec_pin_adap_ops = {
 	.error_inj_parse_line = cec_pin_error_inj_parse_line,
 	.error_inj_show = cec_pin_error_inj_show,
 #endif
+	.received = cec_pin_received,
 };

 struct cec_adapter *cec_pin_allocate_adapter(const struct cec_pin_ops *pin_ops,
diff --git a/include/media/cec-pin.h b/include/media/cec-pin.h
index 604e79cb6cbf..88c8b016eb09 100644
--- a/include/media/cec-pin.h
+++ b/include/media/cec-pin.h
@@ -29,8 +29,11 @@
  *		an error if negative. If NULL or -ENOTTY is returned,
  *		then this is not supported.
  *
- * These operations are used by the cec pin framework to manipulate
- * the CEC pin.
+ * @received:	optional. High-level CEC message callback. Allows the driver
+ *		to process CEC messages.
+ *
+ * These operations (except for the @received op) are used by the
+ * cec pin framework to manipulate the CEC pin.
  */
 struct cec_pin_ops {
 	bool (*read)(struct cec_adapter *adap);
@@ -42,6 +45,9 @@ struct cec_pin_ops {
 	void (*status)(struct cec_adapter *adap, struct seq_file *file);
 	int  (*read_hpd)(struct cec_adapter *adap);
 	int  (*read_5v)(struct cec_adapter *adap);
+
+	/* High-level CEC message callback */
+	int (*received)(struct cec_adapter *adap, struct cec_msg *msg);
 };

 /**
