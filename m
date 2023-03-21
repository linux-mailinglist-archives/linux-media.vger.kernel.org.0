Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356496C38A0
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 18:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbjCURu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 13:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjCURut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 13:50:49 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B56515D6
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 10:50:47 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 14-20020a9d010e000000b0069f1287f557so4598175otu.0
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 10:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679421046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkJwMlCiDTlqzsjpVfjEWIOKQQ9rIssiVzw2rvOzZa0=;
        b=C0FXUQ4Z1C9Qu8HAo3qkbm0OVOdAJcJwZfXplZqfl4/wjggPZjQzmQy5nAadoaDf0o
         Z41S2FUx86AEsmlEXoLff9oRqKmP96hWlQYKM70zw94smvzHTKsCIIVoRfb6AROEdkyA
         tjszC3cHYEAKQo4MY0ejLYx9JTt20kxLtj3gdxywVfE8f4qX2HhnW5GNjE1IS/f9kREa
         o1X+dFOBu+e9pFIUt03mv1Ee9i5Dajls7J52tAReoC+/gSgBam9gaFT2wUxlXOTtJyc7
         4Z2zbjggmCyvK+412kaEA5dXYIKAQSRplfP/EC6YtzGXprGI2D3h5ca2yuLAyAlOisx/
         qpKQ==
X-Gm-Message-State: AO0yUKXgH5gKdtTgr2ct5MLykbDAYxpWy2RI0jyp4w/27pMQsp3A0Bhi
        hDIudUGH2DoEa6SytDTtf75F6MRnHn1m6xio3oI=
X-Google-Smtp-Source: AK7set9nXWd8OVKksqEPYrPVA1o30yxu9d/Cj3gkxVq2A0K1+8mcUmDzD3Qll5Rov+0t/UyR5BflSyJU6a3Ps2VqCsk=
X-Received: by 2002:a9d:3e53:0:b0:69a:7f40:3fb9 with SMTP id
 h19-20020a9d3e53000000b0069a7f403fb9mr1219944otg.3.1679421046646; Tue, 21 Mar
 2023 10:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230106194038.16018-1-adam@piggz.co.uk> <20230106194038.16018-2-adam@piggz.co.uk>
 <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com> <5905587.lOV4Wx5bFT@192-168-1-215>
 <Y7sm4ZbAoBhuhmP/@pendragon.ideasonboard.com> <Y+/FUICC58w10rNJ@pendragon.ideasonboard.com>
 <Y/Xw7lsKOYFqaZEw@aptenodytes>
In-Reply-To: <Y/Xw7lsKOYFqaZEw@aptenodytes>
From:   Adam Pigg <adam@piggz.co.uk>
Date:   Tue, 21 Mar 2023 17:50:35 +0000
Message-ID: <CANFkB1xNRMJyA3MKgwtPXc7B2BiGKhQPDan9NXw+QtCMD7cEJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: sun6i-csi: merge sun6i_csi_formats and sun6i_csi_formats_match
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, yong.deng@magewell.com,
        mchehab@kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 22 Feb 2023 at 10:39, Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi Adam, Laurent,
