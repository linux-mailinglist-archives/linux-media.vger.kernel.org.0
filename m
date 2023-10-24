Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A572C7D4AC6
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 10:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbjJXIrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 04:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjJXIrP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 04:47:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF05E99
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 01:47:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0666AE;
        Tue, 24 Oct 2023 10:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698137220;
        bh=+fSNJOu92HvBSuVnaAZPMBuaAIYcNgZa5ulFuIVi1ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qWNRf+ffUDF7+4/p4I9+POD3YsWLACzzxa2Ro2/MHDgbCM5IVHwnU5aUwt/gqVqTH
         B6OIXxQuzbqTZCUniaUfb6bvgq+vN4pJZK0GbHVQAJ76+QZonsqVJGDQRXi7uiNvAy
         cmS3UgmYNSoDBiUojCklXA4SJn3A1K8WhpTba0m0=
Date:   Tue, 24 Oct 2023 11:47:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Eugen Hristev <eugen.hristev@collabora.com>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Petr Cvek <petrcvekcz@gmail.com>
Subject: Re: [PATCH 0/7] media: v4l2-subdev: Rename pad config 'try_*' fields
Message-ID: <20231024084718.GC5121@pendragon.ideasonboard.com>
References: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
 <74e11289-268c-4f05-923b-2d00467c064a@collabora.com>
 <8c3659ea-e844-4ad2-b2fb-4eb27d8fccc7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c3659ea-e844-4ad2-b2fb-4eb27d8fccc7@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 24, 2023 at 11:41:57AM +0300, Tomi Valkeinen wrote:
> On 24/10/2023 09:55, Eugen Hristev wrote:
> > On 10/24/23 00:40, Laurent Pinchart wrote:
> >> Hello,
> > 
> > Hello Laurent,
> > 
> >>
> >> This series is the result of me getting bothered by the following note
> >> in the documentation of the v4l2_subdev_pad_config structure:
> >>
> >>   * Note: This struct is also used in active state, and the 'try' 
> >> prefix is
> >>   * historical and to be removed.
> >>
> >> So I decided to drop the prefix.
> >>
> >> Patches 1/7 to 6/7 replace direct usage of the fields in drivers with
> >> the corresponding accessor functions. There was a relatively large
> >> number of them in sensor drivers (in 6/7), but more worryingly, the
> >> atmel-isi (1/7), microchip-isc (2/7) and tegra-video (5/7) should really
> >> not have messed up with creating a v4l2_subdev_pad_config structure
> >> manually. I urge the maintainers of those drivers to address the issue.
> > 
> > Could you hint a bit about how the issue should be addressed ?
> > Instead of creating a `v4l2_subdev_pad_config`, one should use 
> > v4l2_subdev_lock_and_get_active_state() ? Is this the right way to do it ?
> 
> I had a quick look at atmel-isi. If I understand it right, it does not 
> expose the subdevs to the userspace, and 'isi->entity.subdev' refers to 
> the sensor.
> 
> In that case I think using v4l2_subdev_call_state_active() and 
> v4l2_subdev_call_state_try() should usually work.
> 
> If there are cases where the same try state needs to be used for 
> multiple calls, then the state management has to be done manually with 
> __v4l2_subdev_state_alloc() and __v4l2_subdev_state_free() (e.g. 
> drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c).

And for the microchip-isc driver, my understanding is that it's an
MC-centric driver. It should therefore not call the sensor's
.enum_frame_size() operation, which would remove the stack-allocated
state in the isc_validate() function.

-- 
Regards,

Laurent Pinchart
