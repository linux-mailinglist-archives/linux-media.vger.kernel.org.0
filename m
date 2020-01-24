Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487DB148AA3
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 15:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbgAXOwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 09:52:42 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37871 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730287AbgAXOwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 09:52:42 -0500
Received: from [IPv6:2001:983:e9a7:1:dded:8f92:97b:fe6e]
 ([IPv6:2001:983:e9a7:1:dded:8f92:97b:fe6e])
        by smtp-cloud7.xs4all.net with ESMTPA
        id v0K6iwlx3rNgyv0K7i5xRH; Fri, 24 Jan 2020 15:52:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579877559; bh=nt1ev1AELOP1XXIhaMPga7o+NX7tYinIX5AKHOo2IS4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PWodr7GoiJQCjKHj7WinuZpCEAEbZ6GEOwZJAjbIpPxw29jpyxKZ35kFBN1psKU9q
         nUG9QYIgn4FDnm1r33c0g8C7Au1P054i5Wjp+4EUIMlNDSIJ2evzMeUxMSNNc4uPwm
         l6hts17jvzLFf32X2bU4GtWwYQCAM/EnN8EaoGjs1ZRosICwy0benD6Ldhvze6hFoF
         9sC+I+hgUFSM4+UIxEe+h5Cv2kmnVC6YQSa9a4jYn4BK23XM77Dtx3I3WfB7/UlzhT
         9AAepsOv1Obz3H+jASew0w11N0s8+Pfxcy85TX4hyaCcBOqQbiOlflJDyXRmbLN3Jj
         77EL0+UDF2zcA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.6] pulse8-cec: close serio in disconnect, not adap_free
Message-ID: <a6ddffaa-f650-8842-387b-f58549a59dd0@xs4all.nl>
Date:   Fri, 24 Jan 2020 15:52:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI3VGN6lqufDaJwm3d9tgUN/owYVptcQ1ND6yPy3EPaN1TMt9kdYIGnLhQf+OA3HXxZ6o8c/cEqRUjWKglwC59TUvKwtx5G7eMlWVs7nDaiYIt0rtTqD
 AN0MIe9LcO6tzeOkb5weTahYDd3STCmVb8NBcg/HoXU5UAMLdQYmpdkZunBIa8AdT6nG2xhQiCTbwHj9q65NwZaTlAeZNjVzZhRLEg3UKIgWdLadxOMbsL6O
 dlzwzueD0FuqqRXnqsnRfC78Jzz6GWnIkbXr3DAWyLw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The serio_close() call was moved to pulse8_cec_adap_free(),
but that can be too late if that is called after the serio
core pulled down the serio already, in which case you get
a kernel oops.

Keep it in the disconnect().

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Fixes: 601282d65b96 ("media: pulse8-cec: use adap_free callback")
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 8d61bcec14bb..0655aa9ecf28 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -635,8 +635,6 @@ static void pulse8_cec_adap_free(struct cec_adapter *adap)
 	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
 	cancel_work_sync(&pulse8->irq_work);
 	cancel_work_sync(&pulse8->tx_work);
-	serio_close(pulse8->serio);
-	serio_set_drvdata(pulse8->serio, NULL);
 	kfree(pulse8);
 }

@@ -652,6 +650,9 @@ static void pulse8_disconnect(struct serio *serio)
 	struct pulse8 *pulse8 = serio_get_drvdata(serio);

 	cec_unregister_adapter(pulse8->adap);
+	pulse8->serio = NULL;
+	serio_set_drvdata(serio, NULL);
+	serio_close(serio);
 }

 static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
@@ -872,10 +873,11 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 	return 0;

 close_serio:
+	pulse8->serio = NULL;
+	serio_set_drvdata(serio, NULL);
 	serio_close(serio);
 delete_adap:
 	cec_delete_adapter(pulse8->adap);
-	serio_set_drvdata(serio, NULL);
 free_device:
 	kfree(pulse8);
 	return err;
-- 
2.23.0

