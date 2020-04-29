Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9944B1BD554
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 09:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgD2HDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 03:03:09 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:33413 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgD2HDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 03:03:09 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A2BAA200009;
        Wed, 29 Apr 2020 07:03:04 +0000 (UTC)
Date:   Wed, 29 Apr 2020 09:06:16 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v3] media: i2c: imx219: Implement get_selection
Message-ID: <20200429070616.ti3ctufc7clsktdz@uno.localdomain>
References: <20200428210903.6957-1-jacopo@jmondi.org>
 <20200428213502.GD5381@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428213502.GD5381@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

    getting to v4 for such a trivial change is a bit embarassing -.-'

On Wed, Apr 29, 2020 at 12:35:02AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Apr 28, 2020 at 11:09:03PM +0200, Jacopo Mondi wrote:
> > +static int imx219_get_selection(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_pad_config *cfg,
> > +				struct v4l2_subdev_selection *sel)
> > +{
> > +	struct imx219 *imx219 = to_imx219(sd);
> > +	const struct v4l2_rect *__crop;
> > +	int ret = 0;
>
> ret is unused.
>

ouch, sorry this was trivial.

> > +
> > +	if (sel->pad != 0)
> > +		return -EINVAL;
>
> As you only have a single pad (0), this check is redundant --- the caller
> will have done that check already.
>

I see, makes sense to remove it indeed

v4 on its way, maybe this time I can get it right
