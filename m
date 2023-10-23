Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446507D3DBC
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbjJWRar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233718AbjJWRaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:30:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B081FDB
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:29:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CED7C2B6;
        Mon, 23 Oct 2023 19:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698082160;
        bh=yxXfirZuB5XZK5TQUpNFHwU6+O9qoXwweOvFPplUAS8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MgU1OtE5ADRCeby+F4lwYGZbMGTb8ua1KBUokwTp2fz9v8eABX7rZxCngJJ3hpIXO
         85CtYaicxK9gR3MNWocFRIMyMybRyWiRp4tDDeF2n0thLoGyZnuJt5ceXQvLOuwaFb
         yhfr1MmNCVw8l2TzcfLvKyNm0z1Ylxos5IUkOSUU=
Date:   Mon, 23 Oct 2023 20:29:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231023172938.GB18687@pendragon.ideasonboard.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-2-sakari.ailus@linux.intel.com>
 <20231023132902.GQ3336@pendragon.ideasonboard.com>
 <20231023140845.GC13234@pendragon.ideasonboard.com>
 <ZTam_G4AAjgZ6Euw@kekkonen.localdomain>
 <20231023170953.GA18687@pendragon.ideasonboard.com>
 <ZTaq6wj5y5gHRLtH@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTaq6wj5y5gHRLtH@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 23, 2023 at 05:18:35PM +0000, Sakari Ailus wrote:
> On Mon, Oct 23, 2023 at 08:09:53PM +0300, Laurent Pinchart wrote:
> > On Mon, Oct 23, 2023 at 05:01:48PM +0000, Sakari Ailus wrote:
> > > Hi Laurent,
> > > 
> > > On Mon, Oct 23, 2023 at 05:08:45PM +0300, Laurent Pinchart wrote:
> > > > > > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > > > 
> > > > There's no sd field in struct v4l2_subdev_state in the linux media
> > > > master branch, no mention of dependencies in the cover letter, and no
> > > > specified base.
> > > > 
> > > > Please generate patch series with --base.
> > > 
> > > That wouldn't help.
> > 
> > Why not ?
> 
> Because the patch the rest of the set depends on is missing. The base for
> the patches is indeed the media stage tree (or close to that).

The cover letter will then mention that. Try it out :-)

> > > But I've realised what the problem is. I forgot to include the first patch.
> > > There were six patches, but one added made that seven...
> > > 
> > > I'll send v3, addressing comments found in v2.

-- 
Regards,

Laurent Pinchart
