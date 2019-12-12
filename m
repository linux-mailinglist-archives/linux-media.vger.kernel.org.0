Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B502411CA1A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 11:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbfLLKB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 05:01:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:52730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbfLLKB4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 05:01:56 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99DBF206DA;
        Thu, 12 Dec 2019 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576144916;
        bh=yIklkQTYg4cUAYyq+XgrD7VI5BaTtq+Mvzd3yt5WteU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uRnLenUhqWTu3Qbb0Qk1z6ERib48rzV9kOaMcRz2w21mkJj5mpQ6gYGnQhSA4wIu/
         aEuMQfi1KPnBhSPlleW4l1a4RZou/wwhy1GZAokrRuCdQNeVmeIJ9SMG4/uA+bKlgY
         JCN1w50AJCYK698/6ifDbhoPOhmFN9jaXmBXjuHk=
Date:   Thu, 12 Dec 2019 11:01:53 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhiqiang Liu <liuzhiqiang26@huawei.com>
Cc:     tglx@linutronix.de, crope@iki.fi, linux-media@vger.kernel.org,
        rfontana@redhat.com, erik.andren@gmail.com, hverkuil@xs4all.nl,
        brijohn@gmail.com, lcostantino@gmail.com, suweifeng1@huawei.com,
        Mingfangsen <mingfangsen@huawei.com>, guiyao@huawei.com
Subject: Re: [PATCH] media: usb/cpia2: fix start_offset+size Integer Overflow
 in, cpia2_remap_buffer
Message-ID: <20191212100153.GA1468094@kroah.com>
References: <83ed0748-634d-4146-d216-53681bc3b553@huawei.com>
 <20191211075745.GA403571@kroah.com>
 <adcdd513-0d94-be6c-96e3-7f8e30174b76@huawei.com>
 <20191212074723.GC1368279@kroah.com>
 <bba0386d-fb55-ecde-6bd9-8a75ea29d5fb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bba0386d-fb55-ecde-6bd9-8a75ea29d5fb@huawei.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 12, 2019 at 05:40:54PM +0800, Zhiqiang Liu wrote:
> 
> 
> On 2019/12/12 15:47, Greg KH wrote:
> > On Thu, Dec 12, 2019 at 09:48:44AM +0800, Zhiqiang Liu wrote:
> >> Omer Shalev have given a example which can trigger the CVE.
> >> Example link: https://deshal3v.github.io/blog/kernel-research/mmap_exploitation
> > 
> > That "example" was run on a kernel without the above mentioned commit to
> > fix all of this.
> > 
> > Have you tried this on the latest kernel release and succeeded?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Thanks for patiently answering my question.
> Actually, I have missed the Omer's commit.

As pennance, you can go revoke that CVE so this doesn't come up again in
a few months from someone else :)

thanks,

greg k-h
