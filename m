Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8AD1FC229
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 01:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgFPXNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 19:13:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38320 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgFPXNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 19:13:41 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17712F9;
        Wed, 17 Jun 2020 01:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592349218;
        bh=tkznWIvn5yGPxhAASmcfLHvHXGuovs9T7JOthfPwJrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TVHw9A6Bko6DeHO/N8H8Iom9KTq4fsvgH/q3Dc6YruZRuFnyXCk0q3aQpn81RgspZ
         7nloG6r74NsoGrKZnUP91KMWdLPGtlJaAqVeovIoRtMAlAtgP2cSwEk7bSroMCq6es
         uBhhJ5RUWd+OHzL7YLMReNqgNPJpJ+MJGveOelXw=
Date:   Wed, 17 Jun 2020 02:13:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vsagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
Message-ID: <20200616231315.GJ913@pendragon.ideasonboard.com>
References: <20200429141705.18755-1-vishal.sagar@xilinx.com>
 <20200429141705.18755-3-vishal.sagar@xilinx.com>
 <20200506151142.GA15206@pendragon.ideasonboard.com>
 <BY5PR02MB68671D6F4700A66F26562C54A7820@BY5PR02MB6867.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR02MB68671D6F4700A66F26562C54A7820@BY5PR02MB6867.namprd02.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

On Tue, Jun 09, 2020 at 06:23:43PM +0000, Vishal Sagar wrote:
> On Wednesday, May 6, 2020 8:42 PM, Laurent Pinchart wrote:
> > On Wed, Apr 29, 2020 at 07:47:04PM +0530, Vishal Sagar wrote:
> > > The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
> > > streams from SDI sources like SDI broadcast equipment like cameras and
> > > mixers. This block outputs either native SDI, native video or
> > > AXI4-Stream compliant data stream for further processing. Please refer
> > > to PG290 for details.
> > >
> > > The driver is used to configure the IP to add framer, search for
> > > specific modes, get the detected mode, stream parameters, errors, etc.
> > > It also generates events for video lock/unlock, bridge over/under flow.
> > >
> > > The driver supports 10/12 bpc YUV 422 media bus format currently. It also
> > > decodes the stream parameters based on the ST352 packet embedded in the
> > > stream. In case the ST352 packet isn't present in the stream, the core's
> > > detected properties are used to set stream properties.
> > 
> > As commented on patch 1/2, I don't see a mention of 12 bpc in the
> > documentation. Let's discuss it as part of patch 1/2.
> 
> Ok.
> 
> > > The driver currently supports only the AXI4-Stream IP configuration.
> > >
> > > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > > ---
> > > v2
> > > - Added DV timing support based on Hans Verkuilś feedback
> > > - More documentation to custom v4l controls and events
> > > - Fixed Hyunś comments
> > > - Added macro for masking and shifting as per Joe Perches comments
> > > - Updated to latest as per Xilinx github repo driver like
> > >   adding new DV timings not in mainline yet uptill 03/21/20
> > >
> > >  drivers/media/platform/xilinx/Kconfig         |   11 +
> > >  drivers/media/platform/xilinx/Makefile        |    1 +
> > >  .../media/platform/xilinx/xilinx-sdirxss.c    | 2162 +++++++++++++++++
> > >  include/uapi/linux/xilinx-sdirxss.h           |  179 ++
> > >  include/uapi/linux/xilinx-v4l2-controls.h     |   67 +
> > >  5 files changed, 2420 insertions(+)
> > >  create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
> > >  create mode 100644 include/uapi/linux/xilinx-sdirxss.h

[snip]

> > > diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c
> > b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> > > new file mode 100644
> > > index 000000000000..c536ea3aaa0d
> > > --- /dev/null
> > > +++ b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> > > @@ -0,0 +1,2162 @@

[snip]

> > > +/* Maximum number of events per file handle. */
> > > +#define XSDIRX_MAX_EVENTS	(128)
> > 
> > Do we really need such a high number ? How often are the overflow and
> > underflow expected ?
> 
> An overflow or underflow events will occur when a resolution / rate change occurs.
> But since we are stopping the bridges in irq handler, these events will stop coming.
> I can reduce this to 8 events but it is arbitrary. Is that ok?

Yes, I think that's a better value.

[snip]

