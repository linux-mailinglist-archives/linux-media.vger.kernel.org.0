Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F533FEC44
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 12:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244710AbhIBKki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 06:40:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233714AbhIBKkh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 06:40:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D5B060FC0;
        Thu,  2 Sep 2021 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630579179;
        bh=pskipErYG3yij3Nnbn/UFKHtIqoDLEsIIQwNdTzNC3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fDU6p6Zgnta23vpi6z+mLMRJZ3jhS35PqWTjGaYFT1WkaatOwxRpopOq56GVtwRTO
         O6AWwHFtIn8opjYQePBCiQRGkGYlAl4kO6GfQe0bTCUzIKbOoisotBW+WYPwjwAf33
         3X0O2xSqekO6mZ5TiSQCE1uLP8YDvzNf2uCTBgCw=
Date:   Thu, 2 Sep 2021 12:39:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
Message-ID: <YTCp6d1umr7AXRZW@kroah.com>
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >
> > On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > >
> > > stk_camera_probe mistakenly execute usb_get_intf and increase the
> > > refcount of interface->dev.
> > >
> > > Fix this by removing the execution of usb_get_intf.
> >
> > Any idea about this patch?
> 
> +cc Dan Carpenter, gregkh
> 
> There is no reply in this thread in one month. Can someone give some
> feedback on this patch?

This is the media developers domain, not much I can do here.

thanks,

greg k-h
