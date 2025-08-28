Return-Path: <linux-media+bounces-41261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5FB3A5AA
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D69C188D984
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBFF27A10C;
	Thu, 28 Aug 2025 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SPYoRymZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KHfGAJF2"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFFD25E828;
	Thu, 28 Aug 2025 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397284; cv=none; b=jS3Okli4L2UdGzKQWWL6BVQf/aNJNX2CzgXCyx0V/manA64U/DuAokhLTt/t0GWJUEZ3kc0wTqEzQX+rCvsgtpb+hcCslS3VjHpWgDht9cHOkFbONkT5B0o5GW5JyjCTyVjSgBO0WvFYxrvMWYkmfu07B5KJKajJyKIVcL6upRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397284; c=relaxed/simple;
	bh=o+frEFE7AZGwmfc5ixOT4Z8nJCk8SgnuLh+DszTK05E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q/wufDTzA3nCMENN3xzmctI+JkTbv5ooWLbhYxIqlfLQ5Fvf3LmVX8wixB+gR33N9CAjDk7qdYsLsYqBFlp7PEWd58jdBAmxL02GhRvFVVnOcqKGhRy3EIdYu1TJZcGQ9Jf9QJZZkpu/h77lP7YEMD2hGw99jDumooaSJe8h+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SPYoRymZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KHfGAJF2; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 484CC1D0014C;
	Thu, 28 Aug 2025 12:08:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 28 Aug 2025 12:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1756397281; x=1756483681; bh=zX
	aSHCTnKpKb2M7BNOL8HHR/cbafH+/o2WSh0td/8+8=; b=SPYoRymZZ/4BzQNbRX
	F7iV6k6CT0JIYLr1E4IGGaMtW3pBU0FnBHjQDN/AKtCXLDVN40SbYeBGil1hYX6s
	dqy6YS4oKmp5NBz1BJIzyJtRF2AJDg+Yl74g2xQXeW2NYDBu0dpdjCdHxJPUFkpV
	3yQfkBxWtvLzLnUkCvZ97dKv/zyySKoVRmm+ye2WmoeO6mrcTRz9jEPhbrD2SnAp
	RnD0AAG8k43BY2/yvRLFCU7r4A4p3qBmHCCKWmSULCuIBugbeckLyBxVhspMwhgD
	7Wl2NT269lL3LvbvOKMbaQDxib5/cLgxaR1uH0QkbZueFh5AZ0GwsOKzr9oOapVI
	VhcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1756397281; x=1756483681; bh=zXaSHCTnKpKb2M7BNOL8HHR/cbaf
	H+/o2WSh0td/8+8=; b=KHfGAJF24jZWCxqxJHpAPUjQdiVqEQFlZNDyL0gbZaW3
	xRD5CxPKwBojVJWfTiPwbXZYUZQc6tX0g0myAlwyHHDwKYFFO9Pi/gZ1oe37Y8Ff
	kQ2qko+/e4zFOEq3yTnH6L9lXuPVD2KrsyK2fFaWgy05v8kcA/sEl/cxzL4FwP1d
	DtlrmMDkvlIV5ELd/gDn8AVNkdhQSLjORjX0Exac1Y6GK4akYAejF15A1ovDjAMf
	MzA/kRQTq1uchXO/ukT1l5ESnyfu2vv+bVFYdJO6oc6hxAf5FJZviSFDbgQIfu8r
	9Wc+M7YrEbPBJzOvNq0FOJOle+Yh7FPGLFh2xFgVBA==
X-ME-Sender: <xms:4H6waP5RS9hO1nZZvpzGtq2pOU44vnfBTL3w3mGndArGtEbabsVz3w>
    <xme:4H6waIvxmOXLVOy_a1r-0-be3Hx5gWvlRwbAdbpGYfdqw98ytm2MRiZ_3tVooqqNj
    BNxk2uYQ29ykd8aJ5M>
