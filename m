Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC97810502B
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 11:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfKUKOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 05:14:38 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36219 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfKUKOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 05:14:37 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so3655502wru.3
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0wg42Ie2oicewNtAQ2/KQD6s/n4R5PzVImaC+y7L2/I=;
        b=lFzeH9x56IU0xzBmSWRZ6DcwLxw1LdGEIJ5MlxSDkIZqsb0vFRQ5uS/KuSKEhv4Rpe
         zXtQOFjQ5v/kTiNdmSeeMdIpd/tLUgDYdIlHZJY++DJQqDyXRl+O2emaVMMdfEMYpbXS
         lPPASwiAaZXdpBiEx8xmrla3280an3xZAkQlbeDlAHyRTMheWJ1BWs1RBZaPlkYk5ZyR
         zGBc4uGluDTwDdqqFLevoP1HfKsU1jK4h2lDg+opAN/Rlpuf7/yfRyLVCalk44pvBFjL
         Q3Uo0kH1qvOW1GrBmhdrITJLvv8OKVb0Z4+4oPyHHtRSxHaUFITEv1aOgLAmvTvJhIBF
         5OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0wg42Ie2oicewNtAQ2/KQD6s/n4R5PzVImaC+y7L2/I=;
        b=P5TkfjMxPLuJ+Egb+Ie95EjC49JD6Qo1w2h1eeaksNJjpEMtZB00u8MLmyFGK388XK
         Tnd0MSlv2498OkK1sdqdiNuAJyAc8FMbtRCeygaCbKn8/Ak0qFArZTOGlHqx5o3oA/L0
         kahJ06ez4/vjfKXbUWKt2NzuqZzMKXnNCiSq7yMTIBrq0gVD+vH7zzCx7HHjig3SDv68
         IVuxy0kZmXjR4SCxi73x6pOhE4tBUJnC9d8XQ9FBTKnUtVAo9AnjqHuOH4bqJ6VhfQLs
         Ja9/2W3UpzSbV+jOEc0vVnEYAfeOrmq7i8hc3KN2zWIIrv4iRUoj/RC8fLXBtDXa4Wi6
         2MkA==
X-Gm-Message-State: APjAAAXWzlzsduWrFwCSs9ztHp6EY3lIq/2sM0ZDfI58Q4/8ftg4fg3j
        WuY8XbkYTVIcsQXohb/wEKdam/v3cCAHTQ==
X-Google-Smtp-Source: APXvYqxaDVnzGeg++beFGsQYq3Z9at9EOfwRlpJHiF3RSAfp90GcgPYTGGemHS3Jb/bwbNGcDgkpQA==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr9739630wrq.91.1574331273780;
        Thu, 21 Nov 2019 02:14:33 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o21sm1289932wmc.17.2019.11.21.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 02:14:33 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: meson-sm1: add video decoder compatible
Date:   Thu, 21 Nov 2019 11:14:29 +0100
Message-Id: <20191121101429.23831-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191121101429.23831-1-narmstrong@baylibre.com>
References: <20191121101429.23831-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the video decoder specific compatible for Amlogic SM1 SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 521573f3a5ba..b94a4eae973f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -138,6 +138,10 @@
 	compatible = "amlogic,meson-sm1-pwrc";
 };
 
+&vdec {
+	compatible = "amlogic,sm1-vdec";
+};
+
 &vpu {
 	power-domains = <&pwrc PWRC_SM1_VPU_ID>;
 };
-- 
2.22.0

