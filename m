Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DBB30BEF6
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 14:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhBBNA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 08:00:58 -0500
Received: from mga02.intel.com ([134.134.136.20]:57830 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231687AbhBBNAy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 08:00:54 -0500
IronPort-SDR: zWzTc0leJTpCvUHUgiAthhOSlD+cJdsY0WKIP+z5f3C4yN8FoFg8qYLJs1K145yfjrizKNCLzb
 3nv5UJchEBkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="167954168"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="167954168"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 04:59:07 -0800
IronPort-SDR: FK9hWrVAKwQQki6XO5cafObwNcDTCd1ufpY6Jbq7JUx7MIfKFfpPcNnzafOkN4QV3TlFOn/lPv
 pBEs+Lq069hA==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="575484265"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 04:59:03 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0F0E0207DF; Tue,  2 Feb 2021 14:59:01 +0200 (EET)
Date:   Tue, 2 Feb 2021 14:59:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v4 14/14] media: Clarify v4l2-async subdevice addition API
Message-ID: <20210202125900.GQ32460@paasikivi.fi.intel.com>
References: <20210128120945.5062-1-sakari.ailus@linux.intel.com>
 <20210128120945.5062-15-sakari.ailus@linux.intel.com>
 <f8964e52-673e-405f-0bc6-eb3562b6065a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8964e52-673e-405f-0bc6-eb3562b6065a@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Mon, Feb 01, 2021 at 05:17:15PM -0300, Helen Koike wrote:
> 
> 
> On 1/28/21 9:09 AM, Sakari Ailus wrote:
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > Now that most users of v4l2_async_notifier_add_subdev have been converted,
> > let's fix the documentation so it's more clear how the v4l2-async API
> > should be used.
> > 
> > Document functions that drivers should use, and their purpose.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../driver-api/media/v4l2-subdev.rst          | 41 ++++++++++++++++---
> >  include/media/v4l2-async.h                    | 15 +++++--
> >  2 files changed, 47 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index 0e82c77cf3e2..a6b82b9c8210 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -201,11 +201,42 @@ Before registering the notifier, bridge drivers must do two things:
> >  first, the notifier must be initialized using the
> >  :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> >  begin to form a list of subdevice descriptors that the bridge device
> > -needs for its operation. Subdevice descriptors are added to the notifier
> > -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> > -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> > -and a pointer to the subdevice descripter, which is of type struct
> > -:c:type:`v4l2_async_subdev`.
> > +needs for its operation. Several functions are available, to add subdevice
> > +descriptors to a notifier, depending on the type of device and the needs of the
> > +driver.
> > +
> > +:c:func:`v4l2_async_register_subdev_sensor_common` is a helper function for
> > +sensor drivers registering their own async sub-device, but it also supports
> > +registering lens and flash devices. The function registers an async notifier for
> > +the sub-device which is unregistered with the async sub-device.
> > +
> > +:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev`,
> > +:c:func:`v4l2_async_notifier_add_fwnode_subdev` and
> > +:c:func:`v4l2_async_notifier_add_i2c_subdev` are for bridge and ISP drivers for
> > +registering their async sub-devices.
> 
> If I understand correctly, these functions are for bridge and ISP drivers to tell
> the framework they are waiting asynchronously for another sub-device.
> I wonder if this could be re-phrased a bit to convey that.

This applies to all async sub-devices, also those registered indirectly by
the sensor driver. I'll see if I could improve it for v5.

> Shouldn't __v4l2_async_notifier_add_subdev() and v4l2_async_notifier_parse_fwnode_endpoints()
> also be mentioned here?
> Or maybe just don't mention __v4l2_async_notifier_add_subdev() here to discourage its usage.
> 
> I see that v4l2_async_notifier_parse_fwnode_endpoints() is only used by sun6i_csi.c,
> I wonder if sun6i is a special case of if we could use one of those 3 functions instead
> and discourage the usage of v4l2_async_notifier_parse_fwnode_endpoints() as well.

I left out these two because the former is not intended to be used by
drivers and the latter is deprecated. Once the sun6i driver is converted,
the function can be removed.

> 
> > +
> > +These functions allocate an async sub-device descriptor which is of type struct
> > +:c:type:`v4l2_async_subdev` embedded in a driver-specific struct. The &struct
> > +:c:type:`v4l2_async_subdev` shall be the first member of this struct:
> > +
> > +.. code-block:: c
> > +
> > +	struct my_async_subdev {
> > +		struct v4l2_async_subdev asd;
> > +		...
> > +	};
> > +
> > +	struct my_async_subdev *my_asd;
> > +	struct fwnode_handle *ep;
> > +
> > +	...
> > +
> > +	my_asd = v4l2_async_notifier_add_fwnode_remote_subdev(&notifier, ep,
> > +							      struct my_async_subdev);
> > +	fwnode_handle_put(ep);
> > +
> > +	if (IS_ERR(asd))
> > +		return PTR_ERR(asd);
> >  
> >  The V4L2 core will then use these descriptors to match asynchronously
> >  registered subdevices to them. If a match is detected the ``.bound()``
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index b94f0a0a8042..6dac6cb6290f 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -128,7 +128,12 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   *
> >   * This function initializes the notifier @asd_list. It must be called
> > - * before the first call to @v4l2_async_notifier_add_subdev.
> > + * before adding a subdevice to a notifier, using one of:
> > + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> > + * @v4l2_async_notifier_add_fwnode_subdev,
> > + * @v4l2_async_notifier_add_i2c_subdev,
> > + * @v4l2_async_notifier_add_subdev or
> 
> v4l2_async_notifier_add_subdev() was renamed on patch 12/14.
> 
> Maybe just don't mention it here to discourage its usage?

I wanted to keep it here since it is possible to use it, and using it
requires initialising and cleaning up. The documentation also applies to
the framework.

The ReST documentation is more driver developer oriented.

> 
> > + * @v4l2_async_notifier_parse_fwnode_endpoints.
> >   */
> >  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
> >  
> > @@ -262,9 +267,11 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
> >   * sub-devices allocated for the purposes of the notifier but not the notifier
> >   * itself. The user is responsible for calling this function to clean up the
> >   * notifier after calling
> > - * @v4l2_async_notifier_add_subdev,
> > - * @v4l2_async_notifier_parse_fwnode_endpoints or
> > - * @v4l2_async_register_subdev_sensor_common.
> > + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> > + * @v4l2_async_notifier_add_fwnode_subdev,
> > + * @v4l2_async_notifier_add_i2c_subdev,
> > + * @v4l2_async_notifier_add_subdev or
> 
> Same here.
> 
> 
> Thanks
> Helen
> 
> > + * @v4l2_async_notifier_parse_fwnode_endpoints.
> >   *
> >   * There is no harm from calling v4l2_async_notifier_cleanup in other
> >   * cases as long as its memory has been zeroed after it has been
> > 

-- 
Kind regards,

Sakari Ailus
