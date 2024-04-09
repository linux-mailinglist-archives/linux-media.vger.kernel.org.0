Return-Path: <linux-media+bounces-8865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF1389D239
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 08:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F7731C212E7
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 06:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467086FE06;
	Tue,  9 Apr 2024 06:18:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6687524AF
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643523; cv=none; b=Y8kZ9Rk/2H6btKtLRhAoB5OJZtH+58FUlintxHDh78++eK91tX8LMwmeZT+6rQpcVxJ5gU/NKeI2nfD34XTiqrGfcNuro3meJsv8YfJLbtOwO6E3I5YHZ0WvYulfWsYb7OrdzG66G+Nq9+rL2kWKHWhbGpYFNN3MQzDmPPXTlLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643523; c=relaxed/simple;
	bh=QRQvht6jAa/wKzsxQ3REzMiaEhQ+2BfyQyf8LTO5Fyk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=K/en6chqknRbeg5IVpOqbWqkROfpLe6dsfGF91ZC6OIppluuEmzXziXidZ1At7++ir1F07HrtDUaXqj+5EiDJTN1eUPAiXj17wocMhhgjIRJPVxITjDfdFTOWxbhT7VrxZXG5zS24u00Gq0xj9Nr9aNb6m4MUoFqhJT6xuRRofo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042E2C433C7;
	Tue,  9 Apr 2024 06:18:42 +0000 (UTC)
Message-ID: <4f15e083-3c6a-4e98-ad02-2be2bd13359d@xs4all.nl>
Date: Tue, 9 Apr 2024 08:18:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.10] Switch subdev dv timing callbacks to pad ops
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is needed in preparation for the Chameleon v3 driver, and
it is not a bad thing to have anyway.

I plan to merge this tomorrow if there are no objections.

Regards,

	Hans

The following changes since commit b82779648dfd3814df4e381f086326ec70fd791f:

  Merge tag 'v6.9-rc2' into media_stage (2024-04-01 10:08:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.10d

for you to fetch changes up to 23de199e4ddc64e0ae9a7e71333d3a87f4504811:

  media: v4l2-subdev: Remove non-pad dv timing callbacks (2024-04-09 07:54:16 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Paweł Anikiel (17):
      media: v4l2-subdev: Add pad versions of dv timing subdev calls
      media: i2c: adv748x: Switch dv timing callbacks to pad ops
      media: i2c: adv7511: Switch dv timing callbacks to pad ops
      media: i2c: adv7604: Switch dv timing callbacks to pad ops
      media: i2c: adv7842: Switch dv timing callbacks to pad ops
      media: i2c: tc358743: Switch dv timing callbacks to pad ops
      media: i2c: tda1997x: Switch dv timing callbacks to pad ops
      media: i2c: ths7303: Switch dv timing callbacks to pad ops
      media: i2c: ths8200: Switch dv timing callbacks to pad ops
      media: i2c: tvp7002: Switch dv timing callbacks to pad ops
      media: spi: gs1662: Switch dv timing callbacks to pad ops
      media: cobalt: Use pad variant of dv timing subdev calls
      media: rcar-vin: Use pad variant of dv timing subdev calls
      media: vpif_capture: Use pad variant of dv timing subdev calls
      media: vpif_display: Use pad variant of dv timing subdev calls
      media: tegra-video: Use pad variant of dv timing subdev calls
      media: v4l2-subdev: Remove non-pad dv timing callbacks

 drivers/media/i2c/adv748x/adv748x-hdmi.c            | 16 ++++++++--------
 drivers/media/i2c/adv7511-v4l2.c                    | 16 +++++++++++-----
 drivers/media/i2c/adv7604.c                         | 20 ++++++++++----------
 drivers/media/i2c/adv7842.c                         | 25 +++++++++++++++++--------
 drivers/media/i2c/tc358743.c                        | 25 +++++++++++++++++--------
 drivers/media/i2c/tda1997x.c                        | 14 +++++++-------
 drivers/media/i2c/ths7303.c                         | 10 +++++++---
 drivers/media/i2c/ths8200.c                         | 14 ++++++++++----
 drivers/media/i2c/tvp7002.c                         | 32 +++++++++++++++++++++-----------
 drivers/media/pci/cobalt/cobalt-v4l2.c              | 12 ++++++------
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c |  9 ++++++---
 drivers/media/platform/ti/davinci/vpif_capture.c    |  4 ++--
 drivers/media/platform/ti/davinci/vpif_display.c    |  2 +-
 drivers/media/spi/gs1662.c                          | 27 ++++++++++++++++++---------
 drivers/media/v4l2-core/v4l2-subdev.c               | 39 ++++++++++++++++++++++++++++++++++++---
 drivers/staging/media/tegra-video/vi.c              | 12 ++++++------
 include/media/v4l2-subdev.h                         | 28 ++++++++++++++--------------
 17 files changed, 197 insertions(+), 108 deletions(-)

