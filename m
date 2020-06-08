Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992A11F1F5E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 20:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgFHS7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 14:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgFHS7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 14:59:35 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABCDC08C5C3
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 11:59:34 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id k22so15569498qtm.6
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1LNXy0gulshDF6Am2ORMrlABkF4RBeFdpjJ6l6ghlxc=;
        b=XKzY/dMoRNR8g2sNEYdfjb4hTfUUulqOlT+yf47tp2KJzcr32jQMJqtK5NJop2cINl
         9Ebd8hsMhE+MWHwkXW/PjQHzQNVi+QxoJYp5ggn+JZbE6bIhHzJaCbg54yeBdVYaKhiU
         GLOT0fN/40VD6Gf5soYESTPoFMs5u410zhTCtMMxSiTNAF1IeqSGJW4F19rGX+ddm8Lh
         2XsHczdkDeRkyYoLm+k6ElJtv/2AnJKWR7j2B8380LonwThSgmeNaioKv+cKsl8yX/fK
         v69JfJPGaD79z/9nCqUM3LDP+XzmX2bnG5R8IMygXAh/DNaCOzAO7QTc8Jl1vn0W6Czd
         fQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1LNXy0gulshDF6Am2ORMrlABkF4RBeFdpjJ6l6ghlxc=;
        b=Z9Zino9U0nSVukBylwm3eEKWIqEnWZNwPinKsAfrPmB40m0zAoYoldQLLjaSVW0LNO
         RN2IcFX2Q10z1VAcG+IQZgGXpgd4cCxkTaLQKZvEKUA/TaLqKU+0yyB6t3Kh72w6mocQ
         NbTI2b03l4djuXWrga9bAQdB6EyTJfeWoQBPWWd2K2tvMrtXZdGKuvRPnzXnfoJZNEzm
         CanmabqozzblcAocupZ5S97SPm3zbEYDs72v8QIFbtRmXZKwo2GTTK4Y1H3kvCRMn7Dx
         TdGCo0sEzuP2m9UBD+usY05OeI1FNwamh2JDB0kmgWEqigl0KC3WdMqZArgQ4OxG6omh
         tObw==
X-Gm-Message-State: AOAM532KogE+l4Uf9umrt55sYGI4+NeP/dyk3lP2bM7NxIZLap9yqhXf
        y2u9ZXsjxphY7V27ocfeKhmiDQ==
X-Google-Smtp-Source: ABdhPJzsZQLMeKY0DCqtO/KRhmtkfC5lUzy0bMjqjQup+oWO9tomqEZelGqLBLNBAwZlmugb1j09Jg==
X-Received: by 2002:ac8:7350:: with SMTP id q16mr24420939qtp.74.1591642773976;
        Mon, 08 Jun 2020 11:59:33 -0700 (PDT)
