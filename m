Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B559785001
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 17:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388620AbfHGPgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 11:36:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:57733 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387827AbfHGPgR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 11:36:17 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 08:36:16 -0700
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; 
   d="scan'208";a="349794837"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 08:36:11 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8A00920355; Wed,  7 Aug 2019 18:36:46 +0300 (EEST)
Date:   Wed, 7 Aug 2019 18:36:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>
Subject: Re: [PATCH v8 09/14] media: rkisp1: add rockchip isp1 core driver
Message-ID: <20190807153646.GO21370@paasikivi.fi.intel.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-10-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-10-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Tue, Jul 30, 2019 at 03:42:51PM -0300, Helen Koike wrote:

...

> +static int rkisp1_fwnode_parse(struct device *dev,
> +			       struct v4l2_fwnode_endpoint *vep,
> +			       struct v4l2_async_subdev *asd)
> +{
> +	struct sensor_async_subdev *s_asd =
> +			container_of(asd, struct sensor_async_subdev, asd);
> +
> +	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(dev, "Only CSI2 bus type is currently supported\n");
> +		return -EINVAL;
> +	}
> +
> +	if (vep->base.port != 0) {
> +		dev_err(dev, "The ISP has only port 0\n");
> +		return -EINVAL;
> +	}
> +
> +	s_asd->mbus.type = vep->bus_type;
> +	s_asd->mbus.flags = vep->bus.mipi_csi2.flags;
> +	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
> +
> +	switch (vep->bus.mipi_csi2.num_data_lanes) {
> +	case 1:
> +		s_asd->mbus.flags |= V4L2_MBUS_CSI2_1_LANE;
> +		break;
> +	case 2:
> +		s_asd->mbus.flags |= V4L2_MBUS_CSI2_2_LANE;
> +		break;
> +	case 3:
> +		s_asd->mbus.flags |= V4L2_MBUS_CSI2_3_LANE;
> +		break;
> +	case 4:
> +		s_asd->mbus.flags |= V4L2_MBUS_CSI2_4_LANE;
> +		break;

Could you use struct v4l2_fwnode_endpoint directly? The mbus config is a
legacy struct from bygone times and I'd like to avoid using it in new
drivers.

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations subdev_notifier_ops = {
> +	.bound = subdev_notifier_bound,
> +	.unbind = subdev_notifier_unbind,
> +	.complete = subdev_notifier_complete,
> +};
> +
> +static int isp_subdev_notifier(struct rkisp1_device *isp_dev)
> +{
> +	struct v4l2_async_notifier *ntf = &isp_dev->notifier;
> +	struct device *dev = isp_dev->dev;
> +	int ret;
> +
> +	v4l2_async_notifier_init(ntf);
> +
> +	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
> +		dev, ntf, sizeof(struct sensor_async_subdev), 0,
> +		rkisp1_fwnode_parse);

I know these functions aren't old but there's a better alternative. See
e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c or
cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.

> +	if (ret < 0)
> +		return ret;
> +
> +	if (list_empty(&ntf->asd_list))
> +		return -ENODEV;	/* no endpoint */
> +
> +	ntf->ops = &subdev_notifier_ops;
> +
> +	return v4l2_async_notifier_register(&isp_dev->v4l2_dev, ntf);
> +}

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
