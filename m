Return-Path: <linux-media+bounces-25070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EA3A18637
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 21:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA413A3858
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 20:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392661F78E1;
	Tue, 21 Jan 2025 20:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QdQU+3Ol";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XurY7Ioe"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C191B808;
	Tue, 21 Jan 2025 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737492274; cv=none; b=JsfK1IxG226Pa8L2SxLbluUu8KWZ6qrKM3GB78KZPiaoLwobVyq+r4DGMG+IqC+GIqQRoh9VH6e/GwaQOgDlT+t27qbL044w/+dztSC//5kPsqUNqTdEBE2+CX/HaulvM7+YfVSgfe0a9DrPBp35kSZNdB4ajtSdNUIS3wcHzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737492274; c=relaxed/simple;
	bh=yo4wlpdr/6Dbs6aayy+WBc6bxvL+D7s/8FKptRM5AmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvX/J+Xksl0W/HNB6pyl0shKjFB1g5Y0Wt2V43X+i9NdznmhH4by//V1xkGPJOrop+RaO1v5E9IzwwAvW1SDI2wLJmsWuisvaG0g6OXpBpvIDxOVmXdrEaqCZfZsHwaNVTG9yCytqxuEyZa6Qi0B68mbNi0DYPjHG3vLd0wpfWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QdQU+3Ol; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XurY7Ioe; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2AFAB254017A;
	Tue, 21 Jan 2025 15:44:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 21 Jan 2025 15:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737492270; x=1737578670; bh=hn
	P3Ci28Onvn0w+XMpeq8bD6Py1e4ZTGnJ50kBrMyzM=; b=QdQU+3OlHacTaIEgbA
	uHlEVIOkcFBunm3mJMEUXIp3vRW7LlouIEUzXmYc08Ec6FfPFVBx9sQuvwMypt2U
	bDNMzU4J1Mc+J7/S97o3F5bWLkKLqqzXa6zyR5HwwPneZdIHhE+7X8+vzoSyaJFq
	RrUN9KKnLdrVEw4lvnEE0l6ViHs+PGK5mS/WTzYPXv286aGb46erHx/eoeHBa5Os
	C+YhjoOLbrtKHdPZzptIs1S4IJMxzJvoU3IflDalvJ07G4DeKaOHvzggULPh0CK/
	MwYbgWn4u8WXoDscGOWffX/HiNgErugn64UbzOCA367h/DNansVOnVq79Pwh4Iuh
	9ltg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1737492270; x=1737578670; bh=hnP3Ci28Onvn0w+XMpeq8bD6Py1e
	4ZTGnJ50kBrMyzM=; b=XurY7Ioe3V8WnIBM/rigZun74Sq6B8l2QM0zhztZfPnK
	a9Dyduf/qfAJyV1VJyhhfkxbusEvdTk6GXchBONZUldlQWMLtktKH6u97gpsvF8K
	3et/ojS8NWN1ZxL3ALEcR11O0uYGCkFiImz0XEZaA0drjNITwirtB88l1p5auCLN
	i8IZLmyW4L1KU+cZx6SVlkB62zG3FS+k8Hu9V59GKj3uH2Kyafzx+X3oiRTAAcGV
	8E1z0c8pEZgZa6h9HFLTujwh12HU3HSrsHC7JGF/EgNhSmuaTQ+azGoPzD+OS+1l
	cWz7C6XCYz8snqwNVTzqEWilt/+J4J/OLB3xPcpNdQ==
X-ME-Sender: <xms:LQeQZ6XUKH-uqpAFIF8F3TBwhJU1krLee3hEOVGyGnrS80q6eMk_Cw>
    <xme:LQeQZ2nkgDnzH2_ggfeAlUE-bqNcjLRzm1tZISLn6trQM2rt2Ddf8MNsmNetBvQ-3
    0jQWfl0oSVlqc1Uirw>
X-ME-Received: <xmr:LQeQZ-buQ9-lX20MVF1aBHpI-rxlzEqigwkxrtPbwJcChlOaft5BcEQU-9EzAbsrbY1YMgUjF958RpFgZgTmwhVaTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejvddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhivghrrghnrdgsihhn
    ghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrg
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrghnshdrvhgvrhhkuhhilhestghi
    shgtohdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluh
    hnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:LQeQZxXIeg0rwFaYQwni6mOMy-etRFju4SJ7EqYZoORKNI77ZWTOFw>
    <xmx:LQeQZ0nTqfLpvWrNi163TTK-KRM1TR_8cjf8C7m4gSp-B26Qhm_nhg>
    <xmx:LQeQZ2coVXwzL_5SrLQzbEPzEI5tu0SGU2Knb74N4RA2yOxZNYbRqQ>
    <xmx:LQeQZ2FPIHZ7Za08bDaU19s9i1MdW41LV0oZeE8PbYqxu-vGWZ6STA>
    <xmx:LQeQZyatOIH0Ao6SGdHg7NEx0IhkImYNkMnEJCIZAUlppbalr5TtX30b>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 15:44:29 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: i2c: adv748x: Fix test pattern selection mask
Date: Tue, 21 Jan 2025 21:44:00 +0100
Message-ID: <20250121204400.4184438-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The mask to select the test-pattern in register ADV748X_SDP_FRP is
incorrect, it's the lower 3 bits which controls the pattern. The
GENMASK() macro is used incorrectly and the generated mask is 0x0e
instead of 0x07.

The result is that not all test patterns are selectable, and that in
some cases the wrong test pattern is activated. Fix this my correcting
the GENMASK().

Fixes: 3e89586a64df ("media: i2c: adv748x: add adv748x driver")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 9bc0121d0eff..2c1db5968af8 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -320,7 +320,7 @@ struct adv748x_state {
 
 /* Free run pattern select */
 #define ADV748X_SDP_FRP			0x14
-#define ADV748X_SDP_FRP_MASK		GENMASK(3, 1)
+#define ADV748X_SDP_FRP_MASK		GENMASK(2, 0)
 
 /* Saturation */
 #define ADV748X_SDP_SD_SAT_U		0xe3	/* user_map_rw_reg_e3 */
-- 
2.48.1


