Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C14D6C4A70
	for <lists+linux-media@lfdr.de>; Wed, 22 Mar 2023 13:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjCVM1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 08:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjCVM1g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 08:27:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF95A559FC
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 05:27:34 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F91B118E;
        Wed, 22 Mar 2023 13:27:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679488052;
        bh=9QjYAFS+mMKrzO7ZTUXCijVRXyuJjXsC6mmq7OKbqbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mT4pL6+zt4y2Wc07UVPqwTAZX+vze/IU3+kKSAnLgA2PO5bmoj2I+3svKYfS9QK2E
         3VW+XtWlzN08hh/QHm1fv6txZJImluYCxCsaP03pgRKQvFL92Rh9Is343nB2RpkRgU
         CIWUck/u96UxpeTMXTOPDtFakzxoOl1rhICAz4Ls=
Date:   Wed, 22 Mar 2023 13:27:30 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <20230322122730.7upptgfrwpwlqoi5@uno.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230227171147.f4o2r5yajoj5nhyi@uno.localdomain>
 <Y/0qFC10ot4BgvFy@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/0qFC10ot4BgvFy@kekkonen.localdomain>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,
  as Robert noted, this doesn't seem to be part of the pull request
for 6.4 ? Is it intentional ?

Thanks
  j

On Tue, Feb 28, 2023 at 12:09:24AM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Feb 27, 2023 at 06:11:47PM +0100, Jacopo Mondi wrote:
> > Hi Sakari
> >
> >    I don't see this patch being collected for 6.3 while I recall that
> > based on the discussion we concluded we can have these in and the
> > iterate on top ?
>
> I know... I'll take it to my tree early in the next cycle (once we have
> rc1).
>
> --
> Kind regards,
>
> Sakari Ailus
