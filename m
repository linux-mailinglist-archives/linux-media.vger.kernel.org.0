Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D48E3638C69
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbiKYOkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiKYOkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:40:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BD6326F6;
        Fri, 25 Nov 2022 06:40:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36E25496;
        Fri, 25 Nov 2022 15:40:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669387238;
        bh=0bnjZSYznGywN/B8Q+QDx8ueVlaptdItSScK7DR+rfM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LjbzNtFcie9qDAnfR3e6TjEWJewfY2JUbUtROQ7jnfRoMbgGEdxZI4Zq4gnjTX7ug
         FTB3Gn/QaShPvuvWQmeJazEDv9CUdioLr45/prJrjIRA95mLaWvtm2YJjPCGQGv6Mn
         Yd8fntuInqF9mx6N8RKoaaFjn9OQHU2x8Rx6b4lE=
Date:   Fri, 25 Nov 2022 16:40:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Message-ID: <Y4DT1ovvIR4NB5qm@pendragon.ideasonboard.com>
References: <20221124200007.390901-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221124200007.390901-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 24, 2022 at 09:00:04PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is a small set of patches to make the int3472/discrete code
> work with the sensor drivers bundled with the (unfortunately out of tree)
> IPU6 driver.
> 
> There are parts of the out of tree IPU6 code, like the sensor drivers,
> which can be moved to the mainline and I do plan to work on this at some
> point and then some of this might need to change. But for now the goal is
> to make the out of tree driver work with standard mainline distro kernels
> through e.g. dkms. Otherwise users need to run a patched kernel just for
> a couple of small differences.
> 
> This is basically a rewrite of this patch:
> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
> 
> Wich users who want to use the IPU6 driver so far have had to manually
> apply to their kernels which is quite inconvenient.
> 
> This rewrite makes 2 significant changes:
> 
> 1. Don't break things on IPU3 platforms
> 
> 2. Instead of extending the int3472_sensor_configs[] quirks table for each
> model which needs "clken" and "pled" GPIOs, do this based on matching
> the ACPI HID of the ACPI device describing the sensor.

How can we be sure that a given sensor model will always be wired to the
same GPIOs on all platforms that integrate it with an IPU6 (or IPU3) ?

> The need for these GPIOs is a property of the specific sensor driver which
> binds using this same HID, so by using this we avoid having to extend the
> int3472_sensor_configs[] quirks table all the time.
> 
> This allows roling back the behavior to at least use a clk-framework
> clk instead of clken GPIO on a per sensor(-driver) basis as we mainline
> the sensor drivers, assuming that the drivers are switched over to the
> clk framework as part of their mainlining.
> 
> A bigger question is what to do with the privacy-led GPIO on IPU3
> we so far have turned the LED on/off at the same as te clock,
> but at least on some IPU6 models this won't work, because they only
> have a privacy-led GPIO and no clk_en GPIO (there is no sensor
> clk-control at all on some models).

Can we turn it on at the same time as the power then ?

> I think we should maybe move all models, including IPU3 based
> models over to using a normal GPIO for controlling the privacy-led
> to make things consistent.
> 
> And likewise (eventually) completely drop the "clken" GPIO this
> patch series introduces (with some sensors) and instead always model
> this through the clk-framework.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (3):
>   platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
>   platform/x86: int3472/discrete: Get the polarity from the _DSM entry
>   platform/x86: int3472/discrete: Add support for sensor-drivers which
>     expect clken + pled GPIOs
> 
>  drivers/platform/x86/intel/int3472/common.h   |  2 +-
>  drivers/platform/x86/intel/int3472/discrete.c | 92 ++++++++++++++++---
>  2 files changed, 78 insertions(+), 16 deletions(-)

-- 
Regards,

Laurent Pinchart
