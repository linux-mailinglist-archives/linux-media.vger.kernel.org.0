Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075B2359C49
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 12:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhDIKj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 06:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhDIKj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 06:39:58 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D15C061760
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 03:39:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54f84e-110.dhcp.inet.fi [84.248.78.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 1A4821B00101;
        Fri,  9 Apr 2021 13:39:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1617964782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xhka/X7wriXY/zfNQyF71FdTOYU/+lYlOvK+hme8ynw=;
        b=c29W+K8qQdjr96UhmEr7E7LCI5ovWpNLTMNgp6BNScLRxMKvUpCGZNwENsH6BAlAPLEEp+
        lsdubf7/OC3fKVNU7ir/Wz/O7KPdE4MgrerOUljfJkUcm42bHjuYpURLViE5D+YtTeO6fh
        5ZrqpMZopW5Wf1O/td6GdGKuO45APvr1lcqKksW+FoJSuPL6AMlyOemQHVJCScAoopjnoZ
        MCRkuZAZL54I8mHdZrxZTIz91ajpIJa7jIA9p1u3OTcLAayPGyQhPKHWYiKrcnFSRv3T6V
        ef+Cb7v2111doh0cX+dltuO5FBtRyM38H8ht/TNO+ShVCHLOlW8rCGr+/6k3Wg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1A044634C87;
        Fri,  9 Apr 2021 13:39:08 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lUoY9-0001YH-Vp; Fri, 09 Apr 2021 13:39:42 +0300
Date:   Fri, 9 Apr 2021 13:39:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Edgar Thier <info@edgarthier.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] v4l: Add 12-bit raw bayer linear packed formats
Message-ID: <20210409103941.GG3@valkosipuli.retiisi.eu>
References: <20190708060225.5172-1-info@edgarthier.net>
 <YFib1BNtNYSp2m7W@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFib1BNtNYSp2m7W@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1617964782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xhka/X7wriXY/zfNQyF71FdTOYU/+lYlOvK+hme8ynw=;
        b=fyZx15Wx4P+d4rRQHVX08WpI47QA80byC6JaE8ouCHAIu8FRM7hSVXD4IjLrWphhs8qGkk
        njo5gP2ycfTdjAc877BKP6LUs2LS0etPHDedp9FtdvIdAkJs4+9qDQd6K+ExUhwM6lcdMc
        qTr0xR0fsVyEf6eSbjlkaCipN+SuQAxmW8mgyIprz0AA9EluB018AFbBqQ4wemLMorpjJe
        QYMcOkTLo/Lrcbf+WWq/15lhTMhuIsfexU8P5IpPfBcsSTY8c2UX6Ena8iI2lncfNEj42G
        U5hJ3CiieCciaqPqiIG7bfw0Q8aoNAhsN77ZNQjOTZwR6hrnEpHiBL0mRq8lrw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1617964782; a=rsa-sha256;
        cv=none;
        b=f59ENk8NvBvqL1aUSYVHmEICvYqVi9dbBEP1fLQrVwQSP1IcCGoHBgD8yIJ3ZWAPW7i+kI
        DRxzWdXfknzzaelPeq3akx/ucF4vlc7Xlfvm9p/uCvIooNW502b/khaAY30V1Xq5m+110Y
        tBxGKjAfiSzzdGIllgFpa+gMvtA2kN1/V8G/LkqrhDvLzi9uAi7gaOe61NSVWp92DgFORL
        E9/6sxvOJ5Lij4cVRokA3jvupIP9IRULrLqol32BED6UNDcvBqT7INCXpihA4wae0z8VCL
        j6ubZgtA1r0HHN0tdCPDb1T/EsVTvxCPXWp2dU1RGoP5TZlM3ot6Migll5UHRg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Mar 22, 2021 at 03:29:56PM +0200, Laurent Pinchart wrote:
> Hi Edgar,
> 
> I've just been notified that I had forgotten about this patch series :-S
> Mea culpa.
> 
> On Mon, Jul 08, 2019 at 08:02:25AM +0200, Edgar Thier wrote:
> > These formats are compressed 12-bit raw bayer formats with four different
> > pixel orders. The pixel follow one another without any padding,
> 
> s/pixel follow/pixels follow/
> 
> > thus are packed in a 'linear' fashion.
> > 
> > Signed-off-by: Edgar Thier <info@edgarthier.net>
> > ---
> >  Documentation/media/uapi/v4l/pixfmt-rgb.rst   |  1 +
> >  .../media/uapi/v4l/pixfmt-srggb12lp.rst       | 76 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
> >  include/uapi/linux/videodev2.h                |  7 ++
> >  4 files changed, 88 insertions(+)
> >  create mode 100644 Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> > 
> > diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> > index 48ab80024835..9efa500c02dc 100644
> > --- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> > @@ -26,5 +26,6 @@ RGB Formats
> >      pixfmt-srggb10-ipu3
> >      pixfmt-srggb12
> >      pixfmt-srggb12p
> > +    pixfmt-srggb12lp
> 
> I'd move this above srggb12p to order them alphabetically.
> 
> >      pixfmt-srggb14p
> >      pixfmt-srggb16
> > diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> > new file mode 100644
> > index 000000000000..08d73cfdc42d
> > --- /dev/null
> > +++ b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
> > @@ -0,0 +1,76 @@
> > +.. -*- coding: utf-8; mode: rst -*-
> > +
> > +.. _v4l2-pix-fmt-sbggr12lp:
> > +.. _v4l2-pix-fmt-sgbrg12lp:
> > +.. _v4l2-pix-fmt-sgrbg12lp:
> > +.. _v4l2-pix-fmt-srggb12lp:
> > +
> > +**********************************************************************************************************************************
> > +V4L2_PIX_FMT_SBGGR12LP ('BGCp'), V4L2_PIX_FMT_SGBRG12LP ('GBCp'), V4L2_PIX_FMT_SGRBG12LP ('GRCp'), V4L2_PIX_FMT_SRGGB12LP ('RGCp')
> > +**********************************************************************************************************************************
> > +
> > +12-bit Bayer formats
> 
> This should be
> 
> 12-bit linear packed Bayer formats
> ----------------------------------
> 
> > +
> > +Description
> > +===========
> > +
> > +These packed Bayer formats are used by industrial cameras, often in conjunction
> > +with UsbVision (see https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).
> > +
> > +The formats are equal to the Genicam PFNC Bayer12p formats
> > +(see https://www.emva.org/wp-content/uploads/GenICam_PFNC_2_3.pdf).
> > +
> > +They are raw sRGB / Bayer formats with 12 bits
> > +per sample with 3 bytes for every 2 pixels.
> > +
> > +The format is little endian.
> 
> I'd drop this line, as there's no real endianess here, is there ?
> 
> With those small changes,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Feel free to add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
