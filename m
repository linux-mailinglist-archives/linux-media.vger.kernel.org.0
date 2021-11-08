Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB61447EBF
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 12:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239154AbhKHLWH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 06:22:07 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:38323 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237148AbhKHLWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 06:22:06 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B21B220000D;
        Mon,  8 Nov 2021 11:19:18 +0000 (UTC)
Date:   Mon, 8 Nov 2021 12:20:11 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 11/21] media: atmel: atmel-isc-base: implement mbus_code
 support in enumfmt
Message-ID: <20211108112011.j4wi2z7hcibot6pz@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-12-eugen.hristev@microchip.com>
 <20211105092559.ce6pdm4hwvxkmutd@uno.localdomain>
 <20211105095128.7tu4rm6mogwy2dz6@uno.localdomain>
 <60f0d378-d998-464f-2d95-09db4e889b96@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60f0d378-d998-464f-2d95-09db4e889b96@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Fri, Nov 05, 2021 at 11:03:25AM +0000, Eugen.Hristev@microchip.com wrote:
> On 11/5/21 11:51 AM, Jacopo Mondi wrote:
> > Hi Eugen
> >
> > On Fri, Nov 05, 2021 at 10:25:59AM +0100, Jacopo Mondi wrote:
> >> Hi Eugen,
> >>
> >> On Fri, Oct 22, 2021 at 10:52:37AM +0300, Eugen Hristev wrote:
> >>> If enumfmt is called with an mbus_code, the enumfmt handler should only
> >>> return the formats that are supported for this mbus_code.
> >>> To make it more easy to understand the formats, changed the report order
> >>> to report first the native formats, and after that the formats that the ISC
> >>> can convert to.
> >>>
> >>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >>
> >> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> >>
> >
> > Too soon! Sorry...
> >
> >> Thanks
> >>     j
> >>
> >>> ---
> >>>   drivers/media/platform/atmel/atmel-isc-base.c | 51 ++++++++++++++++---
> >>>   1 file changed, 43 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> >>> index 2dd2511c7be1..1f7fbe5e4d79 100644
> >>> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> >>> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> >>> @@ -499,21 +499,56 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
> >>>      u32 index = f->index;
> >>>      u32 i, supported_index;
> >>>
> >>> -   if (index < isc->controller_formats_size) {
> >>> -           f->pixelformat = isc->controller_formats[index].fourcc;
> >>> -           return 0;
> >>> +   supported_index = 0;
> >>> +
>
> Hi Jacopo,
>
> This for loop below first iterates through the formats that were
> identified as directly supported by the subdevice.
> As we are able in the ISC to just dump what the subdevice can stream, we
> advertise all these formats here.
> (if the userspace requires one specific mbus code, we only advertise the
> corresponding format)
>
> >>> +   for (i = 0; i < isc->formats_list_size; i++) {
> >>> +           if (!isc->formats_list[i].sd_support)
> >
> >
> >>> +                   continue;
> >>> +           /*
> >>> +            * If specific mbus_code is requested, provide only
> >>> +            * supported formats with this mbus code
> >>> +            */
> >>> +           if (f->mbus_code && f->mbus_code !=
> >>> +               isc->formats_list[i].mbus_code)
> >>> +                   continue;
> >>> +           if (supported_index == index) {
> >>> +                   f->pixelformat = isc->formats_list[i].fourcc;
> >>> +                   return 0;
> >>> +           }
> >>> +           supported_index++;
> >>>      }
> >>>
> >>> -   index -= isc->controller_formats_size;
> >>> +   /*
> >>> +    * If the sensor does not support this mbus_code whatsoever,
> >>> +    * there is no reason to advertise any of our output formats
> >>> +    */
> >>> +   if (supported_index == 0)
> >>> +           return -EINVAL;
> >
> > Shouldn't you also return -EINVAL if index > supported_index ?
>
> No. If we could not find any format that the sensor can use
> (supported_index == 0), and that our ISC can also use, then we don't
> support anything, thus, return -EINVAL regardless of the index.
>
> >
> > In that case, I'm not gettng what the rest of the function is for ?
> >
>
> This is the case when we identified one supported format for both the
> sensor and the ISC (case where supported_index found earlier is >= 1)
>
> >>> +
> >>> +   /*
> >>> +    * If the sensor uses a format that is not raw, then we cannot
> >>> +    * convert it to any of the formats that we usually can with a
> >>> +    * RAW sensor. Thus, do not advertise them.
> >>> +    */
> >>> +   if (!isc->config.sd_format ||
> >>> +       !ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
> >>> +           return -EINVAL;
> >>>
>
> Next, if the current format from the subdev is not raw, we are done.

Ok, I think here it's were I disconnect.

I don't think you should care about the -current- format on the
subdev, as once you move to MC the ISC formats should be enumerated
regardless of the how the remote subdev is configured. Rather, you
should consider if IS_RAW(f->mbus_code) and from there enumerate the
output formats you can generate from raw bayer (in addition to the
ones that can be produced by dumping the sensor produced formats)

> But, if it's raw, we can use it to convert to a plethora of other
> formats. So we have to enumerate them below :
>
> With the previous checks, I am making sure that the ISC can really
> convert to these formats, otherwise they are badly reported
>
> Hope this makes things more clear, but please ask if something looks strange
>

I think our disconnection comes from the way the supported formats are
defined in ISC and I think their definition could be reworkd to
simplify the format selection logic.

The driver defines three lists of formats:

- isc->controller_formats

       static const struct isc_format sama7g5_controller_formats[] = {
	{
		.fourcc		= V4L2_PIX_FMT_ARGB444,
	},
	{
		.fourcc		= V4L2_PIX_FMT_ARGB555,
	},
        ...

        };

 These are listed with the output fourcc only, and if I get
 try_configure_pipeline() right, they can be generated from any Bayer
 RAW format. Is this right ?

- isc->formats_list

        static struct isc_format sama7g5_formats_list[] = {
                {
                        .fourcc		= V4L2_PIX_FMT_SBGGR8,
                        .mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
                        .pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
                        .cfa_baycfg	= ISC_BAY_CFG_BGBG,
                },
                {
                        .fourcc		= V4L2_PIX_FMT_SGBRG8,
                        .mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
                        .pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
                        .cfa_baycfg	= ISC_BAY_CFG_GBGB,
                },

         ...

         };

  These are formats the ISC can output by dumping the sensor output,
  hence they require a specific format to be output from the sensor

- isc->user_formats

        static int isc_formats_init() {

                ...

                fmt = &isc->formats_list[0];
                for (i = 0, j = 0; i < list_size; i++) {
                        if (fmt->sd_support)
                                isc->user_formats[j++] = fmt;
                        fmt++;
                }

      }

  this list is obtained at runtime by restricting the formats_list to
  what the sensor can actually output. I think these, if you move to
  MC should be removed but I'm not 100% sure it is possible with the
  current implementation of set_fmt().

Do you think controller_formats and formats_list should be unified ?

If my understanding that all controller_formats can be generated from
RAW Bayer formats you could model struct isc_format as

        struct isc_format {
                u32	fourcc;
                bool    processed;
                u32     mbus_codes
                u32	cfa_baycfg;
                u32	pfe_cfg0_bps;
        };

and have in example:

	{
		.fourcc		= V4L2_PIX_FMT_ARGB444,
                .processed      = true,
                .mbus_codes     = nullptr,
                ....
	},
        {
                .fourcc		= V4L2_PIX_FMT_SBGGR8,
                .processed      = false,
                .mbus_codes	= { MEDIA_BUS_FMT_SBGGR8_1X8 }
                .pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
                .cfa_baycfg	= ISC_BAY_CFG_BGBG,
        },

and when enumerating and configuring formats check that

        if (isc_format[i].processed &&
            (f->mbus_code && IS_RAW(f->mbus)code))

or

        if (!isc_format[i].processed &&
            (f->mbus_code == isc_format[i].mbus_code

if you have other restrictions as in example V4L2_PIX_FMT_YUV420
requiring a packed YUV format, you can implement more complex
validations to match processed formats, like you do in try_validate_formats()

Also, and a bit unrelated to enum_fmt, if I got this right
at format configuration time you match the ISC format with
the sensor format. I think this should be moved to .link_validate() op time.

The MC core calls .link_validate when streaming is started on each
entity part of a pipeline, and there you could make sure that the ISC output format can be produced using
the sensor format (and sizes). This will greatly simplify set_fmt() as
there you will have just to make sure the supplied format is in the
list of the ISC supported ones and that's it. If userspace fails to
configure the pipeline correctly (in example by setting a non RAW
Bayer sensor on the format and requesting a RAW Bayer format from ISC,
you will fail at s_stream() time by returning an EPIPE.

Hope all of this makes a bit of sense :)

> >>> +   /*
> >>> +    * Iterate again through the formats that we can convert to.
> >>> +    * However, to avoid duplicates, skip the formats that
> >>> +    * the sensor already supports directly
> >>> +    */
> >>> +   index -= supported_index;
> >>>      supported_index = 0;
> >>>
> >>> -   for (i = 0; i < isc->formats_list_size; i++) {
> >>> -           if (!ISC_IS_FORMAT_RAW(isc->formats_list[i].mbus_code) ||
> >>> -               !isc->formats_list[i].sd_support)
> >>> +   for (i = 0; i < isc->controller_formats_size; i++) {
> >>> +           /* if this format is already supported by sensor, skip it */
> >>> +           if (find_format_by_fourcc(isc, isc->controller_formats[i].fourcc))
> >>>                      continue;
> >>>              if (supported_index == index) {
> >>> -                   f->pixelformat = isc->formats_list[i].fourcc;
> >>> +                   f->pixelformat =
> >>> +                           isc->controller_formats[i].fourcc;
> >>>                      return 0;
> >>>              }
> >>>              supported_index++;
> >>> --
> >>> 2.25.1
> >>>
>
