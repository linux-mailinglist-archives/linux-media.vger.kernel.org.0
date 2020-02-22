Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC9F1168E4E
	for <lists+linux-media@lfdr.de>; Sat, 22 Feb 2020 11:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgBVKoK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Feb 2020 05:44:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56204 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgBVKoK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Feb 2020 05:44:10 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A100733E;
        Sat, 22 Feb 2020 11:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582368248;
        bh=F/W2lCKceFGWqm9NHHPJsn5IsWlyDB6hgGq/P39379w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BjG1rrQZH9ORRL/GPzrvAXhOa2bNr2gN5XV7vGvzkhi4a2bAEmRyk9J83WrBVi56T
         tdxUNBEGWGtqnqd93DOZn9mv3LcIgs83hz38330Uslc+m5DB8Fp7jA4meKWFW2BDls
         17b4KfV1YKEiO72tC24OjgNdloH9Y5rlh2wVutNQ=
Date:   Sat, 22 Feb 2020 12:43:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [RFC PATCH 9/9] omap3isp/rcar_fdp1/vsp1/xilinx: drop VB2_USERPTR
Message-ID: <20200222104348.GE4846@pendragon.ideasonboard.com>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
 <20200221084531.576156-10-hverkuil-cisco@xs4all.nl>
 <6b0e13b1-77c8-1b15-6be1-3139ca471715@ideasonboard.com>
 <20200221143101.GI4955@pendragon.ideasonboard.com>
 <20200221194640.GI5023@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200221194640.GI5023@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Feb 21, 2020 at 09:46:41PM +0200, Sakari Ailus wrote:
> Hi Hans, Laurent,
> 
> On Fri, Feb 21, 2020 at 04:31:01PM +0200, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > CC'ing Sakari for the omap3isp part.
> 
> Thanks.
> 
> The omap3isp is behind an IOMMU, so the USERPTR memory does not need to be
> physically contiguous. I don't see a reason to drop userptr support from
> the driver.

Apart from the fact that this API should be discouraged :-) I wonder if
it's used, that's my real question. As we can't rule it out, I'd be
cautious about dropping it.

-- 
Regards,

Laurent Pinchart
