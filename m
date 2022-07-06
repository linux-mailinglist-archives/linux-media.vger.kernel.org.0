Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D135694AF
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 23:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233973AbiGFVtF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 17:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbiGFVtE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 17:49:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EFA140F9
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 14:49:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8376730A;
        Wed,  6 Jul 2022 23:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657144142;
        bh=10kNBLu5wyjbkpqD2913q/MCHJ9mBOP0MyfQuT7lUYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dBaaOco2v71CjDcd6hIHr5DqlHQT5v3tmZkAL4cnPNe+QsxmcW4vqmVZIjHUXV2Q4
         bLMljHlTI/MrhLJiKfWxotagN7nNr6jV3/V4h5vlAHy6YoPnkQJfDCPBuo8PDDH0RJ
         LZQNJxHdpNTW/b96MJZ50QfsvTZRqZLRVX/f2Hso=
Date:   Thu, 7 Jul 2022 00:48:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsYDNaPl5nP5RQ/F@pendragon.ideasonboard.com>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
 <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
 <YsXh/arQZXnaeGAi@carbon.gago.life>
 <YsXrnJ+sTPztWR2A@carbon.gago.life>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsXrnJ+sTPztWR2A@carbon.gago.life>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 06, 2022 at 11:07:56PM +0300, Petko Manolov wrote:
> On 22-07-06 22:26:54, Petko Manolov wrote:
> > 
> > VID_MEM_LIMIT is only 64MB while the image is ~90MB, but it looks like four of
> > those are required.  I increased the CMA to 640MB, defined VID_MEM_LIMIT to
> > 512MB and got something that look like it's working.  I am yet to convert the
> 
> Forgot to mention - with debug disabled vb2_core_reqbufs() would trip on line 829
> WARN_ON() and dump its guts.  With debug 'on' this doesn't happen.
> 
> Not sure if this is the intended behavior, just mentioning it here.

I don't think that's intended, it would be nice to figure out why.

-- 
Regards,

Laurent Pinchart
