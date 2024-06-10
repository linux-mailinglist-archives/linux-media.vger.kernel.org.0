Return-Path: <linux-media+bounces-12851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9803C902067
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 13:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AE6AB22B9B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 11:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347027CF25;
	Mon, 10 Jun 2024 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kIxNoOR0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sq6XVKKp"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6534B2594;
	Mon, 10 Jun 2024 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019153; cv=none; b=H3aeuOcufK1ZsXURR4rKdr64LsJQZQPOnxdLZMdgEiGWoFxdinYBlObbaSify4RVRV8aWfxgBxYm6zuFRHCH+GzECvV8cuGoqR65NkuIsUw8HaObDFod3MMpctGxq2qvZM6UjMNDECXRKoqFtTu6ygRdRI6lPj8+WmnVKvV8blk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019153; c=relaxed/simple;
	bh=w1jw+wEMjd1e+8oaDLVVe6fEkus1cR3Z9ymQ9KAG4lw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GhtEVD2J8ivcaaNGxo/tV3q/P+hDTnjeIEL/UO1HiidnBXSM6DoXdju07sobKR8+j3aPeu4/QE61Ow+7B/4G4alhQj/4qm7qq4TFUUFkhohrSvXBWNB52MbPJ3HDnWfeFKL6KkKfGSjOzcYC16cHJmbB8WW5AZe5XZO/vQnBglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kIxNoOR0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sq6XVKKp; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 9BCB818000F6;
	Mon, 10 Jun 2024 07:32:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 10 Jun 2024 07:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1718019147; x=1718105547; bh=e8
	BmD0po42KEmcBEkYJTdVWfXPNnEdjBbdWwePHpPAA=; b=kIxNoOR0MWoikKtLKG
	RjdJLNmaQzxN9LFcgDlyC9YCW1uq5SYnbDtc8USOqyDZuXn+R+aFWVeSxQuoF5CF
	5MKWBn7O7128nlnchOipMsZQW43PwF5/dv7U5TiRKmw2LZod67OK5ghpBlNrEuzf
	6yxUPbNilTxqDaUkD7Gt5/ICmRJ0Sv5zOd1xe4teFvhDCtiRuN710H24myuiTn01
	PYBgpjbqp+GMfKDI5TESgCbuETB2IljH6gPGIDzS8rt9Eh5+3PVEgZjPjPyz6sVX
	1/z/g/g6LACd90+LMYxTO3WbHKmR1NAAlLbeDmBKhv/o122M1915SV6UyzjA3gtB
	M8tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718019147; x=1718105547; bh=e8BmD0po42KEm
	cBEkYJTdVWfXPNnEdjBbdWwePHpPAA=; b=Sq6XVKKpFNu0ZOHV+K5NAAj2pLH/D
	JKRjJcRJjRW/C1xyS/8fwARklS993oIjoOkGJxIKppK6aTdG3YMEC/k+XE19zcqo
	b89CpEYLlWHOTjGz7S1TRgwKu/qQKzpgGHUOCwZ2PLLRMIQ2MnrSmT0WKVAxLVR4
	pj0S8Hg2oaHJbWiYXapEQWWK0MJilsZ4moDU/uxYiobzekbCCgEisvnZXNvDnI8l
	I99y3+5HtGiaWSvYtY+/N4nO5nYgZPLWppVK916RqVyG+I3ED1oAd1ZtFlh2Gv17
	LCmXAZikZ+r7OgwJozv7yB/xwc9jw3YswBqIUDrTPgHH7KgxGn3ImnCmg==
X-ME-Sender: <xms:S-RmZsvhKstrAHsP47jxrwxs7ZJg_MaH0R5982mWay2KGKW8XNNgvg>
    <xme:S-RmZpehOIHfyoZBgF1-_r481FAsMtgBGTYigOcP-qvD4smFVRXC_hCsetOXEjaTW
    C7LV207IAttcVVgPZQ>
X-ME-Received: <xmr:S-RmZnzP3sYt3DHr1gCxEc0RLuKCeSFRXNymGjGWLM1hqjzk343g3-ZTwkL1xAir9nb3e7E2AiXhkvfFcfZT1JK5dZN58_bgWdl->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:S-RmZvMre-7YWDyODvmTvXfyBrBBi4WDKG6aHMRfO1h8S41sswMrYQ>
    <xmx:S-RmZs_MNa58r2pmOKtXpE6TvzS3kNMElvputZssst3K8gLNg980QQ>
    <xmx:S-RmZnXKpFSKG18cUwKAd0wm12C8qz6D08du3y0j_NKnnQUTn2QHRQ>
    <xmx:S-RmZlfjiKTb4BOaRcnOXugqPCpTpeUU9sVqakFG49rAXJ6HN4HcVg>
    <xmx:S-RmZnYvz6pfKYr1RrOQGzmlrKXc_9JX8B70KUIOUJKn_e_NPC_XeEfJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 07:32:25 -0400 (EDT)
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
Subject: [PATCH v2 0/2] rcar-vin: Add support for R-Car V4M
Date: Mon, 10 Jun 2024 13:31:22 +0200
Message-ID: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
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

The V4M capture pipeline is similar to the other Gen4 SoC supported 
upstream already V4H. Currently all futures supported for VIN on V4M are 
also supported by V4H and the driver code can be shared. But as done for 
other R-Car IP bindings a new dedicated binding for V4M is created.  
This have proved prudent in the past where quirks are found even within 
the same generation as more advance use-cases are enabled.

The two patches where previously posted separately as v1, but are now 
collected in a single series. I wold be happy if the bindings could go 
thru the DT-tree.

See individual patches for changes since previous version.

Niklas Söderlund (2):
  dt-bindings: media: renesas,vin: Add binding for V4M
  media: rcar-vin: Add support for R-Car V4M

 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 drivers/media/platform/renesas/rcar-vin/rcar-core.c      | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.45.2


