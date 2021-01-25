Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCBD302CE0
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 21:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732272AbhAYUre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 15:47:34 -0500
Received: from mga05.intel.com ([192.55.52.43]:31613 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732265AbhAYUoy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 15:44:54 -0500
IronPort-SDR: /3KrCgrm/bJ8jwvPw5+c9z8qnHrF/YivOFzD/3jOLbrarbCTHb6JdYeFcMrb38qbjzlQzg7ZRL
 tO56hNreth+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="264619963"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="264619963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 12:43:07 -0800
IronPort-SDR: r2V4wzM38v8TuffCAnN0RycUgNouVM+OrUDKOXFDdYBo1QaQynYG8z5WREV9WtiUxs/3VrBOC8
 xbhspuAZcN2Q==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="406393321"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 12:43:02 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1012E2080B; Mon, 25 Jan 2021 22:43:01 +0200 (EET)
Date:   Mon, 25 Jan 2021 22:43:01 +0200
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
Subject: Re: [PATCH v3 11/14] media: v4l2-async: Fix incorrect comment
Message-ID: <20210125204300.GB4233@paasikivi.fi.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
 <20210125132230.6600-26-sakari.ailus@linux.intel.com>
 <fab49b26-1297-fb0f-4d02-103e8faedffd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fab49b26-1297-fb0f-4d02-103e8faedffd@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 25, 2021 at 01:50:48PM -0300, Helen Koike wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On 1/25/21 10:22 AM, Sakari Ailus wrote:
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > The v4l2_async_notifier_cleanup() documentation mentions
> > v4l2_fwnode_reference_parse_sensor_common, which was actually
> > introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
> > in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
> > parsing common external refs").
> > 
> > The function drivers do use is
> > v4l2_async_register_subdev_sensor_common().
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-async.h | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 0ddc06e36c08..f2cac0931372 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -174,9 +174,11 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >   *
> >   * @notif: pointer to &struct v4l2_async_notifier
> >   * @endpoint: local endpoint pointing to the remote sub-device to be matched
> > - * @asd: Async sub-device struct allocated by the caller. The &struct
> > - *	 v4l2_async_subdev shall be the first member of the driver's async
> > - *	 sub-device struct, i.e. both begin at the same memory address.
> > + * @asd_struct_size: size of the driver's async sub-device struct, including
> > + *		     sizeof(struct v4l2_async_subdev). The &struct
> > + *		     v4l2_async_subdev shall be the first member of
> > + *		     the driver's async sub-device struct, i.e. both
> > + *		     begin at the same memory address.
> >   *
> >   * Gets the remote endpoint of a given local endpoint, set it up for fwnode
> >   * matching and adds the async sub-device to the notifier's @asd_list. The
> > @@ -184,13 +186,12 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >   * notifier cleanup time.
> >   *
> >   * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
> > - * exception that the fwnode refers to a local endpoint, not the remote one, and
> > - * the function relies on the caller to allocate the async sub-device struct.
> > + * exception that the fwnode refers to a local endpoint, not the remote one.
> >   */
> > -int
> > +struct v4l2_async_subdev *
> >  v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> >  					     struct fwnode_handle *endpoint,
> > -					     struct v4l2_async_subdev *asd);
> > +					     unsigned int asd_struct_size);
> 
> This change should go with patch 1/14.

Yeah.

-- 
Sakari Ailus
