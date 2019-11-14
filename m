Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A724FBF5F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfKNFVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:21:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44222 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfKNFVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:21:40 -0500
Received: from [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a] (unknown [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C32CE28DB2B;
        Thu, 14 Nov 2019 05:21:32 +0000 (GMT)
Subject: Re: [PATCH v4] media: vimc: Implement get/set selection in sink
To:     Guilherme Alcarde Gallo <gagallo7@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        pedro@terraco.de
References: <20191108024509.13067-1-gagallo7@gmail.com>
 <012e37dc-a307-9e77-2973-e17d2abe4b2d@xs4all.nl>
 <CAF2jNbiDNDUJi2hNoy+XL6=ziUhmw1qGjOCc+4y8VYkP=gYy1g@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 mQINBFmOMD4BEADb2nC8Oeyvklh+ataw2u/3mrl+hIHL4WSWtii4VxCapl9+zILuxFDrxw1p
 XgF3cfx7g9taWBrmLE9VEPwJA6MxaVnQuDL3GXxTxO/gqnOFgT3jT+skAt6qMvoWnhgurMGH
 wRaA3dO4cFrDlLsZIdDywTYcy7V2bou81ItR5Ed6c5UVX7uTTzeiD/tUi8oIf0XN4takyFuV
 Rf09nOhi24bn9fFN5xWHJooFaFf/k2Y+5UTkofANUp8nn4jhBUrIr6glOtmE0VT4pZMMLT63
 hyRB+/s7b1zkOofUGW5LxUg+wqJXZcOAvjocqSq3VVHcgyxdm+Nv0g9Hdqo8bQHC2KBK86VK
 vB+R7tfv7NxVhG1sTW3CQ4gZb0ZugIWS32Mnr+V+0pxci7QpV3jrtVp5W2GA5HlXkOyC6C7H
 Ao7YhogtvFehnlUdG8NrkC3HhCTF8+nb08yGMVI4mMZ9v/KoIXKC6vT0Ykz434ed9Oc9pDow
 VUqaKi3ey96QczfE4NI029bmtCY4b5fucaB/aVqWYRH98Jh8oIQVwbt+pY7cL5PxS7dQ/Zuz
 6yheqDsUGLev1O3E4R8RZ8jPcfCermL0txvoXXIA56t4ZjuHVcWEe2ERhLHFGq5Zw7KC6u12
 kJoiZ6WDBYo4Dp+Gd7a81/WsA33Po0j3tk/8BWoiJCrjXzhtRwARAQABtCdIZWxlbiBLb2lr
 ZSA8aGVsZW4ua29pa2VAY29sbGFib3JhLmNvbT6JAlQEEwEKAD4CGwEFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSofQA6zrItXEgHWTzAfqwo9yFiXQUCXEz3bwUJBKaPRQAKCRDAfqwo
 9yFiXdUCD/4+WZr503hQ13KB4DijOW76ju8JDPp4p++qoPxtoAsld3yROoTI+VPWmt7ojHrr
 TZc7sTLxOFzaUC8HjGTb3r9ilIhIKf/M9KRLkpIJ+iLA+VoUbcSOMYWoVNfgLmbnqoezjPcy
 OHJwVw9dzEeYpvG6nkY6E4UktANySp27AniSXNuHOvYsOsXmUOqU1ScdsrQ9s732p/OGdTyw
 1yd3gUMLZvCKFOBVHILH59HCRJgpwUPiws8G4dGMs4GTRvHT2s2mDQdQ0HEvcM9rvCRVixuC
 5ZeOymZNi6lDIUIysgiZ+yzk6i5l/Ni6r7v20N3JppZvhPK6LqtaYceyAGyc3jjnOqoHT/qR
 kPjCwzmKiPtXjLw6HbRXtGgGtP5m3y8v6bfHH+66zd2vGCY0Z9EsqcnK4DCqRkLncFLPM2gn
 9cZcCmO4ZqXUhTyn1nHM494kd5NX1Op4HO+t9ErnpufkVjoMUeBwESdQwwwHT3rjUueGmCrn
 VJK69/qhA4La72VTxHutl+3Z0Xy20HWsZS8Gsam39f95/LtPLzbBwnOOi5ZoXnm97tF8HrAZ
 2h+kcRLMWw3BXy5q4gic+oFZMZP9oq1G9XTFld4FGgJ9ys8aGmhLM+uB1pFxb3XFtWQ2z4AJ
 iEp2VLl34quwfD6Gg4csiZe2KzvQHUe0w8SJ9LplrHPPprkCDQRZjjChARAAzISLQaHzaDOv
 ZxcoCNBk/hUGo2/gsmBW4KSj73pkStZ+pm3Yv2CRtOD4jBlycXjzhwBV7/70ZMH70/Y25dJa
 CnJKl/Y76dPPn2LDWrG/4EkqUzoJkhRIYFUTpkPdaVYznqLgsho19j7HpEbAum8r3jemYBE1
 AIuVGg4bqY3UkvuHWLVRMuaHZNy55aYwnUvd46E64JH7O990mr6t/nu2a1aJ0BDdi8HZ0RMo
 Eg76Avah+YR9fZrhDFmBQSL+mcCVWEbdiOzHmGYFoToqzM52wsNEpo2aStH9KLk8zrCXGx68
 ohJyQoALX4sS03RIWh1jFjnlw2FCbEdj/HDX0+U0i9COtanm54arYXiBTnAnx0F7LW7pv7sb
 6tKMxsMLmprP/nWyV5AfFRi3jxs5tdwtDDk/ny8WH6KWeLR/zWDwpYgnXLBCdg8l97xUoPQO
 0VkKSa4JEXUZWZx9q6kICzFGsuqApqf9gIFJZwUmirsxH80Fe04Tv+IqIAW7/djYpOqGjSyk
 oaEVNacwLLgZr+/j69/1ZwlbS8K+ChCtyBV4kEPzltSRZ4eU19v6sDND1JSTK9KSDtCcCcAt
 VGFlr4aE00AD/aOkHSylc93nPinBFO4AGhcs4WypZ3GGV6vGWCpJy9svfWsUDhSwI7GS/i/v
 UQ1+bswyYEY1Q3DjJqT7fXcAEQEAAYkEcgQYAQoAJgIbAhYhBKh9ADrOsi1cSAdZPMB+rCj3
 IWJdBQJcTPfVBQkEpo7hAkDBdCAEGQEKAB0WIQSomGMEg78Cd/pMshveCRfNeJ05lgUCWY4w
 oQAKCRDeCRfNeJ05lp0gD/49i95kPKjpgjUbYeidjaWuINXMCA171KyaBAp+Jp2Qrun4sIJB
 Z6srMj6O/gC34AhZln2sXeQdxe88sNbg6HjlN+4AkhTd6DttjOfUwnamLDA7uw+YIapGgsgN
 lznjLnqOaQ9mtEwRbZMUOdyRf9osSuL14vHl4ia3bYNJ52WYre6gLMu4K+Ghd02og+ILgIio
 Q827h0spqIJYHrR3Ynnhxdlv5GPCobh+AKsQMdTIuCzR6JSCBk6GHkg33SiWScKMUzT8B/cn
 ypLfGnfV/LDZ9wS2TMzIlK/uv0Vd4C0OGDd/GCi5Gwu/Ot0aY7fzZo2CiRV+/nJBWPRRBTji
 bE4FG2rt7WSRLO/QmH2meIW4f0USDiHeNwznHkPei59vRdlMyQdsxrmgSRDuX9Y3UkERxbgd
 uscqC8Cpcy5kpF11EW91J8aGpcxASc+5Pa66/+7CrpBC2DnfcfACdMAje7yeMn9XlHrqXNlQ
 GaglEcnGN2qVqRcKgcjJX+ur8l56BVpBPFYQYkYkIdQAuhlPylxOvsMcqI6VoEWNt0iFF3dA
 //0MNb8fEqw5TlxDPOt6BDhDKowkxOGIA9LOcF4PkaR9Qkvwo2P4vA/8fhCnMqlSPom4xYdk
 Ev8P554zDoL/XMHl+s7A0MjIJzT253ejZKlWeO68pAbNy/z7QRn2lFDnjwkQwH6sKPchYl2f
 0g//Yu3vDkqk8+mi2letP3XBl2hjv2eCZjTh34VvtgY5oeL2ROSJWNd18+7O6q3hECZ727EW
 gIb3LK9g4mKF6+Rch6Gwz1Y4fmC5554fd2Y2XbVzzz6AGUC6Y+ohNg7lTAVO4wu43+IyTB8u
 ip5rX/JDGFv7Y1sl6tQJKAVIKAJE+Z3Ncqh3doQr9wWHl0UiQYKbSR9HpH1lmC1C3EEbTpwK
 fUIpZd1eQNyNJl1jHsZZIBYFsAfVNH/u6lB1TU+9bSOsV5SepdIb88d0fm3oZ4KzjhRHLFQF
 RwNUNn3ha6x4fbxYcwbvu5ZCiiX6yRTPoage/LUNkgQNX2PtPcur6CdxK6Pqm8EAI7PmYLfN
 NY3y01XhKNRvaVZoH2FugfUkhsBITglTIpI+n6YU06nDAcbeINFo67TSE0iL6Pek5a6gUQQC
 6w+hJCaMr8KYud0q3ccHyU3TlAPDe10En3GsVz7Y5Sa3ODGdbmkfjK8Af3ogGNBVmpV16Xl8
 4rETFv7POSUB2eMtbpmBopd+wKqHCwUEy3fx1zDbM9mp+pcDoL73rRZmlgmNfW/4o4qBzxRf
 FYTQLE69wAFU2IFce9PjtUAlBdC+6r3X24h3uD+EC37s/vWhxuKj2glaU9ONrVJ/SPvlqXOO
 WR1Zqw57vHMKimLdG3c24l8PkSw1usudgAA5OyO5Ag0EWY4wyQEQAMVp0U38Le7d80Mu6AT+
 1dMes87iKn30TdMuLvSg2uYqJ1T2riRBF7zU6u74HF6zps0rPQviBXOgoSuKa1hnS6OwFb9x
 yQPlk76LY96SUB5jPWJ3fO78ZGSwkVbJFuG9gpD/41n8Unn1hXgDb2gUaxD0oXv/723EmTYC
 vSo3z6Y8A2aBQNr+PyhQAPDazvVQ+P7vnZYq1oK0w+D7aIix/Bp4mo4VbgAeAeMxXWSZs8N5
 NQtXeTBgB7DqrfJP5wWwgCsROfeds6EoddcYgqhG0zVU9E54C8JcPOA0wKVs+9+gt2eyRNtx
 0UhFbah7qXuJGhWy/0CLXvVoCoS+7qpWz070TBAlPZrg9D0o2gOw01trQgoKAYBKKgJhxaX/
 4gzi+5Ccm33LYH9lAVTdzdorejuV1xWdsnNyc8OAPeoXBf9RIIWfQVmbhVXBp2DAPjV6/kIJ
 Eml7MNJfEvqjV9zKsWF9AFlsqDWZDCyUdqR96ahTSD34pRwb6a9H99/GrjeowKaaL95DIVZT
 C6STvDNL6kpys4sOe2AMmQGv2MMcJB3aYLzH8f1sEQ9S0UMX7/6CifEG6JodG6Y/W/lLo1Vv
 DxeDA+u4Lgq6qxlksp8M78FjcmxFVlf4cpCi2ucbZxurhlBkjtZZ8MVAEde3hlqjcBl2Ah6Q
 D826FTxscOGlHEfNABEBAAGJAjwEGAEKACYCGwwWIQSofQA6zrItXEgHWTzAfqwo9yFiXQUC
 XEz31QUJBKaOuQAKCRDAfqwo9yFiXUvnEACBWe8wSnIvSX+9k4LxuLq6GQTOt+RNfliZQkCW
 5lT3KL1IJyzzOm4x+/slHRBl8bF7KEZyOPinXQXyJ/vgIdgSYxDqoZ7YZn3SvuNe4aT6kGwL
 EYYEV8Ecj4ets15FR2jSUNnVv5YHWtZ7bP/oUzr2LT54fjRcstYxgwzoj8AREtHQ4EJWAWCO
 ZuEHTSm5clMFoi41CmG4DlJbzbo4YfilKYm69vwh50Y8WebcRN31jh0g8ufjOJnBldYYBLwN
 Obymhlfy/HKBDIbyCGBuwYoAkoJ6LR/cqzl/FuhwhuDocCGlXyYaJOwXgHaCvVXI3PLQPxWZ
 +vPsD+TSVHc9m/YWrOiYDnZn6aO0Uk1Zv/m9+BBkWAwsreLJ/evn3SsJV1omNBTITG+uxXcf
 JkgmmesIAw8mpI6EeLmReUJLasz8QkzhZIC7t5rGlQI94GQG3Jg2dC+kpaGWOaT5G4FVMcBj
 iR1nXfMxENVYnM5ag7mBZyD/kru5W1Uj34L6AFaDMXFPwedSCpzzqUiHb0f+nYkfOodf5xy0
 46+3THy/NUS/ZZp/rI4F7Y77+MQPVg7vARfHHX1AxYUKfRVW5j88QUB70txn8Vgi1tDrOr4J
 eD+xr0CvIGa5lKqgQacQtGkpOpJ8zY4ObSvpNubey/qYUE3DCXD0n2Xxk4muTvqlkFpOYA==
Message-ID: <05b16afc-e2e6-eda2-41fe-05c6bb301c1c@collabora.com>
Date:   Thu, 14 Nov 2019 02:21:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAF2jNbiDNDUJi2hNoy+XL6=ziUhmw1qGjOCc+4y8VYkP=gYy1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/10/19 4:35 PM, Guilherme Alcarde Gallo wrote:
> Hi Hans,
> 
> Thanks for testing the compilation.
> 
> I didn't know that -Wunused-but-set-variable flag was not being
> employed in the default kernel compilation.

It is used if you compile with make W=1

For reference: https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-September/006969.html

Regards,
Helen

> 
> I just sent a v5 fixing this warning.
> This variable was unnecessary since vimc_sca_adjust_sink_crop function
> already creates an internal v4l2_rect to be adjusted to the crop
> region.
> 
> On Sat, Nov 9, 2019 at 8:50 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 11/8/19 3:45 AM, Guilherme Alcarde Gallo wrote:
>>> Add support for the sink pad of scaler subdevice to respond
>>> VIDIOC_G_SELECTION and VIDIOC_S_SELECTION ioctls with the following
>>> targets: V4L2_SEL_TGT_COMPOSE_BOUNDS and V4L2_SEL_TGT_CROP.
>>>
>>> * Add new const struct crop_rect_default to initialize subdev scaler
>>>   properly.
>>> * Make changes in sink pad format reflect to the crop rectangle. E.g.
>>>   changing the frame format to a smaller size one can make the former
>>>   crop rectangle selects a non existing frame area. To solve this
>>>   situation the crop rectangle is clamped to the frame boundaries.
>>> * Clamp crop rectangle respecting the sink bounds during set_selection
>>>   ioctl.
>>>
>>> Signed-off-by: Guilherme Alcarde Gallo <gagallo7@gmail.com>
>>> Co-developed-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
>>> Signed-off-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>>
>>> ---
>>> Changes in V4:
>>> * Revert an unnecessary change in headers include order.
>>> * Sort the declaration order for local variables in function by the size
>>>   descending.
>>>
>>> Changes in V3:
>>> * Sort the headers in alphabetical order.
>>> * Change all functions prefix to 'vimc_sca_'.
>>> * Remove useless case.
>>> * Change commit message subject.
>>>
>>> Changes in V2:
>>> * Use v4l2_rect_map_inside to clamp the crop rectangle.
>>> * Do the crop rectangle clamping after changing sink format.
>>> * Implement try ioctls for selection with CROP* targets.
>>> * Treat tiny rectangles with area smaller than minimal dimensions of
>>>   vimc frames.
>>> * Allow user to get selection when the streaming is on.
>>> * Reuse bound rectangle generation in a static function.
>>> * Disable get_selection for Source pads as we did before with
>>>   set_selection.
>>> ---
>>> ---
>>>  drivers/media/platform/vimc/vimc-scaler.c | 168 ++++++++++++++++++++--
>>>  1 file changed, 153 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>>> index 2f88a7d9d67b..36425cffc0ad 100644
>>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>>> @@ -8,6 +8,7 @@
>>>  #include <linux/moduleparam.h>
>>>  #include <linux/vmalloc.h>
>>>  #include <linux/v4l2-mediabus.h>
>>> +#include <media/v4l2-rect.h>
>>>  #include <media/v4l2-subdev.h>
>>>
>>>  #include "vimc-common.h"
>>> @@ -18,6 +19,9 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>>>
>>>  #define MAX_ZOOM     8
>>>
>>> +#define VIMC_SCA_FMT_WIDTH_DEFAULT  640
>>> +#define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
>>> +
>>>  struct vimc_sca_device {
>>>       struct vimc_ent_device ved;
>>>       struct v4l2_subdev sd;
>>> @@ -25,6 +29,7 @@ struct vimc_sca_device {
>>>        * with the width and hight multiplied by mult
>>>        */
>>>       struct v4l2_mbus_framefmt sink_fmt;
>>> +     struct v4l2_rect crop_rect;
>>>       /* Values calculated when the stream starts */
>>>       u8 *src_frame;
>>>       unsigned int src_line_size;
>>> @@ -33,22 +38,64 @@ struct vimc_sca_device {
>>>  };
>>>
>>>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
>>> -     .width = 640,
>>> -     .height = 480,
>>> +     .width = VIMC_SCA_FMT_WIDTH_DEFAULT,
>>> +     .height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
>>>       .code = MEDIA_BUS_FMT_RGB888_1X24,
>>>       .field = V4L2_FIELD_NONE,
>>>       .colorspace = V4L2_COLORSPACE_DEFAULT,
>>>  };
>>>
>>> +static const struct v4l2_rect crop_rect_default = {
>>> +     .width = VIMC_SCA_FMT_WIDTH_DEFAULT,
>>> +     .height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
>>> +     .top = 0,
>>> +     .left = 0,
>>> +};
>>> +
>>> +static const struct v4l2_rect crop_rect_min = {
>>> +     .width = VIMC_FRAME_MIN_WIDTH,
>>> +     .height = VIMC_FRAME_MIN_HEIGHT,
>>> +     .top = 0,
>>> +     .left = 0,
>>> +};
>>> +
>>> +static struct v4l2_rect
>>> +vimc_sca_get_crop_bound_sink(const struct v4l2_mbus_framefmt *sink_fmt)
>>> +{
>>> +     /* Get the crop bounds to clamp the crop rectangle correctly */
>>> +     struct v4l2_rect r = {
>>> +             .left = 0,
>>> +             .top = 0,
>>> +             .width = sink_fmt->width,
>>> +             .height = sink_fmt->height,
>>> +     };
>>> +     return r;
>>> +}
>>> +
>>> +static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
>>> +                                   const struct v4l2_mbus_framefmt *sink_fmt)
>>> +{
>>> +     const struct v4l2_rect sink_rect =
>>> +             vimc_sca_get_crop_bound_sink(sink_fmt);
>>> +
>>> +     /* Disallow rectangles smaller than the minimal one. */
>>> +     v4l2_rect_set_min_size(r, &crop_rect_min);
>>> +     v4l2_rect_map_inside(r, &sink_rect);
>>> +}
>>> +
>>>  static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>>>                            struct v4l2_subdev_pad_config *cfg)
>>>  {
>>>       struct v4l2_mbus_framefmt *mf;
>>> +     struct v4l2_rect *r;
>>>       unsigned int i;
>>>
>>>       mf = v4l2_subdev_get_try_format(sd, cfg, 0);
>>>       *mf = sink_fmt_default;
>>>
>>> +     r = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>> +     *r = crop_rect_default;
>>> +
>>>       for (i = 1; i < sd->entity.num_pads; i++) {
>>>               mf = v4l2_subdev_get_try_format(sd, cfg, i);
>>>               *mf = sink_fmt_default;
>>> @@ -107,16 +154,21 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>>>                           struct v4l2_subdev_format *format)
>>>  {
>>>       struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>> +     struct v4l2_rect *crop_rect;
>>>
>>>       /* Get the current sink format */
>>> -     format->format = (format->which == V4L2_SUBDEV_FORMAT_TRY) ?
>>> -                      *v4l2_subdev_get_try_format(sd, cfg, 0) :
>>> -                      vsca->sink_fmt;
>>> +     if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>>> +             format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
>>> +             crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>> +     } else {
>>> +             format->format = vsca->sink_fmt;
>>> +             crop_rect = &vsca->crop_rect;
>>> +     }
>>>
>>>       /* Scale the frame size for the source pad */
>>>       if (VIMC_IS_SRC(format->pad)) {
>>> -             format->format.width = vsca->sink_fmt.width * sca_mult;
>>> -             format->format.height = vsca->sink_fmt.height * sca_mult;
>>> +             format->format.width = crop_rect->width * sca_mult;
>>> +             format->format.height = crop_rect->height * sca_mult;
>>>       }
>>>
>>>       return 0;
>>> @@ -148,6 +200,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>>  {
>>>       struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>>       struct v4l2_mbus_framefmt *sink_fmt;
>>> +     struct v4l2_rect *crop_rect;
>>>
>>>       if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>>               /* Do not change the format while stream is on */
>>> @@ -155,8 +208,10 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>>                       return -EBUSY;
>>>
>>>               sink_fmt = &vsca->sink_fmt;
>>> +             crop_rect = &vsca->crop_rect;
>>>       } else {
>>>               sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>> +             crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>>       }
>>>
>>>       /*
>>> @@ -165,8 +220,8 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>>        */
>>>       if (VIMC_IS_SRC(fmt->pad)) {
>>>               fmt->format = *sink_fmt;
>>> -             fmt->format.width = sink_fmt->width * sca_mult;
>>> -             fmt->format.height = sink_fmt->height * sca_mult;
>>> +             fmt->format.width = crop_rect->width * sca_mult;
>>> +             fmt->format.height = crop_rect->height * sca_mult;
>>>       } else {
>>>               /* Set the new format in the sink pad */
>>>               vimc_sca_adjust_sink_fmt(&fmt->format);
>>> @@ -184,6 +239,80 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>>                       fmt->format.xfer_func, fmt->format.ycbcr_enc);
>>>
>>>               *sink_fmt = fmt->format;
>>> +
>>> +             /* Do the crop, but respect the current bounds */
>>> +             vimc_sca_adjust_sink_crop(crop_rect, sink_fmt);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int vimc_sca_get_selection(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_pad_config *cfg,
>>> +                               struct v4l2_subdev_selection *sel)
>>> +{
>>> +     struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>> +     struct v4l2_mbus_framefmt *sink_fmt;
>>> +     struct v4l2_rect *crop_rect;
>>> +
>>> +     if (VIMC_IS_SRC(sel->pad))
>>> +             return -EINVAL;
>>> +
>>> +     if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>> +             sink_fmt = &vsca->sink_fmt;
>>> +             crop_rect = &vsca->crop_rect;
>>> +     } else {
>>> +             sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>> +             crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>> +     }
>>> +
>>> +     switch (sel->target) {
>>> +     case V4L2_SEL_TGT_CROP:
>>> +             sel->r = *crop_rect;
>>> +             break;
>>> +     case V4L2_SEL_TGT_CROP_BOUNDS:
>>> +             sel->r = vimc_sca_get_crop_bound_sink(sink_fmt);
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int vimc_sca_set_selection(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_pad_config *cfg,
>>> +                               struct v4l2_subdev_selection *sel)
>>> +{
>>> +     struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>>> +     struct v4l2_mbus_framefmt *sink_fmt;
>>> +     struct v4l2_rect *crop_rect;
>>> +     struct v4l2_rect sink_rect;
>>> +
>>> +     if (VIMC_IS_SRC(sel->pad))
>>> +             return -EINVAL;
>>> +
>>> +     if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>>> +             /* Do not change the format while stream is on */
>>> +             if (vsca->src_frame)
>>> +                     return -EBUSY;
>>> +
>>> +             crop_rect = &vsca->crop_rect;
>>> +             sink_fmt = &vsca->sink_fmt;
>>> +     } else {
>>> +             crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
>>> +             sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
>>> +     }
>>> +
>>> +     switch (sel->target) {
>>> +     case V4L2_SEL_TGT_CROP:
>>> +             /* Do the crop, but respect the current bounds */
>>> +             sink_rect = vimc_sca_get_crop_bound_sink(sink_fmt);
>>> +             vimc_sca_adjust_sink_crop(&sel->r, sink_fmt);
>>> +             *crop_rect = sel->r;
>>
>> drivers/media/platform/vimc/vimc-scaler.c: In function ‘vimc_sca_set_selection’:
>> drivers/media/platform/vimc/vimc-scaler.c:290:19: warning: variable ‘sink_rect’ set but not used [-Wunused-but-set-variable]
>>   290 |  struct v4l2_rect sink_rect;
>>       |                   ^~~~~~~~~
>>
>> Something is wrong here.
>>
>> Regards,
>>
>>         Hans
>>
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>>       }
>>>
>>>       return 0;
>>> @@ -195,6 +324,8 @@ static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
>>>       .enum_frame_size        = vimc_sca_enum_frame_size,
>>>       .get_fmt                = vimc_sca_get_fmt,
>>>       .set_fmt                = vimc_sca_set_fmt,
>>> +     .get_selection          = vimc_sca_get_selection,
>>> +     .set_selection          = vimc_sca_set_selection,
>>>  };
>>>
>>>  static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>>> @@ -213,11 +344,11 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>>>               vsca->bpp = vpix->bpp;
>>>
>>>               /* Calculate the width in bytes of the src frame */
>>> -             vsca->src_line_size = vsca->sink_fmt.width *
>>> +             vsca->src_line_size = vsca->crop_rect.width *
>>>                                     sca_mult * vsca->bpp;
>>>
>>>               /* Calculate the frame size of the source pad */
>>> -             frame_size = vsca->src_line_size * vsca->sink_fmt.height *
>>> +             frame_size = vsca->src_line_size * vsca->crop_rect.height *
>>>                            sca_mult;
>>>
>>>               /* Allocate the frame buffer. Use vmalloc to be able to
>>> @@ -259,9 +390,10 @@ static void vimc_sca_fill_pix(u8 *const ptr,
>>>  }
>>>
>>>  static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>> -                            const unsigned int lin, const unsigned int col,
>>> +                            unsigned int lin, unsigned int col,
>>>                              const u8 *const sink_frame)
>>>  {
>>> +     const struct v4l2_rect crop_rect = vsca->crop_rect;
>>>       unsigned int i, j, index;
>>>       const u8 *pixel;
>>>
>>> @@ -278,8 +410,10 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>>       /* point to the place we are going to put the first pixel
>>>        * in the scaled src frame
>>>        */
>>> +     lin -= crop_rect.top;
>>> +     col -= crop_rect.left;
>>>       index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
>>> -                              vsca->sink_fmt.width * sca_mult, vsca->bpp);
>>> +                              crop_rect.width * sca_mult, vsca->bpp);
>>>
>>>       dev_dbg(vsca->ved.dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
>>>               vsca->sd.name, lin * sca_mult, col * sca_mult, index);
>>> @@ -307,12 +441,13 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>>  static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
>>>                                   const u8 *const sink_frame)
>>>  {
>>> +     const struct v4l2_rect r = vsca->crop_rect;
>>>       unsigned int i, j;
>>>
>>>       /* Scale each pixel from the original sink frame */
>>>       /* TODO: implement scale down, only scale up is supported for now */
>>> -     for (i = 0; i < vsca->sink_fmt.height; i++)
>>> -             for (j = 0; j < vsca->sink_fmt.width; j++)
>>> +     for (i = r.top; i < r.top + r.height; i++)
>>> +             for (j = r.left; j < r.left + r.width; j++)
>>>                       vimc_sca_scale_pix(vsca, i, j, sink_frame);
>>>  }
>>>
>>> @@ -384,5 +519,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>>>       /* Initialize the frame format */
>>>       vsca->sink_fmt = sink_fmt_default;
>>>
>>> +     /* Initialize the crop selection */
>>> +     vsca->crop_rect = crop_rect_default;
>>> +
>>>       return &vsca->ved;
>>>  }
>>>
>>
