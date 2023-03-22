Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24426C4A9E
	for <lists+linux-media@lfdr.de>; Wed, 22 Mar 2023 13:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjCVMcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 08:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjCVMcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 08:32:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B5A53DB1
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 05:32:06 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB2FD118E;
        Wed, 22 Mar 2023 13:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679488325;
        bh=+wNtqaGXy6PClngnKMp70OCb5UzsF/tsYjAn60FyuQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nxLQ3KPMz9xSpNy5vYa5uM75G/eL6f1ikv8ICM4/mnkQK2r1uqsX8FX9m7saEHmw2
         Xx5V6fI7prDOgaRtLv+TlPf8dNcC65mICBZpUGmOdz8e6IHo3Pb8DfpBtPYTXxJVpV
         xsqSRNRC4bjovGtLw1RTG99UF3Zvvn/QijV+hNZc=
Date:   Wed, 22 Mar 2023 13:32:01 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <20230322123201.weh43bwchkphmtlq@uno.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230227171147.f4o2r5yajoj5nhyi@uno.localdomain>
 <Y/0qFC10ot4BgvFy@kekkonen.localdomain>
 <20230322122730.7upptgfrwpwlqoi5@uno.localdomain>
 <ZBr074jSExZfufDa@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZBr074jSExZfufDa@kekkonen.localdomain>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you ;)

If you post CCS patches I'll try to have a look if it speeds things up

On Wed, Mar 22, 2023 at 02:30:39PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Mar 22, 2023 at 01:27:30PM +0100, Jacopo Mondi wrote:
> > Hi Sakari,
> >   as Robert noted, this doesn't seem to be part of the pull request
> > for 6.4 ? Is it intentional ?
>
> Uh, yes and no. These definitely should go to 6.4 but I wanted to address
> the CCS driver at the same time. I'll try to post CCS patches next week but
> if these don't make it, I'll just merge these nonetheless.
>
> --
> Kind regards,
>
> Sakari Ailus
