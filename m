Return-Path: <linux-media+bounces-12853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE65790206B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 13:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCDC71C21349
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 11:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740097E576;
	Mon, 10 Jun 2024 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="l9hUYuY+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="htXJi5RO"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E127CF3A;
	Mon, 10 Jun 2024 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019155; cv=none; b=R1cAsHgqWyd0KZSdZp7MzNBPrSWhka6ZC/x4RQ1k8WpKWtYp4axxyILmYd7aWu+otk8Ifv8W8YLyg32Ij4NRJAUx5zUoqvnay0QcPpTmFzOV+jlc4mdc9qInjF551WC6XTYyRB1tO5VS2C7OwQ/cRcJkyjjUdisNSNGoUyIkuP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019155; c=relaxed/simple;
	bh=CStBV0fgcLBy/9xmzw52ySJg4JEqK0ZRWsEzdiL2tms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgQm6QggTNcH2eWHLzSvsKqp8qgJQB8FtF474G5LR0FzKfkELpzySnloPiBCDQ3lBuTdwSuXIKG9FkznW+Dx6dmbVhYBhBZL9JBP7fqEUZA0JgxL+0Uzrdc+VkCVvtMasbiEwX+snOEpNBlLTDNUb/fPeqUCygZ4SCaYEr1ybY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=l9hUYuY+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=htXJi5RO; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2B2CE1800141;
	Mon, 10 Jun 2024 07:32:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 07:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718019152;
	 x=1718105552; bh=JqUGsKSVqoAU+q+7qSKP5aMkpYV2soGRm9Sxy2fZa3o=; b=
	l9hUYuY+yhT8imoEE30IWWnyewbstKe+V6zB5ef4igHs60d1GTWWGKPRg9d8Yp6o
	GVGRlbCVh7Lm6cK9cIVYfYixPT7ey8bUkaNK7b8SSZnA7X9CI6rH6vmOHffZP0Cz
	57aqDR6zcoqqtsOorW6gtchVrfz4JD+2mXZS+yls1KU+PZtkFDmmA4CgPBOwg1WI
	H1oPAQ/M2n1S17Ol3w8WtdspfOL2K+lwOXyQW/t3yTlMdNWrLp/kq7iTF5jHH5zE
	7S50wQvzY+Ko2jjGF9e4KU5HdSvIFlT4TB3QDme3z+UZU+K485qlOybWJ6oP902O
	t+5wyuG3pdJydDvJ14npkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718019152; x=
	1718105552; bh=JqUGsKSVqoAU+q+7qSKP5aMkpYV2soGRm9Sxy2fZa3o=; b=h
	tXJi5ROnxpkNnNXNo+bs0MSix6oLFDv0rjCprGlnq3g+xzF+6RouVzocDtSB/7zF
	ERj8ZzLzlJS63F+GEFtCcfdPFJpUr1Y1l/xtAfibehKSiHDOPuAMk/uvW7fJOlND
	vkMt0hFNEEztPwgPhimdp2qWTkfxow8fTIAWQmsjFwP4YKsL5nJ0lvNdMYnU33wc
	eUibIea5LBaDv+l+m/a9bnUvoRuDWlGLvwg0u4wgS/PYxTEhTlt5+qiSBzBZoIJ5
	W7w+xQqwZtjd0SsIDFWgzkfLWYvFdrynvgHGDk59NEFEIcE3nd4LE4pRb5GdT/vX
	P0ZI4Ft6F3OU13iRO28BA==
X-ME-Sender: <xms:UORmZjcffOGQW84wpCo303CtBXnpek-oRC2njIHW_V-LkpYdHRmUQA>
    <xme:UORmZpPQjkbbNYQY-5B2yQeLfx1i3PtWvRE-9dyWIjEVItSGedZP9WkcVL46ow8D3
    SkkXXzSAOdHXtw2F3A>
X-ME-Received: <xmr:UORmZsg4FxO3THplPF8bHE1gudBymCJemC1MlznEeoYf9b85XVeXxeN4vy2eSOoi4nsXwaSnabQG4b4zYpzDau_rBhB9MzsTWdz7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:UORmZk9JKgvFVjDFnmvLEG2Yy7LPPrE0KjmVBZx2t7md2z5uEPIfUA>
    <xmx:UORmZvv09RErHrM6WL71JdgNTi_G-8jgdkmIrLU58CTNyChSKWg6Dw>
    <xmx:UORmZjFtHaJpD-L_QpulSWU6XPL-fNuVMKiG3A5oZuc8BNC3s0R3jw>
    <xmx:UORmZmMVaxCfcVj03tLB0p6L-_uZNmPrAYp6RsilvEwupKjzxOcKvA>
    <xmx:UORmZtJbMB9OhywqubnXU2ZV7olCvX_nayCq4htzpQrg7BQFAYfqzgEA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 07:32:31 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] media: rcar-vin: Add support for R-Car V4M
Date: Mon, 10 Jun 2024 13:31:24 +0200
Message-ID: <20240610113124.2396688-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for R-Car V4M. The V4M is similar to V4H and uses the ISP
Channel Selector as its only possible video input source. Reuse and
rename the info structure from V4H to cover all current Gen4 SoCs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Create a shared Gen4 info strucutre.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 809c3a38cc4a..6992b61f0d48 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1283,7 +1283,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
 	.max_height = 4096,
 };
 
-static const struct rvin_info rcar_info_r8a779g0 = {
+static const struct rvin_info rcar_info_gen4 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
 	.use_isp = true,
@@ -1359,7 +1359,11 @@ static const struct of_device_id rvin_of_id_table[] = {
 	},
 	{
 		.compatible = "renesas,vin-r8a779g0",
-		.data = &rcar_info_r8a779g0,
+		.data = &rcar_info_gen4,
+	},
+	{
+		.compatible = "renesas,vin-r8a779h0",
+		.data = &rcar_info_gen4,
 	},
 	{ /* Sentinel */ },
 };
-- 
2.45.2


