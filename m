Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A367843E4
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 16:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbjHVOWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 10:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236615AbjHVOWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 10:22:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC15FC7
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 07:22:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8817D899;
        Tue, 22 Aug 2023 16:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692714076;
        bh=MKVVZrDJGspfwCNMzUa3Nzf6Ij2H290saCztpy6O95E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aq4U66xImOp5ZCfx8yhvmgb5Vdk1Ow5siG3gZe6Bf2fo0JdfFPfs34DSRu7CWWkAi
         vYrHmQtGwL0UXG5rNq42FQKZ4U1/HWelcYasZEocPpu+PAQkdN+5jmV03Lyjbp6uPS
         O+Wb9+b+/vQqkGKyuolcY7QycRGrFZGV7c1NszIA=
Date:   Tue, 22 Aug 2023 17:22:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     claus.stovgaard@gmail.com
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        andreaskleist@gmail.com
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <20230822142241.GA14596@pendragon.ideasonboard.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <20230821121908.GD10135@pendragon.ideasonboard.com>
 <471df7ffdf34b73d186c429a366cfee62963015f.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <471df7ffdf34b73d186c429a366cfee62963015f.camel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Claus,

On Tue, Aug 22, 2023 at 02:52:35PM +0200, claus.stovgaard@gmail.com wrote:
> On Mon, 2023-08-21 at 15:19 +0300, Laurent Pinchart wrote:
> > On Mon, Aug 21, 2023 at 12:07:59PM +0200, Claus Stovgaard wrote:
> > > On Mon, 2023-08-21 at 08:55 +0200, Claus Stovgaard wrote:
> > > > 
> > > > Looking forward to try your branch. Looks much cleaner, and would be
> > > > nice to get working :)
> > > 
> > > I got it to work on Dell XPS 9320.
> > 
> > I'm glad to hear this ! Even if PSYS support will be needed to make the
> > IPU6 truly usable, it is a very nice step in the right direction.
> > 
> > Would you be interested in adding initial support for the IPU6 in
> > libcamera ? :-) Given that only the ISYS is currently available, and
> > given the simplicity of the hardware, it may be as easy as a single line
> > addition.
> 
> Hi Laurent.
> 
> Thanks for your offer - it might come in handy to have libcamera
> support, but I don't need it right now.
> 
> My use case is a bit special. I am working as Embedded Engineer for
> Ambu A/S, where we have 2 display units, named aView2 and aBox2, for
> single use endoscopy.
> 
> https://youtu.be/eDcSrHxzZ70?t=14
> 
> Those units is based on the intel Apollo Lake with IPU4, where only the
> isys part of IPU4 is used, as a FPGA in front of the Apollo Lake is
> used for image processing. So the image stream is sent to the Apollo
> Lake as RGB data - and is using the IPU4 isys as DMA. E.g. like below.
> 
> scope -> FPGA -> tc358748 -> IPU4-> memory

Out of curiosity, is this because the image processing requirements are
very device-specific, or was that done to work around the fact that the
IPU4 doesn't provide a good ISP driver ?

> We need to support this for newer kernels, then provided from intel
> (4.14 / 4.19)

*OUCH*. Seriously ?? :-(

> and looking at the code, it seems like a better option to
> base it on this IPU6 isys driver and extend it to cover IPU4 isys also.
> 
> So we are being inspired by the provided 4.14 / 4.19 kernel, and then
> work on the IPU6 codebase.
> 
> Our current status is that my coworker has the Buttress to load the
> firmware on IPU4, and we will continue work from there.
> 
> My end goal would be that an upstream vanilla kernel is able to support
> the isys part of IPU4, and the complete IPU6.

It would be very nice to have an upstream driver for the IPU4 CSI-2
receivers indeed. Looking forward to seeing one :-)

-- 
Regards,

Laurent Pinchart
