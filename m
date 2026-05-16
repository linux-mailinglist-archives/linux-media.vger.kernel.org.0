Return-Path: <linux-media+bounces-61824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCiWD0LeCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:14:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B620455DD0C
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE95A301CA40
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F123737F75A;
	Sat, 16 May 2026 21:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Bi6m5BYX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FH7yyUzv"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F537D105;
	Sat, 16 May 2026 21:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966048; cv=none; b=Sx1BJhW/A1/M7QR8WYaj12APt6kXd+FRgf3gmT/9TlOutXgHZkr3unu6JJE7mFJDQp7P4KYuAiWlQfg5r3GGjhG1UeMC/2E/Z8s2piJiF6X7I3BRsBPv4mmcSeamdCXVSL1FOnZye7Ee/d7IgyoH5L+J/uny4ArUSWP5OV+CLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966048; c=relaxed/simple;
	bh=cczfPQFCh9sr2exfMsGQyLvmyRD5uVtbTQsPqX/aFPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUmqaJiGRplLAhamfLvkZVZRFXbMqoqVkVI16C9aAQjNxT3JiEU3UvxhG348Niv8SdqeB4EdFASPykUyanrAGyGl6gOlgTik8aT+FzqBVWv/YNoft5vsO5TceFZxQ1eJk6k8++HwBoHF4QMq47RGikA9zf7IkB4d3+rw+TVSX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Bi6m5BYX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FH7yyUzv; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2FB661400033;
	Sat, 16 May 2026 17:14:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 16 May 2026 17:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966046;
	 x=1779052446; bh=8s9vjoYMYF2Sjsg3CHw2Yw/d8G/4iac/Y/c020DSPtY=; b=
	Bi6m5BYXZBSekppcVjvQ/0kYax8Um0CmaS6CdMRFK16ZucGSs9fjo2RlCAhZ3xZ9
	GzASmx5zhCT8rJiLkh9gqbsaV+MHFqBNVsrK88q+CdZSCwo0rSFUOP06vofBOcpK
	cvrHb1EHxNfFqeSi8lnHuYl8Nk6qXVRco9Xw8Rk+ny6WBiEfPRKC1C3R9PF8QZEx
	d13/qUMrZC44+LQKyEqHgB+AZmuNTuMN9rwPp3d6uR+9PTxgyOYlKr6swDXzxAeQ
	7rm+jyA6lTgRaNWQQKY+5hR7BLaTmV15irHtS/Uwdo8gMwUbC9stKouS1+TIgVZu
	3tLBvgrIk8MYqDBWARDspA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966046; x=
	1779052446; bh=8s9vjoYMYF2Sjsg3CHw2Yw/d8G/4iac/Y/c020DSPtY=; b=F
	H7yyUzv5f46pQjZ2ZknB5ecLt9cHyrIWLh++dvAFTTDfY8wr2sTDSRdVqLAQ7dEn
	uH5TgrS4pspC6JIF08V5UxVYtNpEBLnCXuhTNaLC6p4+iUNbqsk+lawMLyEhqtoS
	I6qz6eJ3jjKSX/rUoq/S0C/OhHE54arNjWTB9DQJA+Xm8KeeSG/H3bj3u1j9aROl
	dFw3Pfu34Ae0exxiynZq0K+PR/NeLLKwX/X34KokSyOsa6tiX8h03NleMuiDJjbn
	b0AvUSeviZTROFaZVP+VwgFc1ql/IIBhYci/4IwmcLK1LQdRCdQFHrYat0EPngOd
	NHlCCTCr/fAykw7qa6gjg==
X-ME-Sender: <xms:Ht4Iap16RpNrJk9eZT9v55ebU_3yl8S1UxSYNA7AawrDJr0n7mZK7A>
    <xme:Ht4Iagj5iEeCzJCYfeBNnpRfVX-JFT_pkDAUECc2Hgorw6RofEetMQtoQHXknueFV
    65a5or0Dmgliu-lVzq-1Hxk-9U42REWL5QXpRTgSQT8thEeGr5wE8Q>
X-ME-Received: <xmr:Ht4Iaqk0dtEhidQ0yXLDZH3h-T8XXNcDG9DqzyFFLZ-544W_b_FCN5jruyGh3HzuMhblhbTdCIuzM-6aGdFAVntnk1dbtfZ5J79R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgs
    ohgrrhgurdgtohhmpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrodhrvghnvghsrghsse
    hiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggi
    esrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghr
    thesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvug
    hirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghn
    vghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhi
    khhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:Ht4IauYoPPTOtWKFmeucgcOrSwOjE9EHCyYcx6Swg5I1woYmG8Gi0g>
    <xmx:Ht4IatFGCqZifptgv_b15ZEXfyueew5ctUM3ugXOMQnED0I9LfqcwQ>
    <xmx:Ht4IalbuIKW8tYLuumM5LsdJ7XS9F4RTqmGsZ8kdrWSsixxTbI68wQ>
    <xmx:Ht4IapyWjIw6X82YGVtIhbomBJWtYY-KSYETBlHmN6hvKruEuGAavQ>
    <xmx:Ht4IarC5ZiyKcIDUEvFNbg7yMpYwTxxdARuqDZtgnY2nufCoUeX-9mDR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:05 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v9 01/13] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta formats
Date: Sat, 16 May 2026 23:13:08 +0200
Message-ID: <20260516211320.3041412-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B620455DD0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-61824-lists,linux-media=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>

Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
parameters and statistics buffers. These formats are used by the driver
to exchange ISP configuration and 3A statistics with userspace through
the extensible parameters framework.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..cd3f4a86e27f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
+	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..1f78b5378b3b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Dreamchip RPP-X1 ISP */
+#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
+#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.54.0


