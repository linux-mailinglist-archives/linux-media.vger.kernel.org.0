Return-Path: <linux-media+bounces-36913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9670BAFA7AC
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 22:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED9F8177454
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 20:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D20E1E1DE3;
	Sun,  6 Jul 2025 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BjsuH+vG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B3DBE5E;
	Sun,  6 Jul 2025 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751833842; cv=none; b=Ik+44MOJ46kdtYTWvTorJ9uww7JOdxhqdClMrA+2zuWP+lrGT9oLx+id9+UoqmdSaUS9mdKuA9AcoPqlT9qpPXJfHK5Ru7pbdOeweJQQZ1DdIH5rTdgJmukdDEtwY5wqHOJropMiQAspqBxvCZVOzfFHeSOYmdK/VXNoezypv4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751833842; c=relaxed/simple;
	bh=4KKPc3m+yLU4QwuNYvv1xkpCbhHNx6yQQFdBuvR2CGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6hdk9X59qpVaIvzIyPpzk/BNs/IACTDCkKxvBvq6axC+dMcr4g+0lHGKtlXU5jssGVFc7dT6spPgrDd+mGvLYVfTMuuPU6ec3Szy6Q4p3nK/ZSO7ncVdVeJDW1rntlMH4pJ+TtltCknHjnfVlq08jMu9Smpkz4n9qcg9vARWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BjsuH+vG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 335D5AD0;
	Sun,  6 Jul 2025 22:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751833810;
	bh=4KKPc3m+yLU4QwuNYvv1xkpCbhHNx6yQQFdBuvR2CGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjsuH+vGlm4G1SB0TCa3uQH/epp2ImFJhZTpzYxlPY8PdtuiknDIcYLOEGYuEbA3C
	 rpeJLXd/RFcdHj4RBEQMSWJwreIvVsM3B11ygywxh3unQBzaUx5Vq+2w5PBahip8dU
	 468qEjctc8Ew7t5e2jnqeQYMQ30dmUzQJV6y/4QU=
Date: Sun, 6 Jul 2025 23:30:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Will Whang <will@willwhang.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:SONY IMX585 SENSOR DRIVER" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
Message-ID: <20250706203007.GB1821@pendragon.ideasonboard.com>
References: <20250702063836.3984-1-will@willwhang.com>
 <20250702063836.3984-4-will@willwhang.com>
 <20250703175121.GA17709@pendragon.ideasonboard.com>
 <CAFoNnrx-YpQwY6_908x=8LK1uwWw0y5zKxsv+aTsW1fxX554vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFoNnrx-YpQwY6_908x=8LK1uwWw0y5zKxsv+aTsW1fxX554vg@mail.gmail.com>

Hi Will,

On Sun, Jul 06, 2025 at 12:09:26AM -0700, Will Whang wrote:
> Hi Laurent,
> 
> Thanks for the feedback, I really appreciate it.
> Most if not all the feedback is straightforward to fix, but I do encounter
> a few problems when trying to incorporate all the feedback
> Reply inline.
> (resend this email for reply all)
> Thanks,
> WillWhang
> 
> On Thu, Jul 3, 2025 at 10:51 AM Laurent Pinchart wrote:
> > Hi Will,
> >
> > Thank you for the patch.
> >
> > Here's a first review, focussing on API usage and coding style.
> >
> > On Wed, Jul 02, 2025 at 07:38:35AM +0100, Will Whang wrote:
> > > Implements support for:
> > >   * 4-lane / 2-lane CSI-2
> > >   * 12-bit linear, 12-bit HDR-GC and 16-bit Clear-HDR modes
> > >   * Mono variant switch, HCG, custom HDR controls
> > >   * Tested on Raspberry Pi 4/5 with 24 MHz XCLK.
> > >
> > > Signed-off-by: Will Whang <will@willwhang.com>
> > > ---
> > >  drivers/media/i2c/Kconfig  |    9 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/imx585.c | 2466 ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 2476 insertions(+)
> > >  create mode 100644 drivers/media/i2c/imx585.c

[snip]

> > > diff --git a/drivers/media/i2c/imx585.c b/drivers/media/i2c/imx585.c
> > > new file mode 100644
> > > index 000000000..2c4212290
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx585.c
> > > @@ -0,0 +1,2466 @@

[snip]

