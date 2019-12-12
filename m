Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63C5911C6A0
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 08:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfLLHr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 02:47:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:33368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbfLLHr0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 02:47:26 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A7F9206A5;
        Thu, 12 Dec 2019 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576136845;
        bh=I29U8J8RgiIJjcxRn+HIm+YV7gF7OtQva/1a1ME1kZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vi5k8+ZvG9NudpSuZAaQlggCh8I6PEbHS72qhMSDHBtOotnpxZmaZ2OWag/K8l2cQ
         k+r4XtG5NpxThsKA6oaa1hL4EFXKL5SBN6LFd/EReMcJMIkg4yH6Tg6yfqSQ9jy0yk
         a7hbfxbwNVpl3fU90Rd0dYhxKIv74L3JsEbkAt3w=
Date:   Thu, 12 Dec 2019 08:47:23 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhiqiang Liu <liuzhiqiang26@huawei.com>
Cc:     tglx@linutronix.de, crope@iki.fi, linux-media@vger.kernel.org,
        rfontana@redhat.com, erik.andren@gmail.com, hverkuil@xs4all.nl,
        brijohn@gmail.com, lcostantino@gmail.com, suweifeng1@huawei.com,
        Mingfangsen <mingfangsen@huawei.com>, guiyao@huawei.com
Subject: Re: [PATCH] media: usb/cpia2: fix start_offset+size Integer Overflow
 in, cpia2_remap_buffer
Message-ID: <20191212074723.GC1368279@kroah.com>
References: <83ed0748-634d-4146-d216-53681bc3b553@huawei.com>
 <20191211075745.GA403571@kroah.com>
 <adcdd513-0d94-be6c-96e3-7f8e30174b76@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adcdd513-0d94-be6c-96e3-7f8e30174b76@huawei.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 12, 2019 at 09:48:44AM +0800, Zhiqiang Liu wrote:
> On 2019/12/11 15:57, Greg KH wrote:
> > On Wed, Dec 11, 2019 at 10:47:58AM +0800, Zhiqiang Liu wrote:
> >> From: Weifeng Su <suweifeng1@huawei.com>
> >>
> >> CVE-2019-18675: The Linux kernel through 5.3.13 has a start_offset+size
> >> IntegerOverflow in cpia2_remap_buffer in drivers/media/usb/cpia2/cpia2_core.c
> >> because cpia2 has its own mmap implementation. This allows local users
> >> (with /dev/video0 access) to obtain read and write permissions on kernel
> >> physical pages, which can possibly result in a privilege escalation.
> >>
> >> Here, we fix it through proper start_offset value check.
> >>
> >> CVE Link: https://nvd.nist.gov/vuln/detail/CVE-2019-18675
> >> Signed-off-by: Weifeng Su <suweifeng1@huawei.com>
> >> Reviewed-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> >> ---
> >>  drivers/media/usb/cpia2/cpia2_core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
> >> index 20c50c2d042e..26ae7a5e3783 100644
> >> --- a/drivers/media/usb/cpia2/cpia2_core.c
> >> +++ b/drivers/media/usb/cpia2/cpia2_core.c
> >> @@ -2401,7 +2401,7 @@ int cpia2_remap_buffer(struct camera_data *cam, struct vm_area_struct *vma)
> >>
> >>  	if (size > cam->frame_size*cam->num_frames  ||
> >>  	    (start_offset % cam->frame_size) != 0 ||
> >> -	    (start_offset+size > cam->frame_size*cam->num_frames))
> >> +	    (start_offset > cam->frame_size*cam->num_frames - size))
> > 
> > I thought we discussed this already, and the checks in the core kernel
> > will prevent this from happening, right?
> > What did I miss?
> > 
> Thanks for your reply.
> It is me who missed the discussion. Could you sent me the mails or links about
> the discussion?

See Omer's email thread on the linux-kernel mailing list where he asks
about this very issue.  You can find it in the archives:
	https://lore.kernel.org/lkml/20191108215038.59170-1-omerdeshalev@gmail.com/

> > Or was that research not correct?  Can you really trigger this?  If so,
> > we should fix the core kernel checks instead, and not rely on it being
> > in every individual driver.
> > 
> > thanks,
> > 
> Omer Shalev have given a example which can trigger the CVE.
> Example link: https://deshal3v.github.io/blog/kernel-research/mmap_exploitation

That "example" was run on a kernel without the above mentioned commit to
fix all of this.

Have you tried this on the latest kernel release and succeeded?

thanks,

greg k-h
