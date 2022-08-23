Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1436259D104
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 08:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240505AbiHWGFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 02:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240391AbiHWGFV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 02:05:21 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E80548C91
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 23:05:20 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id f4so9560168qkl.7
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 23:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=43IBXBukEMZBKHMY65bP6l6zHy53lFBv8pp6iM6iFtQ=;
        b=WJ1Qj/Jv832SskSyFIV8J8wTY+IaV31ImleU35pKbc1aVg2IjbYQZIC61Ug4eR2TGw
         OYinxYvz34GsRtgC/CpH6nRTWaZmV40L6zRMlg9z0vs7JBdJpf0xGe/XySsxPjq6jW8k
         m8JvpHbdzR3PDzK/iENMv48OlTAGCK1+MScEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=43IBXBukEMZBKHMY65bP6l6zHy53lFBv8pp6iM6iFtQ=;
        b=0CGk2TgkCTayplaJS7TRcs40hOiN4VjYs4aP3ciyHikXWEq8NqiSNwzPqo7hW1DY65
         2Y+vs9pK3DsGstBBtn+WDzHIu0f6h+XTUr/Y6JXrue2QHU+ARSe4LE2pTOmr79zPwrQM
         9WwPdKd3SmsayEyQUj8d0D/yYETxu8U7jIdvVaMJ4GMUmal14x5lBG66FfmkXEib0AFb
         FKc3rPxp6SAFmxT6eOvwdqMV6slDjGr7yygv9/zeurZukGuMMSzJBLG1894o3xjEnFmW
         jekXds8PkSKl1G57MYk25f80ZaD16Jb1uIboO3AlaoB9tg7PbRflU30/akVI7b1Fq9xx
         y6yA==
X-Gm-Message-State: ACgBeo39AH18ZjavZ6LNEHLH2WrUyNvKFdmR7EZ4IRNef0iVUn3w49h8
        SLT9NPwZpB4qdWqTs0Hd/JaRrQSrckPqwxhB
X-Google-Smtp-Source: AA6agR4uegQ0JbHcV/lFHCJVQpWgcBb+CDkcIlr22OPycM/vcRQnl814G2woez9b/u3yIYqdjjGTLg==
X-Received: by 2002:ae9:f205:0:b0:6bc:2d40:2f3d with SMTP id m5-20020ae9f205000000b006bc2d402f3dmr3404834qkg.448.1661234719281;
        Mon, 22 Aug 2022 23:05:19 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id t13-20020a05622a01cd00b00342f8143599sm10509326qtw.13.2022.08.22.23.05.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 23:05:18 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-33387bf0c4aso352082687b3.11
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 23:05:17 -0700 (PDT)
X-Received: by 2002:a81:1117:0:b0:336:45a1:221b with SMTP id
 23-20020a811117000000b0033645a1221bmr25033845ywr.229.1661234716981; Mon, 22
 Aug 2022 23:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com> <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com> <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
 <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca> <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
In-Reply-To: <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 23 Aug 2022 15:05:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D-eG-1cHvRX2nF0nKv6Zz3vVq6_KJ7HV0zZjADV9v1Zg@mail.gmail.com>
Message-ID: <CAAFQd5D-eG-1cHvRX2nF0nKv6Zz3vVq6_KJ7HV0zZjADV9v1Zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
To:     Hsia-Jun Li <Randy.Li@synaptics.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, sakari.ailus@linux.intel.com,
        ribalda@chromium.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sebastian.hesselbarth@gmail.com, jszhang@kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 20, 2022 at 12:44 AM Hsia-Jun Li <Randy.Li@synaptics.com> wrote=
