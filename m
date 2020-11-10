Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDB42ACB9D
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 04:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgKJDVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 22:21:23 -0500
Received: from mail.codeweavers.com ([50.203.203.244]:42478 "EHLO
        mail.codeweavers.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgKJDVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 22:21:23 -0500
X-Greylist: delayed 1027 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 22:21:23 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/ZuODjsCGNjBdFOIqlZlXT70GJUC3IHxOLn8UfvUPCw=; b=Z/2TE/jAK4uvAAK8H30hGo+5/r
        kbtQ3MM5J5h2DnTf7S4CNKqs47a5EaqkmIOwCleS9zUszCh7Z0bZpdIbwIsw+1nPsGnBNcc2UNycy
        pbt6aXbdCDFfygBaWZpfp3QcvmJKNmbM4e6UmAfHcRtGF4F+y/A2VME1ReTevTQM0cR4=;
Received: from [64.191.7.9] (helo=watership.localdomain)
        by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <zfigura@codeweavers.com>)
        id 1kcJx7-0001gI-Q7; Mon, 09 Nov 2020 21:04:15 -0600
From:   Zebediah Figura <zfigura@codeweavers.com>
To:     linux-media@vger.kernel.org
Cc:     Zebediah Figura <zfigura@codeweavers.com>
Subject: [PATCH] media: cx231xx: Use snd_card_free_when_closed() instead of snd_card_free().
Date:   Mon,  9 Nov 2020 21:04:03 -0600
Message-Id: <20201110030403.118606-1-zfigura@codeweavers.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -35.2
X-Spam-Report: Spam detection software, running on the system "mail.codeweavers.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  cx231xx_close_extension and hence cx231xx_audio_fini() are
    called with the cx231xx device lock held, but snd_cx231xx_pcm_close() also
    grabs that mutex when closing the file on behalf of arecord. There [...] 
 Content analysis details:   (-35.2 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 USER_IN_WELCOMELIST    user is listed in 'welcomelist_from'
  -20 USER_IN_WHITELIST      DEPRECATED: See USER_IN_WELCOMELIST
  -20 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
  5.3 AWL                    AWL: Adjusted score from AWL reputation of From: address
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cx231xx_close_extension and hence cx231xx_audio_fini() are called with the
cx231xx device lock held, but snd_cx231xx_pcm_close() also grabs that mutex
when closing the file on behalf of arecord. There seems to be no reason to
wait for sound card resources to be released, so let the release be
asynchronous.

Tested with a Hauppauge 955Q (2040:b123) and Linux 5.9.6; the hang described in
the bug no longer occurs and disconnecting the device correctly terminates
arecord with ENODEV.

Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=204087
Signed-off-by: Zebediah Figura <zfigura@codeweavers.com>
---
On the model of the USB audio driver (among others), I am inclined to believe
this is a correct approach. I have also tried to check for any potential
use-after-free bugs that might occur as a result of this patch, and been unable
to easily find any. However, as a new contributor, I am not familiar with the
USB, ALSA, or DVB frameworks, and there is a good chance that I have missed
something.

 drivers/media/usb/cx231xx/cx231xx-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-audio.c b/drivers/media/usb/cx231xx/cx231xx-audio.c
index de42db6f6ad1..9c71b32552df 100644
--- a/drivers/media/usb/cx231xx/cx231xx-audio.c
+++ b/drivers/media/usb/cx231xx/cx231xx-audio.c
@@ -670,7 +670,7 @@ static int cx231xx_audio_fini(struct cx231xx *dev)
 	}
 
 	if (dev->adev.sndcard) {
-		snd_card_free(dev->adev.sndcard);
+		snd_card_free_when_closed(dev->adev.sndcard);
 		kfree(dev->adev.alt_max_pkt_size);
 		dev->adev.sndcard = NULL;
 	}
-- 
2.29.2

