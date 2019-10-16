Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4CF3D9A65
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 21:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391106AbfJPTpV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 15:45:21 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44458 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfJPTpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 15:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zJzBf5k7y5y4wU6OSvT7WuZ9AQM2ptYw/lSfUsZU09U=; b=QNegE6MdeDARFRnRWiYSLMtZr
        w5L+vrKm/Hd0++Y0h2W8qhMnxRtzyaHuCKaQHAUjyGXCz7B2oL6qgMPf2wICr/T9uRjZBm5AUHiMY
        nNxRu2gqyxeqSVhDsm1TTRRzf1wD8W9WrDvkgNBEKr0EuiZJ9GaeYYOEbr/j6Ka7HMlfktWTowrTE
        pMTYh4TQENHQIaCNd3wM1FtVXy4nmmzn9+92bwd/DDv6sE2t115nZwi9eFyikyZt+gGOSIiQyfdbD
        8+lAvdb6bAbm+qOn1oiiAqt2NaMS1uI17OaszA7FBSm2dAupEUrh3i4FEnCTkcPV9HQ6GpB6ZQEUw
        tX12v/MMw==;
Received: from [179.95.49.118] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iKpES-0005gS-Sx; Wed, 16 Oct 2019 19:45:17 +0000
Date:   Wed, 16 Oct 2019 16:45:03 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Documentation:media:v4l2:Add vivid metadata doc
Message-ID: <20191016164503.01b9f037@coco.lan>
In-Reply-To: <3db91bd0-cfdd-6453-6e70-8567ac94d68e@xs4all.nl>
References: <20191004115514.31259-1-bnvandana@gmail.com>
        <3db91bd0-cfdd-6453-6e70-8567ac94d68e@xs4all.nl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 4 Oct 2019 13:59:00 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 10/4/19 1:55 PM, Vandana BN wrote:
> > Adds new file for describing new metadata format V4L2_META_FMT_VIVID added in vivid driver.
> > 
> > Signed-off-by: Vandana BN <bnvandana@gmail.com>
> > ---
> >  Documentation/media/uapi/v4l/meta-formats.rst |  1 +
> >  .../media/uapi/v4l/pixfmt-meta-vivid.rst      | 43 +++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
> > 
> > diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
> > index b10ca9ee3968..74c8659ee9d6 100644
> > --- a/Documentation/media/uapi/v4l/meta-formats.rst
> > +++ b/Documentation/media/uapi/v4l/meta-formats.rst
> > @@ -24,3 +24,4 @@ These formats are used for the :ref:`metadata` interface only.
> >      pixfmt-meta-uvc
> >      pixfmt-meta-vsp1-hgo
> >      pixfmt-meta-vsp1-hgt
> > +    pixfmt-meta-vivid
> > diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
> > new file mode 100644
> > index 000000000000..e6c349fadf30
> > --- /dev/null
> > +++ b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
> > @@ -0,0 +1,43 @@
> > +.. Permission is granted to copy, distribute and/or modify this
> > +.. document under the terms of the GNU Free Documentation License,
> > +.. Version 1.1 or any later version published by the Free Software
> > +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> > +.. and no Back-Cover Texts. A copy of the license is included at
> > +.. Documentation/media/uapi/fdl-appendix.rst.
> > +..
> > +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections

Could you please re-license it with dual GFDL and GPL?

See for example:
	Documentation/media/uapi/mediactl/media-request-ioc-queue.rst

For the text we're adding to all new documentation files on media.

Regards,
Mauro

> > +
> > +.. _v4l2-meta-fmt-vivid:
> > +
> > +*******************************
> > +V4L2_META_FMT_VIVID ('VIVID')  
> 
> That's a fivecc instead of a fourcc :-)
> 
> > +*******************************
> > +
> > +VIVID Metadata Format
> > +
> > +
> > +Description
> > +===========
> > +
> > +This format describes metadata in vivid driver.  
> 
> Say: ...describes the metadata format used by the vivid driver.
> 
> > +
> > +It sets Brightness, Saturation, Contrast and Hue, each of which maps to
> > +corresponding control in vivid driver with respect to its range and default values.  
> 
> ...controls of the...
> ...respect to the range...
> 
> > +
> > +It contains the following fields:
> > +
> > +.. flat-table:: VIVID Metadata
> > +    :widths: 1 4
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +
> > +    * - Field
> > +      - Description
> > +    * - u16 brightness;
> > +      - Image brightness, value can be in range 0 to 255, with default value as 128.  
> 
>       - Image brightness, the value is in the range 0 to 255, with the default value as 128.
> 
> > +    * - u16 contrast;
> > +      - Image contrast, value can be in range 0 to 255, with default value as 128.
> > +    * - u16 saturation;
> > +      - Image color saturation, value can be in range 0 to 255, with default value as 128.
> > +    * - s16 hue;
> > +      - Image color balance, value can be in range -128 to 128, with default value as 0.
> >   
> 
> Ditto.
> 
> Regards,
> 
> 	Hans



Thanks,
Mauro
