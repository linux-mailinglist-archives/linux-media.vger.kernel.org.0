Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F8A2CB76
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfE1QPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:36 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39213 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727339AbfE1QPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:06 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so3530251wma.4;
        Tue, 28 May 2019 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MeV22BL5hfS4X5C1QCisA6E+loww6qQHxa27Rpq4STA=;
        b=t8EnxSxSHqX7JGzCuQ0W+V8VDDdrfYp0zXTg0Jjv2VES+ObbS608OuEC5aduG8a4/I
         rwaEnHAfehwqhg9PUQjtU5nQyBzyzsMgSzKx3A9yzTFORamwTqcIK7nbw8UyNXB/reNj
         eAmdi/bNMybaRTu88vlknWqsQojYxDnYZ/Y+GIEwRISrp98d3acLdJD8w0r/Du9sFekh
         sT0uBwFY+QLPEcdhbgyW7S678kKqXFOXDwVg/OqNifg7AI3r8Q30UWQwsFo+kb7j4/iQ
         ZJaDD/lq7Fgus/ZlD1a8TlJ+dwFMD3dtRwGv84ojGYGtB9lqL2jbod6gsr7Cog5uFHSG
         seOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeV22BL5hfS4X5C1QCisA6E+loww6qQHxa27Rpq4STA=;
        b=PNdFlXfOzfKUfW9wqVxyAqMBzmQYW7pTI24Li5JkGPiViyl278rLoMSj1phlsaMqnb
         Q4LiQx8QfXEc+WW8bMi6rypAdGVgk5SurnDpit+2vc8QNjdHuhDnzU3+5VLidJ3n0dpB
         5PybnGCHCZ3W/ZX2cUrf+l/aAphr/qQV+8LCRIO/Xj+NemARmVqh3TB3+qfaOr/isZ2r
         VLoGm5KQ5h9rT7PgtdblQAQuznkhv84yk2zlv4H3isi2bQ6iiopokDXCx/wm9EQ0wWKe
         a9mtAeygdW79uVk7/XF18vSQzbySxlcA6YA5QRStLQGrLDe12MuNke8Cthx4QyYB8jHk
         o0pA==
X-Gm-Message-State: APjAAAX7osIH8eU0G5NBoEwnVCRvtFvy3MiYR54IhF2CTgBjctBEgU3g
        174CyuJkjLJfPYCg9tLp4V8=
X-Google-Smtp-Source: APXvYqwZj4S7dA+LFRVzSYZt/holujUhydPpu6LvW7id0q64AOuVXDwurd2DjKbvrBMgqBKJZCp/Mg==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr3904606wmg.112.1559060103992;
        Tue, 28 May 2019 09:15:03 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.15.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:15:03 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 08/12] arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
Date:   Tue, 28 May 2019 18:14:36 +0200
Message-Id: <20190528161440.27172-9-peron.clem@gmail.com>
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

OrangePi Win board contains IR receiver. Enable it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index 510f661229dc..e05191b71adf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -180,6 +180,10 @@
 	status = "okay";
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
-- 
2.20.1

