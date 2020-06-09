Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48B01F3FBC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 17:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730945AbgFIPpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 11:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbgFIPpE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 11:45:04 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B73AC05BD1E
        for <linux-media@vger.kernel.org>; Tue,  9 Jun 2020 08:45:04 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id fc4so10308084qvb.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2020 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Bh+YealWwxZJnbcfdPR1PFHaHzWJZRc7njZoU5SFKVg=;
        b=WJLZIt46oqvS0F1DmYUm0IdNNNQ4/DV49oPzeH7fSJHb751fH86VnBdLPrwEcUjvkK
         Zd8OZ+eJVM2Ka4nwUfZXQ6mSnRbOo8CzA4OBipaymuEtLDh+7TWUZT3d74baRLlh8X5J
         rcvICo3ktqtjdzjunktFpWePOGQOl/HDociqiOYgHNiA+E+03Fi7GR/VpCZFd0y6b/tH
         usYe8YztWy8MzIqPWUDUT8sIAOz0YdZ7L9lHsSu8DzbysWvHXmlWVYGZci4wn40mVPzT
         oWRvxAuB+L6VdBuAIPNogdJRjN2f4x9wyIWFbngfQaa7ieROT0Khb42P85nCgwd5+v1n
         RZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Bh+YealWwxZJnbcfdPR1PFHaHzWJZRc7njZoU5SFKVg=;
        b=JAAVtko8ndboMMcma2tGTAA8D0/7QQsVRqyyHOBOqzrCTj/2Qi8syt3CpCGLcidwtW
         njCJFD4OI2PKlc14zN9CSZjNYtBeEmyN4sBUk5t/xyaWqfZxLeoTrsGrvLKQck6PiuPS
         vsVDdBitsyOM+7s93qaBuYzrgHxCiMz3+DInPzwxroDGP7yv8ozzqT6d6OOGC5CM+a+3
         vIdKGylK22d8iAg/rVyZj3Br1FVyJ6YxJrrY1Iw6wkxyjS8v0kDTP0BDVfJfa0j7TdBD
         It7eejm5e7QObKJOZ0CAVZ2kCAx+S05mppsy2V5BMQgr3uqcPF4nydyx2riO7twQkZy3
         TMYw==
X-Gm-Message-State: AOAM530t5EjmHm8GQYczgKbZDYLaB9imJho7EHgZP/oiqDx3cIhoG2iz
        bSsbcI9QCIfYDmVp1Lm/TpUOzA==
X-Google-Smtp-Source: ABdhPJxll233tY2hpEupFFNeElQnDRLHGCt0ZwiP0vWzvEEqbc9NEe8eJ+8hMufO0QZNlzE7UdjUrw==
X-Received: by 2002:a0c:f78a:: with SMTP id s10mr4707997qvn.32.1591717500384;
        Tue, 09 Jun 2020 08:45:00 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id p22sm11214186qtc.7.2020.06.09.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 08:44:59 -0700 (PDT)
Message-ID: <cda85bd893124c0929b80622cb6f4cf90c696c6c.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel
 formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Helen Koike <helen.koike@collabora.com>
Date:   Tue, 09 Jun 2020 11:44:58 -0400
In-Reply-To: <CAAEAJfB8HfgONpJ6YZhLnLdQz+emfhDetR_0=BoRykz3-7732Q@mail.gmail.com>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
         <20200604135317.9235-2-narmstrong@baylibre.com>
         <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
         <4d22ff40-11ac-c77a-564d-af9a678f23af@baylibre.com>
         <a15dea55-3ca4-2a65-5c56-6c1edd2de405@xs4all.nl>
         <a4c5ae79-1d4d-4c1e-1535-c6c8b02d4b6f@baylibre.com>
         <2a0db0a4-9d04-f20c-39d8-ff25e07e64b7@xs4all.nl>
         <f6d35521b61da395528d6dd1164a9af6c3acd664.camel@ndufresne.ca>
         <3ffe901f-73e4-bdf7-84a6-a5372186b55c@baylibre.com>
         <CAAEAJfB8HfgONpJ6YZhLnLdQz+emfhDetR_0=BoRykz3-7732Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 09 juin 2020 à 07:28 -0300, Ezequiel Garcia a écrit :
