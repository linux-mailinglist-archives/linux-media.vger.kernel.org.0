Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFA5302CDB
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 21:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732204AbhAYUqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 15:46:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:46456 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731970AbhAYUpi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 15:45:38 -0500
IronPort-SDR: vvd36FN+yCDDkZIa8778ndDP30ncJhSQV+9ZhtC06C6UfjFOVqxL4kq+/aFZALlN1D3igOUyCJ
 cTBOBVVaDnzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="176287068"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="176287068"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 12:43:43 -0800
IronPort-SDR: gvTEk14EDCgYuW6+wm7Pz35obCVpWzofVHQQKrjGDa8aub10FyNfJEHjrG0OWgCwvAL0+9j9Gd
 kXwNIVmIGeYg==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="387533140"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 12:43:37 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1EB902080B; Mon, 25 Jan 2021 22:43:35 +0200 (EET)
Date:   Mon, 25 Jan 2021 22:43:35 +0200
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
Subject: Re: [PATCH v3 08/14] media: renesas-ceu: Use
 v4l2_async_notifier_add_*_subdev
Message-ID: <20210125204335.GC4233@paasikivi.fi.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
 <20210125132230.6600-23-sakari.ailus@linux.intel.com>
 <e58b42da-cb08-28c7-ec0a-fd3a07f76228@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e58b42da-cb08-28c7-ec0a-fd3a07f76228@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 25, 2021 at 01:50:25PM -0300, Helen Koike wrote:
> 
> 
> On 1/25/21 10:22 AM, Sakari Ailus wrote:
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > The use of v4l2_async_notifier_add_subdev will be discouraged.
> > Drivers are instead encouraged to use a helper such as
> > v4l2_async_notifier_add_i2c_subdev.
> > 
> > This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> > should get a kmalloc'ed struct v4l2_async_subdev,
> > removing some boilerplate code while at it.
> > 
> > Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
> > or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
> > the needed setup, instead of open-coding it.
> > 
> > Using v4l2-async to allocate the driver-specific structs,
> > requires to change struct ceu_subdev so the embedded
> > struct v4l2_async_subdev is now the first element.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/renesas-ceu.c | 60 +++++++++++++---------------
> >  1 file changed, 27 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> > index 4a633ad0e8fa..0298d08b39e4 100644
> > --- a/drivers/media/platform/renesas-ceu.c
> > +++ b/drivers/media/platform/renesas-ceu.c
> > @@ -152,8 +152,8 @@ static inline struct ceu_buffer *vb2_to_ceu(struct vb2_v4l2_buffer *vbuf)
> >   * ceu_subdev - Wraps v4l2 sub-device and provides async subdevice.
> >   */
> >  struct ceu_subdev {
> > -	struct v4l2_subdev *v4l2_sd;
> >  	struct v4l2_async_subdev asd;
> > +	struct v4l2_subdev *v4l2_sd;
> >  
> >  	/* per-subdevice mbus configuration options */
> >  	unsigned int mbus_flags;
> > @@ -174,7 +174,7 @@ struct ceu_device {
> >  	struct v4l2_device	v4l2_dev;
> >  
> >  	/* subdevices descriptors */
> > -	struct ceu_subdev	*subdevs;
> > +	struct ceu_subdev	**subdevs;
> >  	/* the subdevice currently in use */
> >  	struct ceu_subdev	*sd;
> >  	unsigned int		sd_index;
> > @@ -1195,7 +1195,7 @@ static int ceu_enum_input(struct file *file, void *priv,
> >  	if (inp->index >= ceudev->num_sd)
> >  		return -EINVAL;
> >  
> > -	ceusd = &ceudev->subdevs[inp->index];
> > +	ceusd = ceudev->subdevs[inp->index];
> >  
> >  	inp->type = V4L2_INPUT_TYPE_CAMERA;
> >  	inp->std = 0;
> > @@ -1230,7 +1230,7 @@ static int ceu_s_input(struct file *file, void *priv, unsigned int i)
> >  		return 0;
> >  
> >  	ceu_sd_old = ceudev->sd;
> > -	ceudev->sd = &ceudev->subdevs[i];
> > +	ceudev->sd = ceudev->subdevs[i];
> >  
> >  	/*
> >  	 * Make sure we can generate output image formats and apply
> > @@ -1423,7 +1423,7 @@ static int ceu_notify_complete(struct v4l2_async_notifier *notifier)
> >  	 * ceu formats.
> >  	 */
> >  	if (!ceudev->sd) {
> > -		ceudev->sd = &ceudev->subdevs[0];
> > +		ceudev->sd = ceudev->subdevs[0];
> >  		ceudev->sd_index = 0;
> >  	}
> >  
> > @@ -1467,8 +1467,8 @@ static const struct v4l2_async_notifier_operations ceu_notify_ops = {
> >  
> >  /*
> >   * ceu_init_async_subdevs() - Initialize CEU subdevices and async_subdevs in
> > - *			      ceu device. Both DT and platform data parsing use
> > - *			      this routine.
> > + *                           ceu device. Both DT and platform data parsing use
> > + *                           this routine.
> 
> Maybe doc alignment fix should be sent in another patch.
> 
> With or without this:
> 
> Reviewed-by: Helen Koike <helen.koike@collabora.com>

Thanks; I prefer keeping it here, not worth writing a patch just for this.

-- 
Sakari Ailus
