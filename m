Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4CE2C65AE
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 13:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgK0MWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 07:22:22 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47105 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727455AbgK0MWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 07:22:21 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id iclSkPsuGDuFjiclWkqkCb; Fri, 27 Nov 2020 13:22:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606479738; bh=tO8qSW5OnpBmWb7DlqXlf6YMvdUzvHsImQT5vhtZeVM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Sd0PchQ6mX/qUeTohABP+0/s4h1Iqd1WFFKqKIE86yH5pz/E+ro1FyMjTauZscXtz
         jhI71rqJa4oBp6Uc8K71K/bAqzqQfJ3uNpdcRZXvN6hFNzC3MugR1cdsRNCCZolndu
         Fv7nO2WIsa1N6Y4ZygwGMTVV+os/E1aKamgGk0iPmBFRJrhJ4Sa6Ef6MnKnZzXIMV0
         +OsnC/9Q8RdGUmFiPWOs5F1Ds6UhJFzNE/BklRLDM/b06k+PvEGTqaU+ufPWWLm5Jc
         BzhCT2fwl7YCZcqSd65X7utAjf8/R7O0zSe2vPxxY9WjzdpMJrQTWQA50VpqInpT+2
         24jFgcY5dFQtg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.10 1/2] pulse8-cec: fix duplicate free at disconnect or probe error
Date:   Fri, 27 Nov 2020 13:22:13 +0100
Message-Id: <20201127122214.126701-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127122214.126701-1-hverkuil-cisco@xs4all.nl>
References: <20201127122214.126701-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCI2x+FT1W3infBpAwg8JpW+78HkGwN3u+nBE7/pVkwQcrqPHbLo+ltLF4qpNzfBJNEMjxtT0JfALfBMNstKdV+jdyE9BH2izAVJzm9tlTHGq7QZuOMl
 +zY+C2JHAn/byUsuIHsedSKn/BRDjP9OYTwaelkXsLX3Sb0uBV5HGbY6obK7Te7ABYBxnJMyFm/iBtg7TTSghjRERcOV9SjpvUBuRAJm7KhxR4D+wpA09xkr
 jEsI4YzQR+wcDyB50yNPKwJuKkgJaYWPFGgjVmrX2Nk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 601282d65b96b ("media: pulse8-cec: use adap_free callback") used
the adap_free callback to clean up on disconnect. What I forgot was that
in the probe it will call cec_delete_adapter() followed by kfree(pulse8)
if an error occurs. But by using the adap_free callback,
cec_delete_adapter() is already freeing the pulse8 struct.

This wasn't noticed since normally the probe works fine, but Pulse-Eight
published a new firmware version that caused a probe error, so now it
hits this bug. This affects firmware version 12, but probably any
version >= 10.

Commit aa9eda76129ca ("media: pulse8-cec: close serio in disconnect, not
adap_free") made this worse by adding the line 'pulse8->serio = NULL'
right after the call to cec_unregister_adapter in the disconnect()
function. Unfortunately, cec_unregister_adapter will typically call
cec_delete_adapter (unless a filehandle to the cec device is still
open), which frees the pulse8 struct. So now it will also crash on a
simple unplug of the Pulse-Eight device.

With this fix both the unplug issue and a probe() error situation are
handled correctly again.

It will still fail to probe() with a v12 firmware, that's something
to look at separately.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Maxime Ripard <maxime@cerno.tech>
Fixes: aa9eda76129ca ("media: pulse8-cec: close serio in disconnect, not adap_free")
Fixes: 601282d65b96b ("media: pulse8-cec: use adap_free callback")
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index e4d8446b87da..5d3a3f775bc8 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -650,7 +650,6 @@ static void pulse8_disconnect(struct serio *serio)
 	struct pulse8 *pulse8 = serio_get_drvdata(serio);
 
 	cec_unregister_adapter(pulse8->adap);
-	pulse8->serio = NULL;
 	serio_set_drvdata(serio, NULL);
 	serio_close(serio);
 }
@@ -830,8 +829,10 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 	pulse8->adap = cec_allocate_adapter(&pulse8_cec_adap_ops, pulse8,
 					    dev_name(&serio->dev), caps, 1);
 	err = PTR_ERR_OR_ZERO(pulse8->adap);
-	if (err < 0)
-		goto free_device;
+	if (err < 0) {
+		kfree(pulse8);
+		return err;
+	}
 
 	pulse8->dev = &serio->dev;
 	serio_set_drvdata(serio, pulse8);
@@ -874,8 +875,6 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 	serio_close(serio);
 delete_adap:
 	cec_delete_adapter(pulse8->adap);
-free_device:
-	kfree(pulse8);
 	return err;
 }
 
-- 
2.29.2

