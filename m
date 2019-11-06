Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5F1F1454
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 11:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731506AbfKFKtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 05:49:43 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39221 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731486AbfKFKtn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 05:49:43 -0500
Received: by mail-wr1-f67.google.com with SMTP id a11so25139183wra.6
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 02:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kl4ziYImo8mxXSUIUzerWcurMfUG2nKE46XW1BkCvlw=;
        b=kxBJiJoCz+uvEjlaoHMgcQr+fPhAS0j2sc8HQCdJjk0eOme7VQHHlm3TDIUwxNStV/
         IAr8TqzToP3BUIwWnA7k3eNZDWdns4KTC1BChbku6s+9vm65UyDEPJIgV4KXwCKpfUHR
         3GqU0MH9ui+CytCItnEbyCTbgcvYV7VjZW0QGrt/jtVusHHPs8WevG+USUqczTgjBlq4
         kD6WEBWIFfNMsOfhxJRESwTtuQfvK5JMtJdJfKFxXFe+hKKplRvMHMUAf5DaA7nMaRw9
         2q24dcf3jUtUASsUuACt6r/sejqO/Dx1+pNfRBy3dce6DwxTECCghcvZySDx55qOM/c5
         OeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kl4ziYImo8mxXSUIUzerWcurMfUG2nKE46XW1BkCvlw=;
        b=aYRB5dr+O73oxErSZFjWjkVoSqV83E9krk5/IQSXbVVMAoMcRjNZRt1/TZ1fziHb8C
         wYomwfuAueFsfMWlLeMjnX8EQIYagZq4VDHykHuUh4OYM22yFN90Vpre0bYzm6npVhn2
         MrFHmJDY1+7pboBNeCFAdKH9dSWiOxM0pkZoA8lIxt3AIKmYbvdbKAbbXgSf1t8omVEc
         e0spNFM2Psj2K3kDP/k/pWR0+LA3HuGNEEPIQlAPs5182yAQggvoS6P8xzaaHDupcSjR
         4pXynCgY4z4icPH3QSm4Uj65Af9B9I2+AvY8yRvkYic2v3I6/eOh7OfYVyh1FAaS2Mbb
         jGcA==
X-Gm-Message-State: APjAAAVF5uu/sfLY0EFDqUUdF0jLFXzubXbmueA7e9ZNwro/PHvuBxHR
        f1tErtgQ09KJnjgW002NYrz8JA==
X-Google-Smtp-Source: APXvYqzq1lHX4GDEZEPtsCJdyQnYK9ZIjkX+6ml9wEgDrjlLUn4+3HRgIK41WbnzWNEb4WSW+nUPmg==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr1978787wru.344.1573037381252;
        Wed, 06 Nov 2019 02:49:41 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b14sm2331695wmj.18.2019.11.06.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 02:49:40 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl, mchehab@kernel.org
Cc:     linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] MAINTAINERS: ao-cec: Update path for yaml bindings
Date:   Wed,  6 Nov 2019 11:49:35 +0100
Message-Id: <20191106104935.24307-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the path to the ao-cec bindings after convertion to DT Schemas.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b51c83..11108701cadf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10581,7 +10581,7 @@ W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/media/platform/meson/ao-cec.c
 F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
+F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 T:	git git://linuxtv.org/media_tree.git
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
-- 
2.22.0

