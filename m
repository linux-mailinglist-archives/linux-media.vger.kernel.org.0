Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 605B415206A
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 19:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgBDSYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 13:24:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50414 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbgBDSYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 13:24:14 -0500
Received: from pendragon.ideasonboard.com (64.177-245-81.adsl-dyn.isp.belgacom.be [81.245.177.64])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42D76A58;
        Tue,  4 Feb 2020 19:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1580840652;
        bh=zFTGFSo/WAbNQNNcicSOhOMizabwjgIxq1c8MgbFkec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oN7tszKMI2XHQb5w0TU8eJwAzTY7SXN3mQgwVdK6DIQg9RCaEqlb7i14WLb+qBLRI
         9vr/i4+0dteEiA1OqpMl7qRcnbSXrCKkxhcidNg3ItN/7lMMWDyp8CwMiYP6PKFIZS
         R/6Q2txSCdcPWIedgNEQDU+p1WWsTbccaVCVRJYY=
Date:   Tue, 4 Feb 2020 20:23:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH for v5.6] mc-entity.c: use & to check pad flags, not ==
Message-ID: <20200204182355.GD20396@pendragon.ideasonboard.com>
References: <ac1e8940-91c6-b07c-e3ae-55f32931f9c1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac1e8940-91c6-b07c-e3ae-55f32931f9c1@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Feb 04, 2020 at 07:19:22PM +0100, Hans Verkuil wrote:
> These are bits so to test if a pad is a sink you use & but not ==.
> 
> It looks like the only reason this hasn't caused problems before is that
> media_get_pad_index() is currently only used with pads that do not set the
> MEDIA_PAD_FL_MUST_CONNECT flag. So a pad really had only the SINK or SOURCE
> flag set and nothing else.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: <stable@vger.kernel.org>      # for v5.3 and up
> ---
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 7c429ce98bae..0f1461ac00f0 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -639,9 +639,9 @@ int media_get_pad_index(struct media_entity *entity, bool is_sink,
>  		return -EINVAL;
> 
>  	for (i = 0; i < entity->num_pads; i++) {
> -		if (entity->pads[i].flags == MEDIA_PAD_FL_SINK)
> +		if (entity->pads[i].flags & MEDIA_PAD_FL_SINK)
>  			pad_is_sink = true;
> -		else if (entity->pads[i].flags == MEDIA_PAD_FL_SOURCE)
> +		else if (entity->pads[i].flags & MEDIA_PAD_FL_SOURCE)

What if MEDIA_PAD_FL_SINK and MEDIA_PAD_FL_SOURCE are both set ? Is that
acceptable ?

>  			pad_is_sink = false;
>  		else
>  			continue;	/* This is an error! */

-- 
Regards,

Laurent Pinchart
