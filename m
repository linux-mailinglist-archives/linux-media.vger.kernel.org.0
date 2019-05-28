Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D6D2CB7B
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfE1QPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33066 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfE1QPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:02 -0400
Received: by mail-wr1-f67.google.com with SMTP id d9so20912102wrx.0;
        Tue, 28 May 2019 09:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3h/ecQLrMT2ucERTZI2NW1VKv8RQf1gI3c06ij/3do=;
        b=D5pq9A53V3P9k5+gbZIFnj5zFyfkgKo8QUOAK/VdGTy/pyx9OZkU7Goo8ozjnmItMx
         qIG6DBQkLPHluH+sofuoOmzmqWG8QonXzcFxyerBdd1K/QkVGEbFGUrAX0YSbPjpd0ia
         nk1xIKa//ve/OYm3cirDoMTrwR47IbZNxqVx+lZ7NZ78H6dE8w6VV5keqQgcr0zUIyu7
         A0q195IybosxV87mktHmPSzPYq7Ja9yXXfTEijUaEDkXNC+mK/0eHRJqFSdwDtWjogjI
         NFzYyHaIh69k8ozvHH/io83FVtowbL/Mk327kYEptEA57c5G1vDfOSvOiuyLg7rxqKuO
         GS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3h/ecQLrMT2ucERTZI2NW1VKv8RQf1gI3c06ij/3do=;
        b=Gz8pxd97fqJwE5Joa9OP0ahVewgHvOIdFWlOf5dop9ooUrp1PVl15UszNfiRudopOY
         BjSZcWjJl4+1TPrhOzDfP4bzXjVTRAMwaV1hjBRRqCVjedefpao5Qq7PHJ75hkPBnKGF
         5VYT8UuXPpkCQzIRp79DNzuff28JF0MslE5s6sRBpEXuZvjz5dC48O6xuTcztOCUmcUu
         zVK5hPc7mmmdO4z/6niArAFfu42XPI+oKXhTTBJVuQHIPksRnlEJ6PvsFia9Xmh3X4Dy
         y0hBj8jZ+QBusMkaUNPN32Ttd1Y2XlFStkgzqWTEfBrte+OoVsJT50Rou02tb2fw5oxB
         K7Fg==
X-Gm-Message-State: APjAAAV4/WfFIIroackte2KBlBRQl1A8UOZowGY9b5uiGWdJyNcr2wEd
        BqmhlqgbiFd3SRPDBY1VSk8=
X-Google-Smtp-Source: APXvYqw+Fn2shJGkDvqlag2JfFVAEIqjo/jGZI3aD2VVf3zhyZapNInCTDMQlRBL/alZdHiIXmrdGQ==
X-Received: by 2002:adf:dc04:: with SMTP id t4mr1689193wri.126.1559060100435;
        Tue, 28 May 2019 09:15:00 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.14.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:14:59 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 05/12] ARM: dts: sunxi: Prefer A31 bindings for IR
Date:   Tue, 28 May 2019 18:14:33 +0200
Message-Id: <20190528161440.27172-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since A31, memory mapping of the IR driver has changed.

Prefer the A31 bindings instead of A13.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 84977d4eb97a..f0f5ba349c1b 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -822,7 +822,7 @@
 		};
 
 		ir: ir@1f02000 {
-			compatible = "allwinner,sun5i-a13-ir";
+			compatible = "allwinner,sun6i-a31-ir";
 			clocks = <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
 			clock-names = "apb", "ir";
 			resets = <&r_ccu RST_APB0_IR>;
-- 
2.20.1

