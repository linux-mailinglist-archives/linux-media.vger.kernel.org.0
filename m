Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B6D2FE83F
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 12:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbhAUK7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 05:59:02 -0500
Received: from mga07.intel.com ([134.134.136.100]:18705 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729451AbhAUK5n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 05:57:43 -0500
IronPort-SDR: Ytjp9VJOwS0ERsgRd7/iXso/iYDBgnONoahrdkMOH6x59bc+U0yd9sog9EHhBGjyl4wWwkMYvm
 RaPp0pxns8Hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="243323597"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="243323597"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 02:55:57 -0800
IronPort-SDR: OWq0xC6/24XWRXvnn1O8d3+kUcq6pnTtAM2wM3JSN5S+oWoG9yWkG7Xeth2Cd5uGbTm1M+W5/N
 om19m3IL88RQ==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="356420885"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 02:55:53 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C23942067A; Thu, 21 Jan 2021 12:55:51 +0200 (EET)
Date:   Thu, 21 Jan 2021 12:55:51 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 11/14] media: v4l2-async: Fix incorrect comment
Message-ID: <20210121105551.GA6234@paasikivi.fi.intel.com>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-12-ezequiel@collabora.com>
 <530ac7f8-e065-123c-c7e0-70afeb313e5a@collabora.com>
 <8682ddd6a60bbadea78fde0a60c5a4301d8165e6.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8682ddd6a60bbadea78fde0a60c5a4301d8165e6.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Jan 19, 2021 at 05:12:23PM -0300, Ezequiel Garcia wrote:
> On Tue, 2021-01-19 at 15:54 -0300, Helen Koike wrote:
> > Hi Ezequiel,
> > 
> > On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> > > The v4l2_async_notifier_cleanup() documentation mentions
> > > v4l2_fwnode_reference_parse_sensor_common, which was actually
> > > introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
> > > in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
> > > parsing common external refs").
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>> ---
> > >  include/media/v4l2-async.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > index 55bfb27e404e..2144502c95e0 100644
> > > --- a/include/media/v4l2-async.h
> > > +++ b/include/media/v4l2-async.h
> > > @@ -242,7 +242,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
> > >   * notifier after calling
> > >   * @v4l2_async_notifier_add_subdev,
> > >   * @v4l2_async_notifier_parse_fwnode_endpoints or
> > > - * @v4l2_fwnode_reference_parse_sensor_common.
> > > + * @v4l2_async_notifier_parse_fwnode_sensor_common.
> > 
> > I see that this function is only used in the framework by v4l2_async_register_subdev_sensor_common()
> > 
> > Shouldn't we change v4l2_async_notifier_parse_fwnode_sensor_common() to static
> > and remove it from this comment?
> > 
> 
> I haven't noticed that, but it makes sense indeed.
> 
> Sakari, what do you think?

I have no objections. Could you just move the kerneldoc documentation to
the .c file while you make the function static?

-- 
Regards,

Sakari Ailus
