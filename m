Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB52769E43C
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 17:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbjBUQHA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 11:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234270AbjBUQG7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 11:06:59 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A6D2B28F
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:06:58 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DDAED10006E; Tue, 21 Feb 2023 16:06:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1676995615; bh=0R3jkteSJT+i02FKtIIJmCvaM+yR3IsVXDoYzVPRdZ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MWJiop5L9+BtHccsZFubNDoq+LHeVmHwV+3kwRq9zZRWsJBSV2C0X4pg73qBhznjy
         OfiUrndVvaGM4ohH0TijI/PFRtrumpwHzl+osx4RmZWoINkf/85WF4O6wi/7m48Swd
         BqH/CLjx97+pg/ATryCzoptG4TVgzIOPV7aiBy7C1jMte86FOvnI73jymEIGjF45HU
         VPVBuNIqx5FM5NxtJ86NFAqPHpG+Q55B36dMzqOxjxCAGPHRikRCJTb/fpILl/+Ztj
         kr0IEGrEdWZXDH8qAyfi42EkCIPebbgV16O7GNFMAsSINkx/RQF7qBCRAgFBJ338UJ
         O80ajZGUvTgPA==
Date:   Tue, 21 Feb 2023 16:06:55 +0000
From:   Sean Young <sean@mess.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, gjasny@googlemail.com,
        hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [v4l-utils] [PATCH v9 0/7] Switch build system to meson
Message-ID: <Y/TsH6PXU0JQ5wef@gofer.mess.org>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 21, 2023 at 04:31:57PM +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.

I've (re)tested the infrared tools, and it all looks good. The keymaps
and config are installed as they should be.

On my new shiny amd 5950x, ninja -C build takes just 7 seconds and meson
itself also runs instantiously. It's very nice indeed. Thanks for all the
good work Laurant.

Tested-by: Sean Young <sean@mess.org>


Sean
