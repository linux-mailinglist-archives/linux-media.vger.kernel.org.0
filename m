Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E897103856
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbfKTLOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:14:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54378 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729029AbfKTLOk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:14:40 -0500
Received: by mail-wm1-f67.google.com with SMTP id z26so6525744wmi.4
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvIKYbv02jfkUFc5yq+y3wt+kyYSZpa4lPRFM3efvsQ=;
        b=uxjV/l32qVppX/6hMVYuLEHcOzTj2V82Am9eU53lR9/+lCm7uQx0b9YxSnHTPQ2RO2
         kL/nKisP9MMXL2jYLueogpXsVMaPPbGFTCb/jGhjw4leb0TyI0idM0AlU2tAuOWqhNxM
         Bqk/fIB8fJYIkxRuSMzWrXXUER86zpAKud6mSMe1uPEW+wBRA3rKKt83LHZv3tJdfkWY
         TnWsDxjkeZ1Nd32BfTPn0Vqv9FCyLBzt5Vbaunp905EyhrTtIijoXRk7/6RgHOP/7KYx
         lsmVWz5XokU4Yky4+lN8W8NzSRK6N3Ht8/cHS+kEb5i70Q5qlu6u6CpFJo3P6qvgeycm
         /sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvIKYbv02jfkUFc5yq+y3wt+kyYSZpa4lPRFM3efvsQ=;
        b=iQTA7YrSpaux5lyczjT97OHxR3eJmJgOYOmqEQVb7kRVJx27xnjkCWXMhg/AcGWRRI
         nzSGtB3Kimq9Razfilln7zj5qvnNwnxJ16xtCMG+7svRECiOtQhm2dZ9Ck4xPkHnAxst
         wYb9/5gpo5bvmYhvn8fOqo2UvwyzJwuLSJ+U3lxUe+E7DWKSvOSkUhuSu7NhO0OdQnvN
         SnZPtbx2NK+ZLkVoQecqV5v6km++KHslnWctCZkpCjMQdD3SzZeHFy0aqs6SAnwgvcvR
         1M8skxuH2XVCIIIdtRQ19EanPA4ooRkcC1pzMKzgCpzzuwbQ820LcHzpm8CD48N1afNG
         zPkw==
X-Gm-Message-State: APjAAAWOnCpSRYaLiLiVYqNfbG/3hvhR9VqUpESo86tkr5Qcumns2t12
        Wicw2iJNyfBK+Mfxk4VCNoZ67g==
X-Google-Smtp-Source: APXvYqzweKOlyuKQyMd1c/pQf5Z3HB8SFvqepcvQaZ5FjDPXqF7JOhs3aoQy+ZURieFYrTLyR80vzQ==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr2616954wmk.50.1574248477850;
        Wed, 20 Nov 2019 03:14:37 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u1sm6061748wmc.3.2019.11.20.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:14:37 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/4] arm64: dts: meson-g12-common: add video decoder node
Date:   Wed, 20 Nov 2019 12:14:30 +0100
Message-Id: <20191120111430.29552-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191120111430.29552-1-narmstrong@baylibre.com>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add the video decoder node for the Amlogic G12A and compatible SoC.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..6fe7dead5a92 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2152,6 +2152,29 @@
 			};
 		};
 
+		vdec: video-decoder@ff620000 {
+			compatible = "amlogic,g12a-vdec";
+			reg = <0x0 0xff620000 0x0 0x10000>,
+			      <0x0 0xffd0e180 0x0 0xe4>;
+			reg-names = "dos", "esparser";
+			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "vdec", "esparser";
+
+			amlogic,ao-sysctrl = <&rti>;
+			amlogic,canvas = <&canvas>;
+
+			clocks = <&clkc CLKID_PARSER>,
+				 <&clkc CLKID_DOS>,
+				 <&clkc CLKID_VDEC_1>,
+				 <&clkc CLKID_VDEC_HEVC>,
+				 <&clkc CLKID_VDEC_HEVCF>;
+			clock-names = "dos_parser", "dos", "vdec_1",
+				      "vdec_hevc", "vdec_hevcf";
+			resets = <&reset RESET_PARSER>;
+			reset-names = "esparser";
+		};
+
 		vpu: vpu@ff900000 {
 			compatible = "amlogic,meson-g12a-vpu";
 			reg = <0x0 0xff900000 0x0 0x100000>,
-- 
2.22.0

