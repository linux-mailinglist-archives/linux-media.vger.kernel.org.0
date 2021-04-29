Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF38E36E99A
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 13:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhD2Lcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 07:32:55 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:36384 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230148AbhD2Lcz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 07:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619695910; bh=d3uPdEXE1jNAZ54QKIFbLqD5wKoRL+q+9gPNpRFnQIw=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=LZsok5TotTifFAujfAN9dRlgA5JB2P4OgCNd1ghlSOEPrPBi5IQxxRCdW3Zb3boz7
         GNxdyI9hLomBtSVKS7SrKLwpwmzY2HjcW5AS+WkWECPrZAhV5NKzMGkAkeEDDq6P5i
         0Uko0t8E4OwpwctefKBpb8oN+hpXDrKJuLHn2wQM=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 29 Apr 2021 13:31:50 +0200 (CEST)
X-EA-Auth: CX0bTBDMWFCx2SMkg6z9D2BIwVUjGxNmB0nEYowyJhWVMQ6M3qPxHOtdCEn3sTk1EckjJk8FvCJTxXNGgQMUroIbvLmS2QJE
Date:   Thu, 29 Apr 2021 17:01:41 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <YIqZHWkHi8HWnF0C@192.168.1.8>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
 <20210429100808.GZ1981@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429100808.GZ1981@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 01:08:09PM +0300, Dan Carpenter wrote:
> On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> > @@ -1044,7 +1048,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> >  	}
> >  
> >  	/*
> > -	// set analog/digital gain
> > +	 * set analog/digital gain
> >  	switch(AnalogGain)
> >  	{
> >  	case 0:
> 
> How on earth does this compile?

There is a closing */ down under after the entire switch block. The
change I made is within the comment block. I have compiled the built the
driver successfully.
Please let me know if you are seeing a different issue here.

Thank you,
deepak.

> 
> > @@ -1069,8 +1073,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> 
> 
> regards,
> dan carpenter
> 


