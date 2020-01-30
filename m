Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D32EF14DD03
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 15:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgA3Opl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 09:45:41 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56301 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726948AbgA3Opl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 09:45:41 -0500
Received: from [IPv6:2001:420:44c1:2577:91db:5aec:4999:a214]
 ([IPv6:2001:420:44c1:2577:91db:5aec:4999:a214])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xB4Yi8EoQn7E5xB4cihPOP; Thu, 30 Jan 2020 15:45:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580395538; bh=4vDpIAkSrGm95OeRm5AsGZgvUB40s/bpYqX6RcpcurM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T8Z6rkOjykQ0aebjDiAEaPPg4l2sPfpr3UqmsCCmN/LkDP0GO5XA/pUYwJyASBcyD
         dCGJNS1XnSoXLxMpSpzmC43pCxUSgmvaMlCeoSdpua4PUkDstUXy7dXjgZWR+ZRKA3
         TDJgbTPvnE2XcfQ9KZRbptFTY0ukkU1ZzGBx5PDuMcwRA/D9hLPYMjCrGoN80ZGv8k
         nWmyIWBAIldStEbV+7S7+9Caelz1uLDy+zdrng0ovDo+C0EcEWjjerIfQZsgRnVmfz
         jlQw/heZQIvgZU5U8VV2PyEIvBX9pDjBsMWgHb5UKdAEA/jQjQfZFNTOB4ZKTH1wCG
         6WuSZNBlbc3jA==
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <60357c4c-13cc-f623-12c5-92dfdc3ae21d@xs4all.nl>
Date:   Thu, 30 Jan 2020 15:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBQYv/fdTa43AuMw5zPpJJPYhHKTejm/zcLImS8prFgrsL5ANuf9ID8NtWYHgQ8cnOXupYVJTx9pwxmjXMfxCmchmgTEV9MLlnZDITtJVmccahHTczlN
 K5l0NhQyIIDORPlctCxcLRahr2ro1fmnj+LBo7nSgoYXETR86nui4E89deKA2r1007twUYf1xdCRfJT7kPdhged3p0gq9lyKU9xy7UfYYhOwtc6D8xGRoZ6l
 LEdHVe0feHAIqLuwtAA2Es5Nu7VztZDccdKVCiq+qgfjSscUGTMo8CFZiubCEmin004jhmTLriQVuflmiLW+BCXJJen1JBPuO3G7RiTSex/7LflB7AfOotiL
 rMiHWgSnP/Cpl2f921glnOl3FBObRef1eRLuKga8E5jR7MJaj4Pkue7uiwFP9eNZC+tLdzZAScd/BXyALw50RTY+595KQPVBY7EwCWLVD0YIgXlX1/pzLj3W
 1igielB7FQT8khLg3Q3jZDt0G1vVXlj0dNfOIbXsoWsySfFQjUmjYXonOUTOnV025OTuhHZQUKHxkLUkDqWYqPE7zhRnyvv+S+gPSpneg4QiH278sDhHTwKp
 S5c=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a V4L2 media controller and capture driver support
> for Tegra210 built-in CSI to VI test pattern generator.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/Kconfig               |   2 +
>  drivers/staging/media/Makefile              |   1 +
>  drivers/staging/media/tegra/Kconfig         |  12 +
>  drivers/staging/media/tegra/Makefile        |  11 +
>  drivers/staging/media/tegra/TODO            |  10 +
>  drivers/staging/media/tegra/csi.h           | 111 +++++
>  drivers/staging/media/tegra/csi2_fops.c     | 335 +++++++++++++++
>  drivers/staging/media/tegra/csi2_fops.h     |  15 +
>  drivers/staging/media/tegra/host1x-video.c  | 120 ++++++
>  drivers/staging/media/tegra/host1x-video.h  |  33 ++
>  drivers/staging/media/tegra/mc_common.h     | 131 ++++++
>  drivers/staging/media/tegra/tegra-channel.c | 628 ++++++++++++++++++++++++++++
>  drivers/staging/media/tegra/tegra-core.c    | 111 +++++
>  drivers/staging/media/tegra/tegra-core.h    | 125 ++++++
>  drivers/staging/media/tegra/tegra-csi.c     | 380 +++++++++++++++++
>  drivers/staging/media/tegra/tegra-vi.c      | 351 ++++++++++++++++
>  drivers/staging/media/tegra/tegra-vi.h      | 101 +++++
>  drivers/staging/media/tegra/vi2_fops.c      | 364 ++++++++++++++++
>  drivers/staging/media/tegra/vi2_fops.h      |  15 +
>  drivers/staging/media/tegra/vi2_formats.h   | 119 ++++++
>  drivers/staging/media/tegra/vi2_registers.h | 194 +++++++++

Please add an entry to the MAINTAINERS file for this new driver.

Also, checkpatch.pl --strict complains about the SPDX tag in the headers:

WARNING: Improper SPDX comment style for 'drivers/staging/media/tegra/csi.h', please use '/*' instead
#141: FILE: drivers/staging/media/tegra/csi.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

(same warning for all headers)

Please fix for v2.

Regards,

	Hans