:
>
>
>
> On 8/19/22 23:28, Nicolas Dufresne wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >
> >
> > Le vendredi 19 ao=C3=BBt 2022 =C3=A0 02:13 +0300, Laurent Pinchart a =
=C3=A9crit :
> >> On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
> >>> On 8/18/22 14:06, Tomasz Figa wrote:
> >>>> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> =
wrote:
> >>>>>
> >>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> >>>>>
> >>>>> The most of detail has been written in the drm.
> >>
> >> This patch still needs a description of the format, which should go to
> >> Documentation/userspace-api/media/v4l/.
> >>
> >>>>> Please notice that the tiled formats here request
> >>>>> one more plane for storing the motion vector metadata.
> >>>>> This buffer won't be compressed, so you can't append
> >>>>> it to luma or chroma plane.
> >>>>
> >>>> Does the motion vector buffer need to be exposed to userspace? Is th=
e
> >>>> decoder stateless (requires userspace to specify the reference frame=
s)
> >>>> or stateful (manages the entire decoding process internally)?
> >>>
> >>> No, users don't need to access them at all. Just they need a differen=
t
> >>> dma-heap.
> >>>
> >>> You would only get the stateful version of both encoder and decoder.
> >>
> >> Shouldn't the motion vectors be stored in a separate V4L2 buffer,
> >> submitted through a different queue then ?
> >
> > Imho, I believe these should be invisible to users and pooled separatel=
y to
> > reduce the overhead. The number of reference is usually lower then the =
number of
> > allocated display buffers.
> >
> You can't. The motion vector buffer can't share with the luma and chroma
> data planes, nor the data plane for the compression meta data.

I believe what Nicolas is suggesting is to just keep the MV buffer
handling completely separate from video buffers. Just keep a map
between frame buffer and MV buffer in the driver and use the right
buffer when triggering a decode.

>
> You could consider this as a security requirement(the memory region for
> the MV could only be accessed by the decoder) or hardware limitation.
>
> It is also not very easy to manage such a large buffer that would change
> when the resolution changed.

How does it differ from managing additional planes of video buffers?

Best regards,
Tomasz

> >>
> >>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> >>>>> ---
> >>>>>    drivers/media/v4l2-core/v4l2-common.c | 1 +
> >>>>>    drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
> >>>>>    include/uapi/linux/videodev2.h        | 2 ++
> >>>>>    3 files changed, 5 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/=
v4l2-core/v4l2-common.c
> >>>>> index e0fbe6ba4b6c..f645278b3055 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >>>>> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info=
(u32 format)
> >>>>>                   { .format =3D V4L2_PIX_FMT_SGBRG12,       .pixel_=
enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> >>>>>                   { .format =3D V4L2_PIX_FMT_SGRBG12,       .pixel_=
enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> >>>>>                   { .format =3D V4L2_PIX_FMT_SRGGB12,       .pixel_=
enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> >>>>> +               { .format =3D V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc =
=3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 5, .comp_planes =3D 2, .bpp =3D { 1=
, 2, 0, 0 }, .hdiv =3D 2, .vdiv =3D 2, .block_w =3D { 128, 128 }, .block_h =
=3D { 128, 128 } },
> >>>>>           };
> >>>>>           unsigned int i;
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> >>>>> index e6fd355a2e92..8f65964aff08 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtd=
esc *fmt)
> >>>>>                   case V4L2_PIX_FMT_MT21C:        descr =3D "Mediat=
ek Compressed Format"; break;
> >>>>>                   case V4L2_PIX_FMT_QC08C:        descr =3D "QCOM C=
ompressed 8-bit Format"; break;
> >>>>>                   case V4L2_PIX_FMT_QC10C:        descr =3D "QCOM C=
ompressed 10-bit Format"; break;
> >>>>> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr =3D "Synaptic=
s Compressed 8-bit tiled Format";break;
> >>>>> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr =3D "=
Synaptics Compressed 10-bit tiled Format";break;
> >>>>>                   default:
> >>>>>                           if (fmt->description[0])
> >>>>>                                   return;
> >>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> >>>>> index 01e630f2ec78..7e928cb69e7c 100644
> >>>>> --- a/include/uapi/linux/videodev2.h
> >>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
> >>>>>    #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2'=
) /* 12  Y/CbCr 4:2:0 16x16 tiles */
> >>>>>    #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1',=
 '2') /* Y/CbCr 4:2:0 8x128 tiles */
> >>>>>    #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '=
1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> >>>>> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')  =
 /* 12  Y/CbCr 4:2:0 tiles */
> >>>>> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '=
0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
> >>>>>
> >>>>>    /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?=
u=3Dhttp-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=3DDwIFaQ&c=3D7dfBJ8=
cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7=
PXU-mLTeZE&m=3DlkQiuhx0yMAYHGcW-0WaHlF3e2etMHsu-FoNIBdZILGH6FPigwSAmel2vAdc=
VLkp&s=3DJKsBzpb_3u9xv52MaMuT4U3T1pPqcObYkpHDBxvcx_4&e=3D   */
> >>>>>    #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /* =
 8  BGBG.. GRGR.. */
> >>
> >
>
> --
> Hsia-Jun(Randy) Li
