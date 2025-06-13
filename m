Return-Path: <linux-media+bounces-34779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59277AD9174
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7023BC447
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E04D1EEA47;
	Fri, 13 Jun 2025 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dnePkfju";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aZTKFXj3"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AAF1F03F3;
	Fri, 13 Jun 2025 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828928; cv=none; b=U1zDi8Q5s/n26ayUyGlSupwUFxPRjYBG2SWBnrtVlj3qkD1xQUejLhBLiOQHu4AIuJ5a8WwWDT+djl+f/gAHfOoWO8PR3Qa2tQE36MVhgAFaXT4LFSMqBQA0FfHhodMwfVrZc1gR3qr5GLThOTXD71B7lbDWEzxZpM99iF6qLPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828928; c=relaxed/simple;
	bh=JAkV6y2rIEthgNL4Pc8+3KL3ToVlYerUbSxLdiR4Su0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRxZrxa4VzjWGnxmRMr1glxhudos8Rsujens/KvQ8FSvJQF4fr+GsrJJaFM7jvbW1qJxl+Ze/29fTKklcgZ+gg4+No6g7QnrqTePvD5GkJIBpC50SC0sFQQJ0QnXP4hhnjXQ8h+0jS4n6UOVZ3eNB2f4AXPQKnsJyaJBqiK6TN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dnePkfju; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aZTKFXj3; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 16FEC1380392;
	Fri, 13 Jun 2025 11:35:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 13 Jun 2025 11:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828926;
	 x=1749915326; bh=j/RDa5/9tDbREEo+aHBsxG9I7fhin+mYZz1Rk7ttGJw=; b=
	dnePkfju9PDVf35ABCbCIxguLKvhn+tyrVRc5/ATIcI9i66NX7H8SlBRop3Ox2pm
	V+/MVS0k+1kK7ocCKwyYqBPqbRQ6mvuK2haDM3EhxpA0OpM9TPSRsWv4t33LcAw4
	k+vf9VL1h+KC4db4owmutFIDlJX/oeQTFScvbrJEw2dw21UBBObfqOKJeE5CSqY3
	q/zWyR0tHp/jpbMMfDJr+6y8zhfQ6zXwTZdwZynF59+D7CrAtmzOZAXa6zrwOTjk
	NinYkfbP1Zd8S79oUCJ0ZZJqa7vmxyQ6zuYrLhURFc51XXTLvW/9O7FA9q26rIs9
	8bg+AOgVdThVAiJLvsqvgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828926; x=
	1749915326; bh=j/RDa5/9tDbREEo+aHBsxG9I7fhin+mYZz1Rk7ttGJw=; b=a
	ZTKFXj3+EpSuQShP/mIWkg5M8MCXzFB7k/DmTwTgNja5t15ECbq4D0qsifgh7Aqq
	h3gPKmWNVYLLrbWAaQS36/rp2XWj/BU1bWPe+yJCbK2YH2/5MNopG9pgh2bKhPTg
	OnPzKlITI2FaLrzjvZ/VHKlF5J7Gf++D3hPXpMqKYa7pWoAf3OkDh2HZqCyQYCJg
	nGn/evxIm3q1OiyzUJwkCgqgelzAFTFHeSHc+5KdF2E08A5kkaU8osdcgW3QTt0/
	3CuShOXwjqacKGKtlExDlM8bswjHC0CmGZWMfuRepT4h5Q84dLqSbRTXH8tFPy3o
	MWRfUA3i9S7cKKuyYNwxw==
X-ME-Sender: <xms:PUVMaKjAhOp3lBgZX63hXYg3zyfKKPLjXAU7MpFu8JP8lyqnTJ5FcA>
    <xme:PUVMaLATc7JJhvNqF4t0wCLCNv8WuixC5-wQ2N67E3Oy77tRXvBFPl1Mnz6o9ocMj
    hpSZILA0pbL6PwOkmM>
X-ME-Received: <xmr:PUVMaCHaTxxF_GRONupiBmEE8uQkZRFL1yrHu_0OpZ_cwz2UerBPw3PnRJ0614GoTIh5EjMns8uRF9P1qasQc_Fv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:PUVMaDTySMXde6DpB1uBIP3flczSoopMPVayMBkFEREArG6EAxUmJg>
    <xmx:PUVMaHyc3SVEBPXX_gxqL-w8f6j5z1m3PLHgELfof2613Mg8Scdopg>
    <xmx:PUVMaB6lKYXwqbLG_VEyYKrl0R0BXxpzUYFJhsHtZOJazqQ1Rx1xXg>
    <xmx:PUVMaEzTWcuZg1mY8ty1SSN02L39AxR5LVl0yyiUZqv16lyThV-aGQ>
    <xmx:PkVMaJpbvvnJ-JsNzLQSql0azCDqSw0a8H8VZXSnWkUB-8Wyrs_ybU61>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 09/13] media: rcar-vin: Always create a media pad
Date: Fri, 13 Jun 2025 17:34:30 +0200
Message-ID: <20250613153434.2001800-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for Gen2 media graph support by always initializing a media pad
for the VIN device.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- New in v5, broken out from a larger patch in v4.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index b3558c3c44d1..7367b5c993cd 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -895,10 +895,6 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	vin->pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
-	if (ret)
-		return ret;
 
 	ret = rvin_create_controls(vin, NULL);
 	if (ret < 0)
@@ -980,10 +976,6 @@ static int rvin_isp_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	vin->pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
-	if (ret)
-		return ret;
 
 	ret = rvin_create_controls(vin, NULL);
 	if (ret < 0)
@@ -1377,6 +1369,11 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		goto err_dma;
 	}
 
+	vin->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
+	if (ret)
+		goto err_id;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
-- 
2.49.0


