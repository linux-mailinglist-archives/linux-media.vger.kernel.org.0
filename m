Return-Path: <linux-media+bounces-16926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424B960BB5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1AD51F23B47
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649E81BDABE;
	Tue, 27 Aug 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mY7Qpe5s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KgqCuQ/K"
X-Original-To: linux-media@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A991BD03C;
	Tue, 27 Aug 2024 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764826; cv=none; b=agzRtM0xxf94jYvGHXMNtSLAgM168x1XL1ycEiGlFurMxvy827w1zipfgC5xfjU6k+FQUM6yU5+4JZqZlJRAXY9LFbtPuic0OweguLjdzTEHaJD2qLLSLPWvvL2Tku7XuQvgX6OWCorSvGF/3v2P/Uv4wv0DPpgcalB/kLuw8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764826; c=relaxed/simple;
	bh=Go//wYSzFV+Lw49MZP1Kly3yNvZ5MoPb/x6j0CKHo6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eFEhIZVrvKl2gZ4+MrioWg66oHUKkclFSF1m9xqVqIR7ISrKXw0Y4Kl1gHGXQIzvuzGxt2vJynlZHfAy7JRTdjuAje/WlpMKXnpw8EdTn/OXaHqYvd2GmOOOQ4vB+iSVjRcj4L+WVKbT2oA/icvCtxGbopsIvyknADNBgiUl5ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mY7Qpe5s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KgqCuQ/K; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfout.nyi.internal (Postfix) with ESMTP id CB633138FF62;
	Tue, 27 Aug 2024 09:20:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 27 Aug 2024 09:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1724764822; x=1724851222; bh=Ar
	kfXKYtpIYiXVPyHYfB0RmNj4FTnpqN43lWMp5vGm8=; b=mY7Qpe5strnbsa6955
	hKeLLucX2UE5GrOqrWM5BuaSPZ2SapsnivK/A4asSF45r7LelRVhk87XQ1d0CTcu
	yxRMNFn9jPo5xQT+Y0Q8PSjMEoVYPy2oziCOaVRPA8jeNJr9G7BPGoxcN8bTpl4H
	bOwrgbrbWWNnm/qcCzSJbgJ880nVp7+58/jyDG6fjY8mSVwV8uKF+AHAVa2lPWbH
	EObk9ETOxdsf9FaHlKVCH1/cwIMXlkp4xUMevlZUSYanB0XzOvkkpM4s0uOtfZV6
	5h94QAUCKmRqs5dT41z/GvnGHyMNxZj5R1GBC4PggIU+9ODjsG5QcrNrW1fB0djs
	sznQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1724764822; x=1724851222; bh=ArkfXKYtpIYiX
	VPyHYfB0RmNj4FTnpqN43lWMp5vGm8=; b=KgqCuQ/KIPSgwohuGYXq3NLAQXTA3
	LLMqY+HrbZ55vQ010Hzjnl44WqSR8N1g9fXlwLqwwGEbLV2DPl4Nyle9uU6zxkyr
	JIcC0cHtMDozFtnqeJVkg6rlzzm+F0ussLRSBA9C/xW9NDNdi9QRT07dYogpUA4v
	wsepBI6wCoLO+25xufYhg8ddp/HGn9i1yQIgum5I0PBx2lhOQ4dnPqbME6c9CmFp
	kQdqi4zU2PfDnSY16aE1fkM/4buZ8SyiwxaxapeTHzrgRefNGsM8s63U4+8A3Zko
	8uiAO3lKh44tP0FfeMAXQovXfTgTv4EIa2T+Yo6a3fpQzKf1EZiyR08ag==
X-ME-Sender: <xms:ltLNZqQCqb-GB0wSb6LCyj-e6uEnPpOb5GICbwK1QUBogym7CGkqUA>
    <xme:ltLNZvyTe2KzbkNNZR4sm0VNoN8B8HB0mjjoJY1eaVECZCNSkqFPDGROvztvjkNoR
    j1LFlibGy_1p1hi7Z8>
X-ME-Received: <xmr:ltLNZn3CQuH-yJop9lzHZ52s3sVoX6UuTEBLOif7FThZSmGO3yKAHcRdyiATMXmgzn-Xb-FHZngq-h9eFAnGoxUaZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhr
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfh
    houhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehl
    ihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrsh
    dqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ltLNZmCJSNq-jPKlXzDdPJHDZXQWeeNPY7Vv_MCY5efUx_jTskVcEQ>
    <xmx:ltLNZjiCEj1nHI6qbwlR6uQaM7uqfj9a_5X-_cJq31YSzU69R0Zl1g>
    <xmx:ltLNZipeZr7Lg2UILROql1uTX_lHruoJMuOi3Hxy-H9WRAN4UZwLRA>
    <xmx:ltLNZmhlhbcVvP_g7L6GLhgOKJy1gQLMVhM1EzT9kTkehzp3L88u2Q>
    <xmx:ltLNZoYSfjhWzbcGLrticQkjX963AMqXe6jq0-P-YsyUL63bZUyIVvD2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 09:20:21 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] media: staging: max96712: Add support for MAX96724
Date: Tue, 27 Aug 2024 15:18:39 +0200
Message-ID: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This small series extends the max96712 driver in staging to also support 
the MAX96724 device.

The devices are similar but not identical. As the staging driver only 
supports the video pattern generator the changes in the driver are 
small, but needed, to generate a stable test pattern.

Patch 1/2 extends the bindings with a new compatible for MAX96724, while 
patch 2/2 takes care of updating the driver to support generating a test 
pattern without changing the test pattern clock (which is not supported 
on MAX96724).

These two patches where previously posted separately but have now been 
collected together in a series. See individual patches for changelog.

Niklas Söderlund (2):
  dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
  media: staging: max96712: Add support for MAX96724

 .../bindings/media/i2c/maxim,max96712.yaml    |  5 +++-
 drivers/staging/media/max96712/max96712.c     | 26 +++++++++++++++----
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.46.0


