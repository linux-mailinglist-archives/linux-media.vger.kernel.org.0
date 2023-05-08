Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8DE96F9FEC
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 08:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbjEHGaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 02:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbjEHGaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 02:30:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA0D18FF4
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 23:30:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net [126.90.219.15])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50DF0905;
        Mon,  8 May 2023 08:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683527406;
        bh=QjKC8sE1xASvtv5ec5q4F5x/ygneMD3LdcQ5iWvCiro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uDHaIJbhCX0fz/A5LZkQpq9KXtX/EtG4qHU22JRnwCL7dYoc8/G+qBuq1jqHkzJ/p
         27VkBVWNAm/I3rf+h/IkdpS3PiTuT7spEyzmgNeLwSkNnq37cOjfP88v8stk68/pBD
         WihSxMrRXhVOcp9kKdJC5I4sjPrUawMdoPl6RANo=
Date:   Mon, 8 May 2023 09:30:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use unsigned int values for assigning
 bits in u32 fields
Message-ID: <20230508063023.GU23514@pendragon.ideasonboard.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-4-sakari.ailus@linux.intel.com>
 <20230506113223.GC17474@pendragon.ideasonboard.com>
 <ZFiUbA8xRIsR6KHV@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZFiUbA8xRIsR6KHV@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, May 08, 2023 at 09:19:24AM +0300, Sakari Ailus wrote:
> On Sat, May 06, 2023 at 02:32:23PM +0300, Laurent Pinchart wrote:
> > On Fri, May 05, 2023 at 11:51:01PM +0300, Sakari Ailus wrote:
> > > Use unsigned int values annoted by "U" for u32 fields. While this is a
> > > good practice, there doesn't appear to be a bug that this patch would fix.
> > > 
> > > The patch has been generated using the following command:
> > > 
> > > 	perl -i -pe 's/\([0-9]+\K <</U <</g' -- include/uapi/linux/media.h
> > 
> > How about using the _BITUL() macro from include/uapi/linux/const.h ?
> 
> These are u32 whereas _BITUL makes an unsigned long. Int (as in U) is 32
> bits on all platforms where Linux is used AFAIK.

I know, but is it a problem ?

> And thanks for the review!

-- 
Regards,

Laurent Pinchart
