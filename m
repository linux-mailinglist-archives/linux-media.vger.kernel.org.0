Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7307D353E
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 13:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbjJWLqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 07:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbjJWLq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 07:46:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FE9170F
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 04:46:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED268E45;
        Mon, 23 Oct 2023 13:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698061563;
        bh=c8OBA2tMxcWtZ98YfkIaXH3jLDxr6zN99ZDa0ZCrO0o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T7DyTEeEPzlx1p6S3BMNIXvkoJ9eciAYSqNiI7TjHjrdgUzdexcVKIq+pVCfD+G7y
         meot7/CMTvor6/Gnt89vZgzN3wJPi3ht0zfH2/eORenTV0ID/lyuZ214GKIK5GXgeW
         pa/5/44mPa6v5EPCoFkVP4Em2lz7fTyTNJFn6H24=
Date:   Mon, 23 Oct 2023 14:46:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH 1/6] media: v4l: subdev: Store the number of pads in
 sub-device state
Message-ID: <20231023114621.GL3336@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-2-sakari.ailus@linux.intel.com>
 <20231013105749.GA11101@pendragon.ideasonboard.com>
 <ZSkkoG7vjzMUXeOI@kekkonen.localdomain>
 <20231013111507.GE11101@pendragon.ideasonboard.com>
 <ZSknVGSWjNG2qwTa@kekkonen.localdomain>
 <380a79ea-0b68-4ec7-aa37-83e19f239968@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <380a79ea-0b68-4ec7-aa37-83e19f239968@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 23, 2023 at 11:34:25AM +0300, Tomi Valkeinen wrote:
> On 13/10/2023 14:17, Sakari Ailus wrote:
> > On Fri, Oct 13, 2023 at 02:15:07PM +0300, Laurent Pinchart wrote:
> >> On Fri, Oct 13, 2023 at 11:06:08AM +0000, Sakari Ailus wrote:
> >>> On Fri, Oct 13, 2023 at 01:57:49PM +0300, Laurent Pinchart wrote:
> >>>> On Fri, Oct 13, 2023 at 01:44:19PM +0300, Sakari Ailus wrote:
> >>>>> Store the number of pads in the sub-device state. This will be needed to
> >>>>> validate pad when retrieving information for non-stream-aware users.
> >>>>
> >>>> I'd rather store a pointer to the subdev. You can get the number of pads
> >>>> from there.
> >>>
> >>> The value is initialised after the array is allocated so this won't change.
> >>>
> >>> I don't have a strong opinion either way. It's still more efficient to
> >>> store just the value.
> >>
> >> Slightly so, but I don't think it will matter in practice. I believe
> >> we'll have more needs to access the subdev from the state in the future,
> >> which is why I'd rather store the pointer already.
> > 
> > Fair enough, I'll make it a sub-device pointer.
> 
> I have to say like the num_pads more here. We have a pointer to the pads 
> array in the struct v4l2_subdev_state, and it'd be logical to also have 
> the number of elements in that array in struct v4l2_subdev_state.

Yes, but we'll likely need access to the subdev in the future, and it
would then duplicate the information.

-- 
Regards,

Laurent Pinchart
