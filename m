Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3889A320930
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 09:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbhBUIVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 03:21:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:53972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhBUIVa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 03:21:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E94460C41;
        Sun, 21 Feb 2021 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613895649;
        bh=fDoRyutdxwyp7zzQQ7I0wKt3Agq5SbU3ugt9v/IsMtc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tGgb4wvN0GYgO49/7TkQRXQIBt17Tg6GKA1GMhwhtJ2fsl8d/98c0fiLee3jFhD7r
         LqXnEPIX8VEorI/d5buFHmJnFKDAhk4SlXy+6NKeyCRY5Y1H6TwK03FzLnkLTYQJVK
         jkLI2Si+qmNG6S4O9mMVQw4RBcQEX6ErDDdcELKk=
Date:   Sun, 21 Feb 2021 09:20:45 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Nikolay Kyx <knv418@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: ipu3: code style fix - missing a
 blank line after declarations
Message-ID: <YDIX3Q0U8/PcVWgN@kroah.com>
References: <20210221081236.9758-1-knv418@gmail.com>
 <20210221081236.9758-2-knv418@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210221081236.9758-2-knv418@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Feb 21, 2021 at 11:12:36AM +0300, Nikolay Kyx wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> WARNING: Missing a blank line after declarations
> 
> in file ipu3-css-fw.h
> 
> Signed-off-by: Nikolay Kyx <knv418@gmail.com>
> ---
> 
> Additionally some style warnings remain valid here and could be fixed by
> another patch.
> 
>  drivers/staging/media/ipu3/ipu3-css-fw.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
> index 79ffa7045139..3c078f15a295 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.h
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
> @@ -148,6 +148,7 @@ union imgu_fw_union {
>  struct imgu_fw_info {
>  	size_t header_size;	/* size of fw header */
>  	u32 type __aligned(8);	/* enum imgu_fw_type */
> +
>  	union imgu_fw_union info;	/* Binary info */
>  	struct imgu_abi_blob_info blob;	/* Blob info */
>  	/* Dynamic part */

With your knowledge of C, does this change look correct?

thanks,

greg k-h
