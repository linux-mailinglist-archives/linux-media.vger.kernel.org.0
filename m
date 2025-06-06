Return-Path: <linux-media+bounces-34271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19147AD0803
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7F21897044
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A6D1F098F;
	Fri,  6 Jun 2025 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Gytjnrer";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MEMadvK2"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C61EB9FF;
	Fri,  6 Jun 2025 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234415; cv=none; b=bf/soUCmF14UmN1SgM5PuUtaL40bdEWrBzqbrtr0u5InnS/zc/yYhV3sftZZ7D/w5UdGojmF3IsaJDfMUEd21eJX84+B/lVhljb0ww7cS4Of1wUdm4akZG8SyQOR3yFZKedRx4yT8+uReQj7IBF5Ke+1gct6pOGRKeH7qYJY/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234415; c=relaxed/simple;
	bh=GdIhCmyLWEa63aI6h1ikdlHDcLfBS107YOI+nn4PfV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urQq2cjY1wffTCwa9JMVxaWCRGZ8h1UMgP3Y/qBdsu+g/ekNOiaW1XbIJUfWek7O6ARKLIeMrI+IO/vf7nQkEppdGm6p6cHymMQsc9tkkvgaMsrTAWmogOwcNf7w1908ZiCiFZM+mAbD//1RqCBS89Rqzcg7Sg8EEKOsMaWIUSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Gytjnrer; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MEMadvK2; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 2257211400E1;
	Fri,  6 Jun 2025 14:26:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 06 Jun 2025 14:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234412;
	 x=1749320812; bh=CA+e18oSZpbZHlDawSZtloEWbufZV/IrUlYUz+4RtO0=; b=
	GytjnrerkgdUTYDEjPDkejjb+pfrZWfQPZ4qz6aSV2rgGSTwhQ9RfJIyZY7ZkC0a
	6PDtWZWRTaIncIz1DC8V5hD/N9YLVtJOS18UHicxwFHJtiWZT7B9al9cD6u6QGzD
	hmbRK0HrgZCx+gytZdmW06hXaz5zZz0OQc+ckBayvcBSEy7FuLeJVM0W7Jbr5ylj
	azEg/zkG/wo0sP3L3vhdsC4z34nVBracBrGZ4+Ro9DxTcvuDWiTltC5aT4dwBpmb
	qB9HynxGITyUpD9AxXO+j5VRDimuTovpNH6RDkJy4jvM6M7PDzE6Fs84M0mxE3P0
	9v7/MH19pasDqrODWcPpGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234412; x=
	1749320812; bh=CA+e18oSZpbZHlDawSZtloEWbufZV/IrUlYUz+4RtO0=; b=M
	EMadvK2iV6zvLYRlLvmAgnv1v2Avy6w22iVPVUrAm6MEaRnlVRxUv034y4rDmlBi
	Xo3CSAnoN2WvJ2k33Mbtrq5xO9Qa9xZ+CR44hXC1g6sELcn9RVyajWIOet/t4BD3
	o8/LaGVku6ebntGdUC8rr2Ivl9wDRNqHFvA2VzwZqNdDL7MSUsxYTj4TSOgHoo2S
	UaFcA4OkrkkTQKzdhtD80XePx1iEOMt9Jgo9yYwpM/LXOV+Kx1NPXwOjIvAYr82B
	VAm53E+0prvAKsEHGUMaOZgn5ECQDTV9Eg+9xmpvuedt5D+41VEF3w2qCcoOzXAc
	8NhyIgExrTn0DHAnbxIUw==
X-ME-Sender: <xms:7DJDaGV3-YScim0ZpQgznx0e6vkotrW4vLeu6sDpNp3HszetbLUnGw>
    <xme:7DJDaCmwjq6geB-e6zXiuv-SZl_k4inmMZCrbSC6M7tab0b6Kh5kVHwnN-0Q-Lg7h
    uLsqoy2ycWW18L9r7g>
X-ME-Received: <xmr:7DJDaKYvMnCrqEDacVhf8Isj-291loLqXuM0mTanh-J3Z6lFt_XPqROib30qK44QBlgyMHN2m4ANOhiUfEuK0xcD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:7DJDaNXZGAKQRaQnu5TTmzxl9L1GCJSC4RqOy8kfVI8t2snGwCy66w>
    <xmx:7DJDaAni6fqdJN1gUrLU11SU0yuNLh8u_bhJJTifTvDUtuVJssVZ-g>
    <xmx:7DJDaCfw26XOp0mQiwCEUUxjgf7UkBhJUDTPPbCcAuzmKNEYx0RFNA>
    <xmx:7DJDaCHc-eCCpR9_jF2A_8AIvjrIHHxWBg0FmLTNJw3zxyenY9HawA>
    <xmx:7DJDaAn13Tm_-lC4iqSn_9gbj0WDEsl7lOVmM5AqqFdgtL9uw_PX9HYw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:26:52 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 02/12] media: rcar-vin: Store platform info with group structure
Date: Fri,  6 Jun 2025 20:25:56 +0200
Message-ID: <20250606182606.3984508-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the transition of Gen2 to use groups are complete the platform
specific information can be retrieved from the group instead of being
duplicated in each VIN's private data structure.

Prepare for this by already adding the information to the group
structure so it can be used without first having to find the group from
a VIN instances private data.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- New in v5.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 +
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index cf5830d7d7b1..66efe075adae 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -156,6 +156,7 @@ static int rvin_group_get(struct rvin_dev *vin,
 		}
 
 		kref_init(&group->refcount);
+		group->info = vin->info;
 
 		rvin_group_data = group;
 	}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 83d1b2734c41..313703cd1103 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -242,6 +242,7 @@ struct rvin_dev {
  * @lock:		protects the count, notifier, vin and csi members
  * @count:		number of enabled VIN instances found in DT
  * @notifier:		group notifier for CSI-2 async connections
+ * @info:		Platform dependent information about the VIN instances
  * @vin:		VIN instances which are part of the group
  * @link_setup:		Callback to create all links for the media graph
  * @remotes:		array of pairs of async connection and subdev pointers
@@ -255,6 +256,7 @@ struct rvin_group {
 	struct mutex lock;
 	unsigned int count;
 	struct v4l2_async_notifier notifier;
+	const struct rvin_info *info;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
 	int (*link_setup)(struct rvin_dev *vin);
-- 
2.49.0


