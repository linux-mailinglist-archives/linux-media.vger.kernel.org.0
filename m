Return-Path: <linux-media+bounces-36720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B76AF8235
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A989117ACE8
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A532BE7B2;
	Thu,  3 Jul 2025 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="X36vXzP5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MAwZvFIt"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225C2BDC33;
	Thu,  3 Jul 2025 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575996; cv=none; b=qlegONcO1TRgFQlvebJjsxJqbhhaRKjvKhC1ZhxMU1CtDAHBd8yl1I6Up7NAqbGm7Hf+nlnM7oOmUqXx4CtRqN7LTdkx717NZoeMGqBfzBPiXdKHxzAgYvQYD4cdWdzKYPQa36t7YxyHZ09ez2HrF1dEUessD6/x3Hq6gOGf1q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575996; c=relaxed/simple;
	bh=g7PabJ83zz7uivISbq08gR8r4WMWIE1SXuHtXc+5vh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APMO5V/WmUe0zqoEDOzVzANp0/Fldag/ijfDZ5n8toMwp9r5a2KZBNLmhcfCwnnW/O9YvwqqFdvESn9pTi8s+koAH9BSWXKwz+YuacLFDKPE9k7awtwbSRh/jnkAKelYxzJXJnd7/2z0l/8HRjI7WrwR/dIPA//X+ITlDg/y1oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=X36vXzP5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MAwZvFIt; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 4D791EC111A;
	Thu,  3 Jul 2025 16:53:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 03 Jul 2025 16:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575993;
	 x=1751662393; bh=AFDBNqTMyoSMAoL6XURVdvFOGb6+aXsJpYN60MJB+bc=; b=
	X36vXzP5CRU2WUPDdX1vsrsf/Zq6M/KRvjyWf9KiMCz0fTjRUUl5S31maDEfjz0p
	1n7g9ihkcSROrSUSrMSccgmVnwbsL3xEc6RWf/AM7h1ZgqEk/rJW/0wLH9ycy/G9
	L4DJgOYMgB8tBf85A9l4Qq4IIDLObNf8PEDlPDz3JnaYi9F2QF01a9zBeI6exlO/
	Zp+Nmc0DVjA5GRz42O+dFKJ2uZfrXOQn/vlxZ8ewymBlLrIAefI/KQlgBOaowhv9
	9yxKApkyCrpBuKjFcGn1EQQv54JfeVpq9Zb7MM5jnpvtFULt5j6MzbMqnlsKg0aC
	jNoXRJ2kLFt+eiIAZttxfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575993; x=
	1751662393; bh=AFDBNqTMyoSMAoL6XURVdvFOGb6+aXsJpYN60MJB+bc=; b=M
	AwZvFItesHmK4RebYeZWk1Gz/UJXkXsZjrN2PkWxlzi8oZK3DlIK6ZY3bgjxS0bO
	SFrDl6lC1+0CMYMDqwXfbAFYX6F2cA68OUkXFO6/cCt6GY1a4EUGh/kVD27/KUYH
	/YzssPs/M+KKrdUTNqFLFcfJPAGk1IXquapy67F3oXi8gXx6TOOABdfnkhDeGwTO
	xDJf+UzA5e+FfM9JZkmmY5KPYYxjPuVuofVUOssLbTlCRc9nFRFXVExSA6TFmOPW
	B2sJj/ihT/Up01YBaFhwIeo7OeOrGSpGdq/PX+Msx8j2nGvUv6KOmo5febA353rV
	/NlqFXg/ZuZ8Pz8ZMGjvQ==
X-ME-Sender: <xms:ue1maD60opqnHoTGf8QbDmxBagjOnOnDc4pKTKVjCZpS3yJx56w8pg>
    <xme:ue1maI6OVDpbWtN3Vdu1m1pdokWqN4aNnqFUN1IVysZTTDC3MEmsmgZnLsr9hsYP-
    ITT8D_hL5aCB3Gtd8o>
X-ME-Received: <xmr:ue1maKeeXFQ7CH10BIKxKvZ8bYxApUMPbcusDmQUd5vl421P4VoeukgiNJDSk7Gv29HZxdLWJmr8moi7d5CIsaAFKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:ue1maEID0XqA_2-CGk5P5WkacElyA1KhmvJCb3h-WGQXbvxT3e_RfA>
    <xmx:ue1maHJzB40i2NRbT40eTj3QeL2kW5VPIOWIV_gYHh3XCyuzdlGK_g>
    <xmx:ue1maNwv44chUgOWKOoYalGXcR3zI1404aVvC9BiQLVP4WAiSzqMBw>
    <xmx:ue1maDKaKFL9WJoKWiGKQieN2IMgFuLj6mNi7CVN1E4J4EBt94_CKA>
    <xmx:ue1maF_7lyQojL81reGQiqgN62Dx1iWgdPuNYcif6zR0ju0byc1XWVfc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:12 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 09/11] media: adv7180: Do not write format to device in set_fmt
Date: Thu,  3 Jul 2025 22:52:21 +0200
Message-ID: <20250703205223.2810806-10-niklas.soderlund+renesas@ragnatech.se>
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

The .set_fmt callback should not write the new format directly do the
device, it should only store it and have it applied by .s_stream.

The .s_stream callback already calls adv7180_set_field_mode() so it's
safe to remove programming of the device and just store the format and
have .s_stream apply it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index dcdc89b717a4..8ebb72b2bb61 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -793,12 +793,7 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 	ret = adv7180_mbus_fmt(sd,  &format->format);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		if (state->field != format->format.field) {
-			state->field = format->format.field;
-			adv7180_set_power(state, false);
-			adv7180_set_field_mode(state);
-			adv7180_set_power(state, true);
-		}
+		state->field = format->format.field;
 	} else {
 		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*framefmt = format->format;
-- 
2.50.0


