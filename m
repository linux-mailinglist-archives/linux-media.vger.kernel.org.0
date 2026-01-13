Return-Path: <linux-media+bounces-50595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42921D1AB27
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA11E3012646
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CB53939C5;
	Tue, 13 Jan 2026 17:44:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8FA34EEFC
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326291; cv=none; b=uwo7vdvE2tYGEKa49ExVwxnhAyJWUxOA3jJSxlkNj2sdv1tplaEZmxBJfKhSNT8q4HoVKPK/rlTEkQyBumZHq8DSHdCSikZkobZNUlhT8zXym0C4ta/1qXv8g+hTDdrYeN0jDu1dBOcQVhRkSkU8xv2IfcHK8I4+04smBHyuifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326291; c=relaxed/simple;
	bh=724MKfbyRVpOlMBiWmZ+VnfVEBQCW/q6CKIp1BMjM/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p7cfTifub2AIcdwNWBxNxVN7YSQ5+F9JCJj/RIANhvpLZ8sIreEBikXfSGi3vX/8NXtis4ftfJBsUG1GqpCQJ6MCph9lNPfjUBpinx/B3KuRJF2rpXQ7z/JuyLSKNfkJaeVL7YFHWSqCh6+xBkiToVECeH+bjDiXIMo5mYkPk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b86f69bbe60so397053166b.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326288; x=1768931088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=;
        b=qGBTpUx4x641hZ7APuBXVj2uMsNkOP/SRCqIjsoHlKBIVVpaGE+dxX0Dj1mjZf8oDE
         /uQ6VB+HZQ4tNag3PbB9Z12AsQbMA2foTPLzvWoplhZWQh75uUZnA9ysTTT3aQip1kd6
         qAsTBluXg8kYs8aIakI6bk3e9RIvS0ijWsm0knM0BAGdnugjpNbup4rIKhsi7P0P3VE1
         6e43WhT2mF5FVBtvMMjAgB8AhR0qAc7pJRp05LevFdVZBaOus5FZozzn7v0R3ZWoq55q
         6WH9RbEWTY+qvwuT4blKyz+H7CITIwePX/3kspoxG40kyQJqPEkhetV06QiNqQbWOCMP
         Daxg==
X-Forwarded-Encrypted: i=1; AJvYcCWh1cJIncHblHb858mobd0/RDoDWnBMfd4k5f2WCZ4L+EZhuyh0uISSPbjBtXq3c9qFR7uowV3oNlZq7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YynpnuyRVmj5uEw2iPmWyWkji9b0Fqm2xz4ldC9Nyc5MJ7ZoBPG
	lMOPmW45AwJ7TQcWBMVIJo8RZCe2yqelospKGdxk0ttO26NoyIeKwI08
X-Gm-Gg: AY/fxX5TXIX2aiytD71eTz9BpUq+KlZ90ihC7+dnd+9XJOL9K1CgCvjGvgPyNsUcESd
	S7UvBebEFP2rO5NvodqM82SjS1pey39EDOAj2DDUtX1bsHbdcvuSJb9bzZyvsfLKnp8cbUzrqSH
	9HJshiMBdNbMO63GlZOS+I/N3QZS2A0G17AtxaJvr+Ox7ImdGkomH3vECsGlzFmIgvXM4k3NYV+
	H1gTuplzdo/yw/zWY8nIGqC/4h7wN6OcgFH8jvlWiCz50CPFWvZ+kkhCPIyT71G6yV/uUzxjrdm
	e+HCAkq1s6+71oCsxe2jVvuDfuV2pNvRKkng8TRSmEp+3OG4b50LLmroZ6L5cENgA5FGWWMKwuc
	hgKalTuqn/ESbFhzF5HgtPXDeSYSpBvoXHNH5Ew4+G0tGULv/uncsb6ZAiLJTn0TPurtDh1IFXL
	x3DneT24YkK0G+Mqt+RK8EGZbK5w0cJzLot/mg5V1ms7bY7Q==
X-Google-Smtp-Source: AGHT+IE2YWlpMgqpFTSUm4yiwlEdYSG2L29zcJaQPD88F1bJ4MCCWbGfpor4ndxKjRsmJ+9m366jmQ==
X-Received: by 2002:a17:907:7282:b0:b87:892:f440 with SMTP id a640c23a62f3a-b8708930758mr832434466b.38.1768326288113;
        Tue, 13 Jan 2026 09:44:48 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:47 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:35 +0100
Subject: [PATCH 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory
 pool for DSP i/o buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-1-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This memory region is used by the DRM/accel driver to allocate addresses
for buffers that are used for communication with the DSP cores and for
their intermediate results.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 3fbff927c4c08bce741555aa2753a394b751144f..b80d2a5a157ad59eaed8e57b22f1f4bce4765a85 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -42,6 +42,11 @@ c7x_0_memory_region: memory@a3100000 {
 		no-map;
 	};
 
+	c7x_iova_pool: iommu-pool@a7000000 {
+		reg = <0x00 0xa7000000 0x00 0x18200000>;
+		no-map;
+	};
+
 	c7x_1_dma_memory_region: memory@a4000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa4000000 0x00 0x100000>;
@@ -151,13 +156,15 @@ &main_r5fss0_core0 {
 &c7x_0 {
 	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
 	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
+			<&c7x_0_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };
 
 &c7x_1 {
 	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
 	memory-region = <&c7x_1_dma_memory_region>,
-			<&c7x_1_memory_region>;
+			<&c7x_1_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };

-- 
2.52.0


