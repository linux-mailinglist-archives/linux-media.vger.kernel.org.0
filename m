Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329B6706795
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 14:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbjEQMI3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 17 May 2023 08:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjEQMIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 08:08:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E312F83D0
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 05:06:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1pzFv3-0000ip-8A; Wed, 17 May 2023 14:06:13 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1pzFv0-000pZf-Cg; Wed, 17 May 2023 14:06:10 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1pzFuz-0007Kp-Et; Wed, 17 May 2023 14:06:09 +0200
Message-ID: <7e124c395996217c6d5fa85ee82264ec85e6818d.camel@pengutronix.de>
Subject: Re: [PATCH v2 00/31] Separate links and async sub-devices
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Marcel Ziswiler <marcel@ziswiler.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Date:   Wed, 17 May 2023 14:06:09 +0200
In-Reply-To: <7b015114450646f6ead6bdfbe9301e3bbf596d05.camel@ziswiler.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
         <2234496be65fd2a5aeccac278f6c37ddf104514e.camel@pengutronix.de>
         <7b015114450646f6ead6bdfbe9301e3bbf596d05.camel@ziswiler.com>
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

Hi Marcel,

On Mi, 2023-05-17 at 13:24 +0200, Marcel Ziswiler wrote:
> Hi Philipp
> 
> On Wed, 2023-05-17 at 11:43 +0200, Philipp Zabel wrote:
> > Hi Sakari,
> > 
> > On Di, 2023-05-16 at 12:54 +0300, Sakari Ailus wrote:
> > > Hi all,
> > > 
> > > This set adds support for multiple downstream links in an async
> > > sub-device, by separating the sub-device registration from the link
> > > creation.
> > 
> > thank you, capture works again on i.MX6QP (tested with TC358764).
> 
> You probably meant TC358743 being HDMI/CSI as TC358764 is DSI/LVDS, right?

Yes, muscle memory auto-completion failure. Thanks!

regards
Philipp
