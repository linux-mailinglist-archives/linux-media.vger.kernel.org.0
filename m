Return-Path: <linux-media+bounces-32786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA793ABBF80
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D191B7A2D88
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A9127EC97;
	Mon, 19 May 2025 13:44:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9527CB38;
	Mon, 19 May 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662245; cv=none; b=Zf0wNo0qgu9B0wD/uRG4gMxGWKddvC7h5hvwF5hPmTBqikrgg55gdmXf3WGi7zCyogi8Z4JdHgjP1E94rO02FS1E3ZfQp3uTjGyuDJ+5uNH9RA35qEcTjeK5cRKFl9QnEXw4w6fwSRu4SPoOuR/X69R1oq4lNuJdMjezdsJmUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662245; c=relaxed/simple;
	bh=i91shgPHsZNyilUroS+RDBNxOPQpEugf79RIy+zK7UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5yi2ArHmhd7h0fkgZWVeNoY1RE+RBRYQEBXuxgHt1jiFGtKdASI+34lktBbwA0I0E4eTgOTvGipzhxLmge9pOAEQLViNioVSajg8SnMNkbejjLxu/PHcuf0jUTiNedagGWrYhVJbOZwNXjVMWN+BWPW9xFm/xPcneCxFZQs32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so48164855e9.2;
        Mon, 19 May 2025 06:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662242; x=1748267042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=mEWRxFQo0nd9WGWCgVLiUDRzV9jKPlZgwrir19EAviqm5pMSAVr4sxY6QDTWGjZTYv
         Aniz2LXo/jz/1l/iJ7q9uLVTraZdNce/nEorluzqCVZhqKPps2uY5D+Qn+JkqjVg8U8Y
         Wi0I2oCoA3J5yz9QO3bVxxZtxRzfiOqwN5JTZC3XTLIgutxFd3V8CMQuDYPkVLcUg7Jv
         KVv2RZxvSmKbYhXeLyNaXq6qeBw516vFtsCZvXLSAfipmbV+HsOaDT47uMXOCEGvTOvS
         eFcvC1w4mCkEOZxhKg8XaDg6EhjZd67s7SYe/+0fdbX/clpvDssnGL9EmwbYW0qy1B8+
         iuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/NoN5lM5RK+NfjxWoo21O07iZzpnt+zaUDjO6A4H+RWHYpLgFL53343cADUQAc1an6s7R+6+x7S1XN3g=@vger.kernel.org, AJvYcCU7QHbHacEGLtNWtH8/gjDCCRqB8pzqo1nXAjpJZOgBu5XQWbsM+29GHNjZp0ZaWAuhfesLwP7iXaI=@vger.kernel.org, AJvYcCVU8tslYPhz9eCX2i6MnXaVmqYW3/MrLjvg04xr8rXsR0T+cPmHP1cdJEeIYF72G7zEw/VQCRnP9tjm9OdR@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvYrsjKlZg1r3UkPD8UcM/bDusQHU+G2M+/7O7AbQweEBs8f7
	Fp2tosqwpAlbwmbXUFId8mvvkJW4XQOE5USa/Y4iFzDa4zH23htUYJPL
X-Gm-Gg: ASbGncvc9etpwGjGAzb+HcZ/OOGmyN1DOWqFI6JMtQHc7nfxPaxsrdgBNltIh3gOS7P
	tdqO+Rb/QFYS3COq4BhTJJPmzhzVLDu4iTCtX+TmJRYdtefqgK4q/qeh9OCO11jcYfg77dIJUdA
	WYsMtjaShJ8EWlIMbZmS6fYzUKDA4hv9UBDtfWNpDe0bUD+Cx3IBT9/F0ct+KjXuQ+jypeLdK7B
	wuQTKhsDimfGpj2bSLo1g8rScbTOEhY5ZWuxB/u1NKAjwsHqFyUxu28WNFvMt8/z5v1B/1R1HQV
	TaDIbdN931iaXhqzQT8twysiV6qC01UfwNrmOAjhIDtnV9ek5BtICHHOlwOsb5QtDqnBrKQQqiE
	S9zQIWntZ3Q==
X-Google-Smtp-Source: AGHT+IGqaMWHqsYu3YzcAO5QAiGSlI1CdiHCVwdtYh347xJkvMrzMo1SL7n38SQ7xE6N+he27vPggw==
X-Received: by 2002:a05:600c:3114:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-442fd63c6f6mr112316475e9.19.1747662241895;
        Mon, 19 May 2025 06:44:01 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:01 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:35 +0200
Subject: [PATCH v4 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-3-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

Enable the nodes added in a previous commit to the rk3588s device tree.

v2:
- Split nodes (Sebastian Reichel)
- Sort nodes (Sebastian Reichel)
- Add board regulators (Sebastian Reichel)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..2e45b213c25b99571dd71ce90bc7970418f60276 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_top {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.49.0