> > > +struct imx585 {
> > > +     struct v4l2_subdev sd;
> > > +     struct media_pad pad[NUM_PADS];
> > > +
> > > +     unsigned int fmt_code;
> >
> > Please use the v4l2_subdev active state API to replace this. You will
> > need to call v4l2_subdev_init_finalize(), and the V4L2 framework will
> > allocate a v4l2_subdev_state instance for the active state. Most subdev
> > operations won't have to test for V4L2_SUBDEV_FORMAT_ACTIVE or
> > V4L2_SUBDEV_FORMAT_TRY, and will simply store data in the state passed
> > to the function. See commit e8a5b1df000e ("media: i2c: imx219: Use
> > subdev active state") for an example.
> 
> I've tried to update the code to use active state API looking at the
> examples but I keep getting kernel error on
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000008
> [    3.830058]  imx585_set_ctrl+0x58/0xc10 [imx585]
> [    3.834689]  try_or_set_cluster+0x19c/0x2e0 [videodev]
> [    3.839859]  set_ctrl+0xb4/0x100 [videodev]
> [    3.844066]  __v4l2_ctrl_modify_range+0x144/0x1e8 [videodev]
> [    3.849756]  imx585_set_framing_limits+0x180/0x298 [imx585]
> [    3.855347]  imx585_probe+0x980/0xb28 [imx585]
> 
> When probing, the driver tries to update the pixel rate with
> __v4l2_ctrl_modify_range but s_ctrl is dereferencing a NULL pointer
> somewhere here in imx585_set_ctrl.
> 
> state = v4l2_subdev_get_locked_active_state(&imx585->sd);
> fmt = v4l2_subdev_state_get_format(state, 0);
> get_mode_table(imx585, fmt->code, &mode_list, &num_modes);
> mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
>      fmt->width, fmt->height);

You will need to move the imx585_set_framing_limits() call from
imx585_init_controls() to a later point at probe time, after
v4l2_subdev_init_finalize().

> Is it really required to use active state API? I feel like the modification
> I've done is just replacing one line of code with a few more just to get
> the same imx585->mode and imx585->fmt_code.

Yes, all new drivers should use it. It is required to support new
features, and will increasingly become a mandatory building block as we
move forward.

> > > +
> > > +     struct clk *xclk;
> > > +     u32 xclk_freq;
> > > +
> > > +     /* chosen INCK_SEL register value */
> > > +     u8  inck_sel_val;
> > > +
> > > +     /* Link configurations */
> > > +     unsigned int lane_count;
> > > +     unsigned int link_freq_idx;
> > > +
> > > +     struct gpio_desc *reset_gpio;
> > > +     struct regulator_bulk_data supplies[imx585_NUM_SUPPLIES];
> > > +
> > > +     struct v4l2_ctrl_handler ctrl_handler;
> > > +
> > > +     /* V4L2 Controls */
> > > +     struct v4l2_ctrl *pixel_rate;
> > > +     struct v4l2_ctrl *link_freq;
> > > +     struct v4l2_ctrl *exposure;
> > > +     struct v4l2_ctrl *gain;
> > > +     struct v4l2_ctrl *hcg_ctrl;
> > > +     struct v4l2_ctrl *vflip;
> > > +     struct v4l2_ctrl *hflip;
> > > +     struct v4l2_ctrl *vblank;
> > > +     struct v4l2_ctrl *hblank;
> > > +     struct v4l2_ctrl *blacklevel;
> > > +
> > > +     /* V4L2 HDR Controls */
> > > +     struct v4l2_ctrl *hdr_mode;
> > > +     struct v4l2_ctrl *datasel_th_ctrl;
> > > +     struct v4l2_ctrl *datasel_bk_ctrl;
> > > +     struct v4l2_ctrl *gdc_th_ctrl;
> > > +     struct v4l2_ctrl *gdc_exp_ctrl_l;
> > > +     struct v4l2_ctrl *gdc_exp_ctrl_h;
> > > +     struct v4l2_ctrl *hdr_gain_ctrl;
> > > +
> > > +     /* V4L2 IR Cut filter switch Controls */
> > > +     bool   has_ircut;
> > > +     struct v4l2_ctrl   *ircut_ctrl;
> > > +     struct i2c_client  *ircut_client;
> > > +
> > > +     /* Current mode */
> > > +     const struct imx585_mode *mode;
> >
> > This should be dropped too, the imx585_mode instance should be lookup up
> > based on the v4l2_subdev_state.
> 
> > > +
> > > +     /* HCG enabled flag*/
> > > +     bool hcg;
> > > +
> > > +     /* Mono mode */
> > > +     bool mono;
> > > +
> > > +     /* Clear HDR mode */
> > > +     bool clear_HDR;
> >
> > All variables must be lower case.
> >
> Updated.
> 
> > > +
> > > +     /* Sync Mode*/
> > > +     /* 0 = Internal Sync Leader Mode
> > > +      * 1 = External Sync Leader Mode
> > > +      * 2 = Follower Mode
> > > +      * The datasheet wording is very confusing but basically:
> > > +      * Leader Mode = Sensor using internal clock to drive the sensor
> > > +      * But with external sync mode you can send a XVS input so the sensor
> > > +      * will try to align with it.
> > > +      * For Follower mode it is purely driven by external clock.
> > > +      * In this case you need to drive both XVS and XHS.
> > > +      */
> > > +     u32 sync_mode;
> > > +
> > > +     /* Tracking sensor VMAX/HMAX value */
> > > +     u16 HMAX;
> > > +     u32 VMAX;
> > > +
> > > +     /*
> > > +      * Mutex for serialized access:
> > > +      * Protect sensor module set pad format and start/stop streaming safely.
> > > +      */
> > > +     struct mutex mutex;
> >
> > You will be able to drop this when switching to the v4l2_subdev active
> > state API.
> >
> > > +
> > > +     /* Streaming on/off */
> > > +     bool streaming;
> > > +
> > > +     /* Rewrite common registers on stream on? */
> > > +     bool common_regs_written;
> > > +};

