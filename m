Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 449E211A30
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 15:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfEBNaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 09:30:04 -0400
Received: from casper.infradead.org ([85.118.1.10]:36284 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfEBNaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 09:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xwymtSVqN1lovVQt6NGsb0j+Ksp6Gq6pqoqeUUx9qlY=; b=JvQlEI5RM4kReI5CmEtGZ0pJ0T
        ap26TUWdn4Ue6aZ4FpNTcV8aWippQYhCijsNBIH/ugiGhS/ZOkSKh18rJopKMz2TW2ms5ec7B5BvB
        0w+CtMfWC1k/SIkZ8ahK23dkU/n1fPlw8cS4u4YkI38vTCCl7mr0byND/MHB4h596+Hl8ZGmWf9ev
        06fbGizsKPmaAvdipxJeqy1sYNx6vIXA5xZT8nmmRwHYW7yGWJTDRMWtW7DcaZs0CpWAyjxqkivIA
        KDThFvg9a/5brrvL/mtoaQDv/tb0Iulqs2VsRZcHu7sBhdl6W98uw/jbZyr7Ac5Je2VcFcceiTG+G
        T3GCIZlw==;
Received: from [177.159.247.19] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hMBmi-0004FZ-L8; Thu, 02 May 2019 13:30:01 +0000
Date:   Thu, 2 May 2019 10:29:56 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
Message-ID: <20190502102956.70aed1c3@coco.lan>
In-Reply-To: <ee78effa-f678-5d15-3802-bb787e7057e2@xs4all.nl>
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
        <20190502095550.31282c0d@coco.lan>
        <ee78effa-f678-5d15-3802-bb787e7057e2@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 2 May 2019 15:16:54 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 5/2/19 2:55 PM, Mauro Carvalho Chehab wrote:
> > Em Fri, 12 Apr 2019 18:59:15 +0300
> > Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> >   
> >> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
> >> field description to allow v4l clients to set bigger image size
> >> in case of variable length compressed data.
> >>
> >> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >> ---
> >>  Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst | 13 ++++++++++++-
> >>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst        | 11 ++++++++++-
> >>  2 files changed, 22 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
> >> index 5688c816e334..005428a8121e 100644
> >> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
> >> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
> >> @@ -31,7 +31,18 @@ describing all planes of that format.
> >>  
> >>      * - __u32
> >>        - ``sizeimage``
> >> -      - Maximum size in bytes required for image data in this plane.
> >> +      - Maximum size in bytes required for image data in this plane,
> >> +	set by the driver. When the image consists of variable length
> >> +	compressed data this is the number of bytes required by the
> >> +	codec to support the worst-case compression scenario.
> >> +
> >> +	For uncompressed images the driver will set the value. For
> >> +	variable length compressed data clients are allowed to set
> >> +	the sizeimage field, but the driver may ignore it and set the
> >> +	value itself, or it may modify the provided value based on
> >> +	alignment requirements or minimum/maximum size requirements.
> >> +	If the client wants to leave this to the driver, then it should
> >> +	set sizeimage to 0.
> >>      * - __u32
> >>        - ``bytesperline``
> >>        - Distance in bytes between the leftmost pixels in two adjacent
> >> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> >> index 71eebfc6d853..0f7771151db9 100644
> >> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> >> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> >> @@ -89,7 +89,16 @@ Single-planar format structure
> >>        - Size in bytes of the buffer to hold a complete image, set by the
> >>  	driver. Usually this is ``bytesperline`` times ``height``. When
> >>  	the image consists of variable length compressed data this is the
> >> -	maximum number of bytes required to hold an image.
> >> +	number of bytes required by the codec to support the worst-case
> >> +	compression scenario.
> >> +
> >> +	For uncompressed images the driver will set the value. For
> >> +	variable length compressed data clients are allowed to set
> >> +	the sizeimage field, but the driver may ignore it and set the
> >> +	value itself, or it may modify the provided value based on
> >> +	alignment requirements or minimum/maximum size requirements.
> >> +	If the client wants to leave this to the driver, then it should
> >> +	set sizeimage to 0.  
> > 
> > It is very confusing to understand what you meant by the above paragraph,
> > as you inverted the sentence order and forgot a comma.
> > 
> > I would, instead, write the phrases using the direct order, and break
> > into two paragraphs, e. g., changing the above to:
> > 
> > 	"The driver will set the value for uncompressed images.
> > 
> > 	Clients are allowed to set the sizeimage field for variable length
> > 	compressed data, but the driver may ignore it and set the
> > 	value itself, or it may modify the provided value based on
> > 	alignment requirements or minimum/maximum size requirements.
> > 	If the client wants to leave this to the driver, then it should
> > 	set sizeimage to 0."
> > 
> > That makes it a lot easier to read, hopefully preventing mistakes from
> > app and driver developers when reading about sizeimage.
> > 
> > Yet, I'm not too comfortable on letting this too generic. I mean,
> > how an app writer would know what formats are "variable length
> > compressed data", specially since libv4l may actually change that.  
> 
> It's actually quite clearly defined: compressed formats set the
> V4L2_FMT_FLAG_COMPRESSED flag in VIDIOC_ENUMFMT.

Ok, so let's be explicit here, e. g. something like:

 	"Clients are allowed to set the sizeimage field for variable length
 	compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at
	VIDIOC_ENUMFMT, but the driver may ignore it and set the
 	value itself, or it may modify the provided value based on
 	alignment requirements or minimum/maximum size requirements.
 	If the client wants to leave this to the driver, then it should
 	set sizeimage to 0."

That makes clear for app developers when they can use this new
feature.

That still leads us to what happens at libv4l with sizeimage
for a compressed format that got uncompressed by the library, in
order to ensure that a change like this won't cause breakages at
existing userspace apps.

> 
> Also bytesperline will be 0 for compressed formats.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Thanks,
> > Mauro
> >   
> 



Thanks,
Mauro
