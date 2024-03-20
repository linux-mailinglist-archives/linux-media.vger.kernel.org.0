Return-Path: <linux-media+bounces-7393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7AF880E03
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 09:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4AA51C22E5D
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B335038F84;
	Wed, 20 Mar 2024 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="PAUHHYSo"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9623BB36
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710924968; cv=none; b=NZHWg3J8agnMVGYtsR1eDE4J3CXtASbM6QBSR+J6p9Ns5d50V9fjqvJXYFI7auPd3RrAFCQb4fIu1mHUYJvvmJlPs+89VcQZN8rKlVdLG0Qz61dB2XMRGSbyWTk4HLC+E/VVmSo/rY5RBAVZW+7S97KgW5sxV3QwXmm1w6DMkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710924968; c=relaxed/simple;
	bh=P53pA9zF3XWvy1cHBrVFqqurDrUl8+skxuJryDnfZIs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTK3W7wbIBgFMUjczGaxMVKHayYRbzI6eMuCvzZ08DzGdEhCe0pKGbZODR0VTa+rFsfLJZmHzxkvji7vKDI8jyiiS6VW4ZVkDyZl579r/aLgm4dIvY8DhueFjdbfIUlbhWpNReAu7CTtjQTZ7ZHf8nvfYrmNth1htzBHhau1q20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=PAUHHYSo; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1710924453; bh=P53pA9zF3XWvy1cHBrVFqqurDrUl8+skxuJryDnfZIs=;
	h=Date:From:To:Subject:From;
	b=PAUHHYSo7WLfJBKkHDvuDmlIc/YPB00PqqI6aXXSJLwYVo+jDMQJzTEWGydS6TU/l
	 K1Tff/u+3lnCjUvfGZKKADgoS1xN5jAvQCWucSBKf0kXItIqTbxy+iL3mucB6vyZEc
	 z9m68g9h3GWpk0rnjJ9t1Kjz1U6iAHbZtClnOesCulfEEMHJVtiPPpu8KYiDMQaqk4
	 Aa0qRxVb2ZwG+iBwWQVOjBRyOAwLsDLRQnCn6Y17Yp5qbOhXOSpw0wX1PGz1y0Le0j
	 Le+dGRtwuRJBgDsrW2AVbnvatju220JiF6E19Vxxv3NPbYMziV5k48dtfQqVgKL7wm
	 j/rDXYEOuhawA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D590610073E; Wed, 20 Mar 2024 08:47:33 +0000 (GMT)
Date: Wed, 20 Mar 2024 08:47:33 +0000
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.10] rc fixes
Message-ID: <Zfqipcc6e1L6Bz1m@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hans, Mauro,

Here are a few minor fixes for rc core and a simple fix for c8sectpfe. There
should be no functional changes.

Thanks
Sean

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

  media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.10a

for you to fetch changes up to 80ac5e5f440488c515da6f53273cdca9abe2bc0e:

  media: imon: Convert sprintf/snprintf to sysfs_emit (2024-03-20 08:02:17 +0000)

----------------------------------------------------------------
Andy Shevchenko (7):
      media: rc: gpio-ir-recv: Remove unused of_gpio.h
      media: c8sectpfe: Remove unused of_gpio.h
      media: ir-spi: Don't use "proxy" headers
      media: ir-spi: Make use of device properties
      media: ir-spi: Utilise temporary variable for struct device
      media: ir-spi: Remove trailing comma in the terminator entry
      media: ir-spi: Unify indentation and comment style

Li Zhijian (1):
      media: imon: Convert sprintf/snprintf to sysfs_emit

Ricardo B. Marliere (1):
      media: lirc_dev: Make lirc_class constant

 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |  1 -
 drivers/media/rc/gpio-ir-recv.c                    |  1 -
 drivers/media/rc/imon.c                            | 12 +++----
 drivers/media/rc/ir-spi.c                          | 41 ++++++++++++----------
 drivers/media/rc/lirc_dev.c                        | 18 +++++-----
 5 files changed, 37 insertions(+), 36 deletions(-)

