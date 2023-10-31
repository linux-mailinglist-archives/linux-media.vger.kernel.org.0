Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC34D7DCB13
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 11:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236299AbjJaKpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 06:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235071AbjJaKpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 06:45:46 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E4383;
        Tue, 31 Oct 2023 03:45:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4SKRcb54RKzyVh;
        Tue, 31 Oct 2023 12:45:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1698749140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H2lTLELFem5DpyMRkdv4gKGJZh1wufBq0gXd/vl7M/4=;
        b=EkXQoSVZGmFemBFTHWAdK9B3PlBiIgzTwNAryId/lHPjdby06VLELfz1g8/VGH2qlddXXn
        1IoWoKi48Rr2/d8RLTcQF+iwuBqxr9sY6eRJ1599LJDHLOhO6RDEer7qvhQKIe0o31vQoT
        wP2fmUCL58V46bwRUK+vAZNaHur06qE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1698749140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H2lTLELFem5DpyMRkdv4gKGJZh1wufBq0gXd/vl7M/4=;
        b=WISYaPU85RWcHvAKGGrKQ4EgBk8ywzHCjYAuLLgDhxUkRjK26t8FdG24C4KSSOl4VKbJwI
        3pfBP7opfKQdRCRUb6H3r7g6SjZDRko0FFvmJ+ArHygsQxevUMBlvcLoWRzxEDmWi+cswJ
        +/XJ2d+5amv0U0qPV08YLbizZ+Cj05E=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1698749140; a=rsa-sha256; cv=none;
        b=h0e5b9otCvJfu2Nll35AaiO2PeUTitwLs9ScHKesSN/xKrNgRT4mJGzgHq7QLR4Zp3iRo3
        L6NfZpoct4UQQAKzTOfTHGOosUZu490gF0zObv1cifmoSPPXF4vg73GgqiD49k3fRwkll0
        C5XWvaVBT3PZKlgBzKEZqkbWGDISMuI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 337FB634C93;
        Tue, 31 Oct 2023 12:45:32 +0200 (EET)
Date:   Tue, 31 Oct 2023 10:45:32 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 3/3] media: i2c: Add driver for THine THP7312
Message-ID: <ZUDatMX10WK0bdid@valkosipuli.retiisi.eu>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-4-laurent.pinchart@ideasonboard.com>
 <ZTutbU1XG_jKZbIp@valkosipuli.retiisi.eu>
 <20231027124529.GA19539@pendragon.ideasonboard.com>
 <ZTvOIQSmpytUisUD@valkosipuli.retiisi.eu>
 <20231028151858.GB20465@pendragon.ideasonboard.com>
 <ZT9kwC3abUKR9fgQ@valkosipuli.retiisi.eu>
 <20231030104241.GJ12144@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030104241.GJ12144@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Oct 30, 2023 at 12:42:41PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Oct 30, 2023 at 08:09:36AM +0000, Sakari Ailus wrote:
> > On Sat, Oct 28, 2023 at 06:18:58PM +0300, Laurent Pinchart wrote:
> > > On Fri, Oct 27, 2023 at 02:50:09PM +0000, Sakari Ailus wrote:
> > > > On Fri, Oct 27, 2023 at 03:45:29PM +0300, Laurent Pinchart wrote:
> > > > 
> > > > ...
> > > > 
> > > > > > > +#include <linux/clk.h>
> > > > > > > +#include <linux/delay.h>
> > > > > > > +#include <linux/device.h>
> > > > > > > +#include <linux/firmware.h>
> > > > > > > +#include <linux/gpio/consumer.h>
> > > > > > > +#include <linux/i2c.h>
> > > > > > > +#include <linux/init.h>
> > > > > > > +#include <linux/iopoll.h>
> > > > > > > +#include <linux/kernel.h>
> > > > > > > +#include <linux/module.h>
> > > > > > > +#include <linux/mtd/spi-nor.h>
> > > > > > > +#include <linux/of_device.h>
> > > > > > > +#include <linux/pm_runtime.h>
> > > > > > > +#include <linux/regulator/consumer.h>
> > > > > > > +#include <linux/slab.h>
> > > > > > > +#include <linux/thp7312.h>
> > > > > > 
> > > > > > uapi/linux/thp7321.h ?
> > > > > 
> > > > > Is that needed ?
> > > > 
> > > > It's a UAPI header. Wouldn't it be reasonable to include it that way
> > > > (instead of relying on searching include/uapi as well)?
> > > 
> > > There are some occurences of '#include <uapi/' in drivers/ (I counted
> > > 338), but why is that better ?
> > 
> > I'd presume that at some point the -Iinclude/uapi will be cleaned up and
> > then the only option remains to include it from there directly. Why not to
> > do it already now?
> 
> Will it be ? I've never heard of such a plan, but I may have missed it.
> I thought it was a feature meant to stay, and the recommended way to
> include headers in the uapi/ directory.

I'm not sure if anyone is cleaning that up actively but it seems like a
fairly obvious candidate for cleanup.

...

> > > > > > > +	/*
> > > > > > > +	 * Register a device for the sensor, to support usage of the regulator
> > > > > > > +	 * API.
> > > > > > > +	 */
> > > > > > > +	sensor->dev = kzalloc(sizeof(*sensor->dev), GFP_KERNEL);
> > > > > > > +	if (!sensor->dev)
> > > > > > > +		return -ENOMEM;
> > > > > > > +
> > > > > > > +	sensor->dev->parent = dev;
> > > > > > > +	sensor->dev->of_node = of_node_get(sensor->of_node);
> > > > > > 
> > > > > > This device could well find its way to a non-OF system. Could you use the
> > > > > > fwnode property API instead?
> > > > > 
> > > > > I'm pretty sure there will be problems if someone was using this driver
> > > > > on an ACPI-based system, so trying to pretend it's supported without
> > > > > being able to test it may not be the best use of development time. I'll
> > > > > try, but if I hit any issue, I'll keep using the OF-specific functions
> > > > > in the next version.
> > > > 
> > > > I'd suggest to use OF functions if there's no corresponding fwnode function
> > > > available. The intention is they cover the same scope, so it is likely
> > > > something that's missing will be added sooner or later.
> > > 
> > > I understand, but if the conversion is not complete, it's not very
> > > valuable. I have no objection against using the fwnode API in the
> > > driver, but I'll let someone else handle it when and if needed.
> > 
> > If you leave it using OF-only API now in a driver that is not bound to OF
> > in any way, someone moving it to fwnode later may not be able to test it on
> > OF, increasing the likelihood something breaks. So use fwnode API where you
> > can now, and we'll address that one call later on.
> 
> Sorry, this is extra work for very little gain (if any) now, so I don't
> plan to do so if I can't implement a full conversion.

I don't see why would you leave this for someone else to clean up later.
It's called "technical debt". Similarly, we have no ACPI-only sensor
drivers that would use ACPI specific functions that would not be available
on non-ACPI systems --- they've all used the fwnode API, missing just
regulators, clocks and GPIOs.

If you like, I think we could have an fwnode version of the same function,
to be used with DT binding compliant format for the device in ACPI DSDT.
Plain ACPI would have no need for the function.

Cc Andy, too.

-- 
Regards,

Sakari Ailus
