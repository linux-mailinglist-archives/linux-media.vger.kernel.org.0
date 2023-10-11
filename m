Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B34C7C5E43
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 22:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbjJKUVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 16:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjJKUVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 16:21:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156DD90
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 13:21:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15AC3669;
        Wed, 11 Oct 2023 22:21:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697055700;
        bh=rPIOQ1E80lsFv6SQ9fJCB09mkQvP5XdXo/WM8mMmpzc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SmNZwQiL7clyYOW5JzGG+qfVYarE8vlEI3vr8UWjNmdJ17RpDlv1I1n2Nf/v8jstx
         STfUSuBrlqaLeSISbjTyOvFacgjvvDODpyapoaBbbB8gvssbOi4bV64jlL+Kdai/+h
         ch+vMGQRRE2+r6YNRXl0BEukRc+JSOGedVqPMr14=
Date:   Wed, 11 Oct 2023 23:21:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Alexander Shiyan <eagle.alexander923@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Fix null pointer dereference
 when link is not set
Message-ID: <20231011202150.GD5306@pendragon.ideasonboard.com>
References: <20231006074654.11468-1-eagle.alexander923@gmail.com>
 <ZSb7O+2pbIHKgroc@valkosipuli.retiisi.eu>
 <20231011194833.GC5322@pendragon.ideasonboard.com>
 <ZSb/LqHwDgLRCsvF@valkosipuli.retiisi.eu>
 <20231011200615.GC5306@pendragon.ideasonboard.com>
 <ZScDN0mg08Mq6K/F@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZScDN0mg08Mq6K/F@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 08:19:03PM +0000, Sakari Ailus wrote:
> On Wed, Oct 11, 2023 at 11:06:15PM +0300, Laurent Pinchart wrote:
> > On Wed, Oct 11, 2023 at 08:01:50PM +0000, Sakari Ailus wrote:
> > > On Wed, Oct 11, 2023 at 10:48:33PM +0300, Laurent Pinchart wrote:
> > > > On Wed, Oct 11, 2023 at 07:44:59PM +0000, Sakari Ailus wrote:
> > > > > On Fri, Oct 06, 2023 at 10:46:54AM +0300, Alexander Shiyan wrote:
> > > > > > Let's add a check for src_sd before using it.
> > > > > > The link may not be set, in which case the call to this function will fail.
> > > > > 
> > > > > That would seem like an understatement.
> > > > > 
> > > > > Any idea when this was introduced (and which patch did), Fixes: and Cc:
> > > > > stable should be added if this is already in a release.
> > > > 
> > > > It's actually an issue in the pipeline validation code in the V4L2 core.
> > > > The link is marked as MUST_CONNECT, but that isn't handled properly :-(
> > > > It's been on my todo list for a while but I haven't had time to get to
> > > > it. Feel free to give it a go.
> > > 
> > > What's wrong there? It used to work at least...
> > 
> > It's called a regression :-) If I recall correctly, if the pad is not
> > connected, it's not added to the list of pads to check, and the
> > MUST_CONNECT flag is not checked.
> 
> This has potential for other similar issues in a number of drivers.

Indeed, which is why it should be fixed there.

> I suppose this broke with the graph traversal changes ~ a year ago?

I assume so, yes.

-- 
Regards,

Laurent Pinchart
