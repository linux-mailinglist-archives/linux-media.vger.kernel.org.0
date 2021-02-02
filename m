Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3731630C174
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhBBOYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:24:30 -0500
Received: from mga07.intel.com ([134.134.136.100]:4721 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234107AbhBBOWY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:22:24 -0500
IronPort-SDR: xkEhidOBmZU3fYfzbPNL2YzZcGP5bVoTDZO0RyV6Kl5mN9gWPBDhMa7y1H5nyz6RUtrsEQBBTU
 Vnep37P0kaYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="244940050"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="244940050"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 06:19:55 -0800
IronPort-SDR: yTKcripWMo/8u3NF3PtvvZmu6ie8E875FU/TjdpQaprLDtCpb552qvJASLM81e6YA7hAnV4Y35
 d14ZgtNSECuw==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="396053203"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 06:19:47 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C8952207DF; Tue,  2 Feb 2021 16:19:45 +0200 (EET)
Date:   Tue, 2 Feb 2021 16:19:45 +0200
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
Subject: Re: [PATCH v5 13/13] media: Clarify v4l2-async subdevice addition API
Message-ID: <20210202141945.GT32460@paasikivi.fi.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
 <20210202135611.13920-14-sakari.ailus@linux.intel.com>
 <969fb716-9d0b-cc44-1b5a-9def016c8f6b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <969fb716-9d0b-cc44-1b5a-9def016c8f6b@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 11:01:21AM -0300, Helen Koike wrote:
> Hi Sakari,
> 
> On 2/2/21 10:56 AM, Sakari Ailus wrote:
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
> >  .../driver-api/media/v4l2-subdev.rst          | 48 +++++++++++++++----
> >  include/media/v4l2-async.h                    | 15 ++++--
> >  2 files changed, 50 insertions(+), 13 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index 0e82c77cf3e2..8b53da2f9c74 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -197,15 +197,45 @@ unregister the notifier the driver has to call
> >  takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
> >  pointer to struct :c:type:`v4l2_async_notifier`.
> >  
> > -Before registering the notifier, bridge drivers must do two things:
> > -first, the notifier must be initialized using the
> > -:c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> > -begin to form a list of subdevice descriptors that the bridge device
> > -needs for its operation. Subdevice descriptors are added to the notifier
> > -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> > -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> > -and a pointer to the subdevice descripter, which is of type struct
> > -:c:type:`v4l2_async_subdev`.
> > +Before registering the notifier, bridge drivers must do two things: first, the
> > +notifier must be initialized using the :c:func:`v4l2_async_notifier_init`.
> > +Second, bridge drivers can then begin to form a list of subdevice descriptors
> > +that the bridge device needs for its operation. Several functions are available
> > +to add subdevice descriptors to a notifier, depending on the type of device and
> > +the needs of the driver.
> > +
> > +:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev` and
> > +:c:func:`v4l2_async_notifier_add_i2c_subdev` are for bridge and ISP drivers for
> > +registering their async sub-devices with the notifier.
> > +
> > +:c:func:`v4l2_async_register_subdev_sensor_common` is a helper function for
> > +sensor drivers registering their own async sub-device, but it also registers a
> > +notifier and further registers async sub-devices for lens and flash devices
> > +found in firmware. The notifier for the sub-device is unregistered with the
> > +async sub-device.
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
> > index 192a11bdc4ad..6dac6cb6290f 100644
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
> s/v4l2_async_notifier_add_subdev/__v4l2_async_notifier_add_subdev no? Since
> it got renamed on patch 11/13, or am I missing something?

Ooops... forgot this one.

> 
> > + * @v4l2_async_notifier_parse_fwnode_endpoints.
> 
> Should we mention this is deprecated? maybe just a parenthesis "(deprecated)"

That is mentioned in the documentation of that function, should be fine
without here.

> 
> >   */
> >  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
> >  
> > @@ -262,9 +267,11 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
> >   * sub-devices allocated for the purposes of the notifier but not the notifier
> >   * itself. The user is responsible for calling this function to clean up the
> >   * notifier after calling
> > - * @v4l2_async_notifier_add_subdev,
> > - * @v4l2_async_notifier_parse_fwnode_endpoints or
> > - * @v4l2_fwnode_reference_parse_sensor_common.
> > + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> > + * @v4l2_async_notifier_add_fwnode_subdev,
> > + * @v4l2_async_notifier_add_i2c_subdev,
> > + * @v4l2_async_notifier_add_subdev or
> 
> Same here.
> 
> Regards,
> Helen
> 
> > + * @v4l2_async_notifier_parse_fwnode_endpoints.
> >   *
> >   * There is no harm from calling v4l2_async_notifier_cleanup in other
> >   * cases as long as its memory has been zeroed after it has been
> > 

-- 
Sakari Ailus