> > > +/**
> > > + * struct xsdirxss_core - Core configuration SDI Rx Subsystem device structure
> > > + * @dev: Platform structure
> > > + * @iomem: Base address of subsystem
> > > + * @irq: requested irq number
> > > + * @include_edh: EDH processor presence
> > > + * @mode: 3G/6G/12G mode
> > > + * @clks: array of clocks
> > > + * @num_clks: number of clocks
> > > + * @bpc: Bits per component, can be 10 or 12
> > > + */
> > > +struct xsdirxss_core {
> > > +	struct device *dev;
> > > +	void __iomem *iomem;
> > > +	int irq;
> > > +	bool include_edh;
> > > +	int mode;
> > > +	struct clk_bulk_data *clks;
> > > +	int num_clks;
> > 
> > num_clks is never negative, you can make it an unsigned int.
> 
> Ok. I will make num_clks as unsigned int.
> So why devm_clk_bulk_get() and clk_bulk_prepare_enable() take in num_clks argument as int ?

That's a good question. I assume that's because nobody has cared to make
it unsigned. It makes little difference in practice (there's a small
impact on code generation depending on what operation you perform on the
value, but it's usually negligible). Where it makes a difference, I
believe, is in expressing the intent. If you make field unsigned, you
express that it doesn't make sense to assign it a negative value. It's
API documentation in a way. It can also avoid some errors:

struct foo {
	u8 elements[16];
};

int zero_foo_elements(struct foo *foo, int num_elements)
{
	if (num_elements > ARRAY_SIZE(foo->elements))
		return -EOVERFLOW;

	memset(foo->elements, 0, num_elements);

	return 0;
}

If called with a negative value, bad things will happen. If num_elements
was unsigned, there would be no issue. Of course the function could be
written

int zero_foo_elements(struct foo *foo, int num_elements)
{
	if (num_elements < 0 || num_elements > ARRAY_SIZE(foo->elements))
		return -EOVERFLOW;

	memset(foo->elements, 0, num_elements);

	return 0;
}

but it's easy to overlook the need for a < 0 check when there's no valid
use case for passing a negative value.

> > > +	u32 bpc;
> > > +};

[snip]

> > > +/* TODO - Add YUV 444/420 and RBG 10/12 bpc mbus formats here */
> > 
> > s/RBG/RGB/ ?
> > 
> 
> No RBG is correct because as per Xilinx User Guide 934 Figure 1-4 and Table 1-4, 
> the Blue is middle component in the AXI4-Stream protocol followed by all Xilinx Video IPs.
> https://www.xilinx.com/support/documentation/ip_documentation/axi_videoip/v1_0/ug934_axi_videoIP.pdf

Indeed, my bad. I wonder why the AXI4 stream protocol uses RBG, it's a
quite unusual order.

> We will add the RBG 10 and 12 bpc formats later.

[snip]

> > > +
> > > +/**
> > > + * xsdirxss_g_volatile_ctrl - get the Xilinx SDI Rx controls
> > > + * @ctrl: Pointer to V4L2 control
> > > + *
> > > + * Return: 0 on success, errors otherwise
> > > + */
> > > +static int xsdirxss_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	u32 val;
> > > +	struct xsdirxss_state *xsdirxss =
> > > +		container_of(ctrl->handler,
> > > +			     struct xsdirxss_state, ctrl_handler);
> > > +	struct xsdirxss_core *core = &xsdirxss->core;
> > > +	struct device *dev = core->dev;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_XILINX_SDIRX_MODE_DETECT:
> > > +		if (!xsdirxss->vidlocked) {
> > > +			dev_err(dev, "Can't get values when video not locked!\n");
> > > +			return -EINVAL;
> > > +		}
> > > +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> > > +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > > +
> > > +		switch (val) {
> > > +		case XSDIRX_MODE_SD_MASK:
> > > +			ctrl->val = XSDIRX_MODE_SD_OFFSET;
> > > +			break;
> > > +		case XSDIRX_MODE_HD_MASK:
> > > +			ctrl->val = XSDIRX_MODE_HD_OFFSET;
> > > +			break;
> > > +		case XSDIRX_MODE_3G_MASK:
> > > +			ctrl->val = XSDIRX_MODE_3G_OFFSET;
> > > +			break;
> > > +		case XSDIRX_MODE_6G_MASK:
> > > +			ctrl->val = XSDIRX_MODE_6G_OFFSET;
> > > +			break;
> > > +		case XSDIRX_MODE_12GI_MASK:
> > > +			ctrl->val = XSDIRX_MODE_12GI_OFFSET;
> > > +			break;
> > > +		case XSDIRX_MODE_12GF_MASK:
> > > +			ctrl->val = XSDIRX_MODE_12GF_OFFSET;
> > > +			break;
> > > +		}
> > > +		break;
> > 
> > Hans commented that the dv timings structure will report whether the
> > mode is interlaced, I wonder if reporting the SDI mode shouldn't go
> > through that structure too.
> > 
> 
> I don’t know about this. 
> We may add a feature in V4L2 / DRM framework to set / get the SDI modes.

I'd like to get Hans' opinion on this, he has more experience with DV
timings than I do.

> > > +	case V4L2_CID_XILINX_SDIRX_CRC:
> > > +		ctrl->val = xsdirxss_read(core, XSDIRX_CRC_ERRCNT_REG);
> > > +		xsdirxss_write(core, XSDIRX_CRC_ERRCNT_REG, 0xFFFF);
> > > +		break;
> > 
> > Are CRC errors common (and recoverable), or are they rare and fatal
> > errors ? In other words, does this report information that would be
> > classified as link quality, or fatal errors ? In the later case I wonder
> > if an event wouldn't make more sense. It could be reported as another
> > bit in the overflow/underflow event.
> 
> CRC errors will reflect link quality. 
> There is no interrupt for CRC errors. 
> So driver software won't know when to read this register. 
> Also this is specific to Xilinx implementation.

Thanks for the clarification, this makes sense.

> > > +	case V4L2_CID_XILINX_SDIRX_EDH_ERRCNT:
> > > +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> > > +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > > +		if (val == XSDIRX_MODE_SD_MASK) {
> > > +			ctrl->val = xsdirxss_read(core, XSDIRX_EDH_ERRCNT_REG);
> > > +		} else {
> > > +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > 
> > If my understanding of the datasheet is correct, this will be reset for
> > every frame, right ? Reporting the information this way is thus quite
> > racy. Isn't it better to send it through an event ?
> 
> This is not reset per frame. 
> This is an error reporting mechanism that application can use to get errors in stream while 
> running SD modes (720x487 and 720x576).
> So I think it is ok to send it like this.

I'm not sure why I thought it was reset per frame, sorry about the
noise.

> > > +	case V4L2_CID_XILINX_SDIRX_EDH_STATUS:
> > > +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> > > +		val &= XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> > > +		if (val == XSDIRX_MODE_SD_MASK) {
> > > +			ctrl->val = xsdirxss_read(core, XSDIRX_EDH_STAT_REG);
> > > +		} else {
> > > +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > 
> > Same here, seems quite racy.
> > 
> 
> Same here as earlier about EDH Counter. There is no interrupt here too.
> 
> > > +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
> > > +		if (!xsdirxss->vidlocked) {
> > > +			dev_err(dev, "Can't get values when video not
> > locked!\n");
> > > +			return -EINVAL;
> > > +		}
> > > +		ctrl->val = xsdirxss->ts_is_interlaced;
> > > +		break;
> > > +	case V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS:
> > > +		if (!xsdirxss->vidlocked) {
> > > +			dev_err(dev, "Can't get values when video not
> > locked!\n");
> > > +			return -EINVAL;
> > > +		}
> > > +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> > > +		val &= XSDIRX_MODE_DET_STAT_ACT_STREAM_MASK;
> > > +		val >>= XSDIRX_MODE_DET_STAT_ACT_STREAM_OFFSET;
> > > +		ctrl->val = 1 << val;
> > > +		break;
> > > +	case V4L2_CID_XILINX_SDIRX_IS_3GB:
> > > +		if (!xsdirxss->vidlocked) {
> > > +			dev_err(dev, "Can't get values when video not
> > locked!\n");
> > > +			return -EINVAL;
> > > +		}
> > > +		val = xsdirxss_read(core, XSDIRX_MODE_DET_STAT_REG);
> > > +		val &= XSDIRX_MODE_DET_STAT_LVLB_3G_MASK;
> > > +		ctrl->val = val ? true : false;
> > > +		break;
> > 
> > Shouldn't this also go through DV timings ? If not, I think it should at
> > least be combined with V4L2_CID_XILINX_SDIRX_MODE_DETECT.
> 
> I am trying to use the same values to set mode and detect it. 
> As there is no different bit to specifically detect 3GB Mode, hence this differentiation is there.
> I will try to combine this in later patch.
> 
> > > +	default:
> > > +		dev_err(dev, "Get Invalid control id 0x%0x\n", ctrl->id);
> > > +		return -EINVAL;
> > > +	}
> > > +	dev_dbg(dev, "Get ctrl id = 0x%08x val = 0x%08x\n", ctrl->id,
> > > +		ctrl->val);
> > 
> > I would drop this line.
> > 
> 
> Ok I will remove this in next patch.
> 
> > > +	return 0;
> > > +}

[snip]

> > > +static int xsdirxss_parse_of(struct xsdirxss_state *xsdirxss)
> > > +{
> > > +	struct device_node *node = xsdirxss->core.dev->of_node;
> > > +	struct xsdirxss_core *core = &xsdirxss->core;
> > > +	struct device *dev = core->dev;
> > > +	struct fwnode_handle *ep, *rep;
> > > +	int ret;
> > > +	const char *sdi_std;
> > > +
> > > +	core->include_edh = of_property_read_bool(node, "xlnx,include-edh");
> > > +	dev_dbg(dev, "EDH property = %s\n",
> > > +		core->include_edh ? "Present" : "Absent");
> > > +
> > > +	ret = of_property_read_string(node, "xlnx,line-rate", &sdi_std);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "xlnx,line-rate property not found\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (!strncmp(sdi_std, "12G_SDI_8DS", XSDIRX_MAX_STR_LENGTH)) {
> > 
> > Strings in DT are null-terminated, you can use strcmp() and drop
> > XSDIRX_MAX_STR_LENGTH.
> 
> I will remove the strings from DT and have values 0, 1 and 2 to
> represent 3G, 6G and 12G 8DS mode configurations.

Then please add a header file in include/dt-bindings/media with macros
for these values. An alternative would be to use 3, 6 and 12
respectively, in which case we could do without macros I think. I'm
fine with either option.

> > > +		core->mode = XSDIRXSS_SDI_STD_12G_8DS;
> > > +	} else if (!strncmp(sdi_std, "6G_SDI", XSDIRX_MAX_STR_LENGTH)) {
> > > +		core->mode = XSDIRXSS_SDI_STD_6G;
> > > +	} else if (!strncmp(sdi_std, "3G_SDI", XSDIRX_MAX_STR_LENGTH)) {
> > > +		core->mode = XSDIRXSS_SDI_STD_3G;
> > > +	} else {
> > > +		dev_err(dev, "Invalid Line Rate\n");
> > > +		return -EINVAL;
> > > +	}
> > > +	dev_dbg(dev, "SDI Rx Line Rate = %s, mode = %d\n", sdi_std,
> > > +		core->mode);
> > > +
> > > +	ret = of_property_read_u32(node, "xlnx,bpp", &core->bpc);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "failed to get xlnx,bpp\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (core->bpc != 10 && core->bpc != 12) {
> > > +		dev_err(dev, "bits per component=%u. Can be 10 or 12 only\n",
> > > +			core->bpc);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > > +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> > > +	if (!ep) {
> > > +		dev_err(dev, "no source port found");
> > > +		ret = -EINVAL;
> > > +		goto dt_parse_done;
> > > +	}
> > > +
> > > +	rep = fwnode_graph_get_remote_endpoint(ep);
> > > +	if (!rep) {
> > > +		dev_err(dev, "no remote sink endpoint found");
> > > +		ret = -EINVAL;
> > > +	}
> > 
> > I don't think you need to check this, the subdev won't be linked
> > properly in the pipeline if there's no port anyway.
> 
> Ok. I thought it was subdev driver's responsibility to validate this too. Hence added. 
> I will remove this parsing in the next version.
> 
> > > +
> > > +	fwnode_handle_put(rep);
> > > +dt_parse_done:
> > > +	fwnode_handle_put(ep);
> > > +	return ret;
> > > +}

[snip]

-- 
Regards,

Laurent Pinchart
