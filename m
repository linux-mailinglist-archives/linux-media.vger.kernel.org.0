Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5D756235A
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 21:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236731AbiF3TnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 15:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236382AbiF3TnU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 15:43:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DF722533
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 12:43:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2739245F;
        Thu, 30 Jun 2022 21:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656618197;
        bh=4gxQyWiZnF+fGoFYm6S6v2eNt6AzLu0dIEGXMalHjGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ittwI31JX1GkWdecBYDX18X9NyHxARod/UOKFRffWKU1vrqKl/F1tr2oOrZGFZjWN
         OsA9bMvtYWYdFsVTUauIDgR+i9487CahPM7mxTVO31czgorQPgyUyJvwS5ZiS+K2IQ
         P2cS1QfXR4rwGEkOvEyYDKH/p12TiFJdSSKa0wL4=
Date:   Thu, 30 Jun 2022 22:42:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <Yr38wcjA24QkZSRQ@pendragon.ideasonboard.com>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
 <YrwRROJbH/P5lYi+@carbon.lan>
 <YrzzbwYr+ztrXbgZ@pendragon.ideasonboard.com>
 <Yr3w1T7s/7DTgZVd@carbon.gago.life>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yr3w1T7s/7DTgZVd@carbon.gago.life>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 30, 2022 at 09:52:05PM +0300, Petko Manolov wrote:
> On 22-06-30 03:50:55, Laurent Pinchart wrote:
> > 
> > For an i.MX8MM I'd try running the mainline kernel directly. If that doesn't
> > work, I would backport the camera drivers from mainline to the v5.15 NXP
> > kernel. As far as I know, the v5.18 branch isn't an official BSP release (I'm
> > actually not sure what it's for).
> 
> The 5.15 NXP kernel got released sometime in June, but the CSI capture drivers
> are pretty much the same as in their older versions.  So sad...
> 
> Nevermind, i'll share any good news here as well as the imx492 driver code as
> soon i am certain it can successfully stream in at least one mode.
> 
> BTW, the 'fec' section in Variscite's var-som-symphony DT is broken for v5.18
> (mainline) kernels. I am not certain whom should i send the patch.  Would that
> be Rob Herring or should i just use 'git blame' to identify the victim? :)

scripts/get_maintainer.pl is your friend for that.

-- 
Regards,

Laurent Pinchart
