Return-Path: <linux-media+bounces-11485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8D8C6802
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F407281961
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A12113FD8F;
	Wed, 15 May 2024 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oj3FlSFO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612813EFF3;
	Wed, 15 May 2024 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781468; cv=none; b=nThswmWa0MKM5FwI5wjLuXMev/1Wb6Qb2oqgH1TXomLpqwERateKK8U6EsVyCRTG4vVYg4V1dc0LdcLd8w5VAg3Lex83EzC+LNx0IVPSzUBGaYjaZxghw20cIP/a3aXVNoqZ06boMtpuCrkh+v7ErmxBGg/jPLItfhGZvlyVFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781468; c=relaxed/simple;
	bh=8ZuUxwBuqIl5xv9FwD6zxHdkEr4bqeDZSbsEsg2zPmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mygWS5UKztmktTTeJ7pwevLbNAsgE+Mm4h5qowbUB/Vh7/4hoRhnKDM++7ApaudeCRxX8KgPh3lO/+H4fyTpF4fH/dlJkOA3uWIToOFKYJU8ZkcQLlu4sx+FXGiU6ZjtXBtgkCuKEGioP3Z3mdZ1FuhR3EORiEeze2rno9pI4pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oj3FlSFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CB9C4AF08;
	Wed, 15 May 2024 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781468;
	bh=8ZuUxwBuqIl5xv9FwD6zxHdkEr4bqeDZSbsEsg2zPmU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oj3FlSFOr68/qWfihvTAujUUhPEGoUh0a2EeRfwvOp8t6TcAJblJSqUhG15QQTajm
	 X0ZypIvahxAHTF82FIRmlU2JmeCiZMwvZg+EGvVdwOy+OSOe2xcXF1JXL/koBjWJ8f
	 uY1eH1kzAK3EKpSlqeE4zNl58tmABu/OHRqvET7KDksCSKN7RmxdJnLqrBLyDwRdHT
	 tj9PWxBrP/AM1H0vdT+uxhTO2BFPXx2o3XWUE0K/GWe/3iVt7N8oPjgzVElc+MOGeJ
	 74zzL/+8OcKcEv9NJp/Th0hDHXFns5PI1R9GkALEM+tDghU+PYNfMeHNgQ21rMnH+z
	 MvHx0X9dwRxgQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:56:57 +0200
Subject: [PATCH 2/8] of: Add helper to retrieve ECC memory bits
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-2-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8ZuUxwBuqIl5xv9FwD6zxHdkEr4bqeDZSbsEsg2zPmU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+/3WZlme0eHdaHF23mbWzIrm86HrbRLD7LyCko8rz
 uJ85re0YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkYjpjndaJwD3Xp39eISqZ
 bOWhaGUqfPC+tbxHZce+b2VbV6lc4Ap8mKG7L8Nf/dPlvvmn739RZmw4p9u4J+i/zY7Hpn97nvC
 k2mQ5mV6d/XPaqwcblXumnVxr6J4cufGVjJSY2aW6VRcUq44BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The /memory device tree bindings allow to store the ECC detection and
correction bits through the ecc-detection-bits and ecc-correction-bits
properties.

Our next patches rely on whether ECC is enabled, so let's add a helper
to retrieve the ECC correction bits from the /memory node.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/of.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index a0bedd038a05..2fbee65a7aa9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1510,10 +1510,35 @@ static inline int of_get_available_child_count(const struct device_node *np)
 		num++;
 
 	return num;
 }
 
+/**
+ * of_memory_get_ecc_correction_bits() - Returns the number of ECC correction bits
+ *
+ * Search for the number of bits in memory that can be corrected by the
+ * ECC algorithm.
+ *
+ * Returns:
+ * The number of ECC bits, 0 if there's no ECC support, a negative error
+ * code on failure.
+ */
+static inline int of_memory_get_ecc_correction_bits(void)
+{
+	struct device_node *mem;
+	u32 val = 0;
+
+	mem = of_find_node_by_path("/memory");
+	if (!mem)
+		return -ENODEV;
+
+	of_property_read_u32(mem, "ecc-correction-bits", &val);
+	of_node_put(mem);
+
+	return val;
+}
+
 #define _OF_DECLARE_STUB(table, name, compat, fn, fn_type)		\
 	static const struct of_device_id __of_table_##name		\
 		__attribute__((unused))					\
 		 = { .compatible = compat,				\
 		     .data = (fn == (fn_type)NULL) ? fn : fn }

-- 
2.44.0


