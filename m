Return-Path: <linux-media+bounces-36879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4AAF9F34
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 10:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CDDB5817AF
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 08:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E59D28935D;
	Sat,  5 Jul 2025 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="i+ZeIC8h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ODVVi61U"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42E288509;
	Sat,  5 Jul 2025 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751704730; cv=none; b=Ar0LUAdDpS12UUTm1ooijc/75/pYgQ5+ZgTUFggiaV7uJ48+1dSyQExjVTts2TDh9rchx45MlIrzl2RCcyh9GkQqW6el5rCOcFt4Fw0B5XL9SAA8TwxQJjXiC/4+3su/BFnCSun6EwhuUXDMQNU5THXPXwLeFy+ba9XTi3L/VIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751704730; c=relaxed/simple;
	bh=pmk7YPkZiScL4SZ4iplC92qayaP+SFrVXxQhq7jDTqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Npr05gH+g5GMZZ6EyTKOZI0y2WSXbE+5pubkExK8iw3k6Vputw3QRiTTDtnUabMWkTaHeGArFm4+MmbeBNmPOaeWJS2tc0rgcC47/b3/cawzSkVBlgod90p8mfu3BlsfS6sijRBtp3M/ibvf7ycY+PnUe0t8IBOc+2Bu1pKMs8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=i+ZeIC8h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ODVVi61U; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EF9797A0186;
	Sat,  5 Jul 2025 04:38:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 05 Jul 2025 04:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751704727;
	 x=1751791127; bh=dyp1R103fi3l7/oLQ8rCzbeCv/EOPmioAaVMjZotNqU=; b=
	i+ZeIC8h6BLMAZChnFBXJ0tU4xhqOYRQHekaIxWCb8Cs7OY+t1joRoeBtWzwAwxV
	0/LklkDU/MM6N5e5SX7ovAiPMwt6ThB8gZCfA81NFi9PhJEnckWpSPAXs7VGNOyj
	yy3n2oP4wnhg4xJGhcGo81naO3sXVKgt1ZURHje/obfsekVE4+s+eAX+crdGT4AB
	vHp/o1/hIct8270+ApI+Bj42/XKpH9U45ohuQKI+igLug3ezAlEyJPpskF8n7XlK
	BIQuikR8DCMhHatE4qpgvJR7dNhqrQq4E0LIylpGgY0YP5qsGdoHNfj3XIzDpzQn
	pr24mxEGBcCDi22zG+JycQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751704727; x=
	1751791127; bh=dyp1R103fi3l7/oLQ8rCzbeCv/EOPmioAaVMjZotNqU=; b=O
	DVVi61Uynm8VH7Vy1rb++qSnG2/CQSKAO4Vp8nWKBYTX56ZzNubGvLAWPLn3ZIom
	Qe/sMABfT9+tLJqq5z+WIfOPXumrgk19l2EliGFmOng2MTiRJhWJEGLBbfEP+qcO
	fa8r4xee4JfWeC+Ku85zVq6AO4y/SNQBV8pOMZwDTaF9JkyuX4e2QG0KSYfMEvjH
	wt1MCLXlSG9ol7bckUetShONeK1ApRSmtmuapKB3ub8WzpzNYwFWbNj8L9f34t4+
	MMkgo2XZRqUkAgagjCs5LlC0mTfDUtzBpaiB5FCni56n1t5hkshMyiwpHgXmEERj
	qa8cedfNhyeWS4uRB3VaQ==
X-ME-Sender: <xms:l-RoaCrFca3DudPMQIqSXrbe4r794CaiRz13APTRlr_f1EcoHnrd5A>
    <xme:l-RoaArLQof1GksXZq3e3vq-DCpa2y2TMDowYfPnsxUtfZ-Q-wWxh5-b7Kgkdk4JP
    1uXzwpNU1wwYcKWnlY>
X-ME-Received: <xmr:l-RoaHPHc2r03DjNEa6SGZX3qkAU-xZDMhg0UAHjz3oMMIjhxmzXsUiE7vRxN6iG3kx-ocdfkIkYiWf3LRambQqh_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvheehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihgvrhgrnhdrsg
    hinhhghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhr
    vghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtth
    hopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgr
    ghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:l-RoaB6qZDW8ZPqaZeU_qxRb6p5wdHlufNzMSB3ddyQJhqU4nkmA8g>
    <xmx:l-RoaB4nn0DmPZ8Lt7Nr7dy3tHtfZsREbFcIJbV_A-waik5ou-8AlQ>
    <xmx:l-RoaBg4dxUzW4EupZHKnCpeSXCDiQ8TnxIcywItyOLGwP02hRDnOg>
    <xmx:l-RoaL4D5ji-lpcUudtQZ8TZiNeH_3-Bkdw5FpB50E4gipg6_R4wdQ>
    <xmx:l-RoaFK2hfVPTSg39-NwdbQrn38SY1cEvDA672lIenIqJNYdd6NxzFZh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jul 2025 04:38:47 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] media: adv748x: Remove g_pixelaspect implementation
Date: Sat,  5 Jul 2025 10:37:40 +0200
Message-ID: <20250705083741.77517-3-niklas.soderlund+renesas@ragnatech.se>
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

There are no consumer left of g_pixelaspect in the tree, remove the
implementation from the adv748x driver in preparation of removing it
from struct v4l2_subdev_video_ops all together.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-afe.c  | 17 -----------------
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 10 ----------
 2 files changed, 27 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 5edb3295dc58..678199196b84 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -161,22 +161,6 @@ int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
 	return sdp_write(state, ADV748X_SDP_INSEL, input);
 }
 
-static int adv748x_afe_g_pixelaspect(struct v4l2_subdev *sd,
-				     struct v4l2_fract *aspect)
-{
-	struct adv748x_afe *afe = adv748x_sd_to_afe(sd);
-
-	if (afe->curr_norm & V4L2_STD_525_60) {
-		aspect->numerator = 11;
-		aspect->denominator = 10;
-	} else {
-		aspect->numerator = 54;
-		aspect->denominator = 59;
-	}
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * v4l2_subdev_video_ops
  */
@@ -307,7 +291,6 @@ static const struct v4l2_subdev_video_ops adv748x_afe_video_ops = {
 	.g_tvnorms = adv748x_afe_g_tvnorms,
 	.g_input_status = adv748x_afe_g_input_status,
 	.s_stream = adv748x_afe_s_stream,
-	.g_pixelaspect = adv748x_afe_g_pixelaspect,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index a4db9bae5f79..b154dea29ba2 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -382,19 +382,9 @@ static int adv748x_hdmi_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int adv748x_hdmi_g_pixelaspect(struct v4l2_subdev *sd,
-				      struct v4l2_fract *aspect)
-{
-	aspect->numerator = 1;
-	aspect->denominator = 1;
-
-	return 0;
-}
-
 static const struct v4l2_subdev_video_ops adv748x_video_ops_hdmi = {
 	.g_input_status = adv748x_hdmi_g_input_status,
 	.s_stream = adv748x_hdmi_s_stream,
-	.g_pixelaspect = adv748x_hdmi_g_pixelaspect,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.50.0


