Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49BB570F702
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234808AbjEXM6R convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 24 May 2023 08:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjEXM6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:58:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A50AA
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:58:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1q1o4B-0002rN-Ab; Wed, 24 May 2023 14:58:11 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1q1o49-002UU4-9T; Wed, 24 May 2023 14:58:09 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1q1o48-00094A-Em; Wed, 24 May 2023 14:58:08 +0200
Message-ID: <edcc27d84e0bade5ccb40d4b677d54603d11aa65.camel@pengutronix.de>
Subject: Re: [PATCH v3 00/32] Separate links and async sub-devices
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Date:   Wed, 24 May 2023 14:58:08 +0200
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mi, 2023-05-24 at 14:23 +0300, Sakari Ailus wrote:
> Hi all,
> 
> This set adds support for multiple downstream links in an async
> sub-device, by separating the sub-device registration from the link
> creation.
> 
> A new concept, V4L2 async connection is added. A connection later on
> translates to an MC ancillary or data link. Generally async notifiers have
> a number of connections but at that level there is no knowledge of how
> many sub-devices they will connect to. The bound and unbound callbacks now
> work on connections. For the existing drivers there's only one connection
> so I do not expect regressions because of that.
> 
> Async sub-device fwnode matching will now take place between the device
> (the dev field of struct v4l2_subdev) and a struct v4l2_async_connection
> (an endpoint for devices that have endpoints or the device for those that
> do not). This is because the graph data structure only describes
> point-to-point connections so therefore defining one end of the connection
> defines the entire connection.
> 
> This set is unlikely to address all needs people have related to the async
> framework but I think that beyond what it does, it paves some way for
> addressing more of those additional needs.
> 
> To be frank, I'd like to get rid of the entire V4L2 async framework, but
> it would require allowing much more dynamic driver initialisation,
> including sub-devices and device nodes popping up in the system in the
> order and extent there is successfully probed hardware. Until that, and
> this may well be the entire foreseeable future, we have at least some of
> this complexity.
> 
> I didn't add the Tested-by: tags I got for v2 as there are significant
> changes, albeit only for better I hope. :-) Niklas has also tested this on
> rcar-vin + adv746x, it works now while on v2 it did not. So having also
> this version validated on i.MX6 would be nice.

Still works on i.MX6QP with TC358743.

Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp

regards
Philipp
