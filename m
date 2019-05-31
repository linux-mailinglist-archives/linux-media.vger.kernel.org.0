Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D64AE30BA4
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 11:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfEaJb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 05:31:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38933 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbfEaJbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 05:31:37 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so5468966wma.4
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4XUFa5U6isWZ7sY5b7KzRU7MZCM9RrE7vyQt7fpmtT4=;
        b=MLOrSTV7dTXzxU49x4bDt+i4tkXD7kzAQpmwQ9bfTBv/B0cg9fAvuxgqkLXRIjEr9c
         aFSbGbkA3xaQsc40nPleliurFUDWlHuT4f5hb74t2arP26m0Nf0g7fBCgMJY42OYRBJd
         KDUmnjhPwj9+0aeWInVRsHpjkRC3ymeKr2WmduIQMk2YS97ZOmrx0mk3OKc+iQunLVp0
         hNifdZ6j4EsjCbskrCt5DYr9K6H3ODgVt43y27Xnqa5Y0ShU5EgUTr/DJ09GhQVB81cU
         z/QrhG3bjKA0sP5isGkvTkti38x+V22BYt6RfBT1cNnjXVEoqa3L/iOhEsK2v4nSW1YA
         LcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4XUFa5U6isWZ7sY5b7KzRU7MZCM9RrE7vyQt7fpmtT4=;
        b=IukLfS+HUrYnG7/sXqt36A0p0kOJLx21oipoe1L/+xoukF+0XA2zVwpfOrIRLdZCuh
         nNlCd8ic8B3YqxYYZ0PWwDu05GXl/fFETobWnKblf9kTxyyRASvJKSy7nX6BNpF+R9RB
         Uwd5m6JLbvbEOaVDv9wR11DVqM+3XEd2uoIQ8d4ReFKgri49ZGoHnB/TS9muKwxN1khx
         OC+yrS0jO/tuiRGfSFMgY3A2fL7Fm5X2PYpjxslkeDcnFh4hKGA693mqKUCaRfkSZvtF
         EdYY4Bcb1hKmGz2e3A8lcMpn9CODaX8pTQo5dzo9JE7FTtvy+nB0wF1CKGFrq5H0yFfn
         DIBQ==
X-Gm-Message-State: APjAAAWmBru/JWg/YrikxOSpMvjU2d5lFyCSJAIQfeleZh7+2mOne6R5
        x/m/Jjlhzl+0tw+1oo6fUH3FPXGO+wc=
X-Google-Smtp-Source: APXvYqzgrqYZPxkbQY0KTYLUCn3TpwKRSYfNypkhzNaTip4VP3njQzLsn0of+r+EUNCcWFHL4ErJtw==
X-Received: by 2002:a1c:4083:: with SMTP id n125mr4896062wma.54.1559295095233;
        Fri, 31 May 2019 02:31:35 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id b136sm7187023wme.30.2019.05.31.02.31.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 02:31:34 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v7 4/4] MAINTAINERS: Add meson video decoder
Date:   Fri, 31 May 2019 11:31:26 +0200
Message-Id: <20190531093126.26956-5-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531093126.26956-1-mjourdan@baylibre.com>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an entry for the meson video decoder for amlogic SoCs.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 429c6c624861..4aa50e83a494 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10215,6 +10215,14 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/meson_*
 F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 
+MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS
+M:	Maxime Jourdan <mjourdan@baylibre.com>
+L:	linux-media@lists.freedesktop.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+F:	drivers/staging/media/meson/vdec/
+T:	git git://linuxtv.org/media_tree.git
+
 METHODE UDPU SUPPORT
 M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
-- 
2.21.0

