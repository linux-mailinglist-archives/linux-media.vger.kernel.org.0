Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4A22B8FE6
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 11:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgKSKHh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 05:07:37 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55745 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgKSKHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 05:07:37 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5E498C0008;
        Thu, 19 Nov 2020 10:07:32 +0000 (UTC)
Date:   Thu, 19 Nov 2020 11:07:35 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: Re: [PATCH v3 29/29] media: ov5647: Remove 640x480 SBGGR8 mode
Message-ID: <20201119100735.2ojkpkatpwjotlv2@uno.localdomain>
References: <20201109164934.134919-1-jacopo@jmondi.org>
 <20201109164934.134919-30-jacopo@jmondi.org>
 <20201118204813.GN3940@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201118204813.GN3940@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Nov 18, 2020 at 10:48:13PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Nov 09, 2020 at 05:49:34PM +0100, Jacopo Mondi wrote:
> > Capturing in 640x480 SBGGR8_1X8 hangs the system when capturing
> > with the unicam driver on RaspberryPi 4 platform.
> >
> > Remove it.
>
> Is this somehow a property of the sensor driver? Is the sensor driver in

More than a property I would say a failure of the sensor driver :)
> use somewhere else where this configuration could be useful? Can other 8

I'm not sure in which other platforms the 8bpp mode has been tested
with

> bpp configurations captured with the Unicam driver?

But unicam can capture 8bpp modes with imx219 (just tested) and
imx477 according to Dave


>
> --
> Regards,
>
> Sakari Ailus
