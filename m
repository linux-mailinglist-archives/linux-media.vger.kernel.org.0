Return-Path: <linux-media+bounces-13737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B090F250
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55E21C21759
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE5F15279A;
	Wed, 19 Jun 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jJwaDtqL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tyi8S5Gh"
X-Original-To: linux-media@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231D22339;
	Wed, 19 Jun 2024 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718811394; cv=none; b=l94pgra7B3XBN49By3T+2Fr4lGLNpyQfTlJ7ygmvNGLSZg1I9yrmh1w/boP8Z8yriLnwr4YIfuzlTz0R2yU+LFXU8PpFFqy58FZlJq3tVX5WxgCtRnnUsWOVVD5xu1B3eqoWCgl1k3JSC1ThcV/WjYot8CmrDyTxvowvG15gnms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718811394; c=relaxed/simple;
	bh=s2CSdJFOVfOEijvCuRIJxOB1pcs0A8JwFgiQpouLGyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Af7HYREmvIzBQXDj77T7a7ZS7KYCn7qkCYsSaoDZRWgsE8uZ+ttb+vHcAwmOswaKkyeggb4MoJMan4edxScLf0Nk5dpDS2yp65iOPu8KiFe/gFpT87fuWBg1aSatlw0KUDgevlPup1oHX1P6BLt3thn0Q/fee4rkvy6k8qR7hDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jJwaDtqL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tyi8S5Gh; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id C08931380155;
	Wed, 19 Jun 2024 11:36:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 19 Jun 2024 11:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1718811389; x=1718897789; bh=wB
	xMtOnV9YJzQ0lvBapPajLAIE5xYLwtHhfrYGj5nic=; b=jJwaDtqLzQubGVtC78
	xd0ps3F0G/m0mvaCJkIb/s22YKX6wUFcGb/G1UYJf8ixNpx2bd1spnCFb2SsBVNC
	WMuD6tyWw3+OL3+C72tAWGiOlnMQNb2kpIWkF0cIhWDA6A6wCltDvkKoVsZMap6s
	6QPNVyR3Rq9VpFqSx3rXGqgHJzpTJ6v5KOD55Bh+CKo/QcZUgOyopdNO2BD7VnFy
	URMAEAGyMODuwU6gVwRLsCzUnShjE3TyBbQenr7YJ40oEF9ZEsrL4uCv8OuHMUWL
	o3V5DhY4diHnaceQRlt6BwGwAkP2lWZilAmtt38y4O0NQaM+8DCRXtEP/LCaTne3
	bczg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1718811389; x=1718897789; bh=wBxMtOnV9YJzQ
	0lvBapPajLAIE5xYLwtHhfrYGj5nic=; b=tyi8S5GhrNtgPd41fgoe8RN6AFP+N
	ggvCWikQfLY42BMuIHfIaF9f/aDuduVq858PBLQUXX1hsYyLVjqZ6qm27h24faMq
	owsnrlB9KX6NPcYfv1fKxRj7fb2X1sfcimFc+pjx1Pgrr4NunE6cN3sif9Ms6ocm
	iR+0xXIYzwGTuDNFUxDmAwvxnHXFK+PY9LhLYEhNheRw3tbieujT+aVIJUJLVT+8
	Ft8MuU9seaw2ohlx4t3D7b2oEjdg59UY78TmieKOJk5/JXk/kYZiwv8kD4ye+YwM
	bC23MmkJRgfUGr9m6MjVEC5Vdj0xm8j0/wDJTZ/yTaNFGrBIQLEanKRwA==
X-ME-Sender: <xms:_fpyZrGF5SCPe7Uc86x1vGDnfXS8ktxP5QlWXqXy64CuVsUFzkqTmA>
    <xme:_fpyZoUO-Tzr-JYtkP-1HtCLc2Yv8o_nLucok9rXgq2FDJ4GrPCsJSN6KbhT2a_vo
    WliwmRyAEy52qzWKok>
X-ME-Received: <xmr:_fpyZtIEE2ngPmvY-kLMFRnGYXjIdGEHy2y7VzghvsfgLCtFunUESwI7ux87-zc4kps4mzkbVbzxKzguEVr49eJgOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:_fpyZpEl6aWqK4uDNk76O3EY6zP13ripKUcw34w4rbWZd_-SFVUtgw>
    <xmx:_fpyZhUJ9bf7N48Px6en1yNFb_wm_bIpVWcJsaiUfGEJBRIva0zSlA>
    <xmx:_fpyZkNYwI8rqoEa-aLEjVA1oD7Rtkns_3K2Fd7xy432AaH44QN2Cg>
    <xmx:_fpyZg1Yk-6dNH_JVf_DmDlSHQpPyuuuFHpEegC-C_XwlT-swjcVHg>
    <xmx:_fpyZqMKNC2cTGlEDlXEWkfgQWdaLOV-0YuvXou00CL7-Gx1EUmbu8kf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jun 2024 11:36:28 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/2] rcar-vin: Add support for R-Car V4M
Date: Wed, 19 Jun 2024 17:35:57 +0200
Message-ID: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This small series adds bindings and support to rcar-vin for R-Car V4M.

The two patches where previously posted separately as v1, but are now
collected in a single series.

See individual patches for changes since previous version.

Niklas Söderlund (2):
  dt-bindings: media: renesas,vin: Add binding for V4M
  media: rcar-vin: Add support for R-Car V4M

 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 drivers/media/platform/renesas/rcar-vin/rcar-core.c      | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.45.2


