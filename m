Return-Path: <linux-media+bounces-28636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5FDA6DADE
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 14:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A11D7A24CE
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1AB25EFA3;
	Mon, 24 Mar 2025 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lbugUSg4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3418825DCE8;
	Mon, 24 Mar 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821965; cv=none; b=WdPPVpy4a/jjK9oGajKPAoPHESSB7quQ1Q6YCXBVtH9dj18Y/vLi313MPu19PN4DIWvJFsd9i8KDycx+w861phIOG0aRb7PrQ4of3QQFBxZA/A++2yqwIxUtAwpidilQYuhlprGdpvW/Yeb3RvzFc4Cw4/yehGwqEM2rewhlQ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821965; c=relaxed/simple;
	bh=EWhJvrtutK0PeUeDO2lUwMDsAI/g45DKOr0QXABkzPc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GIaP9oTuoCde8ZnnJw2Y5puqSuZRb3DtUO+o6T1ePFPKtX18P62Wnq1vgJ/S0/Nn/uap4ov1ImGJfUwOnMgBqhnvXb3gHN63cZn7x3FY+y1ta4G8PtYF4oO0Zu6LXHwGmKnteTkGFxliFKFBQFxbTGJI8CocSoH9f0Uj8K1OAcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lbugUSg4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB56B455;
	Mon, 24 Mar 2025 14:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742821855;
	bh=EWhJvrtutK0PeUeDO2lUwMDsAI/g45DKOr0QXABkzPc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lbugUSg4VuhHpPEEzuUqJHADfybWIM2S0UzxWuNCyz+MEsTzCWok6eOWRJ/3bgU96
	 8taziEJzP+D3Nfs9X6ik6sZ8gM9gp94aOGzBCZ1N5O6/YmFTXtgPlWPcH9/Rvf2HKn
	 VvJWt9MKjFclHW6glE7T0seTqmrBA5RimAuVyXkk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250324-cal-streams-v6-3-28c93fb8f0c9@ideasonboard.com>
References: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com> <20250324-cal-streams-v6-3-28c93fb8f0c9@ideasonboard.com>
Subject: Re: [PATCH v6 3/3] media: ti: cal: Add streams support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 24 Mar 2025 13:12:38 +0000
Message-ID: <174282195889.3289779.9089924832564377119@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Tomi Valkeinen (2025-03-24 09:29:19)
> Add multiplexed streams support. CAL has 8 DMA-engines and can capture 8
> separate streams at the same time. The driver filters the streams based
> on CSI-2 virtual channel number and datatype. CAL may have (depending on
> the SoC) two CSI-2 RX blocks, which share the 8 DMA-engines, so the
> number of capturable streams does not change even if there are two CSI-2
> RX blocks.
>=20
> Add 8 video device nodes, each representing a single DMA-engine, and set
> the number of source pads on CSI-2 RX blocks to 8. Each video node can be
> connected to any of the source pads on either of the CSI-2 RX instances
> using media links. CSI-2 RX block's subdevice internal routing is used
> to route the incoming CSI-2 streams to one of the 8 source pads.
>=20
> Only video data streams are supported at the moment.

