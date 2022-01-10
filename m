Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E06C4893E5
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 09:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242579AbiAJIpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 03:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241072AbiAJImi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 03:42:38 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D626C06175A;
        Mon, 10 Jan 2022 00:42:38 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id E53EE200CE;
        Mon, 10 Jan 2022 10:42:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1641804155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0luOgHJTcjq8vAIwnV6pZAXCRK6m3nL7sSRDJFPLCf4=;
        b=sdac2KgBgWJnB+7JzZPLWIHLl61ot/QbgL82NJjpQh7w9tF/wxbHFUMAnO8wObnGoigBT3
        va8894VbWVn/LfOZZZZWu6+AQHITe3u7/fm9YzxCVdBpOrzgH9plU5/6VbrcQekYHr1B1G
        qpPGjgKllZbQ/S/vOA6CNVchM+MFwPc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6C1AE634C90;
        Mon, 10 Jan 2022 10:42:34 +0200 (EET)
Date:   Mon, 10 Jan 2022 10:42:34 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 0/8] media: Drop .set_mbus_config(), improve
 .get_mbus_config()
Message-ID: <YdvxehTILoK9cAzj@valkosipuli.retiisi.eu>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220109143624.p25busbiwi2z4buk@uno.localdomain>
 <Ydtn9JIAHMFuZSju@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydtn9JIAHMFuZSju@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1641804155; a=rsa-sha256; cv=none;
        b=fUM/5uWHgPRSji0GQ1W21Zv3BHdzGJtU71orXKQTvxVYfKXl9EhK2VCLbu34/K9yAYRhk7
        gVs2Vk0E3SbMOx/P7H66xlLZZPsCudO+ZK99Q7aDDJbGkzVTyX95Ur8uQkE1w7wySYkhxc
        gqtm4n0pXnD+1C8q0w4Z1CaWBO5x2jU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1641804155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0luOgHJTcjq8vAIwnV6pZAXCRK6m3nL7sSRDJFPLCf4=;
        b=snvEeZJXlN3HM/O/jhFfe0z2AnSxf2z01ryoVCf3PM8ad6NQ12/51E6+hOb9rL89FXWblE
        doPPMeVxyFt0msGTNTlAi7tyaZpyVaB/YRQCgedC2iLcUzcAZN/NUPHJDwyJyBxTfRpMsM
        i+mQNBxei/XbXr3ycWA+0YfwETluWsY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Jacopo,

On Mon, Jan 10, 2022 at 12:55:48AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Sun, Jan 09, 2022 at 03:36:24PM +0100, Jacopo Mondi wrote:
> > On Mon, Jan 03, 2022 at 06:24:06PM +0200, Laurent Pinchart wrote:
> > > Hello,
> > >
> > > This patch series reworks the V4L2 subdev .get_mbus_config() and
> > > .set_mbus_config() operations to improve the former and drop the latter.
> > >
> > > These subdev operations originate from soc-camera (for those who
> > > remember the framework), and were designed to let a transmitter and a
> > > receiver negotiate the physical configuration of the bus that connects
> > > them. The operations use bitflags to represent bus parameters, with
> > > supported options set by the caller of .set_mbus_config(), and selected
> > > options among those returned by the callee. This mechanism is
> > > deprecated, as selection of the bus configuration has long been moved to
> > > the firmware interface (DT or ACPI), and usage of bitflags prevents from
> > > adding more complex configuration parameters (timings in particular).
> > >
> > > As .set_mbus_config() is deprecated and used by one pair of drivers only
> > > (pxa_camera and ov6650), it wasn't difficult to drop usage of that
> > > operation in patches 1/8 and 2/8, and remove the operation itself in
> > > patch 3/8.
> > >
> > > With that operation gone, .get_mbus_config() can be moved from bitflags
> > > to structures. It turned out that the needed data structures were
> > > already present in v4l2_fwnode.h. Patch 4/8 moves them to
> > > v4l2_mediabus.h (and renames them to drop the fwnode mention, as they're
> > > not specific to the fwnode API), and patch 5/8 makes use of them.
> > 
> > great, when the soc_camera version was dropped, the next thing to do
> > was to move away from bitflags and move to structure fields...
> 
> There's an endless supply of cleanups to be done.
> 
> > > Patches 6/8 to 8/8 then removes media bus configuration bitflags that
> > > are unneeded (and now unused).
> > 
> > Parallel might require a bit more of work, but csi2 already has a
> > single flag
> > 
> > /* Clock non-continuous mode support. */
> > #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)
> > 
> > so it should be trivial to replace 'flags' with a boolean
> > 'clock_noncontinuous' field.
> > 
> > One things leaves me a bit confused: we're now mixing run-time
> > configurable paramters (eg the number of data lanes in use in the
> > current streaming sessions) and paramters which come from DT and are
> > usually fixed by the HW design like lanes ordering.
> > 
> > Is this ok in your opinion ?
> 
> The .get_mbus_config() operation is meant to report the runtime
> configuration, which is constrained by hardware limitations (for
> instance the number of data lanes routed on the board, as expressed in
> DT, or the ability to support non-continuous clock mode, which is an
> intrinsic property of the device, known by the driver). When multiple
> options are possible within the constraints of the platform, how to
> select between them is currently unspecified. If the need arises, we'll
> have to study the use cases and find a solution.
> 
> > > The series is an RFC as not everything has been converted from bitflags
> > > to named fields in structures. In particular, the parallel bus flags
> > > haven't been touched at all. Patch 8/8 shows how mutually exclusive
> > > flags can be reworked to drop one of them. We then need to decide
> > > whether to keep expressing the flag as macros, or move to C bitfields
> > > with dedicated structure member names. I didn't want to include this
> > > change in the RFC before getting feedback on the general approach
> > > (feedback on those specific questions will also be appreciated).
> > 
> > There's also an opportunity to use v4l2_mbus_config as part of
> > v4l2_fwnode_endpoint instead of repeating the same fields ?
> > 
> > struct v4l2_fwnode_endpoint {
> > 	struct fwnode_endpoint base;
> > 	/*
> > 	 * Fields below this line will be zeroed by
> > 	 * v4l2_fwnode_endpoint_parse()
> > 	 */
> >         -------------------------------------------------------------
> > 	enum v4l2_mbus_type bus_type;
> > 	struct {
> > 		struct v4l2_mbus_config_parallel parallel;
> > 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> > 		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
> > 	} bus;
> >         -------------------------------------------------------------
> > 	u64 *link_frequencies;
> > 	unsigned int nr_of_link_frequencies;
> > };
> > 
> > struct v4l2_mbus_config {
> > 	enum v4l2_mbus_type type;
> > 	union {
> > 		struct v4l2_mbus_config_parallel parallel;
> > 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> > 		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
> > 	} bus;
> > };
> 
> I've thought about it, but not that the former groups the bus-specific
> data in a struct, while the latter uses a union. Whether or not we could
> use the same in both cases is an issue I have decided not to think about
> at this stage :-)

I think it should be possible to replace that struct by an union. In the
past that probably was not the case.

The defaults for a bus type should be set just before enumerating it.
Drivers should be verified of course.

-- 
Regards,

Sakari Ailus
