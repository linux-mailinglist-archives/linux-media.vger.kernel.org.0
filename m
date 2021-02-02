Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0C430BA2F
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 09:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhBBIpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 03:45:01 -0500
Received: from mga11.intel.com ([192.55.52.93]:11758 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231987AbhBBIo6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 03:44:58 -0500
IronPort-SDR: 0hKx44lJ042Ci9Igk063gydQncJMKLBKUXulL/emkpOhK/mkFN+rY547Iw43zVQVwAuLIndD0X
 fnJMLWTpmSsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="177311506"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="177311506"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 00:43:12 -0800
IronPort-SDR: PvPeEUSI/bdOiBqg2fn5xvzVfOmfC7dZoJt3+5h5XuPodPclMk7efvjBnzBBuaWxRRg+YEI6z0
 dJYk3S0eB7Yg==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="479487441"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 00:43:08 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 47A67207DF; Tue,  2 Feb 2021 10:43:06 +0200 (EET)
Date:   Tue, 2 Feb 2021 10:43:06 +0200
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
Subject: Re: [PATCH v4 11/14] media: v4l2-async: Fix incorrect comment
Message-ID: <20210202084306.GP32460@paasikivi.fi.intel.com>
References: <20210128120945.5062-1-sakari.ailus@linux.intel.com>
 <20210128120945.5062-12-sakari.ailus@linux.intel.com>
 <adf039f7-44dd-36a0-8736-df965cb12f48@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adf039f7-44dd-36a0-8736-df965cb12f48@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for the review!

On Mon, Feb 01, 2021 at 04:33:54PM -0300, Helen Koike wrote:
> 
> 
> On 1/28/21 9:09 AM, Sakari Ailus wrote:
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
> >  include/media/v4l2-async.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 8815e233677e..f2cac0931372 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -250,7 +250,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
> >   * notifier after calling
> >   * @v4l2_async_notifier_add_subdev,
> >   * @v4l2_async_notifier_parse_fwnode_endpoints or
> > - * @v4l2_fwnode_reference_parse_sensor_common.
> > + * @v4l2_async_register_subdev_sensor_common.
> 
> This line gets removed on patch 14/14, maybe just drop this patch?

I'll squash it with 14th.

-- 
Sakari Ailus
