Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE274231A66
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 09:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2Hfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 03:35:40 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:46003 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2Hfk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 03:35:40 -0400
Received: from belgarion ([86.210.166.159])
        by mwinf5d67 with ME
        id 8vbW2300K3SgWc603vbbFk; Wed, 29 Jul 2020 09:35:38 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 29 Jul 2020 09:35:38 +0200
X-ME-IP: 86.210.166.159
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 1/9] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
        <20200714135812.55158-2-jacopo+renesas@jmondi.org>
        <750089f9-0e7f-3b2a-ec85-38452cb64fa1@xs4all.nl>
        <4043309.ejJDZkT8p0@z50>
        <f60dc28c-ac30-0ddc-efb5-62b22d4cbaa7@xs4all.nl>
X-URL:  http://belgarath.falguerolles.org/
Date:   Wed, 29 Jul 2020 09:35:30 +0200
In-Reply-To: <f60dc28c-ac30-0ddc-efb5-62b22d4cbaa7@xs4all.nl> (Hans Verkuil's
        message of "Mon, 20 Jul 2020 10:48:36 +0200")
Message-ID: <87zh7isri5.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil-cisco@xs4all.nl> writes:

> The information on how a sensor (or similar device) is wired up is not something
> that should be negotiated. Even if a combination is theoretically possible, it
> may not have been tested by the board designer and in fact it might not work.
> (Yes, that happens)
>
> It is just a bad design trying to negotiate this.
I quite agree on that one (on the wiring defined by configuration).

> In fact, the only values that can be set as far as I am concerned are lanes and
> channels. I wouldn't mind if the other settings are purely read-only. The only
> driver that actively sets this is the pxa_camera driver and I wish it didn't.
>
> But there are still two pxa boards that use this mechanism, so I guess we still
> have to allow this.
There are 4 :
rj@belgarion:~/mio_linux/kernel/arch/arm/mach-pxa$ grep -rs pxa_set_camera * | grep -v devices.c
ezx.c:		pxa_set_camera_info(&a780_pxacamera_platform_data);
ezx.c:		pxa_set_camera_info(&a910_pxacamera_platform_data);
mioa701.c:	pxa_set_camera_info(&mioa701_pxacamera_platform_data);
palmz72.c:	pxa_set_camera_info(&palmz72_pxacamera_platform_data);
pcm990-baseboard.c:	pxa_set_camera_info(&pcm990_pxacamera_platform_data);

I wouldn't mind that the bus parameters are made "static" by forcing them in the
platform data field (struct pxacamera_platform_data), and not doing the bus
compatibility matching.

I thing Jacopo's work is going this way, as I read that his patch takes first
the platform data flags, and only if none are defined goes to the matchup. That
looks very sensible to me.

Cheers.

--
Robert
