Return-Path: <linux-media+bounces-36520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B3AF0FBE
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD8E16A801
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4829D23C51B;
	Wed,  2 Jul 2025 09:20:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34791420DD
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448002; cv=none; b=X4tscaZobylMj+ZniYgIy94QRNSwL5hHrcy4+9OOsP/rHaUIhDFceForF2cKYqNa4CxCFK27soWTKp/J8NZK9wWjlVNqZf30ka3phUjcUgCYoTwliHFl6+ZhfjFgqCwbmUa4a+bLt/LzYCqOcUU7HMEYTiciAwWlnG5aglpxErc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448002; c=relaxed/simple;
	bh=USfaf4lqnit0FT/XMdEvB7RO58lRiRxjGXYjfADuVxY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=TmzctbB59/ACWgTSb0ikNIuMnB1upy8IUi2UKEtLOX2Snlz6n6MO/Uh07yHtLdmugqBbwvTVf2/jkakEeg8cJK5Q2PVs/QvHhg9xkILFNBPK5nKL4i5B7XjPrCwMu1pNP8OzQUUZKO1Jm6nb6DWelm2rMh3DeKO0jYkp2pOtxgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7536C4CEED;
	Wed,  2 Jul 2025 09:20:01 +0000 (UTC)
Message-ID: <489a173a-b245-4c64-b9a2-3253d61c71fb@xs4all.nl>
Date: Wed, 2 Jul 2025 11:20:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.17] HPD fixes and CEC improvements
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This PR fixes an issue when updating EDIDs in three drivers (HPD needs to stay low a bit
longer), it adds a new error injection type to the cec core, and it allows sleeps when
reading the HPD and 5V state in cec-gpio.

Regards,

	Hans

The following changes since commit 35392e855abf7d02ad3b061cbc75c7c7c37f0577:

media: i2c: max96714: Drop check on number of active routes (2025-06-30 09:06:21 +0200)

are available in the Git repository at:

git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.17k

for you to fetch changes up to 612fb594dd3c534be8b340e262e0447f533be3da:

media: cec: cec-gpio: reading hpd/5v is allowed to sleep (2025-07-02 08:11:57 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (6):
media: i2c: adv7604/tc358743/tda1997x: HPD low for HZ / 7
media: cec: core: add glitch error injection
media: cec: core: add rx-no-low-drive setting
Documentation: media: cec: update error inj doc
media: cec: cec-gpio: rename functions
media: cec: cec-gpio: reading hpd/5v is allowed to sleep

Documentation/userspace-api/media/cec/cec-pin-error-inj.rst | 42 ++++++++++++++++++++++++++++++++++++
drivers/media/cec/core/cec-pin-error-inj.c                  | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++-
drivers/media/cec/core/cec-pin-priv.h                       |  8 +++++++
drivers/media/cec/core/cec-pin.c                            | 31 ++++++++++++++++++++++++++-
drivers/media/cec/platform/cec-gpio/cec-gpio.c              | 68 ++++++++++++++++++++++++++++++-----------------------------
drivers/media/i2c/adv7604.c                                 |  4 ++--
drivers/media/i2c/tc358743.c                                |  4 ++--
drivers/media/i2c/tda1997x.c                                |  4 ++--
8 files changed, 179 insertions(+), 41 deletions(-)

