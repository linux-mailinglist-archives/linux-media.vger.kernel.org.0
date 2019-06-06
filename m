Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3FF3757A
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbfFFNlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:41:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40730 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbfFFNl3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 09:41:29 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so2473950wmj.5
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
        b=PTfsAfjsY3oSeBXdMfkfbzyMxHay18usgjxancBC261D9HS/oJoPW8MRYTwi9k+cgd
         C5pIrO03DPJuZGj/KNYUCiZcuFYCVrUT3+mxUO85wpM9uza5rK1+bYgK62GhoCBe4yAY
         mN5RwsM35bRD96SmVPNGUje6hvbcZCeRWs02OCP3IP5VqnaubgQyD9chTChxI+Up5+Ei
         uzkRx6+L+7ckE4FzaR7Na/9w7yrac80z51g5n2hq1mzRdG0rAw2hLsN+MhKvdgTO/N8T
         mRfqierqUjkjftsjsmAkDwvic8gv86SrA+ybXHPq9LaLqzMwVUY2BxGoBQAXG0z8HOKF
         oqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
        b=GsmeVx+nD5qkHwC7QtcjVxvmXlxZ1SLbkoF2gwenxcJFu0CIMLgzmk5tqcKPfQ3R7g
         TU0j1yhWwSBmBXzua+wMIDHwnhHB1zwL1J4gLyws3GXzWKkvPResgtQtHZPX4PECj7Ui
         RQehZ0FQQWQeCsh6zn5s0VKClCXoRPobk09QD98O3cnhrbvSdt10in11PAGanU1HNDwg
         k4261u17p5xeIpD6GAd7YAIsOp+HAIhNZE9ypWjhEIPuq4mR2Xvn8hhv8Y+M4nm1VfBB
         jQsPv7EHb6tHQQ8yEiEsubpVu6SZqcBfKTp0mx7XnEgJPnouhlTYB8xuDVMpf4QvFbGZ
         b9Wg==
X-Gm-Message-State: APjAAAWPg9PeyTGZpgCJWHylK8YMhXsfChdz6CyZPHsp8aeMblvK8lRn
        /Jyr6eTXiwz9fn22mYC8wtDTpg==
X-Google-Smtp-Source: APXvYqyCUOdIPEBrdpfpAXbm0UVmVJdKLxKlwPhqBO3kAZC/II9ZDgcuQbgSw0/eBfjKkYYNG+Rhxg==
X-Received: by 2002:a1c:6154:: with SMTP id v81mr61488wmb.92.1559828487221;
        Thu, 06 Jun 2019 06:41:27 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c11sm1847367wrs.97.2019.06.06.06.41.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 06:41:26 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v9 3/3] MAINTAINERS: Add meson video decoder
Date:   Thu,  6 Jun 2019 15:41:22 +0200
Message-Id: <20190606134122.16854-4-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606134122.16854-1-mjourdan@baylibre.com>
References: <20190606134122.16854-1-mjourdan@baylibre.com>
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
index b8fbf41865c2..7cf3ece9f0cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10222,6 +10222,14 @@ S:	Maintained
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