[snip]

> > > +/* ------------------------------------------------------------------
> > > + * Optional IR-cut helper
> > > + * ------------------------------------------------------------------
> > > + */
> > > +
> > > +/* One-byte “command” sent to the IR-cut MCU at imx585->ircut_client
> >  */
> >
> > Is that MCU integrated in the camera sensor, or in the camera module ?
> >
> In the camera module, a separate MCU is reading the instructions.

Then it should be handled by a separate driver, with a separate DT node.

[snip]

> > > +static int imx585_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >
> > This should be dropped and replaced by the .init_state() operation.
> >
> Will do, is this related to the active state API?

It's needed for the active state API, but is recommended even without
it.

> > > +{
> > > +     struct imx585 *imx585 = to_imx585(sd);
> > > +     struct v4l2_mbus_framefmt *try_fmt_img =
> > > +             v4l2_subdev_state_get_format(fh->state, IMAGE_PAD);
> > > +     struct v4l2_mbus_framefmt *try_fmt_meta =
> > > +             v4l2_subdev_state_get_format(fh->state, METADATA_PAD);
> > > +     struct v4l2_rect *try_crop;
> > > +
> > > +     mutex_lock(&imx585->mutex);
> > > +
> > > +     /* Initialize try_fmt for the image pad */
> > > +     try_fmt_img->width = supported_modes[0].width;
> > > +     try_fmt_img->height = supported_modes[0].height;
> > > +     if (imx585->mono)
> > > +             try_fmt_img->code = imx585_get_format_code(imx585, MEDIA_BUS_FMT_Y12_1X12);
> > > +     else
> > > +             try_fmt_img->code = imx585_get_format_code(imx585, MEDIA_BUS_FMT_SRGGB12_1X12);
> > > +
> > > +     try_fmt_img->field = V4L2_FIELD_NONE;
> > > +
> > > +     /* Initialize try_fmt for the embedded metadata pad */
> > > +     try_fmt_meta->width = IMX585_EMBEDDED_LINE_WIDTH;
> > > +     try_fmt_meta->height = IMX585_NUM_EMBEDDED_LINES;
> > > +     try_fmt_meta->code = MEDIA_BUS_FMT_SENSOR_DATA;
> > > +     try_fmt_meta->field = V4L2_FIELD_NONE;
> > > +
> > > +     /* Initialize try_crop */
> > > +     try_crop = v4l2_subdev_state_get_crop(fh->state, IMAGE_PAD);
> > > +     try_crop->left = IMX585_PIXEL_ARRAY_LEFT;
> > > +     try_crop->top = IMX585_PIXEL_ARRAY_TOP;
> > > +     try_crop->width = IMX585_PIXEL_ARRAY_WIDTH;
> > > +     try_crop->height = IMX585_PIXEL_ARRAY_HEIGHT;
> > > +
> > > +     mutex_unlock(&imx585->mutex);
> > > +
> > > +     return 0;
> > > +}