X-ME-Received: <xmr:4H6waPgZk7OBHf6Dei6KOQvIZ4XBNKj_iWR3ERC4WOz8KPEBbjtj5VBOM3SjApAHiZJWKs9TnBElcL-qtvdBHfJv4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehlrghrshesmhgvthgrfhhoohdruggvpdhrtghpthhtohep
    mhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlse
    igshegrghllhdrnhhlpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehi
    uggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrsh
    drshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:4H6waDo6cRNxjmnf0TxBNH9x5ogyxla5IZfZ3iv6v-NVL4i0Oa980w>
    <xmx:4H6waMvhZokSNjNUshDifX30DqAwqtZuMtFLKSc7f5aWC5DdaaqmYQ>
    <xmx:4H6waGZDW7SgW8Fzx2s1XbfUsB9kofA9TVYkvsaSO6pZVQnH-SCGvQ>
    <xmx:4H6waDZ0WtSzVELTFe1GBoMZHdidMEEbep3mMFkb6-OutXDYhkfjnA>
    <xmx:4X6waBv6gAzscoxKuiYJvG-NoKGvPzh_bFJ5TtJZDuiCIgE-Hc5GkdQm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:00 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 00/11] media: adv7180: Improve the control over decoder power
Date: Thu, 28 Aug 2025 18:06:43 +0200
Message-ID: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series started as an effort to fix issues with querystd. To do that
it turned out the whole drivers design around how it controls the power
to the video decoder block inside the chip had to be reworked. As a
bonus this works removes the now deprecated .s_power callback from
adv7180.

The adv7180 drivers comes from a time before media controller and all
operation callbacks are, more or less, designed around the concept that
a video device is the only user-space facing API. In that world a vdev
would attached the subdevice, call .s_power and then perform format
configuration using the other operation callbacks and then start
streaming with .s_stream. Needles to say this mode of operation don't
work well with media controller where the subdevices itself have a
user-space API exposed thru a subdev device.

The initial problem I tried to solve (querystd) was that it stopped
functioning as expected after the subdev had been used to stream once
(.s_power(1), .s_power(0)). As it turns out different variants of the
adv7180 device have different reset beaver for if its video decoder
block is left running or powered off. On my device it was left running
so querystd functioned the first time, but not after the video decoder
had been switched off once by .s_power(0).

I first tried to fix this by introducing proper PM handling in the
driver to be able to remove the .s_power callback. I quickly learnt the
power on/off logic happening in the driver had noting to do with
controlling power to the chip itself, but to control if the chips video
decoder block was turned off.

When this block is powered on the device process video data, if there is
a video source else it free runs. However when the block is turned off
the device can still be configured, in fact some configuration requires
it to be off.

For this reason I dropped the effort to add proper PM handling and
treated the decoder power as a stream on/off switch. I still think
proper PM handling would be beneficial for this driver but to not
explode this already large series I left that for another time. Solving
the issue around .s_power will make that work easier as well as other
task such as converting to the v4l2_subdev active state API.

Patch 1/11 just moves code around to make the consecutive changes easier
to read. Patch 2/11 fix a locking issues when suspending the device.
Patch 3/11 and 4/11 improves the locking design to prepare to improve
the driver.

Patch 5/11 make sure the device controls are always programmed after the
device have been reset, fixing a possible issue when the device where
resumed from system sleep.

Patches 6/11, 7/11 and 8/11 is the real change where the .s_power
callback is reworked to fit the design of .s_stream instead.

And finally patch 9/11, 10/11 and 11/11 removes programming of the
device from operation callbacks and solves the issue with querystd.

The work is tested on R-Car M2 together with a ADV7180 device.

See individual patches for changelog.

Niklas Söderlund (11):
  media: adv7180: Move adv7180_set_power() and init_device()
  media: adv7180: Add missing lock in suspend callback
  media: adv7180: Move state mutex handling outside init_device()
  media: adv7180: Use v4l2-ctrls core to handle s_ctrl locking
  media: adv7180: Setup controls every time the device is reset
  media: adv7180: Power down decoder when configuring the device
  media: adv7180: Split device initialization and reset
  media: adv7180: Remove the s_power callback
  media: adv7180: Do not write format to device in set_fmt
  media: adv7180: Only validate format in s_std
  media: adv7180: Only validate format in querystd

 drivers/media/i2c/adv7180.c | 338 +++++++++++++++++++-----------------
 1 file changed, 174 insertions(+), 164 deletions(-)

-- 
2.51.0


