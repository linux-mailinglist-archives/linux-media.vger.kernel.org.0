Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96647C842B
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjJMLPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjJMLPD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:15:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A93B7
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:15:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63520221;
        Fri, 13 Oct 2023 13:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697195696;
        bh=lMVx0d0qPwXwx5eX3Gb6Wd6DMA+NzK2VaqRMXmMTp1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2AZmRd6Nd1J6TXxnxTPBy/LGuGtncI6W8I8iZ+kMTTa7CviiZcoSII0ckfNjNWH2
         +Sk78aQh40SibxLqZEZX/XlWso6z9Xm25m1OyGasOJa14vdYseKy2PMo5Xcj4FV38k
         jlkjn33W8zcnLf+eHuVYSTBlE5gpuXNwaZGcjZio=
Date:   Fri, 13 Oct 2023 14:15:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 1/6] media: v4l: subdev: Store the number of pads in
 sub-device state
Message-ID: <20231013111507.GE11101@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-2-sakari.ailus@linux.intel.com>
 <20231013105749.GA11101@pendragon.ideasonboard.com>
 <ZSkkoG7vjzMUXeOI@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZSkkoG7vjzMUXeOI@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 13, 2023 at 11:06:08AM +0000, Sakari Ailus wrote:
> On Fri, Oct 13, 2023 at 01:57:49PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 13, 2023 at 01:44:19PM +0300, Sakari Ailus wrote:
> > > Store the number of pads in the sub-device state. This will be needed to
> > > validate pad when retrieving information for non-stream-aware users.
> > 
> > I'd rather store a pointer to the subdev. You can get the number of pads
> > from there.
> 
> The value is initialised after the array is allocated so this won't change.
> 
> I don't have a strong opinion either way. It's still more efficient to
> store just the value.

Slightly so, but I don't think it will matter in practice. I believe
we'll have more needs to access the subdev from the state in the future,
which is why I'd rather store the pointer already.

-- 
Regards,

Laurent Pinchart
