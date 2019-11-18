Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD22F1005EF
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 13:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfKRMwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 07:52:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:33002 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbfKRMwq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 07:52:46 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 04:52:45 -0800
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; 
   d="scan'208";a="209069958"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 04:52:42 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 759E020731; Mon, 18 Nov 2019 14:52:40 +0200 (EET)
Date:   Mon, 18 Nov 2019 14:52:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 06/11] media: v4l2-fwnode: Add helper to parse device
 properties
Message-ID: <20191118125240.GE5391@paasikivi.fi.intel.com>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
 <20191108155944.1040883-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108155944.1040883-7-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Nov 08, 2019 at 04:59:39PM +0100, Jacopo Mondi wrote:
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
> +			return -EINVAL;

In both cases, you return an error back to the user if there's a problem
with the value of an optinoal property.

It could prevent probing the driver if someone screwed up the firmware
somehow, but also makes the matter more visible. I think it's good to start
with this way, and hope we don't need to change it.

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

On the naming --- this is relevant for only one property at the moment, so
I'd make it specific to that property, too. This also makes it fit for the
enum below.

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

I think the latter sentence (inserted before the leading comma of the
previous sentence) could be phrased as:

"and fills the @struct v4l2_fwnode_device_properties provided by the
caller".

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
Regards,

Sakari Ailus
