Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61CF24B2509
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 12:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245249AbiBKL6a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 06:58:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbiBKL62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 06:58:28 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A88CF50;
        Fri, 11 Feb 2022 03:58:24 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 343BB240008;
        Fri, 11 Feb 2022 11:58:20 +0000 (UTC)
Date:   Fri, 11 Feb 2022 12:59:27 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jacopo+renesas@jmondi.org,
        hverkuil-cisco@xs4all.nl, Nicolas.Ferre@microchip.com,
        sakari.ailus@iki.fi, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 07/11] media: atmel: atmel-isc: change format
 propagation to subdev into only verification
Message-ID: <20220211115927.ij4247iyw7gpt33q@uno.localdomain>
References: <20220121131416.603972-1-eugen.hristev@microchip.com>
 <20220121131416.603972-8-eugen.hristev@microchip.com>
 <20220210184309.5ifihhnb4qmahdy5@uno.localdomain>
 <eaa95c78-9f11-31f5-4426-e09110c385f4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eaa95c78-9f11-31f5-4426-e09110c385f4@microchip.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Fri, Feb 11, 2022 at 10:38:56AM +0000, Eugen.Hristev@microchip.com wrote:
> On 2/10/22 8:43 PM, Jacopo Mondi wrote:
> > Hi Eugen
> >
> > On Fri, Jan 21, 2022 at 03:14:12PM +0200, Eugen Hristev wrote:
> >> As a top MC video driver, the atmel-isc should not propagate the format to the
> >> subdevice.
> >> It should rather check at start_streaming() time if the subdev is properly
> >> configured with a compatible format.
> >> Removed the whole format finding logic, and reworked the format verification
> >> at start_streaming time, such that the ISC will return an error if the subdevice
> >> is not properly configured. To achieve this, media_pipeline_start
> >> is called and a link_validate callback is created to check the formats.
> >> With this being done, the module parameter 'sensor_preferred' makes no sense
> >> anymore. The ISC should not decide which format the sensor is using. The
> >> ISC should only cope with the situation and inform userspace if the streaming
> >> is possible in the current configuration.
> >
> > This sounds right!
> >
> >> The redesign of the format propagation has also risen the question of the
> >> enumfmt callback. If enumfmt is called with an mbus_code, the enumfmt handler
> >> should only return the formats that are supported for this mbus_code.
> >> To make it more easy to understand the formats, changed the report order
> >> to report first the native formats, and after that the formats that the ISC
> >> can convert to.
> >>
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >> ---
> >> Changes in v4:
> >> - moved validation code into link_validate and used media_pipeline_start
> >> - merged this patch with the enum_fmt patch which was previously in v3 of
> >> the series
> >>
> >> Changes in v3:
> >> - clamp to maximum resolution once the frame size from the subdev is found
> >>
> >>   drivers/media/platform/atmel/atmel-isc-base.c | 335 ++++++++++--------
> >>   .../media/platform/atmel/atmel-isc-scaler.c   |   5 +
> >>   drivers/media/platform/atmel/atmel-isc.h      |   3 +
> >>   3 files changed, 191 insertions(+), 152 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> >> index f7a88399bd54..31c79313aadc 100644
> >> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> >> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> >> @@ -36,11 +36,6 @@ static unsigned int debug;
> >>   module_param(debug, int, 0644);
> >>   MODULE_PARM_DESC(debug, "debug level (0-2)");
> >>
> >> -static unsigned int sensor_preferred = 1;
> >> -module_param(sensor_preferred, uint, 0644);
> >> -MODULE_PARM_DESC(sensor_preferred,
> >> -              "Sensor is preferred to output the specified format (1-on 0-off), default 1");
> >> -
> >>   #define ISC_IS_FORMAT_RAW(mbus_code) \
> >>        (((mbus_code) & 0xf000) == 0x3000)
> >>
> >> @@ -337,6 +332,10 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >>        unsigned long flags;
> >>        int ret;
> >>
> >> +     ret = media_pipeline_start(&isc->video_dev.entity, &isc->mpipe);
> >> +     if (ret)
> >> +             goto err_pipeline_start;
> >> +
> >>        /* Enable stream on the sub device */
> >>        ret = v4l2_subdev_call(isc->current_subdev->sd, video, s_stream, 1);
> >>        if (ret && ret != -ENOIOCTLCMD) {
> >> @@ -384,6 +383,9 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >>        v4l2_subdev_call(isc->current_subdev->sd, video, s_stream, 0);
> >>
> >>   err_start_stream:
> >> +     media_pipeline_stop(&isc->video_dev.entity);
> >> +
> >> +err_pipeline_start:
> >>        spin_lock_irqsave(&isc->dma_queue_lock, flags);
> >>        list_for_each_entry(buf, &isc->dma_queue, list)
> >>                vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
> >> @@ -420,6 +422,9 @@ static void isc_stop_streaming(struct vb2_queue *vq)
> >>        if (ret && ret != -ENOIOCTLCMD)
> >>                v4l2_err(&isc->v4l2_dev, "stream off failed in subdev\n");
> >>
> >> +     /* Stop media pipeline */
> >> +     media_pipeline_stop(&isc->video_dev.entity);
> >> +
> >>        /* Release all active buffers */
> >>        spin_lock_irqsave(&isc->dma_queue_lock, flags);
> >>        if (unlikely(isc->cur_frm)) {
> >> @@ -496,21 +501,56 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
> >>        u32 index = f->index;
> >>        u32 i, supported_index;
> >>
> >> -     if (index < isc->controller_formats_size) {
> >> -             f->pixelformat = isc->controller_formats[index].fourcc;
> >> -             return 0;
> >> +     supported_index = 0;
> >> +
> >> +     for (i = 0; i < isc->formats_list_size; i++) {
> >> +             if (!isc->formats_list[i].sd_support)
> >> +                     continue;
> >
> > Sorry to ask again about sd_support, but if the ISC formats
> > enumeration is not constrained to a specific mbus_code, shouldn't all
> > the formats be enumerated regardless if they're supported from the
> > sensor or not ?
>
> Yes. this slipped a little. I have to rework a bit the format reporting
> to user space.
>
> >
> >> +             /*
> >> +              * If specific mbus_code is requested, provide only
> >> +              * supported formats with this mbus code
> >> +              */
> >> +             if (f->mbus_code && f->mbus_code !=
> >> +                 isc->formats_list[i].mbus_code)
> >
> > nit: for clarity
> >                  if (f->mbus_code &&
> >                      f->mbus_code != isc->formats_list[i].mbus_code)
> >
> >> +                     continue;
> >> +             if (supported_index == index) {
> >> +                     f->pixelformat = isc->formats_list[i].fourcc;
> >> +                     return 0;
> >> +             }
> >> +             supported_index++;
> >>        }
> >>
> >> -     index -= isc->controller_formats_size;
> >> +     /*
> >> +      * If the sensor does not support this mbus_code whatsoever,
> >> +      * there is no reason to advertise any of our output formats
> >> +      */
> >> +     if (supported_index == 0)
> >> +             return -EINVAL;
> >>
> >> +     /*
> >> +      * If the sensor uses a format that is not raw, then we cannot
> >> +      * convert it to any of the formats that we usually can with a
> >> +      * RAW sensor. Thus, do not advertise them.
> >> +      */
> >> +     if (isc->config.sd_format &&
> >> +         !ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
> >> +             return -EINVAL;
> >> +
> >> +     /*
> >> +      * Iterate again through the formats that we can convert to.
> >> +      * However, to avoid duplicates, skip the formats that
> >> +      * the sensor already supports directly
> >> +      */
> >> +     index -= supported_index;
> >>        supported_index = 0;
> >>
> >> -     for (i = 0; i < isc->formats_list_size; i++) {
> >> -             if (!ISC_IS_FORMAT_RAW(isc->formats_list[i].mbus_code) ||
> >> -                 !isc->formats_list[i].sd_support)
> >> +     for (i = 0; i < isc->controller_formats_size; i++) {
> >> +             /* if this format is already supported by sensor, skip it */
> >> +             if (find_format_by_fourcc(isc, isc->controller_formats[i].fourcc))
> >>                        continue;
> >>                if (supported_index == index) {
> >> -                     f->pixelformat = isc->formats_list[i].fourcc;
> >> +                     f->pixelformat =
> >> +                             isc->controller_formats[i].fourcc;
> >
> > I trust this last part to work correctly, as it's not 100% clear to me :)
> >
>
> I think I will remove this and just report all the formats to userspace.
> Let libcamera handle this ;)
>

I think so, the driver will be greatly simplified with this change.

> >>                        return 0;
> >>                }
> >>                supported_index++;
> >> @@ -581,20 +621,30 @@ static int isc_try_validate_formats(struct isc_device *isc)
> >>                break;
> >>        default:
> >>        /* any other different formats are not supported */
> >> +             v4l2_err(&isc->v4l2_dev, "Requested unsupported format.\n");
> >>                ret = -EINVAL;
> >>        }
> >>        v4l2_dbg(1, debug, &isc->v4l2_dev,
> >>                 "Format validation, requested rgb=%u, yuv=%u, grey=%u, bayer=%u\n",
> >>                 rgb, yuv, grey, bayer);
> >>
> >> -     /* we cannot output RAW if we do not receive RAW */
> >> -     if ((bayer) && !ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code))
> >> +     if ((bayer) &&
> >
> > just 'bayer' ?
>
> not sure what you mean ?
> Have to check if we can output raw bayer , and we can only do that if we
> receive raw bayer from the sensor.
>

I just meant that you could remove () from (bayer) ?

Sorry for not being clear :)

> >
> >> +         !ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
> >> +             v4l2_err(&isc->v4l2_dev, "Cannot output RAW if we do not receive RAW.\n");
> >>                return -EINVAL;
> >> +     }
> >>
> >> -     /* we cannot output GREY if we do not receive RAW/GREY */
> >>        if (grey && !ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code) &&
> >> -         !ISC_IS_FORMAT_GREY(isc->try_config.sd_format->mbus_code))
> >> +         !ISC_IS_FORMAT_GREY(isc->try_config.sd_format->mbus_code)) {
> >> +             v4l2_err(&isc->v4l2_dev, "Cannot output GREY if we do not receive RAW/GREY.\n");
> >> +             return -EINVAL;
> >> +     }
> >> +
> >> +     if ((rgb || bayer || yuv) &&
> >> +         ISC_IS_FORMAT_GREY(isc->try_config.sd_format->mbus_code)) {
> >> +             v4l2_err(&isc->v4l2_dev, "Cannot convert GREY to another format.\n");
> >>                return -EINVAL;
> >> +     }
> >>
> >>        return ret;
> >>   }
> >> @@ -822,7 +872,7 @@ static void isc_try_fse(struct isc_device *isc,
> >>         * If we do not know yet which format the subdev is using, we cannot
> >>         * do anything.
> >>         */
> >> -     if (!isc->try_config.sd_format)
> >> +     if (!isc->config.sd_format)
> >>                return;
> >>
> >>        fse.code = isc->try_config.sd_format->mbus_code;
> >> @@ -843,180 +893,141 @@ static void isc_try_fse(struct isc_device *isc,
> >>        }
> >>   }
> >>
> >> -static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
> >> -                     u32 *code)
> >> +static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
> >>   {
> >> -     int i;
> >> -     struct isc_format *sd_fmt = NULL, *direct_fmt = NULL;
> >>        struct v4l2_pix_format *pixfmt = &f->fmt.pix;
> >> -     struct v4l2_subdev_pad_config pad_cfg = {};
> >> -     struct v4l2_subdev_state pad_state = {
> >> -             .pads = &pad_cfg
> >> -             };
> >> -     struct v4l2_subdev_format format = {
> >> -             .which = V4L2_SUBDEV_FORMAT_TRY,
> >> -     };
> >> -     u32 mbus_code;
> >> -     int ret;
> >> -     bool rlp_dma_direct_dump = false;
> >> +     unsigned int i;
> >>
> >>        if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> >>                return -EINVAL;
> >>
> >> -     /* Step 1: find a RAW format that is supported */
> >> -     for (i = 0; i < isc->num_user_formats; i++) {
> >> -             if (ISC_IS_FORMAT_RAW(isc->user_formats[i]->mbus_code)) {
> >> -                     sd_fmt = isc->user_formats[i];
> >> +     isc->try_config.fourcc = isc->user_formats[0]->fourcc;
> >> +
> >> +     /* find if the format requested is supported */
> >> +     for (i = 0; i < isc->controller_formats_size; i++)
> >> +             if (isc->controller_formats[i].fourcc == pixfmt->pixelformat) {
> >> +                     isc->try_config.fourcc = pixfmt->pixelformat;
> >>                        break;
> >>                }
> >> -     }
> >> -     /* Step 2: We can continue with this RAW format, or we can look
> >> -      * for better: maybe sensor supports directly what we need.
> >> -      */
> >> -     direct_fmt = find_format_by_fourcc(isc, pixfmt->pixelformat);
> >> -
> >> -     /* Step 3: We have both. We decide given the module parameter which
> >> -      * one to use.
> >> -      */
> >> -     if (direct_fmt && sd_fmt && sensor_preferred)
> >> -             sd_fmt = direct_fmt;
> >> -
> >> -     /* Step 4: we do not have RAW but we have a direct format. Use it. */
> >> -     if (direct_fmt && !sd_fmt)
> >> -             sd_fmt = direct_fmt;
> >> -
> >> -     /* Step 5: if we are using a direct format, we need to package
> >> -      * everything as 8 bit data and just dump it
> >> -      */
> >> -     if (sd_fmt == direct_fmt)
> >> -             rlp_dma_direct_dump = true;
> >> -
> >> -     /* Step 6: We have no format. This can happen if the userspace
> >> -      * requests some weird/invalid format.
> >> -      * In this case, default to whatever we have
> >> -      */
> >> -     if (!sd_fmt && !direct_fmt) {
> >> -             sd_fmt = isc->user_formats[isc->num_user_formats - 1];
> >> -             v4l2_dbg(1, debug, &isc->v4l2_dev,
> >> -                      "Sensor not supporting %.4s, using %.4s\n",
> >> -                      (char *)&pixfmt->pixelformat, (char *)&sd_fmt->fourcc);
> >> -     }
> >> -
> >> -     if (!sd_fmt) {
> >> -             ret = -EINVAL;
> >> -             goto isc_try_fmt_err;
> >> -     }
> >> -
> >> -     /* Step 7: Print out what we decided for debugging */
> >> -     v4l2_dbg(1, debug, &isc->v4l2_dev,
> >> -              "Preferring to have sensor using format %.4s\n",
> >> -              (char *)&sd_fmt->fourcc);
> >> -
> >> -     /* Step 8: at this moment we decided which format the subdev will use */
> >> -     isc->try_config.sd_format = sd_fmt;
> >> -
> >> -     /* Limit to Atmel ISC hardware capabilities */
> >> -     if (pixfmt->width > isc->max_width)
> >> -             pixfmt->width = isc->max_width;
> >> -     if (pixfmt->height > isc->max_height)
> >> -             pixfmt->height = isc->max_height;
> >> -
> >> -     /*
> >> -      * The mbus format is the one the subdev outputs.
> >> -      * The pixels will be transferred in this format Sensor -> ISC
> >> -      */
> >> -     mbus_code = sd_fmt->mbus_code;
> >> -
> >> -     /*
> >> -      * Validate formats. If the required format is not OK, default to raw.
> >> -      */
> >> -
> >> -     isc->try_config.fourcc = pixfmt->pixelformat;
> >> -
> >> -     if (isc_try_validate_formats(isc)) {
> >> -             pixfmt->pixelformat = isc->try_config.fourcc = sd_fmt->fourcc;
> >> -             /* Re-try to validate the new format */
> >> -             ret = isc_try_validate_formats(isc);
> >> -             if (ret)
> >> -                     goto isc_try_fmt_err;
> >> -     }
> >> -
> >> -     ret = isc_try_configure_rlp_dma(isc, rlp_dma_direct_dump);
> >> -     if (ret)
> >> -             goto isc_try_fmt_err;
> >> -
> >> -     ret = isc_try_configure_pipeline(isc);
> >> -     if (ret)
> >> -             goto isc_try_fmt_err;
> >>
> >> -     /* Obtain frame sizes if possible to have crop requirements ready */
> >> -     isc_try_fse(isc, &pad_state);
> >> -
> >> -     v4l2_fill_mbus_format(&format.format, pixfmt, mbus_code);
> >> -     ret = v4l2_subdev_call(isc->current_subdev->sd, pad, set_fmt,
> >> -                            &pad_state, &format);
> >> -     if (ret < 0)
> >> -             goto isc_try_fmt_subdev_err;
> >> +     /* If we did not find the requested format, we will fallback here */
> >> +     pixfmt->pixelformat = isc->try_config.fourcc;
> >> +     pixfmt->colorspace = V4L2_COLORSPACE_SRGB;
> >> +     pixfmt->field = V4L2_FIELD_NONE;
> >>
> >> -     v4l2_fill_pix_format(pixfmt, &format.format);
> >> +     isc_try_configure_rlp_dma(isc, false);
> >>
> >>        /* Limit to Atmel ISC hardware capabilities */
> >> -     if (pixfmt->width > isc->max_width)
> >> -             pixfmt->width = isc->max_width;
> >> -     if (pixfmt->height > isc->max_height)
> >> -             pixfmt->height = isc->max_height;
> >> +     v4l_bound_align_image(&pixfmt->width, 16, isc->max_width, 0,
> >> +                           &pixfmt->height, 16, isc->max_height, 0, 0);
> >>
> >>        pixfmt->field = V4L2_FIELD_NONE;
> >>        pixfmt->bytesperline = (pixfmt->width * isc->try_config.bpp_v4l2) >> 3;
> >>        pixfmt->sizeimage = ((pixfmt->width * isc->try_config.bpp) >> 3) *
> >>                             pixfmt->height;
> >
> > Seems pixfmt->field is set twice.
> >
> > Could you move the assignment of all pixfmt to a single block ?
>
> okay
> >
> >>
> >> -     if (code)
> >> -             *code = mbus_code;
> >> +     isc->try_fmt = *f;
> >>
> >>        return 0;
> >> +}
> >>
> >> -isc_try_fmt_err:
> >> -     v4l2_err(&isc->v4l2_dev, "Could not find any possible format for a working pipeline\n");
> >> -isc_try_fmt_subdev_err:
> >> -     memset(&isc->try_config, 0, sizeof(isc->try_config));
> >> +static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
> >> +{
> >> +     isc_try_fmt(isc, f);
> >>
> >> -     return ret;
> >> +     /* make the try configuration active */
> >> +     isc->config = isc->try_config;
> >> +     isc->fmt = isc->try_fmt;
> >> +
> >> +     v4l2_dbg(1, debug, &isc->v4l2_dev, "ISC set_fmt to %.4s @%dx%d\n",
> >> +              (char *)&f->fmt.pix.pixelformat,
> >> +              f->fmt.pix.width, f->fmt.pix.height);
> >> +
> >> +     return 0;
> >>   }
> >>
> >> -static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
> >> +static int isc_validate(struct isc_device *isc)
> >>   {
> >> +     int ret;
> >> +     int i;
> >> +     struct isc_format *sd_fmt = NULL;
> >> +     struct v4l2_pix_format *pixfmt = &isc->fmt.fmt.pix;
> >>        struct v4l2_subdev_format format = {
> >>                .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >> +             .pad = isc->remote_pad,
> >> +     };
> >> +     struct v4l2_subdev_pad_config pad_cfg = {};
> >> +     struct v4l2_subdev_state pad_state = {
> >> +             .pads = &pad_cfg,
> >>        };
> >> -     u32 mbus_code = 0;
> >> -     int ret;
> >>
> >> -     ret = isc_try_fmt(isc, f, &mbus_code);
> >> +     /* Get current format from subdev */
> >> +     ret = v4l2_subdev_call(isc->current_subdev->sd, pad, get_fmt, NULL,
> >> +                            &format);
> >>        if (ret)
> >>                return ret;
> >>
> >> -     v4l2_fill_mbus_format(&format.format, &f->fmt.pix, mbus_code);
> >> -     ret = v4l2_subdev_call(isc->current_subdev->sd, pad,
> >> -                            set_fmt, NULL, &format);
> >> -     if (ret < 0)
> >> -             return ret;
> >> +     /* Identify the subdev's format configuration */
> >> +     for (i = 0; i < isc->num_user_formats; i++)
> >> +             if (isc->user_formats[i]->mbus_code == format.format.code) {
> >> +                     sd_fmt = isc->user_formats[i];
> >> +                     break;
> >> +             }
> >> +
> >> +     /* Check if the format is not supported */
> >> +     if (!sd_fmt) {
> >> +             v4l2_err(&isc->v4l2_dev,
> >> +                      "Current subdevice is streaming a media bus code that is not supported 0x%x\n",
> >> +                      format.format.code);
> >> +             return -EPIPE;
> >> +     }
> >> +
> >> +     /* At this moment we know which format the subdev will use */
> >> +     isc->try_config.sd_format = sd_fmt;
> >> +
> >> +     /* If the sensor is not RAW, we can only do a direct dump */
> >> +     if (!ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code))
> >> +             isc_try_configure_rlp_dma(isc, true);
> >>
> >>        /* Limit to Atmel ISC hardware capabilities */
> >> -     if (f->fmt.pix.width > isc->max_width)
> >> -             f->fmt.pix.width = isc->max_width;
> >> -     if (f->fmt.pix.height > isc->max_height)
> >> -             f->fmt.pix.height = isc->max_height;
> >> +     v4l_bound_align_image(&format.format.width, 16, isc->max_width, 0,
> >> +                           &format.format.height, 16, isc->max_height, 0, 0);
> >> +
> >> +     /* Check if the frame size is the same. Otherwise we may overflow */
> >> +     if (pixfmt->height != format.format.height ||
> >> +         pixfmt->width != format.format.width) {
> >> +             v4l2_err(&isc->v4l2_dev,
> >> +                      "ISC not configured with the proper frame size: %dx%d\n",
> >> +                      format.format.width, format.format.height);
> >> +             return -EPIPE;
> >> +     }
> >>
> >> -     isc->fmt = *f;
> >> +     v4l2_dbg(1, debug, &isc->v4l2_dev,
> >> +              "Identified subdev using format %.4s with %dx%d %d bpp\n",
> >> +              (char *)&sd_fmt->fourcc, pixfmt->width, pixfmt->height,
> >> +              isc->try_config.bpp);
> >>
> >> +     /* Reset and restart AWB if the subdevice changed the format */
> >>        if (isc->try_config.sd_format && isc->config.sd_format &&
> >>            isc->try_config.sd_format != isc->config.sd_format) {
> >>                isc->ctrls.hist_stat = HIST_INIT;
> >>                isc_reset_awb_ctrls(isc);
> >>                isc_update_v4l2_ctrls(isc);
> >>        }
> >> -     /* make the try configuration active */
> >> +
> >> +     /* Validate formats */
> >> +     ret = isc_try_validate_formats(isc);
> >> +     if (ret)
> >> +             return ret;
> >> +
> >> +     /* Obtain frame sizes if possible to have crop requirements ready */
> >> +     isc_try_fse(isc, &pad_state);
> >> +
> >> +     /* Configure ISC pipeline for the config */
> >> +     ret = isc_try_configure_pipeline(isc);
> >> +     if (ret)
> >> +             return ret;
> >> +
> >>        isc->config = isc->try_config;
> >>
> >>        v4l2_dbg(1, debug, &isc->v4l2_dev, "New ISC configuration in place\n");
> >> @@ -1040,7 +1051,7 @@ static int isc_try_fmt_vid_cap(struct file *file, void *priv,
> >>   {
> >>        struct isc_device *isc = video_drvdata(file);
> >>
> >> -     return isc_try_fmt(isc, f, NULL);
> >> +     return isc_try_fmt(isc, f);
> >>   }
> >>
> >>   static int isc_enum_input(struct file *file, void *priv,
> >> @@ -1841,7 +1852,7 @@ static int isc_set_default_fmt(struct isc_device *isc)
> >>        };
> >>        int ret;
> >>
> >> -     ret = isc_try_fmt(isc, &f, NULL);
> >> +     ret = isc_try_fmt(isc, &f);
> >>        if (ret)
> >>                return ret;
> >>
> >> @@ -2015,6 +2026,24 @@ int isc_pipeline_init(struct isc_device *isc)
> >>   }
> >>   EXPORT_SYMBOL_GPL(isc_pipeline_init);
> >>
> >> +int isc_link_validate(struct media_link *link)
> >> +{
> >> +     struct video_device *vdev =
> >> +             media_entity_to_video_device(link->sink->entity);
> >> +     struct isc_device *isc = video_get_drvdata(vdev);
> >> +     int ret;
> >> +
> >> +     ret = v4l2_subdev_link_validate(link);
> >> +     if (ret)
> >> +             return ret;
> >
> > Doesn't v4l2_subdev_link_validate() call
> > v4l2_subdev_link_validate_default() if you don't define a .link_validate()
> > pad operation ? v4l2_subdev_link_validate_default() compares format
> > and sizes of both ends to the links and want them to be identical,
> > something that defeat the purpose of your custom isc_validate() ?
>
> I think so. However if I replace the validate call with my custom one, I
> thought that the old default should be called as well.
>

I was actually suggesting to remove the call to
v4l2_subdev_link_validate() completely as I thought you were
performing the same checks in your custom validate. If you're not
please ignore this comment, and even if you are my comment is wrong,
as I should have suggested you to remove the duplicated code and let
the framework do that :)


> Meaning, that maybe my custom validation does certain isc-related
> checks, while the v4l2_subdev_link_validate does exactly what you said.
> So, by defining a custom link_validate, do I lose the checks that are
> done by the v4l2_subdev_link_validate ?
> That's what I wanted to avoid. Chip in my checks, but keep the v4l2
> standard validation in place.
>
> Does that make sense ?

Absolutely, sorry for bothering and if the pipeline validation works
please go ahead with what you have!

Thanks
  j

>
> > Thanks
> >    j
> >
> >> +
> >> +     return isc_validate(isc);
> >> +}
> >> +
> >> +static const struct media_entity_operations isc_entity_operations = {
> >> +     .link_validate = isc_link_validate,
> >> +};
> >> +
> > };
> >>   int isc_mc_init(struct isc_device *isc, u32 ver)
> >>   {
> >>        const struct of_device_id *match;
> >> @@ -2022,6 +2051,8 @@ int isc_mc_init(struct isc_device *isc, u32 ver)
> >>
> >>        isc->video_dev.entity.function = MEDIA_ENT_F_IO_V4L;
> >>        isc->video_dev.entity.flags = MEDIA_ENT_FL_DEFAULT;
> >> +     isc->video_dev.entity.ops = &isc_entity_operations;
> >> +
> >>        isc->pads[ISC_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> >>
> >>        ret = media_entity_pads_init(&isc->video_dev.entity, ISC_PADS_NUM,
> >> diff --git a/drivers/media/platform/atmel/atmel-isc-scaler.c b/drivers/media/platform/atmel/atmel-isc-scaler.c
> >> index ec95c9665883..93375a61aea6 100644
> >> --- a/drivers/media/platform/atmel/atmel-isc-scaler.c
> >> +++ b/drivers/media/platform/atmel/atmel-isc-scaler.c
> >> @@ -155,6 +155,10 @@ static const struct v4l2_subdev_pad_ops isc_scaler_pad_ops = {
> >>        .init_cfg = isc_scaler_init_cfg,
> >>   };
> >>
> >> +static const struct media_entity_operations isc_scaler_entity_ops = {
> >> +     .link_validate = v4l2_subdev_link_validate,
> >> +};
> >> +
> >>   static const struct v4l2_subdev_ops xisc_scaler_subdev_ops = {
> >>        .pad = &isc_scaler_pad_ops,
> >>   };
> >> @@ -172,6 +176,7 @@ int isc_scaler_init(struct isc_device *isc)
> >>
> >>        isc->scaler_sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >>        isc->scaler_sd.entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> >> +     isc->scaler_sd.entity.ops = &isc_scaler_entity_ops;
> >>        isc->scaler_pads[ISC_SCALER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> >>        isc->scaler_pads[ISC_SCALER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> >>
> >> diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> >> index 04ea5e340808..e36cf9d3942a 100644
> >> --- a/drivers/media/platform/atmel/atmel-isc.h
> >> +++ b/drivers/media/platform/atmel/atmel-isc.h
> >> @@ -270,6 +270,7 @@ enum isc_scaler_pads {
> >>    * @formats_list_size:       size of formats_list array
> >>    * @pads:            media controller pads for isc video entity
> >>    * @mdev:            media device that is registered by the isc
> >> + * @mpipe:           media device pipeline used by the isc
> >>    * @remote_pad:              remote pad on the connected subdevice
> >>    * @scaler_sd:               subdevice for the scaler that isc registers
> >>    * @scaler_pads:     media controller pads for the scaler subdevice
> >> @@ -295,6 +296,7 @@ struct isc_device {
> >>        struct completion       comp;
> >>
> >>        struct v4l2_format      fmt;
> >> +     struct v4l2_format      try_fmt;
> >>        struct isc_format       **user_formats;
> >>        unsigned int            num_user_formats;
> >>
> >> @@ -366,6 +368,7 @@ struct isc_device {
> >>        struct {
> >>                struct media_pad                pads[ISC_PADS_NUM];
> >>                struct media_device             mdev;
> >> +             struct media_pipeline           mpipe;
> >>
> >>                u32                             remote_pad;
> >>        };
> >> --
> >> 2.25.1
> >>
>
