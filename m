Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B41A7195E5
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 10:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjFAIpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 04:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbjFAIod (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 04:44:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D5218F
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 01:44:16 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q4dup-0005zj-DJ; Thu, 01 Jun 2023 10:44:15 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q4duo-0005bK-Fj; Thu, 01 Jun 2023 10:44:14 +0200
Date:   Thu, 1 Jun 2023 10:44:14 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: tc358746: Address compiler warnings
Message-ID: <20230601084414.zdsoltpatgojaoju@pengutronix.de>
References: <20230530102126.2886766-1-sakari.ailus@linux.intel.com>
 <20230531081810.pprennf7riycnvsm@pengutronix.de>
 <ZHhUtV1Vt/uqynYk@kekkonen.localdomain>
 <ZHhVIFYZpLq0Ju44@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHhVIFYZpLq0Ju44@kekkonen.localdomain>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
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

On 23-06-01, Sakari Ailus wrote:
> On Thu, Jun 01, 2023 at 08:20:06AM +0000, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Wed, May 31, 2023 at 10:18:10AM +0200, Marco Felsch wrote:
> > > Hi Sakari,
> > > 
> > > Hans already sent a patch a few months ago:
> > >  - https://lore.kernel.org/linux-media/15030a07-3615-fca0-1891-a234dc054b00@xs4all.nl/
> > > 
> > > It turned out that the compiler had a bug albeit the compiler listed in
> > > 'Closes:' is already a gcc-12 and now the warning used is slightly
> > > different.
> > > 
> > > I'm not again the patch but we should point out that this patch is only
> > > required to make the compiler happy.
> > 
> > Ack, thanks. I'll drop this then. The condition isn't trivial for a
> > compiler to figure out though, even I'm not quite sure this is the case for
> > all parameter values.

I don't want to complain here O:) and as I said we can pick the patch
but we should mention that this is a patch for the compiler.

> Hans's patch actually assigns p_best to 0 which isn't a best default value
> for a divisor.

You're right.

Regards,
  Marco
