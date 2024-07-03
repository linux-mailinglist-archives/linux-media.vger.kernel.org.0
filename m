Return-Path: <linux-media+bounces-14587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B50926166
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 15:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B75A6B24C79
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 13:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B502817A584;
	Wed,  3 Jul 2024 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIdDgX6f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7D17A596;
	Wed,  3 Jul 2024 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012064; cv=none; b=K6jGDiUen4LbRHOvRwnDaEBqLnL0Q6JdRMkwRIeV/aHDrnkgNd/WoMAkrIp+e4z7P7bef9pHar9PDfOSnk95hDmBXnVPGwZZBC7PrZ6Bj3GgTeHa7UNTHzerElyUYG3OSFpChLaOp0EhPImDtgBQJTn+mO3eWo6DggkEENATMW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012064; c=relaxed/simple;
	bh=3t3tX+Zwt2Y1wgM8Xm+KTUjehKrUCbNVKOrSzepRc84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHJCK8ib9Kv6n6yl6lLMyg3MyZaO/7aHlaq5c/azrKiX8Q++OxskMB8f2d3QjyHI9DC+3NKLDGM56QCsGIPXieAX+91vypuZZkyJfdOqIPyzJwukPa6CS3ZrFCrdsFX631BdAkEEvCQknGz1l1t72kUZFf/Blyq21Nabs0fR8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIdDgX6f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8826AC2BD10;
	Wed,  3 Jul 2024 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720012063;
	bh=3t3tX+Zwt2Y1wgM8Xm+KTUjehKrUCbNVKOrSzepRc84=;
	h=Date:From:To:Cc:Subject:From;
	b=XIdDgX6fHrReGq0jY+Bz13Z0mfgtxGGIYIE7AlOimIca2UgRT5CfP2ZvLTlVLyhne
	 C/P90IFWjfYPDibGcxuUB6YFe2be8BOgX6G68N5l6JEwzJ5PAfYl0yNf2/VQS9Zh/p
	 yrQOyvlz8Yfou3UVgzo9250gNVzSUbaJ9WGq7QeN5vJ0kPRmAYFYtldQ7iHI3FxLV0
	 06ubt7LtgDc7gwzuWY9701so8KozqQWo5DZeIKrl7kTcyKm3uafHiFo49NHJoqVt34
	 uo9lM3kVhUJzNX4p4+C+sdbM1Vvg0yWPQRusBV16GLyuz4z6+KfNCNY53V06lRAK22
	 pCgAD7dHrU6hA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sOzi0-0000000033f-1XIQ;
	Wed, 03 Jul 2024 15:07:40 +0200
Date: Wed, 3 Jul 2024 15:07:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Failure to stop CAMSS stream (sc8280xp)
Message-ID: <ZoVNHOTI0PKMNt4_@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've been testing Bryan's work that enables the camera on the Lenovo
ThinkPad X13s and keep triggering the below warnings when stopping a
stream (e.g. closing qcam) which indicate that this is a driver bug.

After this happens qcam fails to start again (something returns -EBUSY).

Is this a known issue with CAMSS or is something missing in the sc8280xp
integration?

I'm using the following (squashed) devicetree patch from Bryan to enable
the camera (everything else is upstream):

	https://github.com/jhovold/linux/commit/85b41b8d0efd418509df548592f95b43b9663409

The issue was there with 6.9 as well so it's not a (recent) regression.

Probing the camera sometimes, but infrequently, also fails with:

	qcom-camss ac5a000.camss: Failed to power up pipeline: -13

and I'm seeing the following warning on every boot:

	i2c-qcom-cci ac4c000.cci: Found 19200000 cci clk rate while 37500000 was expected

Johan


[ 1265.509677] ------------[ cut here ]------------
[ 1265.509831] WARNING: CPU: 5 PID: 919 at drivers/media/common/videobuf2/videobuf2-core.c:2183 __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
...
[ 1265.510417] CPU: 5 PID: 919 Comm: qcam Not tainted 6.10.0-rc5 #124
[ 1265.510428] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET87W (1.59 ) 12/05/2023
...
[ 1265.510630] Call trace:
[ 1265.510636]  __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
[ 1265.510648]  vb2_core_streamoff+0x24/0xcc [videobuf2_common]
[ 1265.510660]  vb2_ioctl_streamoff+0x5c/0xa8 [videobuf2_v4l2]
[ 1265.510673]  v4l_streamoff+0x24/0x30 [videodev]
[ 1265.510707]  __video_do_ioctl+0x190/0x3f4 [videodev]
[ 1265.510732]  video_usercopy+0x304/0x8c4 [videodev]
[ 1265.510757]  video_ioctl2+0x18/0x34 [videodev]
[ 1265.510782]  v4l2_ioctl+0x40/0x60 [videodev]
[ 1265.510807]  __arm64_sys_ioctl+0xa8/0xec
[ 1265.510820]  invoke_syscall+0x48/0x118
[ 1265.510834]  el0_svc_common.constprop.0+0x40/0xe0
[ 1265.510845]  do_el0_svc+0x1c/0x28
[ 1265.510856]  el0_svc+0x48/0x114
[ 1265.510867]  el0t_64_sync_handler+0xc0/0xc4
[ 1265.510876]  el0t_64_sync+0x190/0x194
[ 1265.510885] irq event stamp: 279668
[ 1265.510892] hardirqs last  enabled at (279667): [<ffffa0c6a09d7754>] _raw_spin_unlock_irqrestore+0x74/0x78
[ 1265.510904] hardirqs last disabled at (279668): [<ffffa0c6a09c8860>] el1_dbg+0x24/0x8c
[ 1265.510913] softirqs last  enabled at (279636): [<ffffa0c69ffe76e4>] fpsimd_restore_current_state+0x34/0xc4
[ 1265.510924] softirqs last disabled at (279634): [<ffffa0c69ffe76b4>] fpsimd_restore_current_state+0x4/0xc4
[ 1265.510935] ---[ end trace 0000000000000000 ]---
[ 1265.510944] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 0 in active state
[ 1265.511175] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
[ 1265.511398] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active state

