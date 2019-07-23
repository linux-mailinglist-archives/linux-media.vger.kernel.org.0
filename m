Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895B471D4E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 19:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390969AbfGWRED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 13:04:03 -0400
Received: from rime.area49.net ([173.255.231.124]:51944 "EHLO rime.area49.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390967AbfGWRED (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:04:03 -0400
X-Greylist: delayed 1575 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Jul 2019 13:04:03 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=area49.net;
         s=20170228; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=XQnhAoK2rBsF7YrzRe45lPkI3olPTYqXfklS7lal+5k=; b=dTqwFu/n5pm6oS8x/ljkfsNkfX
        /nv8yg/OOy4z11bG+MX/Ifz8GlxI3i2viVjqH/DP0bF3nCazteg0Wzr7kYDH6YjbtajVkV+QIRq6e
        WCvgqpI7UyKrBxGhUncjggttCjLqLePzLkfFnytHgh2Q/0JdajYuPtTVTf9Y22qsf4aWWnWIWlgNG
        pOMVagAiA0GGBHgVoEiG3lTFJdXTh5QpHm8rtDKb+g9h4pvoTkucZIxUSEaNCjI0fgrU/Z+lhN3/H
        Ttn9hJe43XYOncqsHPVkh2JwvfaNLYiJiZQVpbLdXn4oUI3RG5pACSwbcgR1VVYKnOAIWpNYpnOBt
        c2CkC0sQ==;
Received: from pool-71-178-35-130.washdc.fios.verizon.net ([71.178.35.130] helo=[192.168.1.155])
        by rime.area49.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <alpha@area49.net>)
        id 1hpxnO-0007oO-JX; Tue, 23 Jul 2019 12:37:46 -0400
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>
From:   Darius Rad <alpha@area49.net>
Subject: [PATCH] media: rc: imon: Allow iMON RC protocol for ffdc 7e device
Message-ID: <3702ce97-8a03-1a37-9c40-e7844931f5ff@area49.net>
Date:   Tue, 23 Jul 2019 12:37:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow selecting the IR protocol, MCE or iMON, for a device that
identifies as follows (with config id 0x7e):

15c2:ffdc SoundGraph Inc. iMON PAD Remote Controller

As the driver is structured to default to iMON when both RC
protocols are supported, existing users of this device (using MCE
protocol) will need to manually switch to MCE (RC-6) protocol from
userspace (with ir-keytable, sysfs).

Signed-off-by: Darius Rad <alpha@area49.net>
---

The hardware I have (described in the commit) only supports the iMON
protocol; whereas the driver only supports the MCE protocol.  The
unfortunate side effect of this change is that the default setting
will cause problems for existing users.

Allowing a different default protocol for this device will take
more invasive changes.  If it will help this patch be accepted, I
can propose such changes.

  drivers/media/rc/imon.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 7bee72108b0e..37a850421fbb 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -1826,12 +1826,17 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
  		break;
  	/* iMON VFD, MCE IR */
  	case 0x46:
-	case 0x7e:
  	case 0x9e:
  		dev_info(ictx->dev, "0xffdc iMON VFD, MCE IR");
  		detected_display_type = IMON_DISPLAY_TYPE_VFD;
  		allowed_protos = RC_PROTO_BIT_RC6_MCE;
  		break;
+	/* iMON VFD, iMON or MCE IR */
+	case 0x7e:
+		dev_info(ictx->dev, "0xffdc iMON VFD, iMON or MCE IR");
+		detected_display_type = IMON_DISPLAY_TYPE_VFD;
+		allowed_protos |= RC_PROTO_BIT_RC6_MCE;
+		break;
  	/* iMON LCD, MCE IR */
  	case 0x9f:
  		dev_info(ictx->dev, "0xffdc iMON LCD, MCE IR");
-- 
2.20.1
