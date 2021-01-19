Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3A22FC0AE
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbhASUNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbhASUNS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 15:13:18 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3283C061573
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 12:12:37 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 70ABD1F45180
Message-ID: <8682ddd6a60bbadea78fde0a60c5a4301d8165e6.camel@collabora.com>
Subject: Re: [PATCH v2 11/14] media: v4l2-async: Fix incorrect comment
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Tue, 19 Jan 2021 17:12:23 -0300
In-Reply-To: <530ac7f8-e065-123c-c7e0-70afeb313e5a@collabora.com>
References: <20210118015258.3993-1-ezequiel@collabora.com>
         <20210118015258.3993-12-ezequiel@collabora.com>
         <530ac7f8-e065-123c-c7e0-70afeb313e5a@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-19 at 15:54 -0300, Helen Koike wrote:
> Hi Ezequiel,
> 
> On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> > The v4l2_async_notifier_cleanup() documentation mentions
> > v4l2_fwnode_reference_parse_sensor_common, which was actually
> > introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
> > in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
> > parsing common external refs").
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>> ---
> >  include/media/v4l2-async.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 55bfb27e404e..2144502c95e0 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -242,7 +242,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
> >   * notifier after calling
> >   * @v4l2_async_notifier_add_subdev,
> >   * @v4l2_async_notifier_parse_fwnode_endpoints or
> > - * @v4l2_fwnode_reference_parse_sensor_common.
> > + * @v4l2_async_notifier_parse_fwnode_sensor_common.
> 
> I see that this function is only used in the framework by v4l2_async_register_subdev_sensor_common()
> 
> Shouldn't we change v4l2_async_notifier_parse_fwnode_sensor_common() to static
> and remove it from this comment?
> 

I haven't noticed that, but it makes sense indeed.

Sakari, what do you think?

Thanks,
Ezequiel

