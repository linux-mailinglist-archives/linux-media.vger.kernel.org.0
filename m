Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8762AB219B
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 16:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388464AbfIMOIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 10:08:17 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53407 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388084AbfIMOIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 10:08:17 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8mF8iX5okV17O8mFCi32f6; Fri, 13 Sep 2019 16:08:14 +0200
Subject: Re: [PATCH v3 06/11] media: v4l2-fwnode: Add helper to parse device
 properties
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-7-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eb2ff7be-39d3-07e8-aa6e-a24426e3fbbe@xs4all.nl>
Date:   Fri, 13 Sep 2019 16:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912201055.13964-7-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEDBUhMBGneZAJof+pCe41EPWExSZxWJgdf8SZYm9nY+Uu0B5e5a+6quMTkrUd/oB/MsWGqWP1vPwFJqHmDJ+AiQr6qP6vGIWZefujn8eT75bIgV8i6f
 eBYR/vjqMrPvpATvTv0kTSfdG0Q3zb4caEftSU46JAYJg32g0DcHG7cNOkL+p7xd/5BxCYVZVq5iCHDbERFmIj7GUf/i1oZnBLgmuMZ0T73bbrK0MvxPBdMg
 0dj7r2knQki4GMNK2G0aJtavrJAi/Dut1/qIoUo3hVn+AGXvTtsutG4Sqts7TuJD5LhkODYIgpuo1QcbjBlUsC/RFuz6152bzmFvT7bEO/da+/Fs5Ex4/+IQ
 r2NFf9S8iVo+dbJYisP+Nvd6UIp+Oa59iTkxv8Fmz308rqkQHP4hy0sKcU1Q6xAjjmFCogfcGrpcDK1aMJSc0LQi/6aaG0S/9flM9gdAERG2GaS0jGVxEN4B
 jjHR1qfi+XPFKDE2JZwGa5gkd/Bp8it3tDuvOg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> Add an helper function to parse common device properties in the same
> way as v4l2_fwnode_endpoint_parse() parses common endpoint properties.
> 
> Initially parse the 'rotation' and 'location' properties from the

Just drop 'Initially'. It's redundant.

> firmware interface.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 42 +++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h           | 40 +++++++++++++++++++++++++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 3bd1888787eb..d325a2d5c088 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -595,6 +595,48 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
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
> +	dev_dbg(dev, "===== begin V4L2 device properties parsing\n");
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
> +	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> +	if (!ret) {
> +		if (val >= 360 || val % 90) {
> +			dev_warn(dev, "Unsupported device rotation: %u\n", val);
> +			return -EINVAL;
> +		}
> +
> +		props->rotation = val;
> +		dev_dbg(dev, "device rotation: %u\n", val);
> +	}
> +	dev_dbg(dev, "===== end V4L2 device properties parsing\n");

Are these dev_dbg lines really needed? It seems a bit overkill to me.

What if rotation is set, but not location. Then location defaults to Front.
Is that what we want, or should we add an UNKNOWN location?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> +
>  static int
>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  					  struct v4l2_async_notifier *notifier,
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index f6a7bcd13197..86af6d9d11fe 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -109,6 +109,28 @@ struct v4l2_fwnode_endpoint {
>  	unsigned int nr_of_link_frequencies;
>  };
>  
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
> @@ -233,6 +255,24 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
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
> 

Regards,

	Hans
