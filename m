Return-Path: <linux-media+bounces-4539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20136845141
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 07:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98FC28C009
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 06:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E189128362;
	Thu,  1 Feb 2024 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1Q7Zv/a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741317D40B;
	Thu,  1 Feb 2024 06:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706767823; cv=none; b=rHG5FSxTMhDuDLN2+CnoAP2XCTR+mqyIYF7rJ3s7XpzX8E2ZuAux/HhD6mEkGyzdV5iB3yIdrOfKji43nkRVAQYj/OZV+LUhVTGY/+4FVCfkt7oHsJJHaIm2JuCPWFq1MCTFSkzXhA/D3dfyoQy/WL91SgApdiFdBpJ0PKsN10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706767823; c=relaxed/simple;
	bh=xHbSX4Rp2xy+7NO7+8ZHuQQBn57ojB5T4JsjzhfJlpA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2IpGoG6KTi2WZV1/h0tMZtF/NpJf2AlUw7XRQrvDKNbeIvyfwJ0gi1vHe5jqyBzCDQWsg8dZy8vm+O3Da1bnuO2Uy8IW+W1wWCgkEsob57sgo5CxyvYgG8zUkt9G/6Fs+a/t6hn1a9fvSL6SRtHVNTiHZGvcvu1BVV/3o9FlBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1Q7Zv/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5133BC43330;
	Thu,  1 Feb 2024 06:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706767821;
	bh=xHbSX4Rp2xy+7NO7+8ZHuQQBn57ojB5T4JsjzhfJlpA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H1Q7Zv/a7QPgAhBGfhczxwtjZ6zeHHgOCmzLcrMewnfMkEwKNivB/NHpPHEnzdEV6
	 gDZC44uKwzqzwicxK6sIRLe1o1PuNaIaCETV7xrAM8Zs3sURSzJnQi9GQnk7AtbSbH
	 bQKdvhCFqz7Ci95A9R9F1nVWdWC67LAHSaIFXj8o9Wc9kyUKJgSRvpu3XIuJJD/HKA
	 HS1abJ4eNyOnOL5yNDf3PFYfSI4ENnd68ekR66Lb+MmlJmFso+0SeBbgUkjgXHpiA3
	 5WnZbQE6CuvgJ0twpSalXL5SxRAD0X1FFWc9xWKK++PUhIOUcq7RVxh6cc8hfZZqsp
	 ShEEQT4PgxnGQ==
Date: Thu, 1 Feb 2024 07:10:17 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-staging@lists.linux.dev, Kate
 Hsuan <hpa@redhat.com>
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.8-1
Message-ID: <20240201071017.6032bba8@coco.lan>
In-Reply-To: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
References: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 31 Dec 2023 11:39:18 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi Mauro,
> 
> Here are the atomisp changes for 6.8.
> 
> My patches in this set been posted on the list, but only a couple of
> minutes ago, leaving pretty much zero time for review. Sorry about that,
> with the holidays the timing did not work out very well.
> 
> If you don't want to take this pull-request because of this it
> would be good if you can at least take the patches up to
> the "media: atomisp: Fix spelling mistake in ia_css_acc_types.h"
> change. There are only 2 unreviewed patches from me in that
> set, which fix the atomisp driver not working at all with
> the latest media_stage/master code. And the rest of the patches
> in that set are from others and have been reviewed by me.

We typically close the media merge window at -rc6. As I was also
in vacations during those weeks, this PR was merged today for 6.9.

Indeed the first two patches seem to be needed to fix an issue on 6.8. 
Could you please send them to stable after their arrival at linux-next?

Regards,
Mauro

