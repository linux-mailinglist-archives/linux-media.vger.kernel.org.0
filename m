Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F0D4499FE
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 17:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240042AbhKHQii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 11:38:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:34230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237949AbhKHQii (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 11:38:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C9E361378;
        Mon,  8 Nov 2021 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636389353;
        bh=iwpvDLswxle6gd8V8J2IbfFUIvkB+LSqibNQ3NEZosU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S0KOIoF5/TzLjdBfvZr2p1stIlRfTaafAcfC9DaVaNh6xr0cY2KWzFS7ABRnpAQGh
         fOLNKEHnQwrWJ+/ywwjNO2DaGE2+0VClp5Lbu+18h2RHN92o3zKfqqb9qU2zAT83zN
         iqMg1aee4z8ldz1AnuV7QU8a4BPdQ+ZjNac0x39+byise7d3mgrP5BoynbgHZrobKV
         pji3zBShOJKAPe9nKzryPU04Fo/TWY/P91adQjC17DoHaEoVtpTDQegHshOoMOp4Or
         SnyLfa6lCJnGDxaKHTX9zbMA55/gKnqRfNiQTG3uI8MS/+qcZj4+VgokgHLykVNGWl
         u8mX/q/LcfgTg==
Date:   Mon, 8 Nov 2021 16:35:47 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] media: atomisp: pci: fix inverted error check for
 ia_css_mipi_is_source_port_valid()
Message-ID: <20211108163536.07bd2282@sal.lan>
In-Reply-To: <efaf74b587e5e31403895cd5af88852402fe92ec.camel@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-6-kitakar@gmail.com>
        <20211102113332.GC2794@kadam>
        <ed17420d96bd302479b528f7ae8694ff9cd2e72a.camel@gmail.com>
        <20211108151455.GI2001@kadam>
        <efaf74b587e5e31403895cd5af88852402fe92ec.camel@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 09 Nov 2021 00:25:52 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> <removed Alan from Cc as the mail address not reachable>
> 
> On Mon, 2021-11-08 at 18:14 +0300, Dan Carpenter wrote:
> > On Tue, Nov 09, 2021 at 12:00:29AM +0900, Tsuchiya Yuto wrote:  
> > > On Tue, 2021-11-02 at 14:33 +0300, Dan Carpenter wrote:  
> > > > On Mon, Oct 18, 2021 at 01:19:45AM +0900, Tsuchiya Yuto wrote:  
> > > > > The function ia_css_mipi_is_source_port_valid() returns true if the port
> > > > > is valid. So, we can't use the existing err variable as is.
> > > > > 
> > > > > To fix this issue while reusing that variable, invert the return value
> > > > > when assigning it to the variable.
> > > > > 
> > > > > Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
> > > > > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > > > > ---
> > > > >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
> > > > >  1 file changed, 15 insertions(+), 9 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > > index 65fc93c5d56b..c1f2f6151c5f 100644
> > > > > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > > > @@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> > > > >  		return 0; /* AM TODO: Check  */
> > > > >  	}
> > > > >  
> > > > > -	if (!IS_ISP2401)
> > > > > +	if (!IS_ISP2401) {
> > > > >  		port = (unsigned int)pipe->stream->config.source.port.port;
> > > > > -	else
> > > > > -		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> > > > > +	} else {
> > > > > +		/* Returns true if port is valid. So, invert it */
> > > > > +		err = !ia_css_mipi_is_source_port_valid(pipe, &port);  
> > > > 
> > > > Don't invert it...  This isn't supposed to return 1 on failure it's
> > > > supposed to return negative error codes.  
> > > 
> > > You mean I should instead modify the return value of
> > > ia_css_mipi_is_source_port_valid() ?
> > >   
> > 
> > No.  ia_css_mipi_is_source_port_valid() is fine.  It has a boolean name
> > so returning bool is fine.  What I'm saying is that allocate_mipi_frames()
> > should do:
> > 
> > 	if (!ia_css_mipi_is_source_port_valid(pipe, &port))
> > 		err = -EINVAL;
> > 
> > Otherwise it returns negative error codes and 1 on failure.  
> 
> Ah, I see! Thank you. I feel I'm a stupid... I'll do so in v2.

I would prefer if you could send such changes on new patches.

Regards,
Mauro
