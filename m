Return-Path: <linux-media+bounces-18974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08798D002
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45B6EB23A78
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7EA199397;
	Wed,  2 Oct 2024 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bjMMdCfx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WUHzZ5Gp"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D55198E81;
	Wed,  2 Oct 2024 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861048; cv=none; b=idrc2z5oIJEyUTNcYtdarMoK9HeYVfDlTpyRGJUMFWXgelo0o4dIywekooxv8AWQyr8YjKILd6Mqq+EsNUen2BFNTm33K0uAn6AHKd41davI20xwvRlSSFHPVs5ytDwpqdfFauLHo3Msz4JQe1OWAGlNiVjOH6RrnLSmxbe2x9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861048; c=relaxed/simple;
	bh=zGHbD2cI91SvLK+kSijDd658qXkg9SLYg53BjufZDaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BCQPtbWAHWpvmZYUr60M0ocIRF/eZ4jTZ0jFDbmtcuytj6OsSHoofFufmnyR2wOvhflzShGNQ1+n/EaiJRmctfy2kWXlj0gUE+s54esyVEyiR/D0LZGNHbMBcsZ3k7xJni2U/3DVwbNk1aQSDCMVuyNmSUURZkiFPy/KVyFjDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bjMMdCfx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WUHzZ5Gp; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 0E58C1380288;
	Wed,  2 Oct 2024 05:24:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 02 Oct 2024 05:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1727861043; x=1727947443; bh=/o
	0zTzGVvEklZ5xEmmnCr13qdFlvVMIdeYAmXpdTHQ8=; b=bjMMdCfxh8Wzr6cYHE
	4glbMbHLGgtrGvadHWfR2OA3uRI4x8hnGp1zyXFbhSkzcLYVBbkATTcxVZ4Ji2BE
	y9zA2S7pLeCgQaRpcVAbGRnzEX7ORPHGTHXUI5TU86Oz0goPmvHXxaj8u8Q1K1MK
	uW6A3Qbbi0GClIa501jcV+R7mbyFa3OxKCT5Btf2eordww6Nc2RXq3LUFqZWqZE/
	+gl59fOheM8MwkO9zIhIOKoT7iCaCoySWHkM1Pxwtovh/N/yn/i5xZ1mTXDpPBGo
	1gQ6aZwDka2UQyJRUxRi+OZYBA73IHS0+nWBIg6NUvB8QPboz3cA29WZvW2BZ9XD
	r4fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727861043; x=1727947443; bh=/o0zTzGVvEklZ
	5xEmmnCr13qdFlvVMIdeYAmXpdTHQ8=; b=WUHzZ5GpqVboot0rjtOwfOMEApFLw
	QFWrM6Ank4s3q4CgPbW24G+yZZUk0YuYsps8iEeYqF5/Lp3h3Q1d0GrTm+dHH6Rm
	SCj8rOpVzUCx5b+NBdiWtfB9i9pC8sNP2LSR/U35qMfkACrALcTyVUEjwajI1zGd
	zahjHePKiW+pqLsGQKpTVGDL6jTU3Bvv8+tiYe/vv8eiutnvt4PJydc6GRbq6mKA
	fucw95Ld7rzvxBYcol5jfBUHDxpMzhMrUKyCRT9BpTD0E5p+ejs0s4fSq5xLYw4F
	Ge6jBDKmE1eJeSAdaLpL1oqIojQjQR/EqwSD3xingk9b8bw8ATzBmA+oA==
X-ME-Sender: <xms:MhH9ZuQ7og_INInSYNkdFlVJOa6rIkGAw6X62_fXWquHyb4ELjkjig>
    <xme:MhH9Zjx0CKBXB4b3kNNzrprYHKFPtLkVa6Gugp5SaCwicAtwSVCDdFd3TbtzBKV0v
    r4pGpVUYEAN7Ba_x60>
X-ME-Received: <xmr:MhH9Zr29t-KrF75v_VPeFJYQMGvU4hztxAQQSLtLZRk00hexts1NmFbadx2mOa-0-gNjyqZFhS4yKwCWaXGcVXF5qA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhig
    fhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhsse
    hikhhirdhfihdprhgtphhtthhopehjuhhlihgvnhdrmhgrshhsohhtsegtohhllhgrsgho
    rhgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:MhH9ZqAD07GaeDcKung4Yp_S_q6M4geyPMqiVbeWCbJEkRsP7I2Mow>
    <xmx:MhH9ZngP3p9Velmga2lSv6QHcM6RTU4IFhKA_a4wZaY2sP25JWQGug>
    <xmx:MhH9ZmoC-WbWO6-xAjkKeN5sgZFSwme3iD-DTszT8UNTEQh_v_c3dA>
    <xmx:MhH9ZqjUhihfO5jWH6kuGcPLsEjqdq3pXykI6Ep5e_sOoepV3sPESw>
    <xmx:MxH9ZiSFZ2ITEZhMpiBcT9b8Orb5irV3OORKr-vlAfKDo2F4UfbYL3Wg>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 05:24:01 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 0/5] media: staging: max96712: Add support for MAX96724
Date: Wed,  2 Oct 2024 11:23:26 +0200
Message-ID: <20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series extends the max96712 driver in staging to also support
the MAX96724 device.

The devices are similar but not identical. As the staging driver only
supports the video pattern generator the changes in the driver are
small, but needed, to generate a stable test pattern.

Patch 1/2 extends the bindings with a new compatible for MAX96724, while
patchs 2/5 - 4/5 prepare for the new device with small improvements and
moving device specific settings to a device information struct. Finally
patch 5/5 takes care of updating the driver to support generating a test
pattern without changing the test pattern clock (which is not supported
on MAX96724).

See individual patches for changelog.

Niklas Söderlund (5):
  dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
  media: staging: max96712: Remove device id check
  media: staging: max96712: Move link frequency setting to device struct
  media: staging: max96712: Document the DEBUG_EXTRA register
  media: staging: max96712: Add support for MAX96724

 .../bindings/media/i2c/maxim,max96712.yaml    |  5 +-
 drivers/staging/media/max96712/max96712.c     | 56 ++++++++++---------
 2 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.46.1


