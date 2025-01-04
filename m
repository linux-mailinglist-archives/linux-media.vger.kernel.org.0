Return-Path: <linux-media+bounces-24250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1959A01691
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 20:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975483A262E
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 19:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C361D5ACD;
	Sat,  4 Jan 2025 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kJRgqm8G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gUsYZ+I8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F41D5176;
	Sat,  4 Jan 2025 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736020630; cv=none; b=M8CnTw6f1wWPOksPeo9tsVmcRhbYkdI2110XVFGb7JfM+LX0QAVuLETn0hORgYc1jW6GmK3887kqfJIwq+eSqS1kXYwbb9f90P15ylXg/VGwbAxkkNXKwFwOk+odbjd1nohgKIHRZi7XyWwRkd+uunbNAcD25eEonBaghmsaAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736020630; c=relaxed/simple;
	bh=aMVFk2kisgFiZN5UEwf2u3XzlP3yiei7z3fsZR6nlyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W5tiCYSmhiBKLA0JQkAU7WGyZYZHZyppgkus4qTfnBxZFI0qXYbl0HBmV7rO5qes21Cgt4/eYUMndnjrPBGPHNBiYTKP6TrnzdiMYSARA3FyhX9mpTey+ZabFl2IkgN0+nEGiaNa0TVYDtzSKRKokQb7rTnJ7cxQpqyAiygLmEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kJRgqm8G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gUsYZ+I8; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 83A02254019E;
	Sat,  4 Jan 2025 14:57:06 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 04 Jan 2025 14:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736020626;
	 x=1736107026; bh=DYe1f0hPxpFJJwRr2mpZngPc/oTBFdRdhPpk2dWYyAY=; b=
	kJRgqm8GIPbWLOgMFo4u3d1oq3Mcn2MDXjyDmmDVl0ZLPteepqJPS7m4UTF7RHA8
	7xIhuQctod07IqOgDPsUkS2gWw6p5GLBx8etnnfw9ohXDGBHh86QD7t5IBk4eRwq
	sFTqe1WNxeAxi4HLjBo2cyQB3s5xANYCBhw/JyacsxI+5ffJRUQfk5XmB1BwRHMR
	+iq+G6ZNVwgS4TVut7saS3J8yQy0YF7xx8+KSbTzdzvHk8FsTpJ7AwUuqDtgnuOn
	tdfjKtIOoj/zyTLQAxJ0tZUJ9mdINLL7FcA9JALjd3Ovl6l0LayrCsOePotVP0Mt
	0bRlg7P2/CDJplz4kRte5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736020626; x=
	1736107026; bh=DYe1f0hPxpFJJwRr2mpZngPc/oTBFdRdhPpk2dWYyAY=; b=g
	UsYZ+I8uRWEo6qcMn1FrBdrT3nZg2RFydU04YlwysHkN3wq5wOovAHBszDCl0js6
	2TPWYKAEDVc1F4XdAJ8ULqnlqmDedo45UbbzJk4HE42I5i9QvLjNeaoc6NAiC9z7
	GMAJItWSDyS+x1nStHw/sczWEvyHzkwSvEIAdQq9z1A5mIlpqcuB8xp35clPb3f2
	hQM5CUCGcHafrj4WYaPBImrRxxI9NgI0vAeQjhJwP1iEOq4L9+pqC00SNhtKutE8
	mKrUjiNDoj7GAzjPka8Odbln5/pQrp2fQOvoq89GdbubZEYeVXw6I9ILWqLbCxSC
	UuDZ95JNUCxZE5ZLjIfnw==
X-ME-Sender: <xms:kZJ5Z_-ADgZnVovkHfI24L_vAN3aRFtYfqvcToT2pwFZTU5QZH5rNw>
    <xme:kZJ5Z7siHPHy0WOpqP6UMxouibucwOyiNJ7NjTZkjOb1GwKtOcIzuctX8hwO2zLPW
    ERpGGsbmno6EjydrCU>
X-ME-Received: <xmr:kZJ5Z9Aj8xUbNSWNr77NEkf6Rf4rxyJwZPZcvdxhwZ43V-Ltv-hGffD_3a-URq6x5iIFNQ-dI_yPjVR40zg_40QmeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefiedgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghgvvghrtheslh
    hinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:kZJ5Z7eLVnPFOETDyqG__doc1NSbdDWx1vkXmqC7K7XBx9c8ujNrfA>
    <xmx:kZJ5Z0OrV5i1KDglF0laFYu_HlVbHLsrbZZfbBtaKOeqkJ_UHotijw>
    <xmx:kZJ5Z9m53B2PXIZD4VuA7TzzVKmtaBBQl2l_ID3_CDSAifBWFbDs2A>
    <xmx:kZJ5Z-uonfqL8oc1CPoOTGTMVW6DXu3HX_s2hdReCVIC23qblbgu9w>
    <xmx:kpJ5ZwAkqmXhwVctTpUQqprCdNbmZ9nyygQ-rLeEFngARKXFm-lo26kH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Jan 2025 14:57:05 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] media: v4l: fwnode: Add definitions for CSI-2 C-PHY line-orders
Date: Sat,  4 Jan 2025 20:55:47 +0100
Message-ID: <20250104195548.1915578-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add definitions to match the ones in video-interfaces.h for the C-PHY
line orders defined in MIPI Discovery and Configuration (DisCo)
Specification for Imaging.

This provides a way smiler to what is done for media bus types which
also have named defines in video-interfaces.h that benefit from having
human readable defines in code and not just in device tree sources.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/media/v4l2-fwnode.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f7c57c776589..fda5d740ede5 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -180,6 +180,24 @@ enum v4l2_fwnode_bus_type {
 	NR_OF_V4L2_FWNODE_BUS_TYPE
 };
 
+/**
+ * enum v4l2_fwnode_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
+ * @V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ABC: C-PHY line order ABC
+ * @V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ACB: C-PHY line order ACB
+ * @V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BAC: C-PHY line order BAC
+ * @V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BCA: C-PHY line order BCA
+ * @V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CAB: C-PHY line order CAB
+ * @V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CBA: C-PHY line order CBA
+ */
+enum v4l2_fwnode_csi2_cphy_line_orders_type {
+	V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ABC = 0,
+	V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ACB,
+	V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BAC,
+	V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BCA,
+	V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CAB,
+	V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CBA
+};
+
 /**
  * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
  * @fwnode: pointer to the endpoint's fwnode handle
-- 
2.47.1


