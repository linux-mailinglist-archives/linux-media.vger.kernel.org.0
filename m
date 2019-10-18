Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57705DCF6F
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 21:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506019AbfJRTkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 15:40:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:24643 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505992AbfJRTkG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 15:40:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 12:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; 
   d="scan'208";a="208975640"
Received: from wittejoe-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.39.3])
  by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2019 12:40:03 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id A215521E76; Fri, 18 Oct 2019 22:36:40 +0300 (EEST)
Date:   Fri, 18 Oct 2019 22:36:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 06/11] media: v4l2-fwnode: Add helper to parse device
 properties
Message-ID: <20191018193640.GE3712@kekkonen.localdomain>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007162913.250743-7-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Oct 07, 2019 at 06:29:08PM +0200, Jacopo Mondi wrote:
> Add an helper function to parse common device properties in the same
> way as v4l2_fwnode_endpoint_parse() parses common endpoint properties.
> 
> Parse the 'rotation' and 'location' properties from the firmware
> interface.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 42 +++++++++++++++++++++++
>  include/media/v4l2-fwnode.h           | 48 +++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 192cac076761..8af4174a2bbf 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -596,6 +596,48 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
>  
> +int v4l2_fwnode_device_parse(struct device *dev,
> +			     struct v4l2_fwnode_device_properties *props)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	u32 val;
> +	int ret;
> +
> +	memset(props, 0, sizeof(*props));
> +
> +	props->location = V4L2_FWNODE_PROPERTY_UNSET;

How about adding V4L2_FWNODE_LOCATION_UNDEFINED instead? Same for the
rotation. I'd use 0 for that value, so memset above already sets it.

> +	ret = fwnode_property_read_u32(fwnode, "location", &val);
> +	if (!ret) {
> +		switch (val) {
> +		case V4L2_FWNODE_LOCATION_FRONT:
> +		case V4L2_FWNODE_LOCATION_BACK:
> +		case V4L2_FWNODE_LOCATION_EXTERNAL:
> +			break;
> +		default:
> +			dev_warn(dev, "Unsupported device location: %u\n", val);
> +			return -EINVAL;
> +		}
> +
> +		props->location = val;
> +		dev_dbg(dev, "device location: %u\n", val);
> +	}
> +
> +	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> +	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> +	if (!ret) {
> +		if (val >= 360 || val % 90) {
> +			dev_warn(dev, "Unsupported device rotation: %u\n", val);

I think it should be up to the caller to determine what's supported.

> +			return -EINVAL;
> +		}
> +
> +		props->rotation = val;
> +		dev_dbg(dev, "device rotation: %u\n", val);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> +
>  static int
>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  					  struct v4l2_async_notifier *notifier,
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index f6a7bcd13197..6d46d6fc3007 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -109,6 +109,36 @@ struct v4l2_fwnode_endpoint {
>  	unsigned int nr_of_link_frequencies;
>  };
>  
> +/**
> + * v4l2_fwnode_location - identify a non initialized property.
> + *
> + * All properties in &struct v4l2_fwnode_device_properties are initialized
> + * to this value.
> + */
> +#define V4L2_FWNODE_PROPERTY_UNSET   (-1U)
> +
> +/**
> + * enum v4l2_fwnode_location - possible device locations
> + * @V4L2_FWNODE_LOCATION_FRONT: device installed on the front side
> + * @V4L2_FWNODE_LOCATION_BACK: device installed on the back side
> + * @V4L2_FWNODE_LOCATION_EXTERNAL: device externally located
> + */
> +enum v4l2_fwnode_location {
> +	V4L2_FWNODE_LOCATION_FRONT,
> +	V4L2_FWNODE_LOCATION_BACK,
> +	V4L2_FWNODE_LOCATION_EXTERNAL
> +};
> +
> +/**
> + * struct v4l2_fwnode_device_properties - fwnode device properties
> + * @location: device location. See &enum v4l2_fwnode_location
> + * @rotation: device rotation
> + */
> +struct v4l2_fwnode_device_properties {
> +	enum v4l2_fwnode_location location;
> +	unsigned int rotation;
> +};
> +
>  /**
>   * struct v4l2_fwnode_link - a link between two endpoints
>   * @local_node: pointer to device_node of this endpoint
> @@ -233,6 +263,24 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
>   */
>  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
>  
> +/**
> + * v4l2_fwnode_device_parse() - parse fwnode device properties
> + * @dev: pointer to &struct device
> + * @props: pointer to &struct v4l2_fwnode_device_properties where to store the
> + *	   parsed properties values
> + *
> + * This function parses and validates the V4L2 fwnode device properties from
> + * the firmware interface. It is responsibility of the caller to allocate a
> + * valid @struct v4l2_fwnode_device_properties structure and provide a pointer
> + * to it in the @props parameter.
> + *
> + * Return:
> + *	% 0 on success
> + *	%-EINVAL if a parsed property value is not valid
> + */
> +int v4l2_fwnode_device_parse(struct device *dev,
> +			     struct v4l2_fwnode_device_properties *props);
> +
>  /**
>   * typedef parse_endpoint_func - Driver's callback function to be called on
>   *	each V4L2 fwnode endpoint.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