[snip]

> > > +static void imx585_update_hmax(struct imx585 *imx585)
> > > +{
> > > +     struct i2c_client *client = v4l2_get_subdevdata(&imx585->sd);
> >
> > Store the struct device pointer in struct imx585 and use it instead of
> > client->dev. This should drop most usages of i2c_client from the driver.
> >
> Updated.
> 
> > > +
> > > +     const u32 base_4lane = HMAX_table_4lane_4K[imx585->link_freq_idx];
> > > +     const u32 lane_scale = (imx585->lane_count == 2) ? 2 : 1;
> > > +     const u32 factor     = base_4lane * lane_scale;
> > > +     const u32 hdr_factor = (imx585->clear_HDR) ? 2 : 1;
> > > +
> > > +     dev_info(&client->dev, "Upadte minimum HMAX\n");
> > > +     dev_info(&client->dev, "\tbase_4lane: %d\n", base_4lane);
> > > +     dev_info(&client->dev, "\tlane_scale: %d\n", lane_scale);
> > > +     dev_info(&client->dev, "\tfactor: %d\n", factor);
> > > +     dev_info(&client->dev, "\thdr_factor: %d\n", hdr_factor);
> >
> > This makes the driver way too chatty. The messages should be demoted to
> > dev_dbg(), or dropped.
> 
> Will do, but is there a recommended way to have a debug flag that will work
> without recompiling the linux kernel with dynamic debugging support?
> Raspberry Pi Kernel currently does not have it enabled by default so I want
> to have a way to support enabling full logging via either dev_dbg or module
> parameters.

I'm afraid you need to either enable dynamic debugging, or #define DEBUG
at the beginning of the file to get the dev_dbg() messages. Dynamic
debug is the recommended option.

> > > +
> > > +     for (unsigned int i = 0; i < ARRAY_SIZE(supported_modes); ++i) {
> > > +             u32 h = factor / supported_modes[i].hmax_div;
> > > +             u64 v = IMX585_VMAX_DEFAULT * hdr_factor;
> > > +
> > > +             supported_modes[i].min_HMAX     = h;
> > > +             supported_modes[i].default_HMAX = h;
> > > +             supported_modes[i].min_VMAX     = v;
> > > +             supported_modes[i].default_VMAX = v;
> > > +             dev_info(&client->dev, "\tvmax: %lld x hmax: %d\n", v, h);
> > > +     }
> > > +}

[snip]

> > > +static const struct v4l2_subdev_video_ops imx585_video_ops = {
> > > +     .s_stream = imx585_set_stream,
> >
> > Please implement the .enable_streams() and .disable_streams() pad
> > ops, and use v4l2_subdev_s_stream_helper here.
> 
> Is this related to active API?

It's a preparation for future changes. The .s_stream() operation doesn't
properly support multiple streams, which will be required for embedded
data support. New drivers should use .enable_streams() and
.disable_streams(), and those operations indeed assume usage of the
active state API.

> > > +};

[snip]

