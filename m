Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE5C27C5E02
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 22:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbjJKUGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 16:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjJKUGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 16:06:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF709D
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 13:06:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBDA8669;
        Wed, 11 Oct 2023 22:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697054766;
        bh=bNIbGuX/mQ4HIc+ZGj99ySwGCnVGLwd53aVs+4SGRBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mokGtsqQF+HRREuPkhqBF3eqRhK0+OvXiTvLH3w3b1SDGFlnX6QG5x2ZYRmV65eLE
         OmMhkRlm9dPHJptlC4up0cTp5iSOTkmbzPbdI17Du8COazg5SxiRQks88wNqoCI0dW
         0aPGLLczcGFZDAXSi5w+aHkF6QesI5JEXJtpiM3E=
Date:   Wed, 11 Oct 2023 23:06:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Alexander Shiyan <eagle.alexander923@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Fix null pointer dereference
 when link is not set
Message-ID: <20231011200615.GC5306@pendragon.ideasonboard.com>
References: <20231006074654.11468-1-eagle.alexander923@gmail.com>
 <ZSb7O+2pbIHKgroc@valkosipuli.retiisi.eu>
 <20231011194833.GC5322@pendragon.ideasonboard.com>
 <ZSb/LqHwDgLRCsvF@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZSb/LqHwDgLRCsvF@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 08:01:50PM +0000, Sakari Ailus wrote:
> On Wed, Oct 11, 2023 at 10:48:33PM +0300, Laurent Pinchart wrote:
> > On Wed, Oct 11, 2023 at 07:44:59PM +0000, Sakari Ailus wrote:
> > > On Fri, Oct 06, 2023 at 10:46:54AM +0300, Alexander Shiyan wrote:
> > > > Let's add a check for src_sd before using it.
> > > > The link may not be set, in which case the call to this function will fail.
> > > 
> > > That would seem like an understatement.
> > > 
> > > Any idea when this was introduced (and which patch did), Fixes: and Cc:
> > > stable should be added if this is already in a release.
> > 
> > It's actually an issue in the pipeline validation code in the V4L2 core.
> > The link is marked as MUST_CONNECT, but that isn't handled properly :-(
> > It's been on my todo list for a while but I haven't had time to get to
> > it. Feel free to give it a go.
> 
> What's wrong there? It used to work at least...

It's called a regression :-) If I recall correctly, if the pad is not
connected, it's not added to the list of pads to check, and the
MUST_CONNECT flag is not checked.

-- 
Regards,

Laurent Pinchart
