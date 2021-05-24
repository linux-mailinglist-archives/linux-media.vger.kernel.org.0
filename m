Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D05238ECBC
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 17:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbhEXPWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 11:22:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:44414 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235295AbhEXPUl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 11:20:41 -0400
IronPort-SDR: 3VAmEWNKnN1kJRH5F+MBT+S+8/OQ7aElxVzIfCXaQR+3zXkhx4IvpyAx3wZU8Ipnw3AkXzWXB7
 HWi4JpcJr7fw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="223112581"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="223112581"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:18:34 -0700
IronPort-SDR: 3xTXIYzKCtF6IjPu7vE/AmzsvA23PXBxNkDOLWZ71J7wEIsEt2GSoZn7c8zNKaDFnHxGeMg9wl
 hq5kQftQnV1w==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="629725647"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:18:31 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B4AA4202F7;
        Mon, 24 May 2021 18:18:29 +0300 (EEST)
Date:   Mon, 24 May 2021 18:18:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: remove compat_ioctl32 code
Message-ID: <20210524151829.GO3@paasikivi.fi.intel.com>
References: <20210516204818.2967910-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516204818.2967910-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On Sun, May 16, 2021 at 10:47:43PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is one of the last remaining users of compat_alloc_user_space()
> and copy_in_user(), which are in the process of getting removed.
> 
> As of commit 57e6b6f2303e ("media: atomisp_fops.c: disable
> atomisp_compat_ioctl32"), nothing in this file is actually getting used
> as the only reference has been stubbed out.

This patch was made redundant by another one that fixed the bug. But I
guess you're right in the sense that no-one could have used this because of
the patch that disabled it.

So:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

But:

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index f1e6b2597853..e383e17c5072 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -1283,7 +1283,8 @@ const struct v4l2_file_operations atomisp_fops = {
>  	.unlocked_ioctl = video_ioctl2,
>  #ifdef CONFIG_COMPAT
>  	/*
> -	 * There are problems with this code. Disable this for now.
> +	 * this was removed because of bugs, the interface
> +	 * needs to be made safe for compat tasks instead.
>  	.compat_ioctl32 = atomisp_compat_ioctl32,

I think the comment could go, too.

>  	 */
>  #endif
> @@ -1297,10 +1298,7 @@ const struct v4l2_file_operations atomisp_file_fops = {
>  	.mmap = atomisp_file_mmap,
>  	.unlocked_ioctl = video_ioctl2,
>  #ifdef CONFIG_COMPAT
> -	/*
> -	 * There are problems with this code. Disable this for now.
> -	.compat_ioctl32 = atomisp_compat_ioctl32,
> -	 */
> +	/* .compat_ioctl32 = atomisp_compat_ioctl32, */

Thie one, too.

>  #endif
>  	.poll = atomisp_poll,
>  };

-- 
Kind  regards,

Sakari Ailus
