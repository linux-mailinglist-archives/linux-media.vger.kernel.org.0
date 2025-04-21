Return-Path: <linux-media+bounces-30597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98638A94FFD
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF1CD16D096
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C95263F3F;
	Mon, 21 Apr 2025 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="V5wpPBpN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rWNAUZLf"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DFC2620C3;
	Mon, 21 Apr 2025 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233990; cv=none; b=V4YWrq+CIPLwn4P0/a4As+5SmioKfh4cDJ2p49YitwMXmE2liRMjXa1Eo+ODedu44TUU75OYLSSgo/5IWdOlXD4B6gzcWoNC7XZ4sFHJdiQapZbWyM3bG/0n6wTptg86NMm/bXKNXcT/j4DD6xtz91U0zf2ruJFd/oTq2frAK9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233990; c=relaxed/simple;
	bh=Cx41yhUSd1PI+bsxunMjhAop5um1mBO1guWMwSJQrfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g+RaOvj+9t3D1M17BdCAQ93X8v4pwoc/1kWwXnV/hDNhKJ6jmCvL7b39LOC4GIs8sxHBJk6NLkBUOlbNAFCHtpAZzbfh7ydLOils+XjyKtniDa7Ktp/S0hL4HjKusJeE2DVHYuhvzLG/NKhkOwduzaANvClR8E1lARvtuVmG6J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=V5wpPBpN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rWNAUZLf; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6FB8B11400F8;
	Mon, 21 Apr 2025 07:13:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 07:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745233987;
	 x=1745320387; bh=a0Oke0ZWbjkBvVotMq8XuSj5FQ/585/w+QBe2qb0ZlI=; b=
	V5wpPBpN6BqVY+imHIETc2yPrUTGIm4qOa1cjRV0CASMTVhumLtFAqgsD+timewF
	SNVHfEF/MPn00daXoTAc2zucPIdiXoa4qaons5CRcxalNJ/M0h/LatNIcT/G7EpJ
	q86P/y6JSg7JoQBGNo9UB4E7QcuIYIjWFw2lUv9WQsXZazmkeqfREZNmgsqhr4Gh
	q6Hr7CsF6DRd/rlztWZigpFV3caEKY3O0IBfAe0cTwJNp5OvwYhHVT7sX/AfHw/r
	bVkRgaoe7/NZnOY9zWnuFGMNMS9nKEiWwhr/6S44zI51yBy5gGRQzc1IwjGUTl+n
	7UDvQ3ppuvIzsBq44IBC3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745233987; x=
	1745320387; bh=a0Oke0ZWbjkBvVotMq8XuSj5FQ/585/w+QBe2qb0ZlI=; b=r
	WNAUZLfmOrS6B7ToINpFGiq3MLgxKvjQfObHwycKWSezErx2c08AiUdGQ535c5mH
	nRYePYQzpEDvTWTgGJoB3oea94GWarkcij2zy/0V9AOzIhgIZTizRuxiIaGoIigf
	1xVnRk8MIYwoznJuzVXaau+HRfAZRAz3Y4EBm/RuDup0Bg1cjT/FrEb6gdMT2fyb
	eMwcFHPunU3b8Gh6H0LF2mTNp0NOgyVO4wdkBIm8Tc/rdJGtcHCHjfIsxB949twP
	MuA4gafg0/6aX7DpLiZLNWj1n2Ds+gSIk44/TWjdKpb8kzXEtAhYji34JjAczRhl
	OXT9/d6GXZm2bBqpKatbA==
X-ME-Sender: <xms:QygGaAMYNlvfjvj_SxjMi7ifOLPIDW9Ootv51sbIo31ZE0EJo8r_Jg>
    <xme:QygGaG8HVXTxxIhpPXO0Es8iVzah1RhYAPzMRc4t1Tvu7ynu7GjHxqi6uY5BODMrx
    W9F08XarOSTGZMl2rc>
X-ME-Received: <xmr:QygGaHQ8lgAmJn2vAi4u7b2Guo1nBoL_VQ7jiSZg6xXqOuzsKDsS-8wQEanJsjxQ6mLoZg1odTCTh05QN9Hpj5mzeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:QygGaIthG9KHfXVBaK-fIbzNOtSiwnFI0DgFAMmLpo-FBb2vFhYvPQ>
    <xmx:QygGaIcus8FqV_CapYMQAsPu3pPesq29E_KJJc5-x0e8VmdYpKVquQ>
    <xmx:QygGaM21cuxeWGT7nE_dWy_XSmesiNgu5hfX2a3PiYyR2RzJFyGziQ>
    <xmx:QygGaM8nx42UOp9HhB6d-Q_oaGQo-bNTHxbOJxooYPwgc6_9kYObTQ>
    <xmx:QygGaOWLbjburIorp-e6jKBUfmGdU7n4mNSAosE528zoqYu5z-gXBBmY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:13:06 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 7/7] media: rcar-isp: Parse named cs memory region
Date: Mon, 21 Apr 2025 13:12:40 +0200
Message-ID: <20250421111240.789510-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the device tree parsing to optionally parse the cs memory region
by name. The change is backward compatible with the device tree model
where a single unnamed region describing only the ISP channel select
function.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index f36d43c2e0a2..0b6fa62467e4 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -465,7 +465,17 @@ static const struct media_entity_operations risp_entity_ops = {
 static int risp_probe_resources(struct rcar_isp *isp,
 				struct platform_device *pdev)
 {
-	isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	struct resource *res;
+
+	/* For backward compatibility allow cs base to be the only reg if no
+	 * reg-names are set in DT.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cs");
+	if (!res)
+		isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	else
+		isp->csbase = devm_ioremap_resource(&pdev->dev, res);
+
 	if (IS_ERR(isp->csbase))
 		return PTR_ERR(isp->csbase);
 
-- 
2.49.0


