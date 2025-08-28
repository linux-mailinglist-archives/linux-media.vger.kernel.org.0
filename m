Return-Path: <linux-media+bounces-41271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA8B3A5BC
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C8D17EFEF
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E74F2C11FC;
	Thu, 28 Aug 2025 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qHb9Xm38";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lCDlKNN9"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F1821C16E;
	Thu, 28 Aug 2025 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397305; cv=none; b=lpeIV1xDQqVIKl/LOeLaBKENGExKSDZKO0HEUH/M9Git3Zn9F1tlk7TI0gaeHNlI4PiAVrmCKeMQQCiTzhz/I5Pg2X4PYlVNcYJASMnPCtxFRrn2rpvdIE0jQD1QKgeMbgW7bUmOjua+2gFTG1T1o7aXwf6jGq3EQTC/iDt6hBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397305; c=relaxed/simple;
	bh=L40MepexZxm4tV4QtrIwehvc0uJIPdqoyb4BJGy5Iwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9d4afBED/PfTpgDfn/oLoEwnBNCppJDbQX9BCS6gn9iG+URH2/NPrPgDc5PlUmoy09koZBr6tKJDzADvpUiBu33Nl8m5ORGKZWkA/LpI+dsEehrVTaupnm70go/vfxfXUfla0Uny5bcDQrBWD8Wdr+3JbfLBuLlFiVSs8BV+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qHb9Xm38; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lCDlKNN9; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id F1DD51D00160;
	Thu, 28 Aug 2025 12:08:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 28 Aug 2025 12:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397302;
	 x=1756483702; bh=wODoEyZMUkMlr6PA9jEr39IliFt/9ue5XNZ4b5HGfW4=; b=
	qHb9Xm38F3Twa9lHZwDnkWXjEKazqcIevBufFFKF/ZI9tlDsK7n8p+petZPkML+p
	e6COI+s8b4QNLSfI5Rnn86ZveZEZaAgiDS0XH4hGUNz1eOHcBtJqhYA9zeHkTC86
	wxb/QnvKF0FhaPvsxTOVo6XaGHjk8Ctg40HvSoMFF4UejIjF4Tmr9JiL/xWgVU4i
	aWKgyCS94ZxdtKOKXINVmiNW4Nmqm7oPdpW72XZhD2X90NfECjmGrfmmC/vwvgvx
	yc4oLMU08xIQGDtnFDPrmgvOWN+8JDaN10gqSKdEmrmfItY0ORb9r09yzBPx8TQJ
	eyMlH7RKldKZe3wy6Duoug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397302; x=
	1756483702; bh=wODoEyZMUkMlr6PA9jEr39IliFt/9ue5XNZ4b5HGfW4=; b=l
	CDlKNN9tTVID44XEX7uOGWQ7zEIYLH01P3Xyq6qViiMqEw/mrsB9aDoCbbApP1vd
	B02X2W7ERI+bcgAybXALqmCW7mr3EfhUET34r86QxThjECPubctF4XVjt5sqwU28
	bVsWjXNObf27Cl58dbv6mg6NdWEZcUt1EVnZ8NA1aD2qc/K1QJ/BxeNk42JKgGJQ
	EfpQnsy2AGMvo0WPWipSRu5/64dwMABPMZEc9Ze0sAGr1nV4LaLEmXyyb03tuRBn
	Ilax38XgXVuoZhW7AfWSVYLwvlMMRDzIfFAbFicRYNSBvgmclen5fz9/h8CAroZP
	A/BdI/zXFVDDlEYLaFKJQ==
X-ME-Sender: <xms:9n6waGuPgPjaApbrKPTFaTaK73krmlKtlT67TXJaVhue_VcoytW-xA>
    <xme:9n6waArBeXiLuSrH4P5kQzHLU_rCd-4SgKj9gHqrzBKZX67toApMO9GZ_f_GojrPp
    4XkU-Sz6sj09cqx30g>
X-ME-Received: <xmr:9n6waCorNjHAOhaGlNr798e5_G-wWmp16rn9GBvATjZsQ-ev-ICrUwsdxoRehqsnwvcATqzzXB3qpm7Ekt2JByl_-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlrghrshesmhgvthgrfhhoohdruggvpdhrtghpthht
    ohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuih
    hlseigshegrghllhdrnhhlpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhr
    tghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrg
    hsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:9n6waHZtU1jMe1Yj99ToUYtWOqDxFkd4m9lv5BsVOzRWY8db8Sfj-A>
    <xmx:9n6waI9_Wf82dCnEsVHwzBYAtPXNjcDwmIw7AEIwiYH08K1Ms-chWw>
    <xmx:9n6waNmep0JSxPjPRnVNyHanxxMr3aUlfKadEY_R6hG_-EJPsWrSRw>
    <xmx:9n6waNxNrqVB4PVTiAYabcmZDxH8zslhUW_a0TCD6D7WW1PXDbiB0w>
    <xmx:9n6waFYg-OZoe-x0iHSQoVJ7DGYeMZnVbR1z9Z5LHDhjPkbqsQcRNTYo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:22 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 09/11] media: adv7180: Do not write format to device in set_fmt
Date: Thu, 28 Aug 2025 18:06:52 +0200
Message-ID: <20250828160654.1467762-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index c8b63c985b69..641cf698df5e 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -793,14 +793,7 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 	ret = adv7180_mbus_fmt(sd,  &format->format);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		if (state->field != format->format.field) {
-			guard(mutex)(&state->mutex);
-
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
2.51.0


