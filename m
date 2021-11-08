Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A736B449A05
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 17:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240078AbhKHQly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 11:41:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:34632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236528AbhKHQlx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 11:41:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9167961054;
        Mon,  8 Nov 2021 16:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636389549;
        bh=a6NTFs2KSKUTtge7RtoR+4/5YHytkD4pKor5SU+QaZ8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b9f28QHm13W2ui+DJ8Nkic0yst26y3MyI7Pzg/n7nIRUcowjjAJi0CQKekeCT2pFj
         0Cp4WTK8PjDbIo+QSE3yvQrLl+aNdF78zZjBLE8dUHuiGs1MNA2oy/UYRu2boEBAkF
         4pgLf/LY9jQaOrbRM7xKuOl4FBik963q+DWdxGLk5ouAkrJJRQ4oinP840ehWBdb60
         DqrEgfB14zp/d55Ji+aUntKaNy/ltYhHdWCw/2JA5vY87CcONwWpao9UA2VweuQUIx
         8OyNLiYAgMsAg6eG4hSIu06Md/MEKANEV39W6TGHIi1WfUemFdaEnP2xP6Ums9ajTF
         lwBgfNLNSBn8w==
Date:   Mon, 8 Nov 2021 16:39:02 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/17] media: atomisp: pci: use IA_CSS_ERROR() for error
 messages in sh_css_mipi.c
Message-ID: <20211108163902.58e12e76@sal.lan>
In-Reply-To: <ff2ac6cb74e98a5e9b0f537ea468322e6379620e.camel@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-7-kitakar@gmail.com>
        <20211102113540.GD2794@kadam>
        <ff2ac6cb74e98a5e9b0f537ea468322e6379620e.camel@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 09 Nov 2021 00:39:16 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> <removed Alan from Cc as the mail address not reachable>
> 
> On Tue, 2021-11-02 at 14:35 +0300, Dan Carpenter wrote:
> > On Mon, Oct 18, 2021 at 01:19:46AM +0900, Tsuchiya Yuto wrote:  
> > >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 32 ++++++++-----------
> > >  1 file changed, 13 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > index c1f2f6151c5f..de56a1da754d 100644
> > > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > @@ -434,9 +434,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> > >  
> > >  	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
> > >  	    (IS_ISP2401 && err)) {
> > > -		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> > > -				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
> > > -				    pipe, port);
> > > +		IA_CSS_ERROR("allocate_mipi_frames(%p) exit: port is not correct (port=%d).",
> > > +			     pipe, port);  
> > 
> > Not related to this patch but these printks should be using __func__
> > instead of hard coding it.  
> 
> OK, considering that I'll add a separate space issue fix patch in v2 as
> discussed in another mail, I'll also add the separate fix for minor
> issue fixes here, including the usage of `__func__` and dropping
> the unneeded newline `\n` I'm currently doing while here.

Better to keep the \n. The right fix - not only here but everywhere - would
be to convert all those into dev_info/dev_dbg/..., but this is a huge
change.

I would prefer to do such changes on a separate patch series that
will do only this kind of changes. After the conversion, the string
should finish with a \n. So, dropping it will just make the conversion
more error-prone.

Regards,
Mauro

> 
> Regards,
> Tsuchiya Yuto
> 
