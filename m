Return-Path: <linux-media+bounces-11935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF08D0130
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 552F61C20C86
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CD515ECDF;
	Mon, 27 May 2024 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TQ5S6oyM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g/s+7cBH"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C353B4EB55;
	Mon, 27 May 2024 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816005; cv=none; b=vGYoFwg0LnD8eB/h7AhSGCAeKsp1zALS3d1DN6jA4N+ZnJc0BSuSl53qmEjgUZQunuXZZz78M0qTDVWp4cDeOk+5GDl4kJZNLEsTIbyppdE95w3oavgqheUqDudyvAaCEz2e/YUvuf2/kwvI4Oc4KTZkbYMhdS+ogsfvKinC/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816005; c=relaxed/simple;
	bh=R5deowOVL1xXZRyMrkQ6bKxzegxgfdEIxDnAKdcM5y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nq7N2Uxxmvrllgo0m3JksQ3Dllfsj+rx8HUb6xgDOMCHn5O5oI/08OJdKQAs56gQJffE/FFjXtKl1eDnlELdlHca6c56vCm1V8BplQhPO5jfhU9Xgt7UFlR0M03FXkW+enz0Gdonu3SQHTfcJRKe/ykxKNsbeGK3/e3KLGAuxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TQ5S6oyM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g/s+7cBH; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id A50A418000B6;
	Mon, 27 May 2024 09:20:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 27 May 2024 09:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716816002; x=1716902402; bh=Rk
	LTzsfBGl687L1+1UeEDOBTvAXvWVwTqdeYDonkx0I=; b=TQ5S6oyMcDH96gz40r
	cPiWLpVgxJ8JAKnnl5kUw49VZ0OjQaO5eWQDrw7FMhhAtzHm2UGLMHlJnb5Cb6kh
	CF9lfaZa5a434GBJimAw3wn1HkAHhA0pajV26nyfLpRqMXcdBDNtR+ef7pvsLVBA
	XXk2q2FFUF673kakIK7CkkrZTWUbmj3K+S9+AcnHHgUjRY8nf019y9fgnYRVr15E
	Xf3cG2As/R8sHuDu+jdVfjLHCWR/q4/3ZNJI25a0k1tgQFHBwqCjmeUtv/HdEa10
	RzDFuPJe20VP6kOfG+dbxc10URv25ZPKRW2k1JyZWXOOuR373qUylmVWBsoKV/eq
	0gvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716816002; x=1716902402; bh=RkLTzsfBGl687
	L1+1UeEDOBTvAXvWVwTqdeYDonkx0I=; b=g/s+7cBHl3dkIlDHsvKbjSly0Ru67
	07P7hQWPbr+97u3KbwlrKzyrUGAkOQKUJF2oStPgzv+I2qij4BOA8W+dSAJC1iHo
	qSPmdl8t7A/c53870fzn8ABYd9CdwX4hYn4EcAyALvT5q247aXTFxzJbtZrtzQMI
	G7NVS3AqKHVaAgyGiaVAw2E9lxtcCryzQs3EX9P0lamcMW9MA2ys5hBBblg8AvXp
	HuyBzkTfAazGu3YB5/EBtWoaVjyzvlOZh+aDTDsabqvsjpD1CYoBc+g/FS9W1rHv
	PTeLDTwoFe/R3KMEN88Px1/m4biYOGFGmRz+DOn0C4So2CMa/RxGEl0dQ==
X-ME-Sender: <xms:gohUZnE-IeO5Ce5S_0kYcFJ8vjAI-vtPNmkZsEi7mtPI7Gy6qoWjMA>
    <xme:gohUZkU4Y2l2b7KdmTojiYN_HnxmMYnSoygOaej4deKtaZtyISuVS8Exa8lUvuUfO
    vW63ty2XxUmqpfxcuY>
X-ME-Received: <xmr:gohUZpJLybAXKb3Pcph9WBEW7412RCCjAAQU5gljdHSgDehi3szag97cccXmm5mLHXvyvt_Z9Y-RO8wAvQxVbMtV_NmLBeY8tefx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:gohUZlHFFauTLJunL_8HjvdY6iF4sjey-gS0Bm981_HEkpuAv1sD0A>
    <xmx:gohUZtWNe8jbp3HrBxBtRryNb7zPmPV62FLJbtkYDpiRkVyG7U0tbw>
    <xmx:gohUZgNeS1UAhKnswVByyZCzv4XbJ-i3au0UH0bdKyFi23vEbs56Dg>
    <xmx:gohUZs1K775b6ZlEq6vfWHNeIYZicDYeopIp4CMahpffZt5CO1tvCQ>
    <xmx:gohUZlTc2oF3cQ8IHOczFsOm96n2AqmZPIzPTa9ijTIxGXItxrqd9TIE>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:20:00 -0400 (EDT)
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
Subject: [PATCH] dt-bindings: media: renesas,isp: Add binding for V4M
Date: Mon, 27 May 2024 15:19:45 +0200
Message-ID: <20240527131945.1679661-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index 33650a1ea034..d335d5595429 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -22,6 +22,7 @@ properties:
       - enum:
           - renesas,r8a779a0-isp # V3U
           - renesas,r8a779g0-isp # V4H
+          - renesas,r8a779h0-isp # V4M
   reg:
     maxItems: 1
 
-- 
2.45.1