> 
> If review finds any significant issues I'll do a set of follow up
> patches to fix those.
> 
> Highlights:
> - The first commit in this pull-request fixes the driver no longer
>   working due to v4l2_subdev_state handling in media_stage/master
> 
> - Merged a bunch of spelling and other small fixes from various
>   contributors
> 
> - Gracefully handle missing firmware:
>   - Fix the driver crashing the system when the firmware is missing
>   - Make the driver bind in power-managent-only mode when the firmware
>     is missing so that the ISP is still properly turned off. This
>     requires custom handling, not just standard PCI power-management.
>     This allows the system to properly enter S0i3 with missing ISP
>     firmware, allowing the atomisp driver to be used as a replacement
>     for the pm-only drivers/platform/x86/atomisp/pm.c driver.
> 
> Regards,
> 
> Hans
> 
> 
> The following changes since commit 02d4e62ae2452c83e4a3e279b8e4cb4dcbad4b31:
> 
>   media: i2c: mt9m114: use fsleep() in place of udelay() (2023-12-14 12:40:13 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.8-1
> 
> for you to fetch changes up to 1e529948fa3ae6249f1f15dbd77730ea54d0e649:
> 
>   media: atomisp: Update TODO (2023-12-31 11:07:38 +0100)
> 
> ----------------------------------------------------------------
> atomisp staging driver changes for 6.8
> 
> Highlights:
> - The first commit in this pull-request fixes the driver no longer
>   working due to v4l2_subdev_state handling in media_stage/master
> - Merged a bunch of spelling and other small fixes from various
>   contributors
> - Gracefully handle missing firmware:
>   - Fix the driver crashing the system when the firmware is missing
>   - Make the driver bind in power-managent-only mode when the firmware
>     is missing so that the ISP is still properly turned off. This
>     requires custom handling, not just standard PCI power-management.
>     This allows the system to properly enter S0i3 with missing ISP
>     firmware, allowing the atomisp driver to be used as a replacement
>     for the pm-only drivers/platform/x86/atomisp/pm.c driver.
> 
> ----------------------------------------------------------------
> Colin Ian King (1):
>       media: atomisp: Remove redundant assignments to variables
> 
> Dipendra Khadka (13):
>       media: atomisp: Fix spelling mistakes in ia_css_irq.h
>       media: atomisp: Fix a spelling mistake in sh_css_defs.h
>       media: atomisp: Fix repeated "of" in isp2400_input_system_public.h
>       media: atomisp: Fix spelling mistake in isp2400_input_system_global.h
>       media: atomisp: Fix spelling mistakes in circbuf.c
>       media: atomisp: Fix spelling mistake in ia_css_circbuf.h
>       media: atomisp: Fix spelling mistakes in sh_css_mipi.c
>       media: atomisp: Fix spelling mistakes in queue.c
>       media: atomisp: Fix spelling mistakes in rmgr_vbuf.c
>       media: atomisp: Fix spelling mistakes in ia_css_macc_table.host.c
>       media: atomisp: Fix spelling mistakes in ia_css_hdr_types.h
>       media: atomisp: Fix spelling mistake in binary.c
>       media: atomisp: Fix spelling mistake in ia_css_acc_types.h
> 
> Hans de Goede (15):
>       media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8
>       media: atomisp: Refactor sensor crop + fmt setting
>       media: atomisp: Remove s_routing subdev call
>       media: atomisp: Remove remaining deferred firmware loading code
>       media: atomisp: Drop is_valid_device() function
>       media: atomisp: Call pcim_enable_device() and pcim_iomap_regions() later
>       media: atomisp: Fix probe error-exit path
>       media: atomisp: Fix atomisp_pci_remove()
>       media: atomisp: Group cpu_latency_qos_add_request() call together with other PM calls
>       media: atomisp: Fix probe()/remove() power-management
>       media: atomisp: Replace atomisp_drvfs attr with using driver.dev_groups attr
>       media: atomisp: Move power-management [un]init into atomisp_pm_[un]init()
>       media: atomisp: Bind and do power-management without firmware
>       media: atomisp: Remove unnecessary msleep(10) from atomisp_mrfld_power() error path
>       media: atomisp: Update TODO
> 
> Jonathan Bergh (1):
>       media: atomisp: Removed duplicate comment and fixed comment format
> 
>  drivers/staging/media/atomisp/TODO                 |  10 -
>  drivers/staging/media/atomisp/i2c/gc2235.h         |   5 +-
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c    | 133 ++++-----
>  .../media/atomisp/pci/atomisp_compat_css20.c       |   2 +-
>  drivers/staging/media/atomisp/pci/atomisp_drvfs.c  | 148 ++++------
>  drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |   5 +-
>  .../staging/media/atomisp/pci/atomisp_internal.h   |   5 +-
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  60 ++--
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 319 +++++++++------------
>  .../pci/base/circbuf/interface/ia_css_circbuf.h    |   2 +-
>  .../media/atomisp/pci/base/circbuf/src/circbuf.c   |   6 +-
>  .../staging/media/atomisp/pci/ia_css_acc_types.h   |   4 +-
>  drivers/staging/media/atomisp/pci/ia_css_control.h |  29 +-
>  .../staging/media/atomisp/pci/ia_css_firmware.h    |   6 +-
>  drivers/staging/media/atomisp/pci/ia_css_irq.h     |   6 +-
>  .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |   4 +-
>  .../kernels/macc/macc_1.0/ia_css_macc_table.host.c |   4 +-
>  .../atomisp/pci/isp2400_input_system_global.h      |   2 +-
>  .../atomisp/pci/isp2400_input_system_public.h      |   2 +-
>  .../media/atomisp/pci/runtime/binary/src/binary.c  |   2 +-
>  .../atomisp/pci/runtime/pipeline/src/pipeline.c    |   2 +-
>  .../media/atomisp/pci/runtime/queue/src/queue.c    |  22 +-
>  .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c |   6 +-
>  drivers/staging/media/atomisp/pci/sh_css.c         |  33 +--
>  drivers/staging/media/atomisp/pci/sh_css_defs.h    |   2 +-
>  drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   4 +-
>  26 files changed, 344 insertions(+), 479 deletions(-)
> 
> 
> 



Thanks,
Mauro

