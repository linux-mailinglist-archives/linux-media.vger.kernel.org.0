Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59087B5317
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 18:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbfIQQf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 12:35:26 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38802 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730517AbfIQQfY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 12:35:24 -0400
Received: by mail-io1-f66.google.com with SMTP id k5so9156127iol.5
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 09:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=294+1pNE1QvrA8K+k/rIQCwQYW84ev1PmbYotCH5RCQ=;
        b=Tfh+5yMrHUYKeKA9+q9X6Xhm8+u0RWVyyxHdAX3aZLxwUsRnoeNaDspvl/Un73Bwcq
         pnSPCVbxML9W+UK0zA6h+xDzQ1aNt9SoJrM1RHuV/WAJ4yhq/ZC1U64Bi2Fj2iYsBIs8
         KCi2E5pJsZ7F3KklKGa85rzhKvCnRActTpNuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=294+1pNE1QvrA8K+k/rIQCwQYW84ev1PmbYotCH5RCQ=;
        b=aV1kdHlu450SxSfajdqxge2UKSDeeOT3mmXDVRcnDmlpIR1TtIwUhEcJ+W5aQxotxQ
         DwKhSqrXaVaPfbap6c/U6dnBahN2Q3waGLcQdeh9bKypIafIDuRPitK6QWtyHYeYrf8V
         EnORYejFjqi+AqVjIVDvzaPC8PgHG03rK9mQxeqVi7j08inmE7cC1PolWugnvtq5vFXO
         hriPlmmEpBBSFI7Tem9amNnlj5uJlnBgQysFXYmCTWiH0d5Ua+3tJWZNsza+1WcqFKhb
         9mDSiRH4V3uGfZAMiyeij37dvPWd1WARH/0PycMqk9zppqhax/8iVR5daeLm9SUYkwbJ
         53EQ==
X-Gm-Message-State: APjAAAVuesT834aSIG5HjyhO53trvMWWIDK9s6BSYmWxVYTDGzzkucuR
        EBsrav7Oe4C/l2l5b/6mYPVEBw==
X-Google-Smtp-Source: APXvYqylcBKYmKIgGAXRltGvqqvimwBhgilW0kwtUz36uYE1R/OGf1EPI+4k/kLL9WPdRjdp2/iXxA==
X-Received: by 2002:a02:ce2b:: with SMTP id v11mr2431784jar.134.1568738123063;
        Tue, 17 Sep 2019 09:35:23 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v3sm2593781ioh.51.2019.09.17.09.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:35:22 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com,
        skhan@linuxfoundation.org, andrealmeid@collabora.com,
        dafna.hirschfeld@collabora.com, hverkuil-cisco@xs4all.nl,
        davem@davemloft.net, gregkh@linuxfoundation.org,
        nicolas.ferre@microchip.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] MAINTAINERS: Add reviewer to vimc driver
Date:   Tue, 17 Sep 2019 10:35:12 -0600
Message-Id: <e0665a825bbef9027bcbc5a9d14c3ac8b902d3c3.1568689325.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568689325.git.skhan@linuxfoundation.org>
References: <cover.1568689325.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After practically re-writing the driver to collpase it into a monolith,
I am adding myself as a reviewer for vimc driver.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c62b45201d7..4529d257f8db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17041,6 +17041,7 @@ F:	include/media/videobuf2-*
 
 VIMC VIRTUAL MEDIA CONTROLLER DRIVER
 M:	Helen Koike <helen.koike@collabora.com>
+R:	Shuah Khan <skhan@linuxfoundation.org>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	https://linuxtv.org
-- 
2.20.1

