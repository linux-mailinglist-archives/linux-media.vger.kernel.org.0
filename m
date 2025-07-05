Return-Path: <linux-media+bounces-36880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90269AF9F36
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 10:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 187084A7F3E
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 08:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C25B289367;
	Sat,  5 Jul 2025 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZrbPE4h8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZTD/LkXW"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A26286884;
	Sat,  5 Jul 2025 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751704732; cv=none; b=VDcnE9MDFrVEHqRiVoW0vr3Kr+rCZcTACz/MqkSg55M37P9jtVYUZTxQ4/WGJ2Pdsc99gug8Ei5PA1pkUhexwwqrDOj/0hO9YLOlolN9GcJDludXVmeRTLHM1Kwtsh7XjLxftevlmXny0H/bARg1U/KEqxSvuWxkU7CqeSrXdss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751704732; c=relaxed/simple;
	bh=FeJb/+raB5fJYbcRusFo2MVz/GABXUMa5w+fD8Z6fJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDbKxLBMQy7Red2PkgJ7kKdx+J+fuJK3jRWAu+NfQxLR9zjlCJ4nSsXtekSOpF9hRMmEL2JEqpWQqJp9n2x07eoWxnJAdy/ILrvOo320BXq79mg1rR6pih/f4EYCdLLtjv6W+P6m2CXDc3QEgusd63JE8bSjYx+IgO2w3MrkdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZrbPE4h8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZTD/LkXW; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2B2B57A018D;
	Sat,  5 Jul 2025 04:38:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 05 Jul 2025 04:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751704730;
	 x=1751791130; bh=8MjIBc3ZL0ZoYs26maUNFYFLttQFUEIkeWGgCNlQ2PA=; b=
	ZrbPE4h84LW+BIXm2bKZxEOH+jejKO6++1RtgEzbIRUaS7iFzw3cv29DVn+1MB5k
	WPqmlJkRHoDUCYxoYhhyiXNtWGa1ICLCNhX+BH0tTn8EeUBoR+MQ327O0k4SlOO0
	cKzbtPCWTXWqnCf3+SUFj9BF4gbVIIgXVw1acO1AHOdIZRDkkgC78nN4kfbBDoio
	izV4aybudaR1l/B4IQgT1tXTU5wGVQ3bsPVIbhLHcONqeE66QunSKJHX5acOgh51
	O69OtjtZII1pG+kIdM98VQSGXg1iaS0CN6wExs2GTspmZyuUujkfNABo5Z8k8/6s
	5oymJQuANPbjR/qhyp0xdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751704730; x=
	1751791130; bh=8MjIBc3ZL0ZoYs26maUNFYFLttQFUEIkeWGgCNlQ2PA=; b=Z
	TD/LkXWX8BnmlB+i8D1iW0sNrHeNoceoZvEsAtICDDir6wxJDaKIGrrDxhfV9XHX
	bGNAho2UQ4QytnMMGA+R1hfbVL3jDA5G/iaQ3A88nAF2o9G5FaLBVnHcylnYfRah
	DhwcWjOtBAOfbve6Xaf+WL8md5QUsjLh0gMAWeIa0Utul/ksj1pC158he3TKJmrM
	HRtP/60l9FNzs6qSKdsO9cXdVf6OFMDQNl959Vn1QBgKDHy1YakcIlO3PAsELKnU
	MRs+B4XPDLgJwsQG30YlyfCuqSxsYGbZFvIC9iBGkXN8iZ1VgTCjX8sWD7br4z4f
	sRgf9/+PrrysgbQ+Ens7w==
X-ME-Sender: <xms:meRoaL0TMOsuwZ_PjV3RKsO4o5eUp_9tvgGz_AQErTrouitFdcXh3w>
    <xme:meRoaKFRZrXZHhEnGMebV3-n-BjEnj3cKpw3Klp-0zU6p9kU9owU3INyTjaxJtCfB
    CsAzEV3hOeaBsJz7FM>
X-ME-Received: <xmr:meRoaL6_s_-34CWIPiharvyzfZLarVlVNOFgtNarA6uJqxhLQOyYGFS_Hw3KjW90DDQnJyl3crSmKRjDBafTbiu04g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvheehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihgvrhgrnhdrsg
    hinhhghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhr
    vghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtth
    hopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgr
    ghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:meRoaA3E2Ckgrx9LFVuwVB4pPANq1rvmWhUYJRtvpgO8FAjkBr_IZw>
    <xmx:meRoaOHrrs-vCPCMvrHSJGk8hmRPcNoex0Mzk1frat0O-GP47UWA0w>
    <xmx:meRoaB8xuaezCdnbJC4kGNepANoUUEmu2FZERFnTQ6szS0RWuKn_tg>
    <xmx:meRoaLlVLWlp8xOTdhxJyWKr4DCTGwrzCwSMsZmS_KPR01aTYPyc_w>
    <xmx:muRoaEHXPgCS3dp8XCkZjCGH0HYisQAX1oGJeA_Nnjj_WhLD9F6UyqLp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jul 2025 04:38:49 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: v4l2-subdev: Remove g_pixelaspect operation
Date: Sat,  5 Jul 2025 10:37:41 +0200
Message-ID: <20250705083741.77517-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no consumers or implementations left in tree for the subdevice
operation g_pixelaspect, delete it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/media/v4l2-subdev.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 57f2bcb4eb16..5dcf4065708f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -460,8 +460,6 @@ enum v4l2_subdev_pre_streamon_flags {
  *	but use the v4l2_subdev_enable_streams() and
  *	v4l2_subdev_disable_streams() helpers.
  *
- * @g_pixelaspect: callback to return the pixelaspect ratio.
- *
  * @s_rx_buffer: set a host allocated memory buffer for the subdev. The subdev
  *	can adjust @size to a lower value and must not write more data to the
  *	buffer starting at @data than the original value of @size.
@@ -491,7 +489,6 @@ struct v4l2_subdev_video_ops {
 	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
 	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
 	int (*s_stream)(struct v4l2_subdev *sd, int enable);
-	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
 	int (*s_rx_buffer)(struct v4l2_subdev *sd, void *buf,
 			   unsigned int *size);
 	int (*pre_streamon)(struct v4l2_subdev *sd, u32 flags);
-- 
2.50.0