>
> On Fri 17 Feb 23, 20:20, Laurent Pinchart wrote:
> > Could you share your opinion on the question below ?
>
> Yeah sorry for the long delay here. It's taken me a while to dive back into
> this topic.
>
> My first impression is that I would rather be in favor of keeping a dynamic
> approach like what's already in sun6i_csi_capture_link_validate and extract
> the mbus/pixfmt matching logic from there.
>
> I would be happy to craft a patch in that direction, but maybe you'd like
> to have a try at it (since it's your series). Just let me know, I think I can
> do it pretty quickly now that I have everything back in mind. I could also
> add some comment about the general hardware mechanism/limitations.
>

Hi Paul

Apologies for missing this email!

As you seem to know the hardware much better, and I was only getting
it working together with
help from others, im more than happy for you to work up the changes,
and it will likely result in
a much shorter change cycle!

Would that be for this patch only in the series, or the other 2 also?

Thanks

> The hardware is a bit odd in a few ways and I found that the explicit
> combinatory approach wasn't a very good fit (but obviously that's an open topic
> for discussions).
>
> The general idea is that the SUN6I_CSI_INPUT_FMT_YUV420/422 can only be used
> to produce outputs on 2 or 3 planes, but not packed YUV. There's also no
> explicit hardware reordering of the chroma components, so we need to lie about
> the input order (input_yuv_seq_invert) to achieve inverted chroma components
> on the output format.
>
> In order to produce packed data, we can only rely on SUN6I_CSI_INPUT_FMT_RAW
> which provides no reordering mechanism. This is why it made good sense to me
> to only have an explicit matching table for this case and rely on more general
> logic that reflects the hardware capabilities otherwise.
>
> > On Sun, Jan 08, 2023 at 10:26:09PM +0200, Laurent Pinchart wrote:
> > > On Sun, Jan 08, 2023 at 06:23:56PM +0000, Adam Pigg wrote:
> > > > On Friday, 6 January 2023 23:31:48 GMT Laurent Pinchart wrote:
> > > > > On Fri, Jan 06, 2023 at 07:40:36PM +0000, adam@piggz.co.uk wrote:
>
> [...]
>
> > > > > > +#define SUN6I_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
>
> Cosmetic suggestion to stay consistent with the rest:
> #define SUN6I_CSI_CAPTURE_MBUS_CODES(mbus_codes...) \
>         (const u32[]) { mbus_codes, 0 }
>
> Also it would look better in sun6i_csi_capture.h.
>
> But really I would be happier with a dynamic approach.
>
> [...]
>
> > > > > >       /* YUV422 */
> > > > > >       {
> > > > > >
> > > > > > @@ -123,6 +139,8 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {>
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >               .input_format_raw       = true,
> > > > > >               .hsize_len_factor       = 2,
> > > > > >
> > > > > > +             .mbus_codes             =  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > +                                                       MEDIA_BUS_FMT_YUYV8_1X16),
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_YVYU,
> > > > > >
> > > > > > @@ -130,6 +148,8 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {>
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >               .input_format_raw       = true,
> > > > > >               .hsize_len_factor       = 2,
> > > > > >
> > > > > > +             .mbus_codes             =  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > > +                                                       MEDIA_BUS_FMT_YVYU8_1X16),
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_UYVY,
> > > > > >
> > > > > > @@ -137,6 +157,8 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >               .input_format_raw       = true,
> > > > > >               .hsize_len_factor       = 2,
> > > > > >
> > > > > > +             .mbus_codes             =  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > > +                                                       MEDIA_BUS_FMT_UYVY8_1X16),
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_VYUY,
> > > > > >
> > > > > > @@ -144,57 +166,68 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {>
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >               .input_format_raw       = true,
> > > > > >               .hsize_len_factor       = 2,
> > > > > >
> > > > > > +             .mbus_codes             =  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > > +                                                       MEDIA_BUS_FMT_VYUY8_1X16),
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_NV16,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > >
> > > > > I don't think this is correct. To produce semi-planar or multi-planar
> > > > > YUV formats, I believe the CSI needs YUV input. This should thus be
> > > > > (unless I'm mistaken)
>
> You are correct.
>
> > > > >
> > > > >                 .mbus_codes             =  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> > > > >                                                           MEDIA_BUS_FMT_UYVY8_1X16,
> > > > >                                                           MEDIA_BUS_FMT_VYUY8_2X8,
> > > > >                                                           MEDIA_BUS_FMT_VYUY8_1X16,
> > > > >                                                           MEDIA_BUS_FMT_YUYV8_2X8,
> > > > >                                                           MEDIA_BUS_FMT_YUYV8_1X16,
> > > > >                                                           MEDIA_BUS_FMT_YVYU8_2X8,
> > > > >                                                           MEDIA_BUS_FMT_YVYU8_1X16),
> > > > >
> > > > > and same below.
>
> All of the YUV420/422 pixel formats on 2 or 3 planes can take all of the
> supports packed 16-bit YUV bus formats, which is why it doesn't seem very
> graceful to have an explicit list.
>
> > > > >
> > > > Hi Laurent
> > > >
> > > > Thanks for the help and tips.  Ive made all the other changes, which can be
> > > > viewed here until i resubmit them https://github.com/sailfish-on-dontbeevil/
> > > > kernel-megi/commits/pinephone-libcamera
> > > >
> > > > Im just not quite sure on this one.  I think my implementation of merging the
> > > > arrays keeps the previous mapping right?  In sun6i_csi_capture_format_matches
> > > > there is no mapping for the *NV formats, and the remaining ones ive set to 0?
> > >
> > > The current implementation allows writing multi-planar formats (e.g.
> > > NV12) to memory when the input of the CSI is a YUV media bus format
> > > (e.g. YUYV8_1X16). This patch doesn't change that, but it will prevent
> > > NV12 from being enumerated when using media bus-based enumeration of
> > > pixel formats, so userspace won't see NV12 as being available.
> > >
> > > It would be fine fixing that issue in a separate patch on top of this
> > > one, but I though you could as well do both in one go.
> >
> > Adam, you mentioned that NV12 and NV16 "don't work". Could you elaborate
> > and explain what you've tried exactly ?
>
> We definitely need to keep the ability to produce NV12, NV16 and friends from
> YUV bus formats.
>
> > > > > Paul, could you confirm this ?
> > > > >
> > > > > I'm a bit surprised that the CSI can't shuffle the YUV components for
> > > > > packed YUYV formats, but so be it if that's a hardware limitation.
>
> Yep that is correct, it's a hardware limitation.
>
> Cheers,
>
> Paul
>
> > > > > I'm also thinking that a subsequent patch could drop the raw check from
> > > > > sun6i_csi_capture_link_validate():
> > > > >
> > > > > -       /* With raw input mode, we need a 1:1 match between input and  output. */
> > > > > -       if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
> > > > > -           capture_format->input_format_raw) {
> > > > > -               match = sun6i_csi_capture_format_match(pixelformat,
> > > > > -                                                       fmt.format.code);
> > > > > -               if (!match)
> > > > > -                       goto invalid;
> > > > > -       }
> > > > > +       /* Make sure the media bus code and pixel format are compatible. */
> > > > > +       match = sun6i_csi_capture_format_match(pixelformat,  fmt.format.code);
> > > > > +       if (!match)
> > > > > +               goto invalid;
> > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_NV61,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> > > > > >               .input_yuv_seq_invert   = true,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_YUV422P,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > > >
> > > > > >       },
> > > > > >       /* YUV420 */
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_NV12_16L16,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_NV12,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_NV21,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> > > > > >               .input_yuv_seq_invert   = true,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > > >
> > > > > >       },
> > > > > >
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_YUV420,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > > >
> > > > > >       },
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_YVU420,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> > > > > >               .input_yuv_seq_invert   = true,
> > > > > >
> > > > > > +             .mbus_codes             = 0,
> > > > > >
> > > > > >       },
> > > > > >       /* Compressed */
> > > > > >       {
> > > > > >
> > > > > >               .pixelformat            = V4L2_PIX_FMT_JPEG,
> > > > > >               .output_format_frame    =  SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> > > > > >               .output_format_field    =  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >
> > > > > > +             .mbus_codes             =  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_JPEG_1X8),
> > > > > >
> > > > > >       },
> > > > > >
> > > > > >  };
> > > > > >
> > > > > > @@ -210,118 +243,20 @@ struct sun6i_csi_capture_format
> > > > > > *sun6i_csi_capture_format_find(u32 pixelformat)>
> > > > > >       return NULL;
> > > > > >
> > > > > >  }
> > > > > >
> > > > > > -/* RAW formats need an exact match between pixel and mbus formats. */
> > > > > > -static const
> > > > > > -struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[]
> > > > > > = { - /* YUV420 */
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_YUYV,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_YUYV,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_YVYU,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_YVYU,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_YVYU8_1X16,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_UYVY,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_UYVY,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_UYVY8_1X16,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_VYUY,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_VYUY,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_VYUY8_1X16,
> > > > > > -     },
> > > > > > -     /* RGB */
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_RGB565,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_RGB565_2X8_LE,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_RGB565X,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_RGB565_2X8_BE,
> > > > > > -     },
> > > > > > -     /* Bayer */
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SBGGR8,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SBGGR8_1X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SGBRG8,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SGBRG8_1X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SGRBG8,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SGRBG8_1X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SRGGB8,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SRGGB8_1X8,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SBGGR10,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SBGGR10_1X10,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SGBRG10,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SGBRG10_1X10,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SGRBG10,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SRGGB10,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SRGGB10_1X10,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SBGGR12,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SBGGR12_1X12,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SGBRG12,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SGBRG12_1X12,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SGRBG12,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SGRBG12_1X12,
> > > > > > -     },
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_SRGGB12,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_SRGGB12_1X12,
> > > > > > -     },
> > > > > > -     /* Compressed */
> > > > > > -     {
> > > > > > -             .pixelformat    = V4L2_PIX_FMT_JPEG,
> > > > > > -             .mbus_code      = MEDIA_BUS_FMT_JPEG_1X8,
> > > > > > -     },
> > > > > > -};
> > > > > > -
> > > > > >
> > > > > >  static bool sun6i_csi_capture_format_match(u32 pixelformat, u32
> > > > > >  mbus_code)
> > > > > >  {
> > > > > >
> > > > > > -     unsigned int i;
> > > > > > -
> > > > > > -     for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++)  {
> > > > > > -             const struct sun6i_csi_capture_format_match *match =
> > > > > > -                     &sun6i_csi_capture_format_matches[i];
> > > > > > -
> > > > > > -             if (match->pixelformat == pixelformat &&
> > > > > > -                 match->mbus_code == mbus_code)
> > > > > > -                     return true;
> > > > > > +     unsigned int i, j;
> > > > > > +
> > > > > > +     for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> > > > > > +             const struct sun6i_csi_capture_format *format =
> > > > > > +                     &sun6i_csi_capture_formats[i];
> > > > > > +
> > > > > > +             if (format->pixelformat == pixelformat) {
> > > > > > +                     for (j = 0; format->mbus_codes[j]; j++) {
> > > > > > +                             if (mbus_code == format->mbus_codes[j])
> > > > > > +                                     return true;
> > > > > > +                     }
> > > > > > +             }
> > > > > >
> > > > > >       }
> > > > > >
> > > > > >       return false;
> > > > > >
> > > > > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h index
> > > > > > 3ee5ccefbd10..0484942834e3 100644
> > > > > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > > @@ -27,11 +27,7 @@ struct sun6i_csi_capture_format {
> > > > > >
> > > > > >       bool    input_yuv_seq_invert;
> > > > > >       bool    input_format_raw;
> > > > > >       u32     hsize_len_factor;
> > > > > >
> > > > > > -};
> > > > > > -
> > > > > > -struct sun6i_csi_capture_format_match {
> > > > > > -     u32     pixelformat;
> > > > > > -     u32     mbus_code;
> > > > > > +     const u32 *mbus_codes;
> > > > > >
> > > > > >  };
> > > > > >
> > > > > >  #undef current
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
> --
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
