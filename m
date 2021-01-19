Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998532FC082
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391949AbhASUBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:01:19 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34712 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbhASUA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 15:00:29 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 006931F44C06
Message-ID: <1d2bfb513761092ea31f8a9126b2ce7c78b024cc.camel@collabora.com>
Subject: Re: [PATCH v2 04/14] media: exynos4-is: Use
 v4l2_async_notifier_add_fwnode_remote_subdev
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
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Date:   Tue, 19 Jan 2021 16:59:35 -0300
In-Reply-To: <79a74c16-47d7-1833-1625-6590cb29d5e4@collabora.com>
References: <20210118015258.3993-1-ezequiel@collabora.com>
         <20210118015258.3993-5-ezequiel@collabora.com>
         <79a74c16-47d7-1833-1625-6590cb29d5e4@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-19 at 15:52 -0300, Helen Koike wrote:
> Hi Ezequiel,
> 
> On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> > The use of v4l2_async_notifier_add_subdev will be discouraged.
> > Drivers are instead encouraged to use a helper such as
> > v4l2_async_notifier_add_fwnode_remote_subdev.
> > 
> > This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> > should get a kmalloc'ed struct v4l2_async_subdev,
> > removing some boilerplate code while at it.
> > 
> > Use the appropriate helper v4l2_async_notifier_add_fwnode_remote_subdev,
> > which handles the needed setup, instead of open-coding it.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/platform/exynos4-is/media-dev.c | 25 +++++++++++--------
> >  drivers/media/platform/exynos4-is/media-dev.h |  2 +-
> >  2 files changed, 15 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> > index e636c33e847b..de26ecdcfe81 100644
> > --- a/drivers/media/platform/exynos4-is/media-dev.c
> > +++ b/drivers/media/platform/exynos4-is/media-dev.c
> > @@ -401,6 +401,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
> >         int index = fmd->num_sensors;
> >         struct fimc_source_info *pd = &fmd->sensor[index].pdata;
> >         struct device_node *rem, *np;
> > +       struct v4l2_async_subdev *asd;
> >         struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
> >         int ret;
> >  
> > @@ -418,10 +419,11 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
> >         pd->mux_id = (endpoint.base.port - 1) & 0x1;
> >  
> >         rem = of_graph_get_remote_port_parent(ep);
> > -       of_node_put(ep);
> >         if (rem == NULL) {
> >                 v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
> >                                                         ep);
> > +               of_node_put(rem);
> 
> rem is NULL here.
> 

Ouch, crap. Thanks for spotting this!

Ezequiel

