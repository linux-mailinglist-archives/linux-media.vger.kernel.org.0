Return-Path: <linux-media+bounces-36716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18575AF822D
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 832A41C87958
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBC52BE7A8;
	Thu,  3 Jul 2025 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="M7KRAeYI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="COrzhS0j"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC62BE656;
	Thu,  3 Jul 2025 20:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575985; cv=none; b=kvQI25/zNvYxEP6XPjwqZUzBdRP8D47KaaTdB+aVylsRpx/Z9Hg6BM+fmmXHlFSNllyQdt7cjsqTHAlIjoJxsDgH2tvUxMQD9074oFh5aqKwJq8ZKHKZsrnFti4tTJP0JRhPIlkYMpKlzlCA5rNqjdIe8F8kHUye4at411Im/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575985; c=relaxed/simple;
	bh=lJnPnfXktNn6wZVcIYgJrlMU/hfkjJnlgLoFam9qisQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwH4U3BFoxS44NnPk+e1iBtJdC7AwaDCnufMKMLXiOu9be82M3zvGkm8RyqJblxutIpDNRvTXUDIDF0/rB4AAjs9X2brGogEapnhrloSrKqBig5vf145kxwTRGl3QSNvvMOhxWXgBZTBKNBMi021w0roX0553Y+MHowPu315DYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=M7KRAeYI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=COrzhS0j; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 215E3EC1031;
	Thu,  3 Jul 2025 16:53:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 03 Jul 2025 16:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575983;
	 x=1751662383; bh=OA85e1V7cf4XTBxrWIU1L4wKj9ZHBlZ/xxsGQzrAzIU=; b=
	M7KRAeYIFf4oMddmysRcRk8+NWDq50kn91lMi9bpGbxWn6ut/+W7u6/GBC3hKrED
	RCXWUQNBDfn/JsOsGt60A0uyRIXCQSIrHf915HbWzVqjlgiBIEn0/XLiuPJ1oNvB
	x8kS20cJIRzXuHgaub8Xf5W1i8biRXbuZqwBY1fzKxhdMlxgRg5qDbaNGRwO+bQj
	n4SN0POMdUkgPJp0SvmJ66ql3FySeTDDUWCT8lLSude4Qm7KZbUgnUfUJ++MBJE2
	lDbzZTeSLtevKXQWSZjqp3iTZ6BA52HSpA3acsYNeT21RDsCp0fQyuv5O7E38VMS
	nTv6EpsbYnUIBKZbaNQCCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575983; x=
	1751662383; bh=OA85e1V7cf4XTBxrWIU1L4wKj9ZHBlZ/xxsGQzrAzIU=; b=C
	OrzhS0j9Kz1e+g2VAkub52As3IKHuf4LamdM0tHUzahpnHvmxVJjxQcq3Iug5gy8
	ouBfAvcIpU4YXOnXw84IkXCZ5XfJFXl1NPtNWlvLBwwpYO7bnJUT8Gdcwq92qRY4
	jjgBOxGM0h1tLqSI+rgCs+UNlDXMS9dxERCRdDBm8u7cW2MzjqPMSlq4OI8eN1/U
	UgHT2uavxNuXK5JB6lH2aJby0fFNtkI6gcyHfweMQTVWFz262J7I/tXJkzFcED8x
	N7AxUVUlrebUUIAowhvN1Arxzpa79vO4a4v1oGWQkZa+uqg2ZTA9zuIpuFY0qTiw
	wBXSmy3HcNLT1GVKSvktw==
X-ME-Sender: <xms:ru1maC1pwsqxQGNq2gdYA-QGO4Xx03nLEjodaE-JQNr42Vk1Fmd-Cg>
    <xme:ru1maFFSt0K6s9jkbmRjxRBrK_Ue3PpVmfq60rRa_SNAOFguwgggun_pTbgeL1DFm
    cRAHJhIzk8cgAgA-Dw>
X-ME-Received: <xmr:ru1maK4qDzRI_IBwhaK5FZGwGtEJHySuXf27FJr7iTuQtEEqxlXizrdKg2K8_vXvgaoU2FYBZxogBWwk8EM9Ptypcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:ru1maD3sGExfSXa-I8mKLd4KNG0VXkCutP0aInUr3LCJjAOb5qKd3Q>
    <xmx:ru1maFEoW7XVDpaecTbX-QAPBwRnXLa0LF5xgIaf2-mtD0P08Mi2uw>
    <xmx:ru1maM-MmwcguadFVIIMZIJuvA4hJDKABEuF8H3JH1Wom077WdHoSA>
    <xmx:ru1maKl_LsFdH0-u0NZCZ5OLRgRdY5Qjz32Ls7e-SgIQUB8PvNdTNw>
    <xmx:r-1maIKv4aAKnIoH6v-GPNt5sAN2rTrvK3NubUUmXuLTggdflFnZh23I>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:02 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 04/11] media: adv7180: Use v4l2-ctrls core to handle s_ctrl locking
Date: Thu,  3 Jul 2025 22:52:16 +0200
Message-ID: <20250703205223.2810806-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of handling the state lock ourself in .s_ctrl use the v4l2-ctrls
core to handle it for us. This will allow us later to use the unlocked
__v4l2_ctrl_handler_setup() in initialization code where the state lock
is already held.

Add a lockdep assert to demonstrate the mutex must be held when setting
controls.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index bef708916190..c2a79eba4dcd 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -601,11 +601,11 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = to_adv7180_sd(ctrl);
 	struct adv7180_state *state = to_state(sd);
-	int ret = mutex_lock_interruptible(&state->mutex);
+	int ret = 0;
 	int val;
 
-	if (ret)
-		return ret;
+	lockdep_assert_held(&state->mutex);
+
 	val = ctrl->val;
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
@@ -647,7 +647,6 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 	}
 
-	mutex_unlock(&state->mutex);
 	return ret;
 }
 
@@ -668,6 +667,7 @@ static const struct v4l2_ctrl_config adv7180_ctrl_fast_switch = {
 static int adv7180_init_controls(struct adv7180_state *state)
 {
 	v4l2_ctrl_handler_init(&state->ctrl_hdl, 4);
+	state->ctrl_hdl.lock = &state->mutex;
 
 	v4l2_ctrl_new_std(&state->ctrl_hdl, &adv7180_ctrl_ops,
 			  V4L2_CID_BRIGHTNESS, ADV7180_BRI_MIN,
-- 
2.50.0


