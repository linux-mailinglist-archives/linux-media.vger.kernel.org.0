Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520BD7D8460
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 16:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbjJZOUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 10:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjJZOUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 10:20:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBC81A2
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 07:20:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7D1075B;
        Thu, 26 Oct 2023 16:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698329993;
        bh=hM51KPwX42jR/qMtaQm27v3NJ6B+6Z7CGY4buBbIjSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCJgKr3QtktTI0Mczy9jX328pO35Z1dVZA0EWgf9vxgGP/nomAx5mp9rDnfuwYTaK
         by9QA0e2bWkD/MDRR3yrynYRU516jN9GSwERiJ/NciWf5r0K0U5lgi1YALtqxell8q
         s73SpO3A4c4jeTb/xCKEn20jmCuHVXseHSktryWk=
Date:   Thu, 26 Oct 2023 17:20:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 9/9] media: v4l: subdev: Warn on stream when accessing
 stream-unaware data
Message-ID: <20231026142011.GG26306@pendragon.ideasonboard.com>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-10-sakari.ailus@linux.intel.com>
 <913f5d17-58b3-4631-912c-98203e896ff6@xs4all.nl>
 <ZToYBPjwqKOIs68L@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZToYBPjwqKOIs68L@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 26, 2023 at 07:40:52AM +0000, Sakari Ailus wrote:
> On Thu, Oct 26, 2023 at 09:36:41AM +0200, Hans Verkuil wrote:
> > On 26/10/2023 09:03, Sakari Ailus wrote:
> > > Warn if the stream is set ot a non-zero value on sub-device pad state
> > > access functions. A driver bug is required for triggering the warning.
> > 
> > More confusion here: why not merge this into patch 2?
> 
> I can squash it there.

I'm fine with that, but I wonder if we need a WARN_ON() in that case.
Won't driver developers notice the bug, given they'll get a NULL pointer
?

-- 
Regards,

Laurent Pinchart
