Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379ED1F381E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 12:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgFIK3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 06:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgFIK26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 06:28:58 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D86C03E97C
        for <linux-media@vger.kernel.org>; Tue,  9 Jun 2020 03:28:56 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id m32so10718484ede.8
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2020 03:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gFNWdxQvJsj/PAcrNno1NXDrWUfuQ3gELpOPfZFY9Ok=;
        b=bWTGfVAOG6tfJfLLKI3RpHybPpWytXlALbTZ34ZpOyOmB1Dxfj7SykRUv/XYVfF6IA
         QsjVmQiJIYrP7R/wcwSSnyfZjY8Bsgw2EWZy9Tsb0Cegmtpuwq5fJVZ6x0vCfDBXfPuI
         tnx/l1sUi1c4IdE1GUCateS/CElmISjns8noFnDPXJzIwU5OM6MdRhEGmTzOfE2MDGZ5
         /vmk6NNv1rTAsuOT5WMWZS9iuGAlmWexYWDEeWMgIjk1LXYBSNwvv1CFbiIsjPtq61Ir
         QnTfYDvkxZc5Tf9hHLIUJ6hJVY0LpvnMc7fI8e1GP5Rx8E9l/MHT+h0EQ79CUyrBqOXi
         sd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gFNWdxQvJsj/PAcrNno1NXDrWUfuQ3gELpOPfZFY9Ok=;
        b=YBaAAij5h2diLy8QqBp1aRmvUSI/vfWShulESAznwYBhF/4d+lZPfrE89I4upDSDIC
         YLr+7egDWALEB1RavwBWinjGniJ40LxEUWW8csAiEQCv+ERZCAvYd9n3KMxN8WPqbMN9
         J9G+H7eRVsBo1W1s2Df6TMzrJRsxRHtejC5IQXqHrkeh4sTAK8pnuwBR1fZeCCVWSJJ6
         dDIWmDTU43etaZ7mHtEX4uOk9jQRIe/JVr61E46ya8AH/kgDdxc35SsfzGjO7Oo6CiKA
         V6+mR9wdkSpWp9n/tyNy2hZLkcbNcMmAjpArWL8T9RHeN4nLyKkTSTTq2q2QtCWTQEUg
         E51g==
X-Gm-Message-State: AOAM5312XlHrUge8B71X1h5DLxoWIRQzCdwk/XiJmODoiCzdeYU+m9MX
        UxFlbpdn9+1b5Y3pryMALbClSjVsOhN17eIbW9FPQw==
X-Google-Smtp-Source: ABdhPJxZ6XlgVmh3lSP6SM9175REGiYedmbVtXDN/k3Pkaj/EKKBRDkAoZb/wAc6G53Gx2OymPWm4S7XPrTygcgKTIg=
X-Received: by 2002:a05:6402:1746:: with SMTP id v6mr2922335edx.236.1591698535254;
 Tue, 09 Jun 2020 03:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200604135317.9235-1-narmstrong@baylibre.com>
 <20200604135317.9235-2-narmstrong@baylibre.com> <02aa06fd8397b77c9a75d3a8399cb55d3b4d39c1.camel@ndufresne.ca>
 <4d22ff40-11ac-c77a-564d-af9a678f23af@baylibre.com> <a15dea55-3ca4-2a65-5c56-6c1edd2de405@xs4all.nl>
 <a4c5ae79-1d4d-4c1e-1535-c6c8b02d4b6f@baylibre.com> <2a0db0a4-9d04-f20c-39d8-ff25e07e64b7@xs4all.nl>
 <f6d35521b61da395528d6dd1164a9af6c3acd664.camel@ndufresne.ca> <3ffe901f-73e4-bdf7-84a6-a5372186b55c@baylibre.com>
In-Reply-To: <3ffe901f-73e4-bdf7-84a6-a5372186b55c@baylibre.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 9 Jun 2020 07:28:44 -0300
Message-ID: <CAAEAJfB8HfgONpJ6YZhLnLdQz+emfhDetR_0=BoRykz3-7732Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel formats
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding Helen to the discussion.

