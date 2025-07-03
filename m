Return-Path: <linux-media+bounces-36725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57333AF82C7
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 23:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3134617B22B
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 21:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643EC2BEFF6;
	Thu,  3 Jul 2025 21:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="c06AggcK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CL9RIUmH"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C7B2BEC20
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 21:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578999; cv=none; b=BMaPa/kYAe513ekYghQDEicNBCuG7eSuCZ3ikSHIH/eVTh4IpoxfagFgioymuooTW9qqo4vuWIWekK8hNOAgJg2hOnUGU9ix/q6lm6sgrVjKN1adSk8ONUiZGPWbkNNS9BYtrkd7ZUbwiHDRPvj3hgUlup/eDXzIQFBY5SN45Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578999; c=relaxed/simple;
	bh=ClJWqIB81WbIXpyAKfmACDVMLij4Pm3Xj37OHutZ1vI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dJb9hqHxn5YOMRrhsu/4qaJTMiKDkZaW/FvfXBea1Yt2+UgLJ4bzhlhee/lfz4evlpKS4VjnUbOCL4qfCRyE8ah33qW9WGoK4+rjHs4arKGmWrQN11XcyoFklaikCCkmJMrX4OnDGPVUfuXPPaO6IxEEFl1E+EqczGcFGJ/9HC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=c06AggcK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CL9RIUmH; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6BC731400F01;
	Thu,  3 Jul 2025 17:43:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 03 Jul 2025 17:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751578986; x=1751665386; bh=j9
	6ovG/LytcJqcplUUyqaN2ThvgU1GWcSDJvQyWGAIQ=; b=c06AggcKZhp86umJsp
	KHsoDJdNWPeByQI6Dl/lF8wwPwATwOUvxtrEwSIa3cMbnOOs4Kz5SQNKnxvOnBHh
	Q/4TYrVjUqfAuPOssDvpMx8vWfC7o1amfNgPYOQmzZ6gDlWFMYmGlf4o47iu+fZq
	t/jF1OP3POCV8vWgZ/WzAgYnUvc2A8hj/uzgEkmIqnNIYBCv0y1f5k+/JFh/ykxC
	vk0vF9+TXlgeAOS2mEv9VrpQn1Tu/L+k80CW78nXuy8vqEq/6bTQnqzmc5pOV1wS
	KfaLZSIGs6jCuHm1FV2WFc6T/E1tsW16EG+UypwPWryVL+Fngwc6u4tSmPbTKR9G
	vLlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751578986; x=1751665386; bh=j96ovG/LytcJqcplUUyqaN2ThvgU
	1GWcSDJvQyWGAIQ=; b=CL9RIUmHSTAoKakeyX7rDSbEb95aNAO+9DCS2DimbWMQ
	krjuN/0XZ9V2RPyAZUj/YLCvq5NbfQQIL5O7RzxbEA2EWMYFZp4v8t6N5RfmkezZ
	ysyCv4jbx4gC3hvRH1UY0yeTRw2vDDZ++8TKH3wBPNY0PGFuQIkggD0l7p/ePTIh
	dIT4Z6Qa6EfWGQCnfqHsQhyRQv1ms8qbss0CTOKM/8bO17t++6Vd8L3DThexNQB4
	AYKA8ad5UIOPTcBi3p0fLA5r9gA8RBinlCTp2GsHjBlv4UnBGCmEa1hE8QcfthOO
	KI/NAu/REyvwpFZ/nqPQA94I7XKbLC9jZNC0DHhCdw==
X-ME-Sender: <xms:aflmaJJpKip0LAxwtX4Y1d-uDVSu_0WtLczbn_Ncws-SxhZ7Nskjug>
    <xme:aflmaFI7dkXlESwKBq2FF0YBgj_1yq2YhzRZtYpPJUKRD9BUJEMm_bjaAUk4Wxwi7
    Ci-nGtaM2i2vaOVMZg>
X-ME-Received: <xmr:aflmaBtGm49Zymin4kvCQCqE8DcrbD-gzRmt4xS4ORcGyEczjNZ-fPqqKgiuVutfcj4NnIDupB83tpMNCzaeMbNTDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhgrnhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    rghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    hmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvggu
    ihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:aflmaKaH4PW9IWBuQnh00Jvan_8hNDMUkJWCi4trOtU3WgU1gfNdjQ>
    <xmx:avlmaAaqxKeQrZVNSIK5rAK3lbRg_eegks_oOwl7_XI0oobM-9R9DA>
    <xmx:avlmaOBk7JES622gDXNZE-mHUMGsOSxzw_vvvdOxS2yzDBCEjOWoJw>
    <xmx:avlmaObEZTXJAb55Wn8L7CIcEUbl_9IZb9A0EckA1dMLCW6mGCbvNg>
    <xmx:avlmaJVTYgyI664y8AKzvLYATxcbmAu4F2-UtbvlfY3Nu4nTzGkoun2l>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 17:43:05 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: i2c: imx290: Remove unneeded assignment of subdev device pointer
Date: Thu,  3 Jul 2025 23:42:06 +0200
Message-ID: <20250703214206.2882092-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The core helper v4l2_i2c_subdev_init() already assignees the subdevices
dev pointer to the device associated with the i2c client passed to it.
And 'imx290->dev' is assigned to '&client->dev' already in probe before
calling imx290_subdev_init().

Remove the duplicated open-coded assignment in the driver, there is no
reason to do it twice.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index fbf7eba3d71d..4f3f386c5353 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1294,7 +1294,6 @@ static int imx290_subdev_init(struct imx290 *imx290)
 	 * will already be prevented even before the delay.
 	 */
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
-	imx290->sd.dev = imx290->dev;
 	pm_runtime_mark_last_busy(imx290->dev);
 	pm_runtime_put_autosuspend(imx290->dev);
 
-- 
2.50.0


