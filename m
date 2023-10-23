Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236657D3D15
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjJWRJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJWRJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:09:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CB5BD
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:09:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834482B6;
        Mon, 23 Oct 2023 19:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698080974;
        bh=3tGwWzV0NMvV6f3gViMIG4HDjfuSwklhIcSM70skKws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fzdMsWyDRrMv0W214ZIo5BXhDnmF5pabGstHdzgEdaQ4UvniCnUt+ZyFkR3Pgk3Ok
         eOXdM1qhLfVTnofY/DaOUs6jioe9huCkFfgTsdS6Ib/R8+P7TJAOf1C2dfYrhJNuHH
         paygKBkr51L6+iLYUeBjS11y+14HYimLuR54PKGc=
Date:   Mon, 23 Oct 2023 20:09:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231023170953.GA18687@pendragon.ideasonboard.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-2-sakari.ailus@linux.intel.com>
 <20231023132902.GQ3336@pendragon.ideasonboard.com>
 <20231023140845.GC13234@pendragon.ideasonboard.com>
 <ZTam_G4AAjgZ6Euw@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTam_G4AAjgZ6Euw@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 23, 2023 at 05:01:48PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Mon, Oct 23, 2023 at 05:08:45PM +0300, Laurent Pinchart wrote:
> > > > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > 
> > There's no sd field in struct v4l2_subdev_state in the linux media
> > master branch, no mention of dependencies in the cover letter, and no
> > specified base.
> > 
> > Please generate patch series with --base.
> 
> That wouldn't help.

Why not ?

> But I've realised what the problem is. I forgot to include the first patch.
> There were six patches, but one added made that seven...
> 
> I'll send v3, addressing comments found in v2.

-- 
Regards,

Laurent Pinchart
