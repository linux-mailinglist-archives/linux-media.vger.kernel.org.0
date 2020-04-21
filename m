Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116941B23DB
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 12:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgDUKaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 06:30:12 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:34187 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727120AbgDUKaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 06:30:11 -0400
Received: from [37.161.214.89] (port=49522 helo=[192.168.42.159])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jQqAA-009drc-8X; Tue, 21 Apr 2020 12:30:02 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v11 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
To:     Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hyun Kwon <hyun.kwon@xilinx.com>
References: <20200409194424.45555-1-vishal.sagar@xilinx.com>
 <20200409194424.45555-3-vishal.sagar@xilinx.com>
Message-ID: <4331afd6-3891-2dd5-b5b8-2ffc5d1cbed5@lucaceresoli.net>
Date:   Tue, 21 Apr 2020 12:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409194424.45555-3-vishal.sagar@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

thanks for having resumed this patchset!

On 09/04/20 21:44, Vishal Sagar wrote:
[...]
> +static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
> +{
> +	struct xcsi2rxss_core *core = &xcsi2rxss->core;
> +	struct device_node *node = xcsi2rxss->core.dev->of_node;

Can be simplified as:

	struct device_node *node = core.dev->of_node;

> +	unsigned int nports, irq;
> +	bool en_csi_v20, vfb;
> +	int ret;
> +
> +	en_csi_v20 = of_property_read_bool(node, "xlnx,en-csi-v2-0");
> +	if (en_csi_v20)
> +		core->en_vcx = of_property_read_bool(node, "xlnx,en-vcx");
> +
> +	core->enable_active_lanes =
> +		of_property_read_bool(node, "xlnx,en-active-lanes");
> +
> +	ret = of_property_read_u32(node, "xlnx,csi-pxl-format",
> +				   &core->datatype);
> +	if (ret < 0) {
> +		dev_err(core->dev, "missing xlnx,csi-pxl-format property\n");
> +		return ret;
> +	}
> +
> +	switch (core->datatype) {
> +	case XCSI_DT_YUV4228B:
> +	case XCSI_DT_RGB444:
> +	case XCSI_DT_RGB555:
> +	case XCSI_DT_RGB565:
> +	case XCSI_DT_RGB666:
> +	case XCSI_DT_RGB888:
> +	case XCSI_DT_RAW6:
> +	case XCSI_DT_RAW7:
> +	case XCSI_DT_RAW8:
> +	case XCSI_DT_RAW10:
> +	case XCSI_DT_RAW12:
> +	case XCSI_DT_RAW14:
> +		break;
> +	case XCSI_DT_YUV42210B:
> +	case XCSI_DT_RAW16:
> +	case XCSI_DT_RAW20:
> +		if (!en_csi_v20) {
> +			ret = -EINVAL;
> +			dev_dbg(core->dev, "enable csi v2 for this pixel format");
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +	if (ret < 0) {
> +		dev_err(core->dev, "invalid csi-pxl-format property!\n");
> +		return ret;
> +	}
> +
> +	vfb = of_property_read_bool(node, "xlnx,vfb");
> +	if (!vfb) {
> +		dev_err(core->dev, "failed as VFB is disabled!\n");
> +		return -EINVAL;
> +	}
> +
> +	for (nports = 0; nports < XCSI_MEDIA_PADS; nports++) {
> +		struct fwnode_handle *ep;
> +		struct v4l2_fwnode_endpoint vep = {
> +			.bus_type = V4L2_MBUS_CSI2_DPHY
> +		};
> +
> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(core->dev),
> +						     nports, 0,
> +						     FWNODE_GRAPH_ENDPOINT_NEXT);
> +		if (!ep)
> +			break;
> +		/*
> +		 * since first port is sink port and it contains
> +		 * all info about data-lanes and cfa-pattern,
> +		 * don't parse second port but only check if exists
> +		 */
> +		if (nports == XVIP_PAD_SOURCE) {
> +			dev_dbg(core->dev, "no need to parse source port");
> +			fwnode_handle_put(ep);
> +			continue;
> +		}
> +
> +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +		if (ret) {
> +			dev_err(core->dev, "error parsing sink port");
> +			fwnode_handle_put(ep);
> +			return ret;
> +		}
> +
> +		dev_dbg(core->dev, "port %d bus type = %d\n", nports,
> +			vep.bus_type);
> +
> +		if (vep.bus_type == V4L2_MBUS_CSI2_DPHY) {
> +			dev_dbg(core->dev, "base.port = %d base.id = %d\n",
> +				vep.base.port, vep.base.id);
> +
> +			dev_dbg(core->dev, "mipi number lanes = %d\n",
> +				vep.bus.mipi_csi2.num_data_lanes);
> +
> +			core->max_num_lanes =
> +				vep.bus.mipi_csi2.num_data_lanes;
> +		}
> +		fwnode_handle_put(ep);
> +	}
> +
> +	if (nports != XCSI_MEDIA_PADS) {
> +		dev_err(core->dev, "invalid number of ports %u\n", nports);
> +		return -EINVAL;
> +	}
> +
> +	/* Register interrupt handler */
> +	irq = irq_of_parse_and_map(node, 0);
> +	ret = devm_request_irq(core->dev, irq, xcsi2rxss_irq_handler,
> +			       IRQF_SHARED, "xilinx-csi2rxss", xcsi2rxss);
> +	if (ret) {
> +		dev_err(core->dev, "Err = %d Interrupt handler reg failed!\n",
> +			ret);
> +		return ret;
> +	}

When using this driver I have changed this to a threaded IRQ, moving
most of the management out of interrupt context. The patch is super
simple and it works fine, for my use case at least. Do you think a
strict IRQ is really needed for some reason?

> +	xcsi2rxss_log_ipconfig(xcsi2rxss);
> +
> +	return 0;

This function references 'core->dev' a lot of times, so I'd rather add
at the top of the function:

  struct device * const dev = &pdev->dev;

and then use simply 'dev' everywhere. This would keep lines shorter and
more readable. It is also handy when copying/moving a line of code from
one function to another if all of them have 'dev' called the same way so
I tend to do use this pattern often.

> +}
> +
> +static int xcsi2rxss_probe(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev;
> +	struct xcsi2rxss_state *xcsi2rxss;
> +	struct xcsi2rxss_core *core;
> +	struct resource *res;
> +	int num_clks = ARRAY_SIZE(xcsi2rxss_clks);
> +	int ret;
> +
> +	xcsi2rxss = devm_kzalloc(&pdev->dev, sizeof(*xcsi2rxss), GFP_KERNEL);
> +	if (!xcsi2rxss)
> +		return -ENOMEM;
> +
> +	core = &xcsi2rxss->core;
> +	core->dev = &pdev->dev;

This function references 'dev' many times, sometimes as &pdev->dev,
thers as 'core->dev', thus as above why not adding at the top of the
function:

  struct device * const dev = &pdev->dev;

and simplify code using 'dev' always?

> +	core->clks = devm_kmemdup(core->dev, xcsi2rxss_clks,
> +				  sizeof(xcsi2rxss_clks), GFP_KERNEL);
> +	if (!core->clks)
> +		return -ENOMEM;
> +
> +	/* Reset GPIO */
> +	core->rst_gpio = devm_gpiod_get_optional(core->dev, "reset",
> +						 GPIOD_OUT_HIGH);
> +	if (IS_ERR(core->rst_gpio)) {
> +		if (PTR_ERR(core->rst_gpio) != -EPROBE_DEFER)
> +			dev_err(core->dev, "Video Reset GPIO not setup in DT");
> +		return PTR_ERR(core->rst_gpio);
> +	}
> +
> +	mutex_init(&xcsi2rxss->lock);

There are 3 'return' statements after this call, and mutex_destroy()
won't be called if they trigger. Ok, probably no real effect as
mutex_init() is just initializing data, but for the sake of well-written
code you can simply move mutex_init()...

> +	ret = xcsi2rxss_parse_of(xcsi2rxss);
> +	if (ret < 0)
> +		return ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	core->iomem = devm_ioremap_resource(core->dev, res);
> +	if (IS_ERR(core->iomem))
> +		return PTR_ERR(core->iomem);
> +
> +	ret = clk_bulk_get(core->dev, num_clks, core->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(num_clks, core->clks);
> +	if (ret)
> +		goto err_clk_put;

...here.

> +	if (core->rst_gpio) {
> +		gpiod_set_value_cansleep(core->rst_gpio, 1);
> +		/* minimum of 40 dphy_clk_200M cycles */
> +		usleep_range(1, 2);
> +		gpiod_set_value_cansleep(core->rst_gpio, 0);
> +	}


-- 
Luca
