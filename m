Return-Path: <linux-media+bounces-24249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FDA0168E
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 20:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6DE3A2847
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 19:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4650E1D514F;
	Sat,  4 Jan 2025 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Qo+0UOQO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YXzqsd3a"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB194C9D;
	Sat,  4 Jan 2025 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736020627; cv=none; b=md8+wTPG9mAbOs8/8T9TDb1cPPmEPdp2MyV3Xx1hFFORi+wfJ7rAHojtQSe9MhhsWN2INqW4ZDtpfUaM+guu7HVw71tOL5bGV5Lc4VKGWkuLj2E92lIr6akZBumS/ErgxPd9NDCaiVBhFfQaMs5CosQ+DDcQdBHxDF8cmgwEFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736020627; c=relaxed/simple;
	bh=3JmfoyCmcjPz/d/GMe43zWqq7GqOqVJNDv7V4kVDIOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bAIPi0RH1pSh2jKGf1aF8GLruJlznMUbIrpvYviy7c2BIdvmvVoqCfud8mirRRTR2xjcNQqiFqEg4cIN6634qZA97r8kel8Dm0GBLJ+jghs26A+gdZsMX45J+gpzBLmJLNXpqhIz67yJh1uyGGu2ByWqXUJ+8oQaS4TTU4RmaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Qo+0UOQO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YXzqsd3a; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C66312540121;
	Sat,  4 Jan 2025 14:57:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sat, 04 Jan 2025 14:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736020623; x=1736107023; bh=L6
	b0or5kSQnABMYlz3oMvkpDWOnfeKYY3NnMIx/DGA0=; b=Qo+0UOQOAYi81Rw8Aa
	sdnTHMH9B2p5TLuesZsUZGIvd+Qfic5XB32ekdXHZ6oyI7rsoEaR26aAntqk5AwY
	26PL8XJ2JhJobrWBvwg3prxlVZZ+MHx+y2yuHyRFTcNXjH3pDO4y0rfMMDgY7NBM
	MgP/TOL29Hw0TJdfulQELEDIyT3uqSMNtYA/dFFZ/GTtCfmY3yR00O0zT9IViVCE
	/RTI+87hwLUsUIKkLTZW7C9OW35GFvebe4JNd+wkhYOtac5K5a0tokTXWA2Nzy+V
	//IJfCJaFeg5doRQ1jjG+p4ob/whvXBDdok/VFICfvJ2AnjSREoHW03+xQwrJW+K
	x5nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736020623; x=1736107023; bh=L6b0or5kSQnABMYlz3oMvkpDWOnf
	eKYY3NnMIx/DGA0=; b=YXzqsd3am3HNE1Hefvl4KKMvLJq/Kxu/FrIBySCwO00U
	fZtnYjvwaqNwLtAfx/rgAVlwJW9k1pncvwdaSneIgALSRXSyZL9/7ZvPgIoz37cm
	PlOab2SJEOBPudhPOrBvGtMCyiqCudHmJBct8I7sp8/pPoADIwyZ2p9kXnhgxNmT
	hcpzivNl3jhbsxXurkcPojx93+DUYvGUQ2wbfrhW1ZvT68rGYvEQqMcYgu6Z1ifN
	GzbH9jPpoeyszvJyvaBMRNm7PP9lbwc1283+DtiErAcYA1eeFmhewd2HrJvusaIA
	MouUQCme8xCVZDz0ePAcCg7i287FZ4tD8ClWN1V/Vw==
X-ME-Sender: <xms:jpJ5Z3ojLr6UiX71bc8sr_3DUt9yyfwmFpzoqxLQUNKcEA9eJJumCg>
    <xme:jpJ5ZxrT8jWpX1F9D7AGWYsJciAPXu4I4GQdoxSdlG2iary-KFMRIfELv5M9B1xLK
    0qvv0dv7F7FdUArxwo>
X-ME-Received: <xmr:jpJ5Z0OWZUFQWEsUzUn_XdL38_LNjbq8B2S_CyQJNIqtxO-9if6IgVXMbdhfzf-KSlwf6hnsoK_y4rdudHvuP9C6Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefiedgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:jpJ5Z66Y6AGk4xG7KxIwfCiHJMDqa9R9YFV73Gfc1-6jhTDxXep8Rw>
    <xmx:jpJ5Z24a4amBBBhWlbZRISaLi_BX_2fIRJLV8Er6CkCDpf7m_HJalg>
    <xmx:jpJ5Zyix5dQkxrMzqAFd9ywmut9cEXZ4EhuY_X_dJ2Mcsg_6LY9kEg>
    <xmx:jpJ5Z47vc3bty6bPqznWSGZlpLsVz90eLduv9G7AHL8TII123mtGHA>
    <xmx:j5J5ZztbsyQ-Z9LC47Hu9YuE82jfmdbxYuadDnt-Rekq-XaeQJ448OBl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Jan 2025 14:57:02 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] media: v4l: fwnode: Improve line-orders parsing
Date: Sat,  4 Jan 2025 20:55:46 +0100
Message-ID: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Sakari, Geert,

As discussed in the series which added line-orders support [1] the 
method which line-orders are parsed differers from how bus-type is 
parsed. The line-order parsing skipped an intermediary step which aids 
in separating the values used in device tree sources and the values used 
by drivers.

This was done to keep the line-order simple and based on the fact that 
compared to bus-types we are unlikely to get any more line order 
settings, at least not for CSI-2 C-PHY. But as Geert pointed it out this 
series addresses this and moves the line-orders parsing to use the same 
intermediary step as bus-type. We also gain an enum for the line orders 
at the fwnode level which may or may not be use-full down the line which 
we previously did not have.

As an added bonus the parsing code is a tad easier to read as the 
parsing function is already quiet large and the new helper functions to 
match how bus-type is parsed reduces that a bit.

Patch 1/2 adds the missing intermediary enum, while patch 2/2 breaks out 
the line-order parsing into helper functions and a struct to record the 
information. All of this mimics the pattern used for bus-type pattern.

There is no intentional functional change in this series and it have 
been tested on Renesas devices.

1. [PATCH v2 0/4] media: v4l: fwnode: Add support for CSI-2 C-PHY line orders

Niklas Söderlund (2):
  media: v4l: fwnode: Add definitions for CSI-2 C-PHY line-orders
  media: v4l: fwnode: Parse CSI-2 C-PHY line-orders like bus-type

 drivers/media/v4l2-core/v4l2-fwnode.c | 80 ++++++++++++++++++++++-----
 include/media/v4l2-fwnode.h           | 18 ++++++
 2 files changed, 84 insertions(+), 14 deletions(-)

-- 
2.47.1