> Adding Helen to the discussion.
> 
> On Tue, 9 Jun 2020 at 04:43, Neil Armstrong <narmstrong@baylibre.com> wrote:
> > Hi Nicolas,
> > 
> > On 08/06/2020 20:59, Nicolas Dufresne wrote:
> > > Le lundi 08 juin 2020 à 16:43 +0200, Hans Verkuil a écrit :
> > > > On 08/06/2020 16:14, Neil Armstrong wrote:
> > > > > On 08/06/2020 11:26, Hans Verkuil wrote:
> > > > > > On 08/06/2020 10:16, Neil Armstrong wrote:
> > > > > > > Hi Nicolas,
> > > > > > > 
> > > > > > > On 05/06/2020 17:35, Nicolas Dufresne wrote:
> > > > > > > > Le jeudi 04 juin 2020 à 15:53 +0200, Neil Armstrong a écrit :
> > > > > > > > > From: Maxime Jourdan <mjourdan@baylibre.com>
> > > > > > > > > 
> > > > > > > > > Add two generic Compressed Framebuffer pixel formats to be used
> > > > > > > > > with a modifier when imported back in another subsystem like DRM/KMS.
> > > > > > > > > 
> > > > > > > > > These pixel formats represents generic 8bits and 10bits compressed buffers
> > > > > > > > > with a vendor specific layout.
> > > > > > > > > 
> > > > > > > > > These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
> > > > > > > > > used to describe the underlying compressed buffers used for ARM Framebuffer
> > > > > > > > > Compression. In the Amlogic case, the compression is different but the
> > > > > > > > > underlying buffer components is the same.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > > > > > > > > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> > > > > > > > >  include/uapi/linux/videodev2.h       | 9 +++++++++
> > > > > > > > >  2 files changed, 11 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > > > > index 2322f08a98be..8f14adfd5bc5 100644
> > > > > > > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > > > > @@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > > > > > > > >                 case V4L2_PIX_FMT_S5C_UYVY_JPG: descr = "S5C73MX interleaved UYVY/JPEG"; break;
> > > > > > > > >                 case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
> > > > > > > > >                 case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
> > > > > > > > > +               case V4L2_PIX_FMT_YUV420_8BIT:  descr = "Compressed YUV 4:2:0 8-bit Format"; break;
> > > > > > > > > +               case V4L2_PIX_FMT_YUV420_10BIT: descr = "Compressed YUV 4:2:0 10-bit Format"; break;
> > > > > 
> > > > > [..]
> > > > > 
> > > > > > > > I'll remind that the modifier implementation has great value and is
> > > > > > > > much more scalable then the current V4L2 approach. There has been some
> > > > > > > > early proposal for this, maybe it's time to prioritize because this
> > > > > > > > list will starts growing with hundred or even thousands or format,
> > > > > > > > which is clearly indicated by the increase of modifier generator macro
> > > > > > > > on the DRM side.
> > > > > > > 
> > > > > > > Yes, but until the migration of drm_fourcc and v4l2 fourcc into a common one
> > > > > > > is decided, I'm stuck and this is the only intermediate solution I found.
> > > > > > 
> > > > > > We can safely assume that drm fourcc and v4l2 fourcc won't be merged.
> > > > > > 
> > > > > > There is too much divergence and not enough interest in creating common
> > > > > > fourccs.
> > > > > > 
> > > > > > But we *do* want to share the modifiers.
> > > > > > 
> > > > > > > We have a working solution with Boris's patchset with ext_fmt passing the
> > > > > > > modifier to user-space.
> > > > > > > 
> > > > > > > but anyway, since the goal is to merge the fourcc between DRM & V4L2, these YUV420_*BIT
> > > > > > > will still be needed if we pass the modifier with an extended format struct.
> > > > > > 
> > > > > > We tried merging fourccs but that ran into resistance. Frankly, I wouldn't
> > > > > > bother with this, it is much easier to just create a conversion table in the
> > > > > > kernel docs.
> > > > > > 
> > > > > > So don't block on this, I would really prefer if the ext_fmt series is picked
> > > > > > up again and rebased and reposted and then worked on. The stateless codec support
> > > > > > is taking less time (it's shaping up well) so there is more time to work on this.
> > > > > 
> > > > > Ok, I already starting discussing with Helen Koike about the ext_fnt re-spin.
> > > > > 
> > > > > Should I re-introduce different v4l2 pixfmt for these DRM YUV420_*BIT or I can keep this
> > > > > patch along the new ext_fmt and shared modifiers ?
> > > > 
> > > > So to be clear the DRM_FORMAT_YUV420_8BIT/10BIT fourccs define that this is a
> > > > buffer containing compressed YUV420 in 8 or 10 bit and the modifier tells userspace
> > > > which compression is used, right?
> > > > 
> > > > And we would add V4L2_PIX_FMT_YUV420_8BIT/_10BIT that, I assume, use the same
> > > > fourcc values as the DRM variants?
> > > > 
> > > > Since these fourccs are basically useless without V4L2 modifier support it would
> > > > only make sense in combination with the ext_fmt series.
> > > 
> > > I personally still think that adding these fourcc will just create a
> > > source of confusion and that fourcc should not be tried to be matched
> > > at the cost of tripling the already duplicated pixel formats. Userspace
> > > already need to implement translation anyway.
> > 
> > By using the same fourcc + modifiers, the translation table would only be needed
> > for v4l2-specific fourcc, by reusing the same it's not necessary anymore.
> > We have a really simple ffmpeg implementation using ext_fmt, and it makes it
> > generic.

But it's not overall generic because "generic" userspace still need to
handle legacy, like the Samsung NV12 tiled format. There is no way to
avoid translation while supporting multiple HW (even with modifiers).
And adding a subset of generic fourcc that duplicates some existing
pixel format seems like the wrong way. Quickly this will grow fourcc
collision between DRM and V4L2.

> > 
> > > On DRM side, new fourcc was not create for NV12+modifier, I don't see
> > > why planar YUV420 has to be different, with or without ext_fmt.
> > 
> > These V4L2_PIX_FMT_YUV420_8BIT/_10BIT were added because of the compressed nature
> > of buffers. It's not because of the modifiers, modifiers can be used we any fourcc
> > to define vendor specific layout requirements or changes, but for compressed the
> > underlying YUV buffer cannot be physically described by any YUV420 fourcc, so
> > ARM introduced these fourcc to describe a virtual YUV420 8 or 10bit buffer which
> > physical layout is defined by the modifier.
> > They could have re-used DRM_FORMAT_YUV420, but it's a 2 plane fourcc, and the other
> > describe a true single or multiple plane layout which are simply not true with
> > ARM AFBC or Amlogic FBC.

As far as I'm concern, this argument does not hold, as NV12 is still
used with compressed modifiers on other plaforms (even if NV12 is not
by "nature" compressed) and only 1 out of the two NV12 formats we got
in V4L2 matches the DRM fourcc. So it might be "generic" to your
specific SoC, but that's not real.

In any case, I still believe the naming is completely misleading if
this is to indicate a buffer format which is compressed, and not
supposed to be used for linear YUV420p (which already have two fourcc
in V4L2 for).

> > 
> > Neil
> > 
> > > Nicolas
> > > 
> > > > Regards,
> > > > 
> > > >      Hans
> > > > 
> > > > > Neil
> > > > > 
> > > > > > I believe we really need this since v4l2_buffer and v4l2_format are a real mess.
> > > > > > 
> > > > > > Regards,
> > > > > > 
> > > > > >    Hans
> > > > > > 
> > > > > > > > >                 default:
> > > > > > > > >                         if (fmt->description[0])
> > > > > > > > >                                 return;
> > > > > > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > > > > > > > index c3a1cf1c507f..90b9949acb8a 100644
> > > > > > > > > --- a/include/uapi/linux/videodev2.h
> > > > > > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > > > > > @@ -705,6 +705,15 @@ struct v4l2_pix_format {
> > > > > > > > >  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
> > > > > > > > >  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
> > > > > > > > > 
> > > > > > > > > +/*
> > > > > > > > > + * Compressed Luminance+Chrominance meta-formats
> > > > > > > > > + * In these formats, the component ordering is specified (Y, followed by U
> > > > > > > > > + * then V), but the exact Linear layout is undefined.
> > > > > > > > > + * These formats can only be used with a non-Linear modifier.
> > > > > > > > > + */
> > > > > > > > > +#define V4L2_PIX_FMT_YUV420_8BIT       v4l2_fourcc('Y', 'U', '0', '8') /* 1-plane YUV 4:2:0 8-bit */
> > > > > > > > > +#define V4L2_PIX_FMT_YUV420_10BIT      v4l2_fourcc('Y', 'U', '1', '0') /* 1-plane YUV 4:2:0 10-bit */
> > > > > > > > > +
> > > > > > > > >  /*  Vendor-specific formats   */
> > > > > > > > >  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
> > > > > > > > >  #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov hw compress */
> > > > > > > 
> > > > > > > [1] https://patchwork.freedesktop.org/series/73722/#rev7
> > > > > > > 