That's a big chunk of patch, so it's taken me a while to get through,
but aside from random comment's I couldn't see anything that scared me
so:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/ti/cal/cal-camerarx.c | 271 +++++++++++++++++++++=
------
>  drivers/media/platform/ti/cal/cal-video.c    | 127 ++++++++++---
>  drivers/media/platform/ti/cal/cal.c          |  45 +++--
>  drivers/media/platform/ti/cal/cal.h          |   3 +-
>  4 files changed, 340 insertions(+), 106 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media=
/platform/ti/cal/cal-camerarx.c
> index 42dfe08b765f..9d8aefdeb430 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -49,21 +49,38 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_=
camerarx *phy)
>  {
>         struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 =3D &phy->endpoint.b=
us.mipi_csi2;
>         u32 num_lanes =3D mipi_csi2->num_data_lanes;
> -       const struct cal_format_info *fmtinfo;
>         struct v4l2_subdev_state *state;
> -       struct v4l2_mbus_framefmt *fmt;
>         u32 bpp;
>         s64 freq;
> =20
> +       /*
> +        * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls =
back
> +        * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
> +        *
> +        * With multistream input there is no single pixel rate, and thus=
 we
> +        * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
> +        * causes v4l2_get_link_freq() to return an error if it falls bac=
k to
> +        * V4L2_CID_PIXEL_RATE.

Seems like a convenient 'trick'. I wonder if the documentation of
v4l2_get_link_freq() should be extended to state this is possible, as I
expect other platforms will need the same thing when using streams?

Aha, actually it does already state bpp for D-PHY... 0 otherwise, but
perhaps something could be more explicit about streams usage.

Anyway, not an impact for this patch directly.


> +        */
> +
>         state =3D v4l2_subdev_get_locked_active_state(&phy->subdev);
> =20
> -       fmt =3D v4l2_subdev_state_get_format(state, CAL_CAMERARX_PAD_SINK=
);
> +       if (state->routing.num_routes > 1) {
> +               bpp =3D 0;
> +       } else {
> +               struct v4l2_subdev_route *route =3D &state->routing.route=
s[0];
> +               const struct cal_format_info *fmtinfo;
> +               struct v4l2_mbus_framefmt *fmt;
> =20
> -       fmtinfo =3D cal_format_by_code(fmt->code);
> -       if (!fmtinfo)
> -               return -EINVAL;
> +               fmt =3D v4l2_subdev_state_get_format(state,
> +                       route->sink_pad, route->sink_stream);
> +
> +               fmtinfo =3D cal_format_by_code(fmt->code);
> +               if (!fmtinfo)
> +                       return -EINVAL;
> =20
> -       bpp =3D fmtinfo->bpp;
> +               bpp =3D fmtinfo->bpp;
> +       }
> =20
>         freq =3D v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * n=
um_lanes);
>         if (freq < 0) {
> @@ -284,15 +301,32 @@ static void cal_camerarx_ppi_disable(struct cal_cam=
erarx *phy)
>                         0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
>  }
> =20
> -static int cal_camerarx_start(struct cal_camerarx *phy)
> +static int cal_camerarx_start(struct cal_camerarx *phy, u32 sink_stream)
>  {
> +       struct media_pad *remote_pad;
>         s64 link_freq;
>         u32 sscounter;
>         u32 val;
>         int ret;
> =20
> +       remote_pad =3D media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX=
_PAD_SINK]);
> +
> +       /*
> +        * We need to enable the PHY hardware when enabling the first str=
eam,
> +        * but for the following streams we just propagate the enable_str=
eams
> +        * to the source.
> +        */
> +
>         if (phy->enable_count > 0) {
> +               ret =3D v4l2_subdev_enable_streams(phy->source, remote_pa=
d->index,
> +                                                BIT(sink_stream));
> +               if (ret) {
> +                       phy_err(phy, "enable streams failed in source: %d=
\n", ret);
> +                       return ret;
> +               }
> +
>                 phy->enable_count++;
> +
>                 return 0;
>         }
> =20
> @@ -394,7 +428,8 @@ static int cal_camerarx_start(struct cal_camerarx *ph=
y)
>          * Start the source to enable the CSI-2 HS clock. We can now wait=
 for
>          * CSI-2 PHY reset to complete.
>          */
> -       ret =3D v4l2_subdev_call(phy->source, video, s_stream, 1);
> +       ret =3D v4l2_subdev_enable_streams(phy->source, remote_pad->index,
> +                                        BIT(sink_stream));
>         if (ret) {
>                 v4l2_subdev_call(phy->source, core, s_power, 0);
>                 cal_camerarx_disable_irqs(phy);
> @@ -425,12 +460,22 @@ static int cal_camerarx_start(struct cal_camerarx *=
phy)
>         return 0;
>  }
> =20
> -static void cal_camerarx_stop(struct cal_camerarx *phy)
> +static void cal_camerarx_stop(struct cal_camerarx *phy, u32 sink_stream)
>  {
> +       struct media_pad *remote_pad;
>         int ret;
> =20
> -       if (--phy->enable_count > 0)
> +       remote_pad =3D media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX=
_PAD_SINK]);
> +
> +       if (--phy->enable_count > 0) {
> +               ret =3D v4l2_subdev_disable_streams(phy->source,
> +                                                 remote_pad->index,
> +                                                 BIT(sink_stream));
> +               if (ret)
> +                       phy_err(phy, "stream off failed in subdev\n");
> +
>                 return;
> +       }
> =20
>         cal_camerarx_ppi_disable(phy);
> =20
> @@ -450,7 +495,9 @@ static void cal_camerarx_stop(struct cal_camerarx *ph=
y)
>         /* Disable the phy */
>         cal_camerarx_disable(phy);
> =20
> -       if (v4l2_subdev_call(phy->source, video, s_stream, 0))
> +       ret =3D v4l2_subdev_disable_streams(phy->source, remote_pad->inde=
x,
> +                                         BIT(sink_stream));
> +       if (ret)
>                 phy_err(phy, "stream off failed in subdev\n");
> =20
>         ret =3D v4l2_subdev_call(phy->source, core, s_power, 0);
> @@ -599,22 +646,50 @@ static inline struct cal_camerarx *to_cal_camerarx(=
struct v4l2_subdev *sd)
>         return container_of(sd, struct cal_camerarx, subdev);
>  }
> =20
> -static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
> +struct cal_camerarx *
> +cal_camerarx_get_phy_from_entity(struct media_entity *entity)
> +{
> +       struct v4l2_subdev *sd;
> +
> +       sd =3D media_entity_to_v4l2_subdev(entity);
> +       if (!sd)
> +               return NULL;
> +
> +       return to_cal_camerarx(sd);
> +}
> +
> +static int cal_camerarx_sd_enable_streams(struct v4l2_subdev *sd,
> +                                         struct v4l2_subdev_state *state,
> +                                         u32 pad, u64 streams_mask)
>  {
>         struct cal_camerarx *phy =3D to_cal_camerarx(sd);
> -       struct v4l2_subdev_state *state;
> -       int ret =3D 0;
> +       u32 sink_stream;
> +       int ret;
> =20
> -       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +       ret =3D v4l2_subdev_routing_find_opposite_end(&state->routing, pa=
d, 0,
> +                                                   NULL, &sink_stream);
> +       if (ret)
> +               return ret;
> =20
> -       if (enable)
> -               ret =3D cal_camerarx_start(phy);
> -       else
> -               cal_camerarx_stop(phy);
> +       return cal_camerarx_start(phy, sink_stream);
> +}
> =20
> -       v4l2_subdev_unlock_state(state);
> +static int cal_camerarx_sd_disable_streams(struct v4l2_subdev *sd,
> +                                          struct v4l2_subdev_state *stat=
e,
> +                                          u32 pad, u64 streams_mask)
> +{
> +       struct cal_camerarx *phy =3D to_cal_camerarx(sd);
> +       u32 sink_stream;
> +       int ret;
> =20
> -       return ret;
> +       ret =3D v4l2_subdev_routing_find_opposite_end(&state->routing, pa=
d, 0,
> +                                                   NULL, &sink_stream);
> +       if (ret)
> +               return ret;
> +
> +       cal_camerarx_stop(phy, sink_stream);
> +
> +       return 0;
>  }
> =20
>  static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
> @@ -628,8 +703,12 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l=
2_subdev *sd,
>                 if (code->index > 0)
>                         return -EINVAL;
> =20
> -               fmt =3D v4l2_subdev_state_get_format(state,
> -                                                  CAL_CAMERARX_PAD_SINK);
> +               fmt =3D v4l2_subdev_state_get_opposite_stream_format(stat=
e,
> +                                                                  code->=
pad,
> +                                                                  code->=
stream);
> +               if (!fmt)
> +                       return -EINVAL;
> +
>                 code->code =3D fmt->code;
>         } else {
>                 if (code->index >=3D cal_num_formats)
> @@ -654,8 +733,12 @@ static int cal_camerarx_sd_enum_frame_size(struct v4=
l2_subdev *sd,
>         if (cal_rx_pad_is_source(fse->pad)) {
>                 struct v4l2_mbus_framefmt *fmt;
> =20
> -               fmt =3D v4l2_subdev_state_get_format(state,
> -                                                  CAL_CAMERARX_PAD_SINK);
> +               fmt =3D v4l2_subdev_state_get_opposite_stream_format(stat=
e,
> +                                                                  fse->p=
ad,
> +                                                                  fse->s=
tream);
> +               if (!fmt)
> +                       return -EINVAL;
> +
>                 if (fse->code !=3D fmt->code)
>                         return -EINVAL;
> =20
> @@ -711,36 +794,78 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subd=
ev *sd,
> =20
>         /* Store the format and propagate it to the source pad. */
> =20
> -       fmt =3D v4l2_subdev_state_get_format(state, CAL_CAMERARX_PAD_SINK=
);
> +       fmt =3D v4l2_subdev_state_get_format(state, format->pad,
> +                                                 format->stream);
> +       if (!fmt)
> +               return -EINVAL;
> +
>         *fmt =3D format->format;
> =20
> -       fmt =3D v4l2_subdev_state_get_format(state,
> -                                          CAL_CAMERARX_PAD_FIRST_SOURCE);
> +       fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, forma=
t->pad,
> +                                                          format->stream=
);
> +       if (!fmt)
> +               return -EINVAL;
> +
>         *fmt =3D format->format;
> =20
>         return 0;
>  }
> =20
> +static int cal_camerarx_set_routing(struct v4l2_subdev *sd,
> +                                   struct v4l2_subdev_state *state,
> +                                   struct v4l2_subdev_krouting *routing)
> +{
> +       static const struct v4l2_mbus_framefmt format =3D {
> +               .width =3D 640,
> +               .height =3D 480,

This feels a bit arbitrary ... ?=20

Which would be fine if it's just called from init_state, but I see calls
from
	.set_routing =3D cal_camerarx_sd_set_routing,

too?

> +               .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +               .field =3D V4L2_FIELD_NONE,
> +               .colorspace =3D V4L2_COLORSPACE_SRGB,
> +               .ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> +               .quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> +               .xfer_func =3D V4L2_XFER_FUNC_SRGB,
> +       };
> +       int ret;
> +
> +       ret =3D v4l2_subdev_routing_validate(sd, routing,
> +                                          V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1 |
> +                                          V4L2_SUBDEV_ROUTING_NO_SOURCE_=
MULTIPLEXING);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D v4l2_subdev_set_routing_with_fmt(sd, state, routing, &for=
mat);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
> +                                      struct v4l2_subdev_state *state,
> +                                      enum v4l2_subdev_format_whence whi=
ch,
> +                                      struct v4l2_subdev_krouting *routi=
ng)
> +{
> +       return cal_camerarx_set_routing(sd, state, routing);

Do the routes persist across both TRY/ACTIVE? I.e. there's only ever a
single routing table?

> +}
> +
>  static int cal_camerarx_sd_init_state(struct v4l2_subdev *sd,
> -                                     struct v4l2_subdev_state *state)
> -{
> -       struct v4l2_subdev_format format =3D {
> -               .which =3D state ? V4L2_SUBDEV_FORMAT_TRY
> -               : V4L2_SUBDEV_FORMAT_ACTIVE,
> -               .pad =3D CAL_CAMERARX_PAD_SINK,
> -               .format =3D {
> -                       .width =3D 640,
> -                       .height =3D 480,

Aha, So the size was already arbitrary - not newly added anyway.

> -                       .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> -                       .field =3D V4L2_FIELD_NONE,
> -                       .colorspace =3D V4L2_COLORSPACE_SRGB,
> -                       .ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> -                       .quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> -                       .xfer_func =3D V4L2_XFER_FUNC_SRGB,
> -               },
> +                                   struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_subdev_route routes[] =3D { {
> +               .sink_pad =3D 0,
> +               .sink_stream =3D 0,
> +               .source_pad =3D 1,
> +               .source_stream =3D 0,
> +               .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +       } };
> +
> +       struct v4l2_subdev_krouting routing =3D {
> +               .num_routes =3D 1,
> +               .routes =3D routes,
>         };
> =20
> -       return cal_camerarx_sd_set_fmt(sd, state, &format);
> +       /* Initialize routing to single route to the fist source pad */
> +       return cal_camerarx_set_routing(sd, state, &routing);
>  }
> =20
>  static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned =
int pad,
> @@ -749,48 +874,71 @@ static int cal_camerarx_get_frame_desc(struct v4l2_=
subdev *sd, unsigned int pad,
>         struct cal_camerarx *phy =3D to_cal_camerarx(sd);
>         struct v4l2_mbus_frame_desc remote_desc;
>         const struct media_pad *remote_pad;
> +       struct v4l2_subdev_state *state;
> +       u32 sink_stream;
> +       unsigned int i;
>         int ret;
> =20
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +
> +       ret =3D v4l2_subdev_routing_find_opposite_end(&state->routing,
> +                                                   pad, 0,
> +                                                   NULL, &sink_stream);
> +       if (ret)
> +               goto out_unlock;
> +
>         remote_pad =3D media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX=
_PAD_SINK]);
> -       if (!remote_pad)
> -               return -EPIPE;
> +       if (!remote_pad) {
> +               ret =3D -EPIPE;
> +               goto out_unlock;
> +       }
> =20
>         ret =3D v4l2_subdev_call(phy->source, pad, get_frame_desc,
>                                remote_pad->index, &remote_desc);
>         if (ret)
> -               return ret;
> +               goto out_unlock;
> =20
>         if (remote_desc.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>                 cal_err(phy->cal,
>                         "Frame descriptor does not describe CSI-2 link");
> -               return -EINVAL;
> +               ret =3D -EINVAL;
> +               goto out_unlock;
>         }
> =20
> -       if (remote_desc.num_entries > 1)
> -               cal_err(phy->cal,
> -                       "Multiple streams not supported in remote frame d=
escriptor, using the first one\n");
> +       for (i =3D 0; i < remote_desc.num_entries; i++) {
> +               if (remote_desc.entry[i].stream =3D=3D sink_stream)
> +                       break;
> +       }
> +
> +       if (i =3D=3D remote_desc.num_entries) {
> +               cal_err(phy->cal, "Stream %u not found in remote frame de=
sc\n",
> +                       sink_stream);
> +               ret =3D -EINVAL;
> +               goto out_unlock;
> +       }
> =20
>         fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>         fd->num_entries =3D 1;
> -       fd->entry[0] =3D remote_desc.entry[0];
> +       fd->entry[0] =3D remote_desc.entry[i];
> =20
> -       return 0;
> -}
> +out_unlock:
> +       v4l2_subdev_unlock_state(state);
> =20
> -static const struct v4l2_subdev_video_ops cal_camerarx_video_ops =3D {
> -       .s_stream =3D cal_camerarx_sd_s_stream,
> -};
> +       return ret;
> +}
> =20
>  static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops =3D {
> +       .enable_streams =3D cal_camerarx_sd_enable_streams,
> +       .disable_streams =3D cal_camerarx_sd_disable_streams,
>         .enum_mbus_code =3D cal_camerarx_sd_enum_mbus_code,
>         .enum_frame_size =3D cal_camerarx_sd_enum_frame_size,
>         .get_fmt =3D v4l2_subdev_get_fmt,
>         .set_fmt =3D cal_camerarx_sd_set_fmt,
> +       .set_routing =3D cal_camerarx_sd_set_routing,
>         .get_frame_desc =3D cal_camerarx_get_frame_desc,
>  };
> =20
>  static const struct v4l2_subdev_ops cal_camerarx_subdev_ops =3D {
> -       .video =3D &cal_camerarx_video_ops,
>         .pad =3D &cal_camerarx_pad_ops,
>  };
> =20
> @@ -800,6 +948,7 @@ static const struct v4l2_subdev_internal_ops cal_came=
rarx_internal_ops =3D {
> =20
>  static const struct media_entity_operations cal_camerarx_media_ops =3D {
>         .link_validate =3D v4l2_subdev_link_validate,
> +       .has_pad_interdep =3D v4l2_subdev_has_pad_interdep,
>  };
> =20
>  /* ------------------------------------------------------------------
> @@ -851,7 +1000,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_=
dev *cal,
>         v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
>         sd->internal_ops =3D &cal_camerarx_internal_ops;
>         sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> -       sd->flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       sd->flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>         snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
>         sd->dev =3D cal->dev;
> =20
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/pl=
atform/ti/cal/cal-video.c
> index 29c38bf8d7a1..97a14ceaf237 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -108,9 +108,10 @@ static int __subdev_get_format(struct cal_ctx *ctx,
>                 .pad =3D 0,
>         };
>         struct v4l2_mbus_framefmt *mbus_fmt =3D &sd_fmt.format;
> +       struct v4l2_subdev *sd =3D ctx->phy->source;
>         int ret;
> =20
> -       ret =3D v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &s=
d_fmt);
> +       ret =3D v4l2_subdev_call_state_active(sd, pad, get_fmt, &sd_fmt);
>         if (ret)
>                 return ret;
> =20
> @@ -130,11 +131,12 @@ static int __subdev_set_format(struct cal_ctx *ctx,
>                 .pad =3D 0,
>         };
>         struct v4l2_mbus_framefmt *mbus_fmt =3D &sd_fmt.format;
> +       struct v4l2_subdev *sd =3D ctx->phy->source;
>         int ret;
> =20
>         *mbus_fmt =3D *fmt;
> =20
> -       ret =3D v4l2_subdev_call(ctx->phy->source, pad, set_fmt, NULL, &s=
d_fmt);
> +       ret =3D v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
>         if (ret)
>                 return ret;
> =20
> @@ -176,6 +178,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *fi=
le, void *priv,
>                                       struct v4l2_format *f)
>  {
>         struct cal_ctx *ctx =3D video_drvdata(file);
> +       struct v4l2_subdev *sd =3D ctx->phy->source;
>         const struct cal_format_info *fmtinfo;
>         struct v4l2_subdev_frame_size_enum fse =3D {
>                 .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> @@ -201,8 +204,8 @@ static int cal_legacy_try_fmt_vid_cap(struct file *fi=
le, void *priv,
>         for (fse.index =3D 0; ; fse.index++) {
>                 int ret;
> =20
> -               ret =3D v4l2_subdev_call(ctx->phy->source, pad, enum_fram=
e_size,
> -                                      NULL, &fse);
> +               ret =3D v4l2_subdev_call_state_active(sd, pad, enum_frame=
_size,
> +                                                   &fse);
>                 if (ret)
>                         break;
> =20
> @@ -238,6 +241,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file=
, void *priv,
>                                     struct v4l2_format *f)
>  {
>         struct cal_ctx *ctx =3D video_drvdata(file);
> +       struct v4l2_subdev *sd =3D &ctx->phy->subdev;
>         struct vb2_queue *q =3D &ctx->vb_vidq;
>         struct v4l2_subdev_format sd_fmt =3D {
>                 .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> @@ -277,7 +281,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file=
, void *priv,
>         ctx->v_fmt.fmt.pix.field =3D sd_fmt.format.field;
>         cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
> =20
> -       v4l2_subdev_call(&ctx->phy->subdev, pad, set_fmt, NULL, &sd_fmt);
> +       v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);

No return checks required here from set_fmt? But it wasn't there before
so not this patch anyway.

> =20
>         ctx->fmtinfo =3D fmtinfo;
>         *f =3D ctx->v_fmt;
> @@ -289,6 +293,7 @@ static int cal_legacy_enum_framesizes(struct file *fi=
le, void *fh,
>                                       struct v4l2_frmsizeenum *fsize)
>  {
>         struct cal_ctx *ctx =3D video_drvdata(file);
> +       struct v4l2_subdev *sd =3D ctx->phy->source;
>         const struct cal_format_info *fmtinfo;
>         struct v4l2_subdev_frame_size_enum fse =3D {
>                 .index =3D fsize->index,
> @@ -307,8 +312,7 @@ static int cal_legacy_enum_framesizes(struct file *fi=
le, void *fh,
> =20
>         fse.code =3D fmtinfo->code;
> =20
> -       ret =3D v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, =
NULL,
> -                              &fse);
> +       ret =3D v4l2_subdev_call_state_active(sd, pad, enum_frame_size, &=
fse);
>         if (ret)
>                 return ret;
> =20
> @@ -350,6 +354,7 @@ static int cal_legacy_enum_frameintervals(struct file=
 *file, void *priv,
>                                           struct v4l2_frmivalenum *fival)
>  {
>         struct cal_ctx *ctx =3D video_drvdata(file);
> +       struct v4l2_subdev *sd =3D ctx->phy->source;
>         const struct cal_format_info *fmtinfo;
>         struct v4l2_subdev_frame_interval_enum fie =3D {
>                 .index =3D fival->index,
> @@ -364,8 +369,8 @@ static int cal_legacy_enum_frameintervals(struct file=
 *file, void *priv,
>                 return -EINVAL;
> =20
>         fie.code =3D fmtinfo->code;
> -       ret =3D v4l2_subdev_call(ctx->phy->source, pad, enum_frame_interv=
al,
> -                              NULL, &fie);
> +
> +       ret =3D v4l2_subdev_call_state_active(sd, pad, enum_frame_interva=
l, &fie);
>         if (ret)
>                 return ret;
>         fival->type =3D V4L2_FRMIVAL_TYPE_DISCRETE;
> @@ -432,6 +437,9 @@ static int cal_mc_enum_fmt_vid_cap(struct file *file,=
 void  *priv,
>         idx =3D 0;
> =20
>         for (i =3D 0; i < cal_num_formats; ++i) {
> +               if (cal_formats[i].meta)
> +                       continue;
> +
>                 if (f->mbus_code && cal_formats[i].code !=3D f->mbus_code)
>                         continue;
> =20
> @@ -459,7 +467,7 @@ static void cal_mc_try_fmt(struct cal_ctx *ctx, struc=
t v4l2_format *f,
>          * supported.
>          */
>         fmtinfo =3D cal_format_by_fourcc(f->fmt.pix.pixelformat);
> -       if (!fmtinfo)
> +       if (!fmtinfo || fmtinfo->meta)
>                 fmtinfo =3D &cal_formats[0];
> =20
>         /*
> @@ -675,16 +683,16 @@ static int cal_video_check_format(struct cal_ctx *c=
tx)
>  {
>         const struct v4l2_mbus_framefmt *format;
>         struct v4l2_subdev_state *state;
> -       struct media_pad *remote_pad;
> +       struct media_pad *phy_source_pad;
>         int ret =3D 0;
> =20
> -       remote_pad =3D media_pad_remote_pad_first(&ctx->pad);
> -       if (!remote_pad)
> +       phy_source_pad =3D media_pad_remote_pad_first(&ctx->pad);
> +       if (!phy_source_pad)
>                 return -ENODEV;
> =20
>         state =3D v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev=
);
> =20
> -       format =3D v4l2_subdev_state_get_format(state, remote_pad->index);
> +       format =3D v4l2_subdev_state_get_format(state, phy_source_pad->in=
dex, 0);
>         if (!format) {
>                 ret =3D -EINVAL;
>                 goto out;
> @@ -707,16 +715,28 @@ static int cal_video_check_format(struct cal_ctx *c=
tx)
>  static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>         struct cal_ctx *ctx =3D vb2_get_drv_priv(vq);
> +       struct media_pad *phy_source_pad;
>         struct cal_buffer *buf;
>         dma_addr_t addr;
>         int ret;
> =20
> +       phy_source_pad =3D media_pad_remote_pad_first(&ctx->pad);
> +       if (!phy_source_pad) {
> +               ctx_err(ctx, "Context not connected\n");
> +               ret =3D -ENODEV;
> +               goto error_release_buffers;
> +       }
> +
>         ret =3D video_device_pipeline_alloc_start(&ctx->vdev);
>         if (ret < 0) {
>                 ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
>                 goto error_release_buffers;
>         }
> =20
> +       /* Find the PHY connected to this video device */
> +       if (cal_mc_api)
> +               ctx->phy =3D cal_camerarx_get_phy_from_entity(phy_source_=
pad->entity);
> +
>         /*
>          * Verify that the currently configured format matches the output=
 of
>          * the connected CAMERARX.
> @@ -749,7 +769,8 @@ static int cal_start_streaming(struct vb2_queue *vq, =
unsigned int count)
>         cal_ctx_set_dma_addr(ctx, addr);
>         cal_ctx_start(ctx);
> =20
> -       ret =3D v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
> +       ret =3D v4l2_subdev_enable_streams(&ctx->phy->subdev,
> +                                        phy_source_pad->index, BIT(0));
>         if (ret)
>                 goto error_stop;
> =20
> @@ -774,10 +795,14 @@ static int cal_start_streaming(struct vb2_queue *vq=
, unsigned int count)
>  static void cal_stop_streaming(struct vb2_queue *vq)
>  {
>         struct cal_ctx *ctx =3D vb2_get_drv_priv(vq);
> +       struct media_pad *phy_source_pad;
> =20
>         cal_ctx_stop(ctx);
> =20
> -       v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
> +       phy_source_pad =3D media_pad_remote_pad_first(&ctx->pad);
> +
> +       v4l2_subdev_disable_streams(&ctx->phy->subdev, phy_source_pad->in=
dex,
> +                                   BIT(0));
> =20
>         pm_runtime_put_sync(ctx->cal->dev);
> =20
> @@ -786,6 +811,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
>         cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
> =20
>         video_device_pipeline_stop(&ctx->vdev);
> +
> +       if (cal_mc_api)
> +               ctx->phy =3D NULL;
>  }
> =20
>  static const struct vb2_ops cal_video_qops =3D {
> @@ -812,6 +840,7 @@ static const struct v4l2_file_operations cal_fops =3D=
 {
> =20
>  static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
>  {
> +       struct v4l2_subdev *sd =3D ctx->phy->source;
>         struct v4l2_mbus_framefmt mbus_fmt;
>         const struct cal_format_info *fmtinfo;
>         unsigned int i, j, k;
> @@ -831,20 +860,20 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx=
 *ctx)
>                         .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
>                 };
> =20
> -               ret =3D v4l2_subdev_call(ctx->phy->source, pad, enum_mbus=
_code,
> -                                      NULL, &mbus_code);
> +               ret =3D v4l2_subdev_call_state_active(sd, pad, enum_mbus_=
code,
> +                                                   &mbus_code);
>                 if (ret =3D=3D -EINVAL)
>                         break;
> =20
>                 if (ret) {
>                         ctx_err(ctx, "Error enumerating mbus codes in sub=
dev %s: %d\n",
> -                               ctx->phy->source->name, ret);
> +                               sd->name, ret);
>                         return ret;
>                 }
> =20
>                 ctx_dbg(2, ctx,
>                         "subdev %s: code: %04x idx: %u\n",
> -                       ctx->phy->source->name, mbus_code.code, j);
> +                       sd->name, mbus_code.code, j);
> =20
>                 for (k =3D 0; k < cal_num_formats; k++) {
>                         fmtinfo =3D &cal_formats[k];
> @@ -862,7 +891,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *=
ctx)
> =20
>         if (i =3D=3D 0) {
>                 ctx_err(ctx, "No suitable format reported by subdev %s\n",
> -                       ctx->phy->source->name);
> +                       sd->name);
>                 return -EINVAL;
>         }
> =20
> @@ -948,16 +977,52 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
>                 return ret;
>         }
> =20
> -       ret =3D media_create_pad_link(&ctx->phy->subdev.entity,
> -                                   CAL_CAMERARX_PAD_FIRST_SOURCE,
> -                                   &vfd->entity, 0,
> -                                   MEDIA_LNK_FL_IMMUTABLE |
> -                                   MEDIA_LNK_FL_ENABLED);
> -       if (ret) {
> -               ctx_err(ctx, "Failed to create media link for context %u\=
n",
> -                       ctx->dma_ctx);
> -               video_unregister_device(vfd);
> -               return ret;
> +       if (cal_mc_api) {
> +               u16 phy_idx;
> +               u16 pad_idx;
> +
> +               /* Create links from all video nodes to all PHYs */
> +
> +               for (phy_idx =3D 0; phy_idx < ctx->cal->data->num_csi2_ph=
y;
> +                    ++phy_idx) {
> +                       struct media_entity *phy_entity =3D
> +                               &ctx->cal->phy[phy_idx]->subdev.entity;
> +
> +                       for (pad_idx =3D 1; pad_idx < CAL_CAMERARX_NUM_PA=
DS;
> +                            ++pad_idx) {
> +                               /*
> +                                * Enable only links from video0 to PHY0 =
pad 1,
> +                                * and video1 to PHY1 pad 1.
> +                                */
> +                               bool enable =3D (ctx->dma_ctx =3D=3D 0 &&
> +                                              phy_idx =3D=3D 0 && pad_id=
x =3D=3D 1) ||
> +                                             (ctx->dma_ctx =3D=3D 1 &&
> +                                              phy_idx =3D=3D 1 && pad_id=
x =3D=3D 1);
> +
> +                               ret =3D media_create_pad_link(phy_entity,=
 pad_idx,
> +                                       &vfd->entity, 0,
> +                                       enable ? MEDIA_LNK_FL_ENABLED : 0=
);
> +                               if (ret) {
> +                                       ctx_err(ctx,
> +                                               "Failed to create media l=
ink for context %u\n",
> +                                               ctx->dma_ctx);
> +                                       video_unregister_device(vfd);
> +                                       return ret;
> +                               }
> +                       }
> +               }
> +       } else {
> +               ret =3D media_create_pad_link(&ctx->phy->subdev.entity,
> +                                           CAL_CAMERARX_PAD_FIRST_SOURCE,
> +                                           &vfd->entity, 0,
> +                                           MEDIA_LNK_FL_IMMUTABLE | MEDI=
A_LNK_FL_ENABLED);
> +               if (ret) {
> +                       ctx_err(ctx,
> +                               "Failed to create media link for context =
%u\n",
> +                               ctx->dma_ctx);
> +                       video_unregister_device(vfd);
> +                       return ret;
> +               }
>         }
> =20
>         ctx_info(ctx, "V4L2 device registered as %s\n",
> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform=
/ti/cal/cal.c
> index 4bd2092e0255..9389c444400e 100644
> --- a/drivers/media/platform/ti/cal/cal.c
> +++ b/drivers/media/platform/ti/cal/cal.c
> @@ -481,8 +481,9 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
>                 ctx->vc =3D 0;
>                 ctx->datatype =3D CAL_CSI2_CTX_DT_ANY;
>         } else if (!ret) {
> -               ctx_dbg(2, ctx, "Framedesc: len %u, vc %u, dt %#x\n",
> -                       entry.length, entry.bus.csi2.vc, entry.bus.csi2.d=
t);
> +               ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt =
%#x\n",
> +                       entry.stream, entry.length, entry.bus.csi2.vc,
> +                       entry.bus.csi2.dt);
> =20
>                 ctx->vc =3D entry.bus.csi2.vc;
>                 ctx->datatype =3D entry.bus.csi2.dt;
> @@ -490,7 +491,7 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
>                 return ret;
>         }
> =20
> -       ctx->use_pix_proc =3D !ctx->fmtinfo->meta;
> +       ctx->use_pix_proc =3D ctx->vb_vidq.type =3D=3D V4L2_BUF_TYPE_VIDE=
O_CAPTURE;
> =20
>         if (ctx->use_pix_proc) {
>                 ret =3D cal_reserve_pix_proc(ctx->cal);
> @@ -1014,7 +1015,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_de=
v *cal, int inst)
>                 return NULL;
> =20
>         ctx->cal =3D cal;
> -       ctx->phy =3D cal->phy[inst];
>         ctx->dma_ctx =3D inst;
>         ctx->csi2_ctx =3D inst;
>         ctx->cport =3D inst;
> @@ -1226,18 +1226,37 @@ static int cal_probe(struct platform_device *pdev)
>         }
> =20
>         /* Create contexts. */
> -       for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
> -               if (!cal->phy[i]->source_node)
> -                       continue;
> +       if (!cal_mc_api) {
> +               for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
> +                       struct cal_ctx *ctx;
> +
> +                       if (!cal->phy[i]->source_node)
> +                               continue;
> +
> +                       ctx =3D cal_ctx_create(cal, i);
> +                       if (!ctx) {
> +                               cal_err(cal, "Failed to create context %u=
\n", cal->num_contexts);
> +                               ret =3D -ENODEV;
> +                               goto error_context;
> +                       }
> +
> +                       ctx->phy =3D cal->phy[i];
> =20
> -               cal->ctx[cal->num_contexts] =3D cal_ctx_create(cal, i);
> -               if (!cal->ctx[cal->num_contexts]) {
> -                       cal_err(cal, "Failed to create context %u\n", cal=
->num_contexts);
> -                       ret =3D -ENODEV;
> -                       goto error_context;
> +                       cal->ctx[cal->num_contexts++] =3D ctx;
>                 }
> +       } else {
> +               for (i =3D 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> +                       struct cal_ctx *ctx;
> +
> +                       ctx =3D cal_ctx_create(cal, i);
> +                       if (!ctx) {
> +                               cal_err(cal, "Failed to create context %u=
\n", i);
> +                               ret =3D -ENODEV;
> +                               goto error_context;
> +                       }
> =20
> -               cal->num_contexts++;
> +                       cal->ctx[cal->num_contexts++] =3D ctx;
> +               }
>         }
> =20
>         /* Register the media device. */
> diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform=
/ti/cal/cal.h
> index 0856297adc0b..44ee0bece56e 100644
> --- a/drivers/media/platform/ti/cal/cal.h
> +++ b/drivers/media/platform/ti/cal/cal.h
> @@ -45,7 +45,7 @@
> =20
>  #define CAL_CAMERARX_PAD_SINK          0
>  #define CAL_CAMERARX_PAD_FIRST_SOURCE  1
> -#define CAL_CAMERARX_NUM_SOURCE_PADS   1
> +#define CAL_CAMERARX_NUM_SOURCE_PADS   8
>  #define CAL_CAMERARX_NUM_PADS          (1 + CAL_CAMERARX_NUM_SOURCE_PADS)
> =20
>  static inline bool cal_rx_pad_is_sink(u32 pad)
> @@ -319,6 +319,7 @@ const struct cal_format_info *cal_format_by_code(u32 =
code);
> =20
>  void cal_quickdump_regs(struct cal_dev *cal);
> =20
> +struct cal_camerarx *cal_camerarx_get_phy_from_entity(struct media_entit=
y *entity);
>  void cal_camerarx_disable(struct cal_camerarx *phy);
>  void cal_camerarx_i913_errata(struct cal_camerarx *phy);
>  struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>=20
> --=20
> 2.43.0
>