> > > +static int imx585_check_hwcfg(struct device *dev, struct imx585 *imx585)
> > > +{
> > > +     struct fwnode_handle *endpoint;
> >
> >         struct fwnode_handle *endpoint __free(fwnode_handle_put) = NULL;
> >
> > and rop the fwnode_handle_put() call below. That will simplify error
> > handling.
> 
> For some reason when I tried this, gcc showed an error for me.

Sorry, it should have been __free(fwnode_handle).

> > > +     struct v4l2_fwnode_endpoint ep_cfg = {
> > > +             .bus_type = V4L2_MBUS_CSI2_DPHY
> > > +     };
> > > +     int ret = -EINVAL;
> > > +     int i;
> > > +
> > > +     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > > +     if (!endpoint) {
> > > +             dev_err(dev, "endpoint node not found\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > > +             dev_err(dev, "could not parse endpoint\n");
> > > +             goto error_out;
> > > +     }
> > > +
> > > +     /* Check the number of MIPI CSI2 data lanes */
> > > +     if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 && ep_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> > > +             dev_err(dev, "only 2 or 4 data lanes are currently supported\n");
> > > +             goto error_out;
> > > +     }
> > > +     imx585->lane_count = ep_cfg.bus.mipi_csi2.num_data_lanes;
> > > +     dev_info(dev, "Data lanes: %d\n", imx585->lane_count);
> > > +
> > > +     /* Check the link frequency set in device tree */
> > > +     if (!ep_cfg.nr_of_link_frequencies) {
> > > +             dev_err(dev, "link-frequency property not found in DT\n");
> > > +             goto error_out;
> > > +     }
> > > +
> > > +     for (i = 0; i < ARRAY_SIZE(link_freqs); i++) {
> > > +             if (link_freqs[i] == ep_cfg.link_frequencies[0]) {
> > > +                     imx585->link_freq_idx = i;
> > > +                     break;
> > > +             }
> > > +     }
> > > +
> > > +     if (i == ARRAY_SIZE(link_freqs)) {
> > > +             dev_err(dev, "Link frequency not supported: %lld\n",
> > > +                     ep_cfg.link_frequencies[0]);
> > > +                     ret = -EINVAL;
> > > +                     goto error_out;
> > > +     }
> > > +
> > > +     dev_info(dev, "Link Speed: %lld Mhz\n", ep_cfg.link_frequencies[0]);
> > > +
> > > +     ret = 0;
> > > +
> > > +error_out:
> > > +     v4l2_fwnode_endpoint_free(&ep_cfg);
> > > +     fwnode_handle_put(endpoint);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int imx585_probe(struct i2c_client *client)
> > > +{
> > > +     struct device *dev = &client->dev;
> > > +     struct device_node  *np;
> > > +     struct imx585 *imx585;
> > > +     const struct of_device_id *match;
> > > +     int ret, i;
> > > +     u32 sync_mode;
> > > +
> > > +     imx585 = devm_kzalloc(&client->dev, sizeof(*imx585), GFP_KERNEL);
> > > +     if (!imx585)
> > > +             return -ENOMEM;
> > > +
> > > +     v4l2_i2c_subdev_init(&imx585->sd, client, &imx585_subdev_ops);
> > > +
> > > +     match = of_match_device(imx585_dt_ids, dev);
> > > +     if (!match)
> > > +             return -ENODEV;
> >
> > This doesn't seem needed.
> 
> Updated.
> 
> > > +
> > > +     dev_info(dev, "Reading dtoverlay config:\n");
> > > +     imx585->mono = of_property_read_bool(dev->of_node, "mono-mode");
> >
> > Mono sensors should be detected based on the compatible string, not with
> > a separate property.
> 
> Updated.
> But will it cause issues for libcamera such that the ipa doesn't know which
> tuning file to use?

Userspace should be able to tell the models apart based on the reported
media bus code (MEDIA_BUS_FMT_Y12_1X12 vs. MEDIA_BUS_FMT_SGBRG12_1X12).

> > > +     if (imx585->mono)
> > > +             dev_info(dev, "Mono Mode Selected, make sure you have the correct sensor variant\n");
> > > +
> > > +     imx585->clear_HDR = of_property_read_bool(dev->of_node,
> > "clearHDR-mode");
> >
> > This doesn't seem to belong to DT, as it's a runtime option.
> 
> Updated, I removed the clearHDR-mode option in DT, was originally for setup
> the sensor with clearHDR mode directly.
> 
> > > +     dev_info(dev, "ClearHDR: %d\n", imx585->clear_HDR);
> > > +
> > > +     imx585->sync_mode = 0;
> > > +     ret = of_property_read_u32(dev->of_node, "sync-mode", &sync_mode);
> > > +     if (!ret) {
> > > +             if (sync_mode > 2) {
> > > +                     dev_warn(dev, "sync-mode out of range, using 0\n");
> > > +                     sync_mode = 0;
> > > +             }
> > > +             imx585->sync_mode = sync_mode;
> > > +     } else if (ret != -EINVAL) {          /* property present but bad */
> > > +             dev_err(dev, "sync-mode malformed (%pe)\n", ERR_PTR(ret));
> > > +             return ret;
> > > +     }
> > > +     dev_info(dev, "Sync Mode: %s\n", sync_mode_menu[imx585->sync_mode]);
> > > +
> > > +     /* Check the hardware configuration in device tree */
> > > +     if (imx585_check_hwcfg(dev, imx585))
> > > +             return -EINVAL;
> > > +
> > > +     /* Get system clock (xclk) */
> > > +     imx585->xclk = devm_clk_get(dev, NULL);
> > > +     if (IS_ERR(imx585->xclk)) {
> > > +             dev_err(dev, "failed to get xclk\n");
> > > +             return PTR_ERR(imx585->xclk);
> > > +     }
> > > +
> > > +     imx585->xclk_freq = clk_get_rate(imx585->xclk);
> > > +
> > > +     for (i = 0; i < ARRAY_SIZE(imx585_inck_table); ++i) {
> > > +             if (imx585_inck_table[i].xclk_hz == imx585->xclk_freq) {
> > > +                     imx585->inck_sel_val = imx585_inck_table[i].inck_sel;
> > > +                     break;
> > > +             }
> > > +     }
> > > +
> > > +     if (i == ARRAY_SIZE(imx585_inck_table)) {
> > > +             dev_err(dev, "unsupported XCLK rate %u Hz\n",
> > > +                     imx585->xclk_freq);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     dev_info(dev, "XCLK %u Hz → INCK_SEL 0x%02x\n",
> > > +              imx585->xclk_freq, imx585->inck_sel_val);
> > > +
> > > +     ret = imx585_get_regulators(imx585);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed to get regulators\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     /* Request optional enable pin */
> > > +     imx585->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > +                                                  GPIOD_OUT_HIGH);
> > > +
> > > +     /*
> > > +      * The sensor must be powered for imx585_check_module_exists()
> > > +      * to be able to read register
> > > +      */
> > > +     ret = imx585_power_on(dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret = imx585_check_module_exists(imx585);
> > > +     if (ret)
> > > +             goto error_power_off;
> > > +
> > > +     imx585->has_ircut     = false;
> > > +     imx585->ircut_client  = NULL;
> > > +
> > > +     if (of_property_read_bool(dev->of_node, "ircut-mode")) {
> > > +             np = of_parse_phandle(dev->of_node, "ircut-controller", 0);
> > > +             if (np) {
> > > +                     imx585->ircut_client = of_find_i2c_device_by_node(np);
> > > +                     of_node_put(np);
> > > +                     ret = imx585_ircut_write(imx585, 0x01);
> > > +                     if (!ret) {
> > > +                             imx585->has_ircut    = true;
> > > +                             dev_info(dev, "IR-cut controller present at 0x%02x\n",
> > > +                                      imx585->ircut_client->addr);
> > > +                     } else {
> > > +                             dev_info(dev,
> > > +                                      "Can't communication with IR-cut control, dropping\n");
> > > +                     }
> > > +             }
> > > +     } else {
> > > +             dev_info(dev, "No IR-cut controller\n");
> > > +     }
> > > +
> > > +     /* Initialize default format */
> > > +     imx585_set_default_format(imx585);
> > > +
> > > +     /* Enable runtime PM and turn off the device */
> > > +     pm_runtime_set_active(dev);
> > > +     pm_runtime_enable(dev);
> > > +     pm_runtime_idle(dev);
> >
> > It would be best to use PM runtime autosuspend. See the imx296 driver
> > for an example.
> 
> Will update for V2.
> 
> > > +
> > > +     /* This needs the pm runtime to be registered. */
> > > +     ret = imx585_init_controls(imx585);
> > > +     if (ret)
> > > +             goto error_pm_runtime;
> > > +
> > > +     /* Initialize subdev */
> > > +     imx585->sd.internal_ops = &imx585_internal_ops;
> > > +     imx585->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > +                             V4L2_SUBDEV_FL_HAS_EVENTS;
> > > +     imx585->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +
> > > +     /* Initialize source pads */
> > > +     imx585->pad[IMAGE_PAD].flags = MEDIA_PAD_FL_SOURCE;
> > > +     imx585->pad[METADATA_PAD].flags = MEDIA_PAD_FL_SOURCE;
> > > +
> > > +     ret = media_entity_pads_init(&imx585->sd.entity, NUM_PADS, imx585->pad);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed to init entity pads: %d\n", ret);
> > > +             goto error_handler_free;
> > > +     }
> > > +
> > > +     ret = v4l2_async_register_subdev_sensor(&imx585->sd);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> > > +             goto error_media_entity;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +error_media_entity:
> > > +     media_entity_cleanup(&imx585->sd.entity);
> > > +
> > > +error_handler_free:
> > > +     imx585_free_controls(imx585);
> > > +
> > > +error_pm_runtime:
> > > +     pm_runtime_disable(&client->dev);
> > > +     pm_runtime_set_suspended(&client->dev);
> > > +
> > > +error_power_off:
> > > +     imx585_power_off(&client->dev);
> > > +
> > > +     return ret;
> > > +}

[snip]

-- 
Regards,

Laurent Pinchart

