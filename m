Return-Path: <linux-media+bounces-11941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055F8D01AF
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6B7DB248BB
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403DE13A3E4;
	Mon, 27 May 2024 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="o6CuyxbU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CHIykO6X"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885FD15ECF0;
	Mon, 27 May 2024 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816759; cv=none; b=Q0RA2yWvluh6iNCMEqHHYFFcNe7AiFeN6swrExSZI6AwfdQHz5bmOcFbhp1kaLBzuNikQN/C8bsxbUgr3D2ekvfHXnl0w+q7GbVqT2qSe2QnoWM938dB6/rPE3Pxep1HT9mCqUquNKvX/4vVz0FimH4pQaO8kKKKn/CG33EfQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816759; c=relaxed/simple;
	bh=kmwyMZl2XKx8oQwCw8QiS5DrtkXvk3gH8kGUI1+iW/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a+G8rGzHG8X07AAO0W6ZiUKqm7SKqAwJc7xTmfvgp7BAENFtgHmFRCQZ9nrGzS2tupykJm76dVycjwRZ5OsDDvPNASgupJQmyExzpo2xSGCWoHGthJu0ch72RgBc5tnUoHJC/k6m3c+u0HljQ+G3hb4EmlWLHWfavRsc8PXrg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=o6CuyxbU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CHIykO6X; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 53BBE1C000B1;
	Mon, 27 May 2024 09:32:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 May 2024 09:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716816755; x=1716903155; bh=9T
	oe7Zno50n7bGWdE58anHTSk+Ncf9sfnVGYAhL+yTs=; b=o6CuyxbUijy/p97dCO
	DwmN+bLjQ65W4C5l++/okp/54n79ro3YJ7lXgZmA5zY4NC0QB6Bn6dMyOQ5HW1EL
	cADvFsrw28LM6jcOKGDihC6/+eqLqrRPgktpYArVhkEUP3mcRIl6TZqal3LuNTi9
	m1YERpdykeKrDF+1cR3tQ+pHrtoVH7TsX6/ceus2e/SjE1MDGYHVLeMomkSeL377
	iQOigFOrrU9dTWHe+ZS+6BDvhdeD9lo7K+k8dTjXkrvNIa63+aUOYHs490TJmSJC
	H3u5FNaOMA/glP/l4VFXCM5qSkhNUASVRUmwvNheR7zYy+r0SR95r/UUi5dN6rL/
	rLRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716816755; x=1716903155; bh=9Toe7Zno50n7b
	GWdE58anHTSk+Ncf9sfnVGYAhL+yTs=; b=CHIykO6XILTzb6VV8QDIJGjTHO4KO
	I3sA9pdeglZp6Hd1TzSieB/Mr8a3GF4yYzjbf/eMtG645daedqaHoD43KN0EQtI+
	U8zdnJv5YtnRB1WxBVYiUzQmgJ8T+eN5mc3n15bHk6C3YrYl91KTg52ljamQBWcC
	+qtU+IW3G56DWyUSMtk03529Jy8hG7Jn2SyV0BzHOwmu8hI0/Ue9P5hgNlxXPHo1
	duuDx7NSlduycTAa5Jo37LUEJegwEMKO1agmjCibumNASY35sLbQzYZsSWfebYqL
	c1zAvkks/ya5rz5XoJdI5ZExtINPIYnL2grgutEt/p5GB2eZxMRkyDn0g==
X-ME-Sender: <xms:c4tUZvzI8tR0QpzDbNZ2NLzkYKhaj40AFchmyplaU804vdItrckQgQ>
    <xme:c4tUZnQXOOTf9J0GU1RQwFbCAhtHCk4ZSHQTX45qaYeScCWSXFWBNZNO8DhdyRXOa
    1t4S389FDxgQGhaqwQ>
X-ME-Received: <xmr:c4tUZpWMRL8Y6aC8BEEbZCpppsw08v5gCDIhh21P3u75K0hnRcFQSbSy5IGJk3_gmM6fFuP7CA2ABc-Kgr9kpoo_OStmTv8U-NS4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:c4tUZpglvRoBr7FeMqzxp0JyL6n5VOK3XCDoENyGyNI2tt6ciJuPEw>
    <xmx:c4tUZhBWswbNqPR2CE4l18bNmrE_GRSDiYLvoMCtSn9L1tmjH3kPUg>
    <xmx:c4tUZiKhVLFfl7G_r24gXQD-T5VZ3Ll_i20jDgPbJ1O5yHPR4yyZhg>
    <xmx:c4tUZgC5wgNkGHUUZawPbcvh9EVEpVU48o4UUUqEHP1oaoBYOiQxIg>
    <xmx:c4tUZk4jlz8z8cdX0sfEbKtOZOIpfxwLJv1o7L2Upr4IJN5VLyEqTDTz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:34 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/7] media: rcar-csi2: Add support for V4M
Date: Mon, 27 May 2024 15:32:14 +0200
Message-ID: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series enables support for R-Car V4M to the CSI-2 receiver.

Patch 1-2 clean up some simplifications in the driver which where 
possible before V4M support but that now needs to be addressed.

Patch 3-5 prepares for V4M support by extending some of the abstractions 
used in the driver to cover how they are implemented in the V4M version 
of the CSI-2 IP.

Patch 6 improves the documentation around two registers used on Gen4 as 
later datasheets now document them and they will be used when enabling 
V4M support.

And finally patch 7 adds V4M support. The V4M is similar in design to 
V4H with the big difference it only supports CSI-2 D-PHY. All of the 
media graph setup and V4L2 callbacks can be reused, only the start 
procedure is different.

Niklas Söderlund (7):
  media: rcar-csi2: Correct field size for PHTW writes
  media: rcar-csi2: Allow writing any code and data value to PHTW
  media: rcar-csi2: Abstract PHTW and PHYPLL register offsets
  media: rcar-csi2: Add helper to lookup mbps settings
  media: rcar-csi2: Move PHTW write helpers
  media: rcar-csi2: Add documentation for PHY_EN and PHY_MODE registers
  media: rcar-csi2: Add support for R-Car V4M

 drivers/media/platform/renesas/rcar-csi2.c | 515 +++++++++++++++++----
 1 file changed, 415 insertions(+), 100 deletions(-)

-- 
2.45.1


