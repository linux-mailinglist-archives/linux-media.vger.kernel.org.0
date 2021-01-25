Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A04302CE2
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 21:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732173AbhAYUrp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 15:47:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:37915 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732189AbhAYUor (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 15:44:47 -0500
IronPort-SDR: lIOEj2/0uT4W6onanjSOeRQ1tACaNhYdXQHkqkyi5WYRjBySXqD3iMdIpL6IWCGiEpjQ6jkO54
 dQVzSpi31OPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="177228405"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="177228405"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 12:42:52 -0800
IronPort-SDR: M2NngHcjxNNs5Hh/lUBHSoCvBKReKpGZ9eomc1ZTDdMoTd3e8pShmlEOk8lfhUcmZE69dW/PP8
 h1QkdlCBpYrg==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="356461225"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 12:42:48 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A57A32080B; Mon, 25 Jan 2021 22:42:46 +0200 (EET)
Date:   Mon, 25 Jan 2021 22:42:46 +0200
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
Subject: Re: [PATCH v3 12/14] media: Clarify v4l2-async subdevice addition API
Message-ID: <20210125204246.GA4233@paasikivi.fi.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
 <20210125132230.6600-27-sakari.ailus@linux.intel.com>
 <3ed5e3df-d1d2-266d-34fa-edff5abc6a0d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ed5e3df-d1d2-266d-34fa-edff5abc6a0d@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for the review.

On Mon, Jan 25, 2021 at 02:22:37PM -0300, Helen Koike wrote:
> 
> 
> On 1/25/21 10:22 AM, Sakari Ailus wrote:
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > Now that most users of v4l2_async_notifier_add_subdev have
> > been converted, let's fix the documentation so it's more clear
> > how the v4l2-async API should be used.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
> >  include/media/v4l2-async.h                    | 15 ++++++--
> >  2 files changed, 44 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index 0e82c77cf3e2..490dd212345d 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -201,11 +201,39 @@ Before registering the notifier, bridge drivers must do two things:
> >  first, the notifier must be initialized using the
> >  :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> >  begin to form a list of subdevice descriptors that the bridge device
> > -needs for its operation. Subdevice descriptors are added to the notifier
> > -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> > -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> > -and a pointer to the subdevice descripter, which is of type struct
> > -:c:type:`v4l2_async_subdev`.
> > +needs for its operation. Several functions are available, to add subdevice
> > +descriptors to a notifier, depending on the type of device:
> > +:c:func:`v4l2_async_notifier_add_fwnode_subdev`,
> > +:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev` or
> > +:c:func:`v4l2_async_notifier_add_i2c_subdev`.
> > +
> > +These functions allocate a subdevice descriptor, which is of
> > +type struct :c:type:`v4l2_async_subdev`, and take a size argument
> > +which can be used to embed the descriptor in a driver-specific
> > +async subdevice struct. The &struct :c:type:`v4l2_async_subdev`
> > +shall be the first member of this struct:
> > +
> > +.. code-block:: c
> > +
> > +	struct my_async_subdev {
> > +		struct v4l2_async_subdev asd;
> > +		...
> > +	};
> > +
> > +	struct my_async_subdev *my_asd;
> > +	struct v4l2_async_subdev *asd;
> > +	struct fwnode_handle *ep;
> > +
> > +	...
> > +
> > +	asd = v4l2_async_notifier_add_fwnode_subdev(
> > +			&notifier, ep, sizeof(*my_asd));
> > +	fwnode_handle_put(ep);
> > +
> > +	if (IS_ERR(asd))
> > +		return PTR_ERR(asd);
> > +
> > +	my_asd = container_of(asd, struct my_async_subdev, asd);
> >  
> >  The V4L2 core will then use these descriptors to match asynchronously
> >  registered subdevices to them. If a match is detected the ``.bound()``
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index f2cac0931372..25c9ebd3f963 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -128,7 +128,12 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   *
> >   * This function initializes the notifier @asd_list. It must be called
> > - * before the first call to @v4l2_async_notifier_add_subdev.
> > + * before adding a subdevice to a notifier, using one of:
> > + * @v4l2_async_notifier_add_fwnode_subdev,
> > + * @v4l2_async_register_subdev_sensor_common,
> 
> This function doesn't receive a notifier, it is used by the sensor at probe's
> time to inform the framework this sensor is present (if I understand correctly).
> So it could be called before the isp (who is registering a notifier) is probed.
> 
> There is no need to call v4l2_async_notifier_init() before
> v4l2_async_register_subdev_sensor_common() in my understanding.

Yeah... I guess I shouldn't just write this as I recall from years ago. X-)

Anyway, I added also v4l2_async_notifier_add_fwnode_remote_subdev.

> 
> > + * @v4l2_async_notifier_add_i2c_subdev,
> > + * @v4l2_async_notifier_add_subdev or
> > + * @v4l2_async_notifier_parse_fwnode_endpoints.
> >   */
> >  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
> >  
> > @@ -248,9 +253,11 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
> >   * sub-devices allocated for the purposes of the notifier but not the notifier
> >   * itself. The user is responsible for calling this function to clean up the
> >   * notifier after calling
> > - * @v4l2_async_notifier_add_subdev,
> > - * @v4l2_async_notifier_parse_fwnode_endpoints or
> > - * @v4l2_async_register_subdev_sensor_common.
> > + * @v4l2_async_notifier_add_fwnode_subdev,
> > + * @v4l2_async_register_subdev_sensor_common,
> 
> The user of v4l2_async_register_*() is not responsible
> for cleaning up the notifier with v4l2_async_notifier_unregister(),
> it calls v4l2_async_unregister_*() instead
> (or am I missing something?)

Agreed. Added the same v4l2_async_notifier_add_fwnode_remote_subdev here,
too.

-- 
Kind regards,

Sakari Ailus
