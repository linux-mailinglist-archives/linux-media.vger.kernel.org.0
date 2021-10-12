Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A104F429E6D
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 09:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbhJLHRs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 03:17:48 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:47419 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbhJLHRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 03:17:46 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4976824000B;
        Tue, 12 Oct 2021 07:15:41 +0000 (UTC)
Date:   Tue, 12 Oct 2021 09:16:30 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <YWU2TmTDjkETta3a@uno.localdomain>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
 <m3mtnflpna.fsf@t19.piap.pl>
 <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
 <6c89cdb5-4920-8d01-2051-b64b804db9f6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c89cdb5-4920-8d01-2051-b64b804db9f6@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Oct 11, 2021 at 11:22:10PM +0100, Daniel Scally wrote:
> Hi Jacopo
>
> On 11/10/2021 15:34, Jacopo Mondi wrote:
> >>>> +static int ar0521_remove(struct i2c_client *client)
> >>>> +{
> >>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >>>> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> >>>> +
> >>>> +	v4l2_async_unregister_subdev(&sensor->sd);
> >>>> +	media_entity_cleanup(&sensor->sd.entity);
> >>>> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> >>>> +	pm_runtime_disable(&client->dev);
> >>>> +	pm_runtime_set_suspended(&client->dev);
> >>> set_suspended() then disable maybe ?
> >> Other drivers seem to do it the above way but I don't know the
> >> difference.
> > Maybe I'm wrong but calling set_suspend() after pm_runtime() had been
> > disabled seems pointless. A minor anyway as it's in the driver's
> > remove function.
> >
>
> fwiw, the kernel doc [1] for pm_runtime_set_suspended() does say that
> it's not valid to call it for devices where runtime PM is still enabled.
>

Ah, great! thanks for pointing it out, it was very well visible in the
documentation :) Sorry for the noise!

Cheers
   j

>
> [1]
> https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L510
>
