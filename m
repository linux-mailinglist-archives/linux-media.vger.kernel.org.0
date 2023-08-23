Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25307853EA
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbjHWJ3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235342AbjHWJ0X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:26:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4389A172A
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 02:14:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E5F95A4;
        Wed, 23 Aug 2023 11:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692782002;
        bh=KQ0KsiJ+h6jq3DVenR0+i/n9MO0evSDaDfL3XOTEXFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uAVV+oYKHOsYO7Fp/Iuw5dCLm9WUBZZGpUFiKgBZUvC9YbRXqMw8a9nUWGKjVRuJl
         CSupsluPJTddNp95IWR2QKY/7Y3/Nne9gbu+U9CytOd7JA3BooBaBBsHd5N2+pGYBe
         5xsALk2ffS7Ok9R8YSI0+lCWCHBP8V5TmaIHPYEY=
Date:   Wed, 23 Aug 2023 12:14:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 14/18] media: i2c: imx219: Drop system suspend/resume
 operations
Message-ID: <20230823091446.GG4143@pendragon.ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-15-laurent.pinchart@ideasonboard.com>
 <CAPY8ntBX5P5SOitehxN-AGb9OaGQkSaW-z4a2R+HZ7LiKDP_Tg@mail.gmail.com>
 <ZOXLBAXVSZsyyNuN@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZOXLBAXVSZsyyNuN@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Aug 23, 2023 at 09:01:56AM +0000, Sakari Ailus wrote:
> On Tue, Aug 22, 2023 at 06:58:47PM +0100, Dave Stevenson wrote:
> > On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart wrote:
> > >
> > > There is no need to stop streaming at system suspend time, or restart it
> > > when the system is resumed, as the host-side driver is responsible for
> > > stopping and restarting the pipeline in a controlled way by calling the
> > > .s_stream() operation. Drop the system suspend and resume handlers, and
> > > simplify the .s_stream() handler as a result.
> > 
> > I'll believe you, but the docs for power management in camera sensor
> > drivers [1] state
> > "Please see examples in e.g. drivers/media/i2c/ov8856.c and
> > drivers/media/i2c/ccs/ccs-core.c. The two drivers work in both ACPI
> > and DT based systems."
> > 
> > Looking at CCS we find the suspend hook stopping streaming [2], and
> > resume hook starting it [3]. Same in ov8856 [4].
> > 
> > Could you reference the documentation that states that the host-side
> > driver is responsible for starting and stopping? Is this an ACPI vs DT
> > difference?
> 
> There's no difference between DT and ACPI, no.

The comment about drivers working with both ACPI- and DT-based systems
was related, as far as I understand, to usage of runtime PM, I don't
think it was related to system PM at all.

> Starting streaming on resume from system suspend is haphazard as there's no
> guarantee on the timing of resuming devices (if the suspend and resume
> independently), or similarly if the receiver driver explicitly starts
> streaming, there's no guarantee the sub-device driver has resumed.
> 
> So I think we'd need more than what currently exists on the framework side
> to do this reliably --- at least when it comes to CSI-2.

Device links help here. See for instance mxc_isi_async_notifier_bound()
in drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c. Ideally this
shouldn't be handled by drivers but by the V4L2 core though. In any
case, the sensors don't need to deal with it, enforcing correct ordering
is an issue for the connected receiver.

Sakari, you didn't explicitly answer whether you think that system
suspend/resume handlers are needed or not for camera sensor drivers.
What is your opinion on this ?

-- 
Regards,

Laurent Pinchart
