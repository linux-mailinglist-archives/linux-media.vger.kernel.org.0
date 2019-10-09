Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4EDCD11F9
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 17:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731616AbfJIPCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 11:02:03 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42812 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731345AbfJIPCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 11:02:02 -0400
Received: by mail-io1-f65.google.com with SMTP id n197so5621046iod.9;
        Wed, 09 Oct 2019 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z4AULEV/1OkpdS8GLMgMKJd/N77GZOnH9zsY4Or4awY=;
        b=C9/GlktKQq+UhJCklxy/wjmeurDA98BmMhZJF7gWghXkqGR5TwN2McupN4XJSGPt7p
         d4GAYgQHni4sRNU6dIxV2d2TiDaFHyILSeioe/6tunKhDQBXHPGcHbBT+vLwzK2qdJLH
         tghQKUJCnN9+QMmBJYc6ZLPvYzeZ7KKC3s5WhSPBmr3C3crVaUDmM6GGClE569a54Y/g
         E4UDfk5+xalXRAZHa7BUVza7co5w4JjVFtUjvtxKV3+DikfksDmsoBVYusgkBMBaEfzI
         i5owPMLt583bhrZtQUHNrDb2LLSP2j1RQGoyhyDSSyeHMqiqbWVuSEjIVRauhRtmYc+q
         djPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Z4AULEV/1OkpdS8GLMgMKJd/N77GZOnH9zsY4Or4awY=;
        b=nhaS8DKwj5fP7dp08tO5afuDFBpLloF6h/aB+elat1o6/QJuzeTGYV5hIFAaLVkDCU
         jKJzWBNFBhwuoa4x/czHJTlOCXTk1EbXA8QYTyHbNexxlSnIHpnRnP+XWswY9hhtlmHW
         tFSpgwL+jTvhJTZAVHDEmPaRFnbZS76smaTSzIpbs0LfihBZ5UzyAr0f+cQLbRG0peiN
         6oCzq1Y6uMYuFUj8cbaoAOQhKtpgtARX+NIqOlVhH7DZRDccgOGoy1O3kscpc93g3xFe
         3ck2Jnc0C0rQuHB5+yciB2RqVNSkhdvlf0Fjpno1ugtKf3uNmCFDr8ptR+O3sfLaaDK2
         w/BA==
X-Gm-Message-State: APjAAAW01ft1pT5MBdao+ccHYRckOWu1WLMl2FGI/75OsTZJcCiZZ5HQ
        FlP0JJS3lRS/WZk2NUV0GP4=
X-Google-Smtp-Source: APXvYqwil7LDiZE5RwUQR46RyNkw6ou97UIC4KBDGqdtGNtTWZlQ2CgXipbFbCGXn/Tkj0Y4Ueq2zA==
X-Received: by 2002:a6b:8b56:: with SMTP id n83mr3724862iod.200.1570633321809;
        Wed, 09 Oct 2019 08:02:01 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id t9sm1157429iop.86.2019.10.09.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 08:02:01 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: usb: fix memory leak in af9005_identify_state
Date:   Wed,  9 Oct 2019 10:01:47 -0500
Message-Id: <20191009150150.1087-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6de2396d-eaa4-5cb4-9a1d-f253503bcf48@xs4all.nl>
References: <6de2396d-eaa4-5cb4-9a1d-f253503bcf48@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In af9005_identify_state when returning -EIO the allocated buffer should
be released. Replace the "return -EIO" with assignment into ret and move
deb_info() under a check.

Fixes: af4e067e1dcf ("V4L/DVB (5625): Add support for the AF9005 demodulator from Afatech")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v2:
	-- Reused the error handling to release buf
	-- Added Fixes tag
---
 drivers/media/usb/dvb-usb/af9005.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index 02697d86e8c1..bc6e7659c37b 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -975,9 +975,10 @@ static int af9005_identify_state(struct usb_device *udev,
 		*cold = 1;
 	else if (reply == 0x02)
 		*cold = 0;
-	else
-		return -EIO;
-	deb_info("Identify state cold = %d\n", *cold);
+	else
+		ret = -EIO;
+	if (!ret)
+		deb_info("Identify state cold = %d\n", *cold);
 
 err:
 	kfree(buf);
-- 
2.17.1

