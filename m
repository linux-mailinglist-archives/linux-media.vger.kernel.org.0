Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31FEB39D6A4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhFGIDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:03:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51034 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhFGIDE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 04:03:04 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06D158DB;
        Mon,  7 Jun 2021 10:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623052872;
        bh=0CT4441Hy+tfbQEEn2Es1cZH9FXlOWNCWUL5WmqTVy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AD9iHnf+b7qk0a1miSVCu0Wyt/u6CPuByHt5CbgCmfwbVrE4vvoF8NWLneznWodhW
         AOITLpLC30/a83PNVZ9NIW5psWavIbSgBkqHU783yPcG07LsLOCexDqkPHPHaodaWB
         EwPWkcQmiNCVbv3NZHDt89bBvSR9k9BiJ2tkggBM=
Date:   Mon, 7 Jun 2021 11:00:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 21/38] media: ti-vpe: cal: handle
 cal_ctx_v4l2_register error
Message-ID: <YL3SOsELi3yuoqDl@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-22-tomi.valkeinen@ideasonboard.com>
 <YLou7fPDyQaCaz1o@pendragon.ideasonboard.com>
 <a810e868-5ddf-7cf6-df70-723aa8bd447b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a810e868-5ddf-7cf6-df70-723aa8bd447b@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Jun 07, 2021 at 10:44:17AM +0300, Tomi Valkeinen wrote:
> On 04/06/2021 16:47, Laurent Pinchart wrote:
> > On Mon, May 24, 2021 at 02:08:52PM +0300, Tomi Valkeinen wrote:
> >> cal_async_notifier_complete() doesn't handle errors returned from
> >> cal_ctx_v4l2_register(). Add the error handling.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/ti-vpe/cal.c | 8 ++++++--
> >>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> >> index ba8821a3b262..9e051c2e84a9 100644
> >> --- a/drivers/media/platform/ti-vpe/cal.c
> >> +++ b/drivers/media/platform/ti-vpe/cal.c
> >> @@ -743,8 +743,12 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
> >>   	int ret = 0;
> >>   
> >>   	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> >> -		if (cal->ctx[i])
> >> -			cal_ctx_v4l2_register(cal->ctx[i]);
> >> +		if (!cal->ctx[i])
> >> +			continue;
> >> +
> >> +		ret = cal_ctx_v4l2_register(cal->ctx[i]);
> >> +		if (ret)
> >> +			return ret;
> > 
> > This part looks good, so
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Don't we need to call cal_ctx_v4l2_unregister() in the error path of
> > cal_async_notifier_register() though ?
> 
> Hmm, can you elaborate? I don't understand where and why we need to call 
> the unregister.

cal_async_notifier_complete() can be called synchronously by
v4l2_async_notifier_register() if all async subdevs are present. If
cal_ctx_v4l2_register() fails for one contexts, the failure will be
propagated to cal_async_notifier_register(), then to
cal_media_register(), and cal_probe(). Unless I'm mistaken, the contexts
for which cal_ctx_v4l2_register() succeeded will not be cleaned
properly.

-- 
Regards,

Laurent Pinchart
