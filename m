Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38ECC170619
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 18:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgBZR2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 12:28:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55298 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgBZR2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 12:28:18 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D7BC628ED79
Message-ID: <f0798d3bebaa52bdcf613120f56791d76229b276.camel@collabora.com>
Subject: Re: [PATCH v2] media: Split v4l2_pipeline_pm_use into
 v4l2_pipeline_pm_{get, put}
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>
Date:   Wed, 26 Feb 2020 14:28:08 -0300
In-Reply-To: <20200226155336.GO5023@valkosipuli.retiisi.org.uk>
References: <20200124203543.22890-1-ezequiel@collabora.com>
         <20200226155336.GO5023@valkosipuli.retiisi.org.uk>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Sakari,

Thanks a lot for your comments.

On Wed, 2020-02-26 at 17:53 +0200, Sakari Ailus wrote:
> Hi Ezequiel,
> 
> On Fri, Jan 24, 2020 at 05:35:43PM -0300, Ezequiel Garcia wrote:
> > Currently, v4l2_pipeline_pm_use() prototype is:
> > 
> >   int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
> > 
> > Where the 'use' argument shall only be set to '1' for enable/power-on,
> > or to '0' for disable/power-off. The integer return is specified
> > as only meaningful when 'use' is set to '1'.
> > 
> > Let's enforce this semantic by splitting the function in two:
> > v4l2_pipeline_pm_get and v4l2_pipeline_pm_put. This is done
> > for several reasons.
> > 
> > It makes the API easier to use (or harder to misuse).
> > It removes the constraint on the values the 'use' argument
> > shall take. Also, it removes the need to constraint
> > the return value, by making v4l2_pipeline_pm_put void return.
> > 
> > And last, it's more consistent with other kernel APIs, such
> > as the runtime pm APIs, which makes the code more symmetric.
> 
> Indeed. These functions only exist because not all sensor etc. drivers have
> been converted to runtime PM yet. New drivers no longer implement s_power
> callbacks.
> 
> I don't object the patch as such, but I think you could also add a note
> that relying on the s_power callback is deprecated. This probably should be
> a separate patch.
> 

Hans picked this patch, sending a pull request yesterday which includes it.

Since you know this API better than me, I thikn it would be best
if you take care of sending a patch for it.

In particular, I'd like to know as reference, if any changes are needed
RKISP1 and sensors such as IMX219 in order to avoid relying in the deprecated
API.

Moreover, is there any way we can add some build time or run time warning,
to avoid developers from using an API that is deprecated?

Thanks!
Ezequiel

