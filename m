Return-Path: <linux-media+bounces-60215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMaWKcjx92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:09:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1636D4B7DD9
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E701301A396
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14D21A6839;
	Mon,  4 May 2026 01:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fkBT0qRi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZZSTfjRH"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03913126BF7;
	Mon,  4 May 2026 01:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856937; cv=none; b=eZrua9n4xubZp5cpDIk5OX31QcHXBJ/ZZ9+PUzQ955QPE3mdYUkvWRIZV6UzWGZETYs0AelVhOVHyFC4pgpSKw/Y6VMzKShABiLt3nAGaiLJVhlGICnNL3cqJaCVUy69oW8fcQzQbqXpGj3jy34TuQbO4JbRZ8m4ZENMWHHrybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856937; c=relaxed/simple;
	bh=cczfPQFCh9sr2exfMsGQyLvmyRD5uVtbTQsPqX/aFPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVGChKvb1XudC2jL/MehQ2Lb80O/UXQLYELSjqVT/174VEn5dCYs7kXMDafvBgxJ4S5fNHaYe6NMvOcMlKx4kZue+CvvP88dZmfPV8Dyk7ToJERWZ5C9adoytcu+UR4oP8jbgtKwA7LOqv5ExU/LUyLRFXNLdXHhBaDiTsMm9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fkBT0qRi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZZSTfjRH; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 114AC1D00090;
	Sun,  3 May 2026 21:08:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 03 May 2026 21:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856934;
	 x=1777943334; bh=8s9vjoYMYF2Sjsg3CHw2Yw/d8G/4iac/Y/c020DSPtY=; b=
	fkBT0qRiCUwcQ2jpsIEQwLmZsCpAZFw6oc8DRK3w6qV9JgjiJ3OAVzCosmVbzISH
	8ma+p0ApxK7MtSLpWkKjNZX8E1LaOV/kJW3r6n3CRZ/A6S2SM8+TH7Bmc9T+fopY
	8D965vbzEXKW4yOGDiKD4++paNPUwMTZtF/a4OWWl/EuZh5JO6naJEcHHvHOP8Uo
	ik27G57o+h4wsGEsnXXEcCvo3LYX8UjYX1tKmUoktjbvRCpCsm7VakUdLsLIp+/6
	haoD94y6/4raXPMya9zdJMq/ybBFBVDTyBotmp01hqtgsOzr65y5a7Vk3BmVpNNQ
	tJe4oBtnoq/1DuyNuo9D4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856934; x=
	1777943334; bh=8s9vjoYMYF2Sjsg3CHw2Yw/d8G/4iac/Y/c020DSPtY=; b=Z
	ZSTfjRHrXI3GRjtVo3g1F5vwudHlT8ZRh8uP/XkLR0OpWR8ewMDHdfabES4cxqVA
	A+A08zBPwlXl2xkCS+E3fHVZvdrlKvdt7a47UmV8dCBZagy0s0saTO3ezOsBW2V4
	JWbJARjhmiTP24+eJQB01qSY2aTk++g1LUmUS8bztRqkNe73ldl73V0OM4IyaL3+
	oDWwKtWhv2dpYDoHs9S9Opc4CPZUdi7FjSbOF3zDufenzKL5PeaxBCh9ZlX4IwAQ
	PtZYi6qNUHzxjdIapcLJW3cx8eCgmIkwybhAr4ovxcJ+N7oe/Bbw07o7QgRY6/Vz
	WirSzws59d9voe/eusFjA==
X-ME-Sender: <xms:pvH3acIliHPOTXKqiIlGN-GB6e8gM_vo9kUljA_PDx2LXBCNcEMJag>
    <xme:pvH3ackVXp8-hV8_wgm8XIsyw4Zzju4bKySUtetnjSJbWLmzup3uyV0HiAMIfHxpr
    zu-6D07t6Apdy659jafNbhsxaelOgzBOAzd_6tFM2Uo88ptWVx2kW4>
X-ME-Received: <xmr:pvH3adbY9I63FNxPILgFSlcVb6ctuLyK-Yr6mjxyfp3QHbizh4YNntM87yG5qqfDmfWpAOqgc1-80jJN6k8qDvo6bYvE5wpj18-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrodhrvghnvghsrghssehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrsh
    honhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhk
    lhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:pvH3aQ9-JMr3Gej0VPEQqlOuZvPQ19CjlVEczQCd66uU7cvkt-YHIA>
    <xmx:pvH3aUZfRYb3VyTRoe4GJnBFkxxnlwYgh8hBCulc_mpFa6csbCFaYw>
    <xmx:pvH3aSd2HzgqF3DwZTjmHaaiVfE5PHwEfK5eh-zqszqfpThClaQetA>
    <xmx:pvH3aZkwnkOYKSjzzB1HbfJzWUchSa9BFp3TIB3MMKoM2573nQvRuw>
    <xmx:pvH3aZGWBVW42M9EHEQa5iPkQeBAW4eD9en9772TJwnjfne4t4R750ZA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:08:54 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [v8 01/14] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta formats
Date: Mon,  4 May 2026 03:05:43 +0200
Message-ID: <20260504010556.2796398-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1636D4B7DD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60215-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]

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


