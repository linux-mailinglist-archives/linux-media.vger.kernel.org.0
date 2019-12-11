Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC97311A57B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 08:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfLKH5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 02:57:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:56736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfLKH5s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 02:57:48 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BDBE2077B;
        Wed, 11 Dec 2019 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576051067;
        bh=MynNlQMAxU4Bskpq1nSDu6V8FrDtd2NELJMdOdt6L1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eAqfjEeLnF/N7Q4JpAEtxc/csi1AbWGay9jV9aTzjBgx2k0XjgjaYvLEbKuHQcRHE
         BUr1lR4b9YF9It/WnwVO9oH+8Tzx99/gEgFHOoDdmnOdCoVVH9mszG3tf6gm5vQQ4N
         MgCrhYldxj4DSiIInXodpGSSxZRkCYXnyBLwmI3A=
Date:   Wed, 11 Dec 2019 08:57:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhiqiang Liu <liuzhiqiang26@huawei.com>
Cc:     tglx@linutronix.de, crope@iki.fi, linux-media@vger.kernel.org,
        rfontana@redhat.com, erik.andren@gmail.com, hverkuil@xs4all.nl,
        brijohn@gmail.com, lcostantino@gmail.com, suweifeng1@huawei.com,
        Mingfangsen <mingfangsen@huawei.com>, guiyao@huawei.com
Subject: Re: [PATCH] media: usb/cpia2: fix start_offset+size Integer Overflow
 in, cpia2_remap_buffer
Message-ID: <20191211075745.GA403571@kroah.com>
References: <83ed0748-634d-4146-d216-53681bc3b553@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83ed0748-634d-4146-d216-53681bc3b553@huawei.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 11, 2019 at 10:47:58AM +0800, Zhiqiang Liu wrote:
> From: Weifeng Su <suweifeng1@huawei.com>
> 
> CVE-2019-18675: The Linux kernel through 5.3.13 has a start_offset+size
> IntegerOverflow in cpia2_remap_buffer in drivers/media/usb/cpia2/cpia2_core.c
> because cpia2 has its own mmap implementation. This allows local users
> (with /dev/video0 access) to obtain read and write permissions on kernel
> physical pages, which can possibly result in a privilege escalation.
> 
> Here, we fix it through proper start_offset value check.
> 
> CVE Link: https://nvd.nist.gov/vuln/detail/CVE-2019-18675
> Signed-off-by: Weifeng Su <suweifeng1@huawei.com>
> Reviewed-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> ---
>  drivers/media/usb/cpia2/cpia2_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
> index 20c50c2d042e..26ae7a5e3783 100644
> --- a/drivers/media/usb/cpia2/cpia2_core.c
> +++ b/drivers/media/usb/cpia2/cpia2_core.c
> @@ -2401,7 +2401,7 @@ int cpia2_remap_buffer(struct camera_data *cam, struct vm_area_struct *vma)
> 
>  	if (size > cam->frame_size*cam->num_frames  ||
>  	    (start_offset % cam->frame_size) != 0 ||
> -	    (start_offset+size > cam->frame_size*cam->num_frames))
> +	    (start_offset > cam->frame_size*cam->num_frames - size))

I thought we discussed this already, and the checks in the core kernel
will prevent this from happening, right?

What did I miss?

Or was that research not correct?  Can you really trigger this?  If so,
we should fix the core kernel checks instead, and not rely on it being
in every individual driver.

thanks,

greg k-h
