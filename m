Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BE7363D79
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 10:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbhDSIby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 04:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhDSIbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 04:31:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2507C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 01:31:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DAFA897;
        Mon, 19 Apr 2021 10:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618821080;
        bh=dXQLvnLFo1OIIijlze0tsjz6pobfR5Vb663W7XBOvHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fFjiKrWr5qbWDthoyGNbJeEbXzA6Gp2+6D1lOtp4RalOopnGtjw/WgH6JsA3t8j0H
         cHNCBTXho3llsX22dg4Gz9G6zK9l0MvLTCA9vabRYbaa/S8gPgooN98S920biNaJQV
         G4tTPqnst0VDxm7s8p+F+uyEMmykl38yMVY4Kd9c=
Date:   Mon, 19 Apr 2021 11:31:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/28] media: ti-vpe: cal: fix error handling in
 cal_camerarx_create
Message-ID: <YH0/1Ct74/fKm9zg@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-3-tomi.valkeinen@ideasonboard.com>
 <YHtpnurWK0or8TfM@pendragon.ideasonboard.com>
 <d813dc3b-8dd3-fa4a-64bc-d9394eff50c6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d813dc3b-8dd3-fa4a-64bc-d9394eff50c6@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Apr 19, 2021 at 11:24:01AM +0300, Tomi Valkeinen wrote:
> On 18/04/2021 02:05, Laurent Pinchart wrote:
> > On Mon, Apr 12, 2021 at 02:34:31PM +0300, Tomi Valkeinen wrote:
> >> cal_camerarx_create() doesn't handle error returned from
> >> cal_camerarx_sd_init_cfg()
> > 
> > This looks good.
> > 
> >> and it always runs all the cleanup/free
> >> functions in the error code path. The latter doesn't cause any issues at
> >> the moment as media_entity_cleanup() is an empty function.
> > 
> > But this was by design. Do you think we could keep
> > media_entity_cleanup() idempotent ? That would simplify error paths (as
> > shown here).
> 
> It isn't documented. I can change the doc for media_entity_cleanup to 
> state it can be called multiple times, if that was the intention, and 
> simplify the error handling here.

That would be my preference. media_entity_cleanup() isn't
performance-sensitive, so I'd favour ease of use and simplicity of error
handling in drivers.

-- 
Regards,

Laurent Pinchart
