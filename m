Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9276A36E9D8
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 13:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbhD2L4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 07:56:48 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:39696 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230148AbhD2L4s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 07:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619697337; bh=EDodJBjFB3DQAxPXQjc9/lyJzoAH5vHWFKGP+cWp5Cw=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=PMcwewS9jJs/xe16lbhanLuCXKbwsgk2tpXw8CD58VNUgrh3QihuEfUskHjXGvcDo
         YscogBvsi/zoiu90mjxVqfNw2x1kivo0wQZGTJx/OVWA7YCNhSfPHiNapfF6MOLBNO
         4blcMauAcuzRsVgfy39EKZ/eORv1KZ4N+kH8eABw=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 29 Apr 2021 13:55:37 +0200 (CEST)
X-EA-Auth: cJOQOLANNKlBzEu2daIqW4bACv6qvrxU/vXGYSh8PQf4qW+uEs1ZyrV9jbACe8RylP4MiN8XQLbjiYmvM0/i1v18h2xAnE/j
Date:   Thu, 29 Apr 2021 17:25:30 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <YIqesrvl3lFwWDhV@192.168.1.8>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
 <20210429100808.GZ1981@kadam>
 <YIqZHWkHi8HWnF0C@192.168.1.8>
 <20210429114304.GC21598@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429114304.GC21598@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 02:43:04PM +0300, Dan Carpenter wrote:
> On Thu, Apr 29, 2021 at 05:01:41PM +0530, Deepak R Varma wrote:
> > On Thu, Apr 29, 2021 at 01:08:09PM +0300, Dan Carpenter wrote:
> > > On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> > > > @@ -1044,7 +1048,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> > > >  	}
> > > >  
> > > >  	/*
> > > > -	// set analog/digital gain
> > > > +	 * set analog/digital gain
> > > >  	switch(AnalogGain)
> > > >  	{
> > > >  	case 0:
> > > 
> > > How on earth does this compile?
> > 
> > There is a closing */ down under after the entire switch block. The
> > change I made is within the comment block. I have compiled the built the
> > driver successfully.
> 
> Oh...  Duh.  I thought you converted the // to /*.  This patch doesn't
> make any sense though because originally it was commented out code, but
> now it's a commented out ball of code and notes.

No problem. It looks wrong with the limited lines in diff. Appreciate
you looking at it though.

Is it okay if I send in a separate patch with comment clean up? There
are several #if 0 code block directives for this driver that I believe can
be taken off as well. Should I clean those up as well?

Regards,
deepak.

> 
> Just delete any commented out code.
> 
> regards,
> dan carpenter
> 


