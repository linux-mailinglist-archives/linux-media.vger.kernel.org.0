Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF76B28FB
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2019 01:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390705AbfIMXzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 19:55:15 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40735 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390695AbfIMXzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 19:55:14 -0400
Received: by mail-io1-f68.google.com with SMTP id h144so66265154iof.7;
        Fri, 13 Sep 2019 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3VViACYA451Huc+LtS7zi8sLCA8aVNyRPy9i0iM2GDI=;
        b=u+ggpLTcaq339c2+f3rAkLb54fKQpdkq3J6sVCXOqfGhelJxp2mCB8bAEBNzC7FH8o
         P8crxVpK13Nsp577LkLXyKaW2JJjz1OwcoICYOGPj3LNVO2Ath+NI60FjJpPWJ38JL8m
         p324Omsau/Be646rkyZpswvsPYOgWeGFsIU8/JNTbrnCvBlSlTLJK5hJvzegJILcN7mx
         m8kT5JwtTA+m8LJUZQfvpHit/UeP26CgqjQljfasFqss1kQ5wWXFlHe4tiObzhxZqxnp
         UQd9L0o94P5palf14PIxjKxCOjPQFrDqlMj84BvliGEcbB24ZjE87nIwV1CQLaCwIXpj
         YN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3VViACYA451Huc+LtS7zi8sLCA8aVNyRPy9i0iM2GDI=;
        b=SAbbPV7da3xXyuuVPrFgWL2Po8KhClOZywCdu53H+0JWwDciRszlO38NeSbjG8Yh6S
         DTotrRLjuIfs9KFFTK/3Nvpa2xjWOVhqPGG6El7egCbZ7jwb7T2bYZvwhSeCHq03YC5A
         bnuAKbiER+gdgbs/nRSpT9KGu4gF6BkbEi2UUpQgKr0YGAoA3wI1zzYMKv5xcDOeaXzH
         TZiy+HfJGeAotXc28UbPwImzuVqYTN3K2TfINYBE0jJJmxmniDCKZE9NcaI/TRMkED6F
         JESpWRTQ9u1gnN5PMBRzklH7KcxeI6SMwM72io/OF/xK16SXDEqtkFJoOGUdoe+R2POr
         M60Q==
X-Gm-Message-State: APjAAAUDYFXH15fauIv02QCfr8F0fq91EN16m9onZ8shBrOFnKTiHJAz
        JH2XIKC3ZyD/RYkJN5wSYdU=
X-Google-Smtp-Source: APXvYqxkKUUtkwic4jRqCz27WVubjYpWonkpiAPsJeQd45CS9E9tD5VtULCBx/wyK4xtoT0vEOKphQ==
X-Received: by 2002:a5e:9509:: with SMTP id r9mr3154422ioj.100.1568418913865;
        Fri, 13 Sep 2019 16:55:13 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id q74sm44394874iod.72.2019.09.13.16.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 16:55:13 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: usb: fix memory leak in af9005_identify_state
Date:   Fri, 13 Sep 2019 18:55:02 -0500
Message-Id: <20190913235505.9164-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In af9005_identify_state when returning -EIO the allocated buffer should
be released.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/media/usb/dvb-usb/af9005.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index 02697d86e8c1..aee500beaab6 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -975,8 +975,10 @@ static int af9005_identify_state(struct usb_device *udev,
 		*cold = 1;
 	else if (reply == 0x02)
 		*cold = 0;
-	else
+	else {
+		kfree(buf);
 		return -EIO;
+	}
 	deb_info("Identify state cold = %d\n", *cold);
 
 err:
-- 
2.17.1

