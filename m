Return-Path: <linux-media+bounces-36712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C3AF8225
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954C01C874BB
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A632BE626;
	Thu,  3 Jul 2025 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lkJWMUWJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EcWmYffi"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46641CDFCE;
	Thu,  3 Jul 2025 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575977; cv=none; b=M6DOkX7KGnShrx1l6xL2RSZlXf0AgT2jWnfn4lgGTAMOfqw6UlxdOYHKlfeRrAvlSQBN/5PDhdedw5nXKtxOl3FAlkr7DpoOA714klzXWPaXNH8RoEji6/peu8srUepKuQKDZKRhDIDq0oqabRKPYCO7nrl/bLm513lGaDRWAPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575977; c=relaxed/simple;
	bh=o3bFz0kdD0THHZiXWbF2M47HHiC80i6Q2yfBBjsgRS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TxSsA7SUTRQRjf7OemccLgv0qT8+f6DHouBas+9kV/sSmDFEGc8JXRBVBZyDEJU8KagJm48VcQfsgOor8XrCfpDmfqiQiPTlHxrGhiGZ0DrDVZ1+YNrbV/Pqz4ePEmKasue87rD+hSUFNAqsGk64KGCj2y5dTcSuWRLnJTHfb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lkJWMUWJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EcWmYffi; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B343AEC0F44;
	Thu,  3 Jul 2025 16:52:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 03 Jul 2025 16:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751575973; x=1751662373; bh=Cb
	O88HqhCEj5JIou4AJDqQqC/4wBE46Wunks0ZO3g/g=; b=lkJWMUWJ02Tv0fXZz0
	bWMF6MJDQnHFPS7aj4xfjda1JJAnbY7vLrn/AZAXkyDjPlXQa/t1Uq2S/eoPYHdW
	/cR30qQT08kjF6BoXPBRGz8gw8jiLM3W8JTPbluPfDlrRS90DZ+Uov9jRaYewaLg
	YQO4QXDz3qJSlFdVqdu7vkdE6hpg2ixshhh/WK52c1efcyNTq8UzhHLwVEI7cWsz
	KNnKhAHqq/ILwuiAFwJBRP49Ndh7vIpsn6CYnfwiaXyCXGqt03EZEy7gnIYtJ2W1
	JmM3F/2sz+wfcgdS4FooQOWCqLnjk690Oi2llkq4t6NUfr64mgaAjrPEuHOrEYWw
	UmsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751575973; x=1751662373; bh=CbO88HqhCEj5JIou4AJDqQqC/4wB
	E46Wunks0ZO3g/g=; b=EcWmYffiAXVAKhOBdtvEY+oGhVlmXTuWRv+ejK5h8iOB
	1J+X98zWT+/erekleKDp8mDS7JxaV72GFVCp95C7ZLmIaMZgFXLZjVZxc1syKMNc
	8QLnXkAVfMA/E7rbQk4v3vxFxBDvMxuZ1jZnXutUt/OuX6Br0JucyE2uxSfXTQ5z
	qVbzvAQAn3zCF1UeKVSuGMWsiYej2rdKldulIE8497D1jgffGz4Aygf9rMrHRZrr
	71AWeeam+1LUdpvT0ITCFdjr1euyu74QYtXr6rpF6erEhyDXCtLcNc9bJoTdQdTu
	Tkgyq+jvo3egQYt3b+4jMBYXuiVKXlmRzJsLcCa8jg==
X-ME-Sender: <xms:o-1maNbzi5Bh91Pi2aAhQNc1h_H9T2sTDUuHFYQlwFbE0WBK-kiGTw>
    <xme:o-1maEYy5-0szOgyMcgGSu_7UcQOWeSho7rXLqxiW7Hs-JSLVIJClyUk8Hli67KyY
    m9_ffddvvZ_HJBO-sA>
X-ME-Received: <xmr:o-1maP-jgwamfRPk24CQ7bSx7QaO5en_rth6ugsmsXYnDp8gW1n7e2LY1YHxKSYT1H2DeZPLbcoHdg4WiOnoJQ_GVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthhopehm
    tghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilhesgi
    hsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghs
    qdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrd
    hsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:o-1maLpZW6GksTP_-SSXTuwtZ2i9OiaBjgEg9QlGthWoeYpVPaNp3Q>
    <xmx:o-1maIoUPgb6KhVlgUXEx4Yvf_46Q81F-Sgn-xCNOAefXOGs_PM8Dg>
    <xmx:o-1maBRXAYuDq1pX_O1d9ZnfD7pvItG8yvY6rcvd987v0642sX3BEA>
    <xmx:o-1maAqd23Qqca7_b_SKHaXt9FiGpGndA_1sSyMYV8PIuiQmHNez-w>
    <xmx:pe1maBfW04xLE0lYe6XJj6sKQaiG7ITmIqnOfWxsMGnPEJAYkrWnmyF->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:52:51 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 00/11] media: adv7180: Improve the control over decoder power
Date: Thu,  3 Jul 2025 22:52:12 +0200
Message-ID: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
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
2.50.0


