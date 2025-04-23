Return-Path: <linux-media+bounces-30846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2059A99572
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7A15A8156
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2335288CAB;
	Wed, 23 Apr 2025 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="E7rEhmdY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rV1aQ3Dp"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CF288C89;
	Wed, 23 Apr 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426026; cv=none; b=cgw4JRoATrQl13Tr5l7hKRYySv1FbFoYetyhIC8F4VL/OmfPWzwhwlDkLev5n35UY2PAFV22eY7RWBm5j/eJwiz7VF3mIJfrj+426zsNz2V096Gu7VqffItZh6zYpvnT+CNgLtPOKqDm9bsAa1u0hkddHmfbzfOu/7gjqiqJGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426026; c=relaxed/simple;
	bh=H3gORsEgd++DOOLijD+5++YqlB8k5rFqElExjfxfDbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idydPWMyAizHW0ocz12a0d9I9uKYuOmGgpkXgp7WX2o4Rqdn2KPGpEk6BGXRYtxL2S15EV4d6CbiEmBGpiJY3C0IQ7Ou7Oh+vpUEbO2FzNmP3eo7E20Hm7EiQn2XhVK0Xb/p8E30/YRaE5roC7I/jq48vGhoFduHP2F+ihSSm2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=E7rEhmdY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rV1aQ3Dp; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 99E4E1140207;
	Wed, 23 Apr 2025 12:33:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 23 Apr 2025 12:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745426023;
	 x=1745512423; bh=SX2+4t/MuotXp5o7SUKqxiNerP4aexBTVBofSMVOOCk=; b=
	E7rEhmdYY5bmeHKHnD7LVihhxJ4WWDqIg5OK2FihqJV6YEUD0TMtYq1B1lhC7t+w
	JFdyE4Z1I3no10M356bHgfkOy7PcV5o68+uW6IWr00BEV6cEhf+huub3kDFd4uUv
	A59D0D6puzKXL7bA/+69a1PuAat4jIdnmcO2G4HVUVQtC6jPDbFNW8/T+dV3V+Pd
	c7OPom5YB3Pj/VuXds8xIzsh9P84xJGsLQfxQlW/CHotFVv4dyQcIOQM28KLSxXc
	aHVZd7fVp4fxRgAk1fkT/5B+3K1qTg/Ho/e6nB802x+g2VNJIB+JxZ3jWTnF0S8d
	8irYK9ZiLSIF3Vf8KfuuXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745426023; x=
	1745512423; bh=SX2+4t/MuotXp5o7SUKqxiNerP4aexBTVBofSMVOOCk=; b=r
	V1aQ3Dptbo2Hso2+BJr9MTbuTQ62uShIdYizB3jsb71JaTN3qwbjRQUcLfgpONsU
	7CgC+gi+n33KD4CDl35UDNqEEkXyRSqxDdo6YpDzri7+ALJS8UMBUTKzY6g8fopI
	+PhW7TyEw6kxm/EhCm0+6Hk20V1WcD6F5tqIj1Y7NZ2PVMT79k2oPaho9QPRipcs
	UcFb/fmypOd5x/9Tv9LI261mC1hU8uYHTtnNxUscDWQ9CzN7JFka7vfNcsfFwn6X
	IgAIVVoAE2meIC1W6WWM2wlQKkbkaNQSEs4W+4XHhUr7DjvsVaKFc1cUhzGPpkod
	hgUzskT7j1JyGWLDo8FmQ==
X-ME-Sender: <xms:ZxYJaIoW_hz4r7V0-XEiaKkYIzlRhN4Py-KyadRu00xrv_mKcjHaxQ>
    <xme:ZxYJaOqwnVtSHiXu17W8tcru_9T1gESAlmWQZuQ1yVooKe6SePsoUBmQDxFSqKF1g
    lLWEGXQUoFi3PTJbpE>
X-ME-Received: <xmr:ZxYJaNPnLqok1cVVgmiME8NiwBkkiezQpAfOmqcWKUyFMgb8OChMcF4uGNqvu2gMrCsliZG1wzxVg3paOnnzuCub>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:ZxYJaP6yp49zF2pIvcMBWdCh6vn5jYJVS4FQcBaVw4Say5MT4l8_eQ>
    <xmx:ZxYJaH4uo1c07jyJh5rlP1RpmtGXPKtDs7xmEajkCmtHo3YAJwSjyg>
    <xmx:ZxYJaPibTo3RKsqJ8vJYJ_RaQd17580Tz7gEK2H77S7RpCspRyIjRw>
    <xmx:ZxYJaB7K1hXcOvzfpDM2rsaQE52EGSLgh4aMDqu8Cnlw_hkHBuZVZw>
    <xmx:ZxYJaKcf3GkBvqT9rziYjFeWRz3DKG0khx75-uBbowMW0Se3Mjqkjk3D>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:43 -0400 (EDT)
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 7/7] media: rcar-isp: Parse named cs memory region
Date: Wed, 23 Apr 2025 18:31:13 +0200
Message-ID: <20250423163113.2961049-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
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
where a single unnamed region describes only the ISP channel select
function.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v2
- Fix spelling in commit message.
- Fix comment style.
- Use devm_platform_ioremap_resource().
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index f36d43c2e0a2..1eb29a0b774a 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -465,7 +465,18 @@ static const struct media_entity_operations risp_entity_ops = {
 static int risp_probe_resources(struct rcar_isp *isp,
 				struct platform_device *pdev)
 {
-	isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	struct resource *res;
+
+	/*
+	 * For backward compatibility allow cs base to be the only reg if no
+	 * reg-names are set in DT.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cs");
+	if (!res)
+		isp->csbase = devm_platform_ioremap_resource(pdev, 0);
+	else
+		isp->csbase = devm_ioremap_resource(&pdev->dev, res);
+
 	if (IS_ERR(isp->csbase))
 		return PTR_ERR(isp->csbase);
 
-- 
2.49.0


