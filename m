Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71BE6FA18B
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 09:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbjEHHwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 03:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233559AbjEHHwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 03:52:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8F51BCF
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 00:51:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net [126.90.219.15])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F076755;
        Mon,  8 May 2023 09:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683532312;
        bh=/56sBcX4Tra9Zrkd7Anc8XmIKFkyYhUvUPrS+1n7hXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZsiVpM3ZDQs2T5n8na/MXG6w9KpI3N4pe4emCVxj8q9YLjpNBTqnMFD6pdnVXb1Ny
         yciEjmygUR2hWlnIYm/fHEujFOI7oUvU6XD1yw+R+xehkWodfLgRTBjNrHxQfNwo8L
         f7yxIqu0REnyIxPGEUlz+eef6ndiZgPdHkQ+8tt4=
Date:   Mon, 8 May 2023 10:52:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use unsigned int values for assigning
 bits in u32 fields
Message-ID: <20230508075209.GV23514@pendragon.ideasonboard.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-4-sakari.ailus@linux.intel.com>
 <20230506113223.GC17474@pendragon.ideasonboard.com>
 <ZFiUbA8xRIsR6KHV@kekkonen.localdomain>
 <20230508063023.GU23514@pendragon.ideasonboard.com>
 <ZFidqGx5Kl/moD6h@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZFidqGx5Kl/moD6h@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, May 08, 2023 at 09:58:48AM +0300, Sakari Ailus wrote:
> On Mon, May 08, 2023 at 09:30:23AM +0300, Laurent Pinchart wrote:
> > On Mon, May 08, 2023 at 09:19:24AM +0300, Sakari Ailus wrote:
> > > On Sat, May 06, 2023 at 02:32:23PM +0300, Laurent Pinchart wrote:
> > > > On Fri, May 05, 2023 at 11:51:01PM +0300, Sakari Ailus wrote:
> > > > > Use unsigned int values annoted by "U" for u32 fields. While this is a
> > > > > good practice, there doesn't appear to be a bug that this patch would fix.
> > > > > 
> > > > > The patch has been generated using the following command:
> > > > > 
> > > > > 	perl -i -pe 's/\([0-9]+\K <</U <</g' -- include/uapi/linux/media.h
> > > > 
> > > > How about using the _BITUL() macro from include/uapi/linux/const.h ?
> > > 
> > > These are u32 whereas _BITUL makes an unsigned long. Int (as in U) is 32
> > > bits on all platforms where Linux is used AFAIK.
> > 
> > I know, but is it a problem ?
> 
> If we have a u32 field, unsigned int is the right type for that (from
> non-fixed length C types), not unsigned long. In practice it would work, I
> have no doubts about that. The compiler could still do different decisions
> due to this, promoting values to a 64-bits for instance.
> 
> If we had _BITU(), I'd be happy to use that. :-)

Note how BIT() is defined in include/vdso/bits.h:

#include <vdso/const.h>

#define BIT(nr)                 (UL(1) << (nr))

And in include/vdso/const.h:

#include <uapi/linux/const.h>

#define UL(x)           (_UL(x))

BIT() is thus essentially identical to _BITUL(). As we use the former
everywhere without any trouble, I wouldn't expect issue with the latter.

> How about this: let's merge this patch and then see how a _BITU() macro
> would fare.

-- 
Regards,

Laurent Pinchart