On Tue, 9 Jun 2020 at 04:43, Neil Armstrong <narmstrong@baylibre.com> wrote=
:
>
> Hi Nicolas,
>
> On 08/06/2020 20:59, Nicolas Dufresne wrote:
> > Le lundi 08 juin 2020 =C3=A0 16:43 +0200, Hans Verkuil a =C3=A9crit :
> >> On 08/06/2020 16:14, Neil Armstrong wrote:
> >>> On 08/06/2020 11:26, Hans Verkuil wrote:
> >>>> On 08/06/2020 10:16, Neil Armstrong wrote:
> >>>>> Hi Nicolas,
> >>>>>
> >>>>> On 05/06/2020 17:35, Nicolas Dufresne wrote:
> >>>>>> Le jeudi 04 juin 2020 =C3=A0 15:53 +0200, Neil Armstrong a =C3=A9c=
rit :
> >>>>>>> From: Maxime Jourdan <mjourdan@baylibre.com>
> >>>>>>>
> >>>>>>> Add two generic Compressed Framebuffer pixel formats to be used
> >>>>>>> with a modifier when imported back in another subsystem like DRM/=
KMS.
> >>>>>>>
> >>>>>>> These pixel formats represents generic 8bits and 10bits compresse=
d buffers
> >>>>>>> with a vendor specific layout.
> >>>>>>>
> >>>>>>> These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_=
YUV420_10BIT
> >>>>>>> used to describe the underlying compressed buffers used for ARM F=
ramebuffer
> >>>>>>> Compression. In the Amlogic case, the compression is different bu=
t the
> >>>>>>> underlying buffer components is the same.
> >>>>>>>
> >>>>>>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> >>>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >>>>>>> ---
> >>>>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> >>>>>>>  include/uapi/linux/videodev2.h       | 9 +++++++++
> >>>>>>>  2 files changed, 11 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media=
/v4l2-core/v4l2-ioctl.c
> >>>>>>> index 2322f08a98be..8f14adfd5bc5 100644
> >>>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>>>> @@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fm=
tdesc *fmt)
> >>>>>>>                 case V4L2_PIX_FMT_S5C_UYVY_JPG: descr =3D "S5C73M=
X interleaved UYVY/JPEG"; break;
> >>>>>>>                 case V4L2_PIX_FMT_MT21C:        descr =3D "Mediat=
ek Compressed Format"; break;
> >>>>>>>                 case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr =3D "Su=
nxi Tiled NV12 Format"; break;
> >>>>>>> +               case V4L2_PIX_FMT_YUV420_8BIT:  descr =3D "Compre=
ssed YUV 4:2:0 8-bit Format"; break;
> >>>>>>> +               case V4L2_PIX_FMT_YUV420_10BIT: descr =3D "Compre=
ssed YUV 4:2:0 10-bit Format"; break;
> >>>
> >>> [..]
> >>>
> >>>>>> I'll remind that the modifier implementation has great value and i=
s
> >>>>>> much more scalable then the current V4L2 approach. There has been =
some
> >>>>>> early proposal for this, maybe it's time to prioritize because thi=
s
> >>>>>> list will starts growing with hundred or even thousands or format,
> >>>>>> which is clearly indicated by the increase of modifier generator m=
acro
> >>>>>> on the DRM side.
> >>>>>
> >>>>> Yes, but until the migration of drm_fourcc and v4l2 fourcc into a c=
ommon one
> >>>>> is decided, I'm stuck and this is the only intermediate solution I =
found.
> >>>>
> >>>> We can safely assume that drm fourcc and v4l2 fourcc won't be merged=
.
> >>>>
> >>>> There is too much divergence and not enough interest in creating com=
mon
> >>>> fourccs.
> >>>>
> >>>> But we *do* want to share the modifiers.
> >>>>
> >>>>> We have a working solution with Boris's patchset with ext_fmt passi=
ng the
> >>>>> modifier to user-space.
> >>>>>
> >>>>> but anyway, since the goal is to merge the fourcc between DRM & V4L=
2, these YUV420_*BIT
> >>>>> will still be needed if we pass the modifier with an extended forma=
t struct.
> >>>>
> >>>> We tried merging fourccs but that ran into resistance. Frankly, I wo=
uldn't
> >>>> bother with this, it is much easier to just create a conversion tabl=
e in the
> >>>> kernel docs.
> >>>>
> >>>> So don't block on this, I would really prefer if the ext_fmt series =
is picked
> >>>> up again and rebased and reposted and then worked on. The stateless =
codec support
> >>>> is taking less time (it's shaping up well) so there is more time to =
work on this.
> >>>
> >>> Ok, I already starting discussing with Helen Koike about the ext_fnt =
re-spin.
> >>>
> >>> Should I re-introduce different v4l2 pixfmt for these DRM YUV420_*BIT=
 or I can keep this
> >>> patch along the new ext_fmt and shared modifiers ?
> >>
> >> So to be clear the DRM_FORMAT_YUV420_8BIT/10BIT fourccs define that th=
is is a
> >> buffer containing compressed YUV420 in 8 or 10 bit and the modifier te=
lls userspace
> >> which compression is used, right?
> >>
> >> And we would add V4L2_PIX_FMT_YUV420_8BIT/_10BIT that, I assume, use t=
he same
> >> fourcc values as the DRM variants?
> >>
> >> Since these fourccs are basically useless without V4L2 modifier suppor=
t it would
> >> only make sense in combination with the ext_fmt series.
> >
> > I personally still think that adding these fourcc will just create a
> > source of confusion and that fourcc should not be tried to be matched
> > at the cost of tripling the already duplicated pixel formats. Userspace
> > already need to implement translation anyway.
>
> By using the same fourcc + modifiers, the translation table would only be=
 needed
> for v4l2-specific fourcc, by reusing the same it's not necessary anymore.
> We have a really simple ffmpeg implementation using ext_fmt, and it makes=
 it
> generic.
>
> >
> > On DRM side, new fourcc was not create for NV12+modifier, I don't see
> > why planar YUV420 has to be different, with or without ext_fmt.
>
> These V4L2_PIX_FMT_YUV420_8BIT/_10BIT were added because of the compresse=
d nature
> of buffers. It's not because of the modifiers, modifiers can be used we a=
ny fourcc
> to define vendor specific layout requirements or changes, but for compres=
sed the
> underlying YUV buffer cannot be physically described by any YUV420 fourcc=
, so
> ARM introduced these fourcc to describe a virtual YUV420 8 or 10bit buffe=
r which
> physical layout is defined by the modifier.
> They could have re-used DRM_FORMAT_YUV420, but it's a 2 plane fourcc, and=
 the other
> describe a true single or multiple plane layout which are simply not true=
 with
> ARM AFBC or Amlogic FBC.
>
> Neil
>
> >
> > Nicolas
> >
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >>> Neil
> >>>
> >>>> I believe we really need this since v4l2_buffer and v4l2_format are =
a real mess.
> >>>>
> >>>> Regards,
> >>>>
> >>>>    Hans
> >>>>
> >>>>>>>                 default:
> >>>>>>>                         if (fmt->description[0])
> >>>>>>>                                 return;
> >>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/=
videodev2.h
> >>>>>>> index c3a1cf1c507f..90b9949acb8a 100644
> >>>>>>> --- a/include/uapi/linux/videodev2.h
> >>>>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>>>> @@ -705,6 +705,15 @@ struct v4l2_pix_format {
> >>>>>>>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /*=
 Fast Walsh Hadamard Transform (vicodec) */
> >>>>>>>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W=
', 'H') /* Stateless FWHT (vicodec) */
> >>>>>>>
> >>>>>>> +/*
> >>>>>>> + * Compressed Luminance+Chrominance meta-formats
> >>>>>>> + * In these formats, the component ordering is specified (Y, fol=
lowed by U
> >>>>>>> + * then V), but the exact Linear layout is undefined.
> >>>>>>> + * These formats can only be used with a non-Linear modifier.
> >>>>>>> + */
> >>>>>>> +#define V4L2_PIX_FMT_YUV420_8BIT       v4l2_fourcc('Y', 'U', '0'=
, '8') /* 1-plane YUV 4:2:0 8-bit */
> >>>>>>> +#define V4L2_PIX_FMT_YUV420_10BIT      v4l2_fourcc('Y', 'U', '1'=
, '0') /* 1-plane YUV 4:2:0 10-bit */
> >>>>>>> +
> >>>>>>>  /*  Vendor-specific formats   */
> >>>>>>>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /*=
 cpia1 YUV */
> >>>>>>>  #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /*=
 Winnov hw compress */
> >>>>>
> >>>>> [1] https://patchwork.freedesktop.org/series/73722/#rev7
> >>>>>
> >
>