Received: from skullcanyon (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id z194sm7357905qkb.73.2020.06.08.11.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 11:59:33 -0700 (PDT)
Message-ID: <f6d35521b61da395528d6dd1164a9af6c3acd664.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel
 formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 08 Jun 2020 14:59:32 -0400
In-Reply-To: <2a0db0a4-9d04-f20c-39d8-ff25e07e64b7@xs4all.nl>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
         <20200604135317.9235-2-narmstrong@baylibre.com>
         <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
         <4d22ff40-11ac-c77a-564d-af9a678f23af@baylibre.com>
         <a15dea55-3ca4-2a65-5c56-6c1edd2de405@xs4all.nl>
         <a4c5ae79-1d4d-4c1e-1535-c6c8b02d4b6f@baylibre.com>
         <2a0db0a4-9d04-f20c-39d8-ff25e07e64b7@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 08 juin 2020 à 16:43 +0200, Hans Verkuil a écrit :
> On 08/06/2020 16:14, Neil Armstrong wrote:
> > On 08/06/2020 11:26, Hans Verkuil wrote:
> > > On 08/06/2020 10:16, Neil Armstrong wrote:
> > > > Hi Nicolas,
> > > > 
> > > > On 05/06/2020 17:35, Nicolas Dufresne wrote:
> > > > > Le jeudi 04 juin 2020 à 15:53 +0200, Neil Armstrong a écrit :
> > > > > > From: Maxime Jourdan <mjourdan@baylibre.com>
> > > > > > 
> > > > > > Add two generic Compressed Framebuffer pixel formats to be used
> > > > > > with a modifier when imported back in another subsystem like DRM/KMS.
> > > > > > 
> > > > > > These pixel formats represents generic 8bits and 10bits compressed buffers
> > > > > > with a vendor specific layout.
> > > > > > 
> > > > > > These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
> > > > > > used to describe the underlying compressed buffers used for ARM Framebuffer
> > > > > > Compression. In the Amlogic case, the compression is different but the
> > > > > > underlying buffer components is the same.
> > > > > > 
> > > > > > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > > > > > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > > > > > ---
> > > > > >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> > > > > >  include/uapi/linux/videodev2.h       | 9 +++++++++
> > > > > >  2 files changed, 11 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > index 2322f08a98be..8f14adfd5bc5 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > @@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > > > > >  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
> > > > > >  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
> > > > > >  		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
> > > > > > +		case V4L2_PIX_FMT_YUV420_8BIT:	descr = "Compressed YUV 4:2:0 8-bit Format"; break;
> > > > > > +		case V4L2_PIX_FMT_YUV420_10BIT:	descr = "Compressed YUV 4:2:0 10-bit Format"; break;
> > 
> > [..]
> > 
> > > > > I'll remind that the modifier implementation has great value and is
> > > > > much more scalable then the current V4L2 approach. There has been some
> > > > > early proposal for this, maybe it's time to prioritize because this
> > > > > list will starts growing with hundred or even thousands or format,
> > > > > which is clearly indicated by the increase of modifier generator macro
> > > > > on the DRM side.
> > > > 
> > > > Yes, but until the migration of drm_fourcc and v4l2 fourcc into a common one
> > > > is decided, I'm stuck and this is the only intermediate solution I found.
> > > 
> > > We can safely assume that drm fourcc and v4l2 fourcc won't be merged.
> > > 
> > > There is too much divergence and not enough interest in creating common
> > > fourccs.
> > > 
> > > But we *do* want to share the modifiers.
> > > 
> > > > We have a working solution with Boris's patchset with ext_fmt passing the
> > > > modifier to user-space.
> > > > 
> > > > but anyway, since the goal is to merge the fourcc between DRM & V4L2, these YUV420_*BIT
> > > > will still be needed if we pass the modifier with an extended format struct.
> > > 
> > > We tried merging fourccs but that ran into resistance. Frankly, I wouldn't
> > > bother with this, it is much easier to just create a conversion table in the
> > > kernel docs.
> > > 
> > > So don't block on this, I would really prefer if the ext_fmt series is picked
> > > up again and rebased and reposted and then worked on. The stateless codec support
> > > is taking less time (it's shaping up well) so there is more time to work on this.
> > 
> > Ok, I already starting discussing with Helen Koike about the ext_fnt re-spin.
> > 
> > Should I re-introduce different v4l2 pixfmt for these DRM YUV420_*BIT or I can keep this
> > patch along the new ext_fmt and shared modifiers ?
> 
> So to be clear the DRM_FORMAT_YUV420_8BIT/10BIT fourccs define that this is a
> buffer containing compressed YUV420 in 8 or 10 bit and the modifier tells userspace
> which compression is used, right?
> 
> And we would add V4L2_PIX_FMT_YUV420_8BIT/_10BIT that, I assume, use the same
> fourcc values as the DRM variants?
> 
> Since these fourccs are basically useless without V4L2 modifier support it would
> only make sense in combination with the ext_fmt series.

I personally still think that adding these fourcc will just create a
source of confusion and that fourcc should not be tried to be matched
at the cost of tripling the already duplicated pixel formats. Userspace
already need to implement translation anyway.

On DRM side, new fourcc was not create for NV12+modifier, I don't see
why planar YUV420 has to be different, with or without ext_fmt.

Nicolas
 
> 
> Regards,
> 
> 	Hans
> 
> > Neil
> > 
> > > I believe we really need this since v4l2_buffer and v4l2_format are a real mess.
> > > 
> > > Regards,
> > > 
> > > 	Hans
> > > 
> > > > > >  		default:
> > > > > >  			if (fmt->description[0])
> > > > > >  				return;
> > > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > > > > index c3a1cf1c507f..90b9949acb8a 100644
> > > > > > --- a/include/uapi/linux/videodev2.h
> > > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > > @@ -705,6 +705,15 @@ struct v4l2_pix_format {
> > > > > >  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
> > > > > >  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
> > > > > >  
> > > > > > +/*
> > > > > > + * Compressed Luminance+Chrominance meta-formats
> > > > > > + * In these formats, the component ordering is specified (Y, followed by U
> > > > > > + * then V), but the exact Linear layout is undefined.
> > > > > > + * These formats can only be used with a non-Linear modifier.
> > > > > > + */
> > > > > > +#define V4L2_PIX_FMT_YUV420_8BIT	v4l2_fourcc('Y', 'U', '0', '8') /* 1-plane YUV 4:2:0 8-bit */
> > > > > > +#define V4L2_PIX_FMT_YUV420_10BIT	v4l2_fourcc('Y', 'U', '1', '0') /* 1-plane YUV 4:2:0 10-bit */
> > > > > > +
> > > > > >  /*  Vendor-specific formats   */
> > > > > >  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
> > > > > >  #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov hw compress */
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/73722/#rev7
> > > > 

