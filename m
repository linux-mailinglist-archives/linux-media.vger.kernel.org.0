Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D96C4029C2
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 15:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344372AbhIGNeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 09:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344367AbhIGNeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Sep 2021 09:34:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8131C061575
        for <linux-media@vger.kernel.org>; Tue,  7 Sep 2021 06:32:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C73B499;
        Tue,  7 Sep 2021 15:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631021576;
        bh=6IJZQDIDJtCLyWhmOko2x0EA8QxQ0oV6JRKF/nYnYeg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b1kOR3sxqbPSvOT2WrRpo4eOS6qUssUqx/Wvj5jVRaGdkZIAL+Qie1yTfl4dZjT3W
         YJkwaTzfbjcnVIJdlpuo411pLZteJfVT3dH/R4nZNlPkw8blz7Z8P+r5OdaPDTUryn
         /rtVcnkQIV2SiP0RgJ3JBwILbXOO3PHQjDM3ym4w=
Date:   Tue, 7 Sep 2021 16:32:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 0/2] New V4L2 control V4L2_CID_NOTIFY_GAINS
Message-ID: <YTdp9Ux0p38F+hfz@pendragon.ideasonboard.com>
References: <20210816113909.234872-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210816113909.234872-1-david.plowman@raspberrypi.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I've reviewed this series and it looks good to me. Sakari, would you
like to have a look, or should I send a pull request ?

On Mon, Aug 16, 2021 at 12:39:07PM +0100, David Plowman wrote:
> Hi again everyone
> 
> Thanks for last round of feedback, leading to this v6 pair of
> patches. I've made the documentation improvements that were suggested,
> and accordingly added Laurent's "Reviewed-by" tags.
> 
> Thanks and best regards
> 
> David
> 
> David Plowman (2):
>   media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
>   media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control
> 
>  .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  3 files changed, 22 insertions(+)

-- 
Regards,

Laurent Pinchart
