Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967184A1D5
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 15:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbfFRNPM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 09:15:12 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:35619 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFRNPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 09:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560863710;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8Sk51g8h+pY9v2GEDSBxZp9Y3gDd6KLCG5Md6Pf+sao=;
        b=OP8v3opIQ243H108SC7eJxXGDa/1SyWxeTSbGxXZ+qwotdLMbnorPriQFxfVBY0lb/
        Ga58UfNRpxCyEZPAYW7DEGjHebLbE7Ll7w04StE6JoV0CleIijC/hfw7EQDOiyooPFbY
        Ohcd+sXmcQ7cCrTnHo8gUCOpr7CRYf3s2fKDhizdmdu/OfPMYuvpMhsvoSxsMY73OsAu
        PjnpFWOLrQrVWcEdJoYhN8s/7VDNsMNBL8ICLr8zKY4UKqzKNhDmcQS/sdbSEmm+p0r6
        tKz3ywCm1noILiDyYxE/lPyfdLXPede2hj3ukq0upD1feHdjRl18XCccFLJUYw4oiles
        RXmg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v5IDFA13M
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 18 Jun 2019 15:15:10 +0200 (CEST)
Date:   Tue, 18 Jun 2019 15:15:10 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <197277619.790831.1560863710263@webmail.strato.com>
In-Reply-To: <20190617210930.6054-8-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-8-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Provide for_each_group helper
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev58
X-Originating-IP: 85.212.220.45
X-Originating-Client: open-xchange-appsuite
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On June 17, 2019 at 11:09 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Refactoring of the group control code will soon require more iteration
> over the available groups. Simplify this process by introducing a group
> iteration helper.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Don't assign __group in the condition part of the for statement of the
>   for_each_rcdu_group() macro
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h |  5 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 10 ++--------
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 1327cd0df90a..0cc0984bf2ea 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -96,6 +96,11 @@ struct rcar_du_device {
>  	unsigned int vspd1_sink;
>  };
>  
> +#define for_each_rcdu_group(__rcdu, __group, __i) \
> +	for ((__i) = 0, (__group) = &(__rcdu)->groups[0]; \
> +	     (__i) < DIV_ROUND_UP((__rcdu)->num_crtcs, 2); \
> +	     __i++, __group++)
> +
>  static inline bool rcar_du_has(struct rcar_du_device *rcdu,
>  			       unsigned int feature)
>  {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 144c0c1b1591..c04136674e58 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -627,9 +627,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	struct drm_device *dev = rcdu->ddev;
>  	struct drm_encoder *encoder;
> +	struct rcar_du_group *rgrp;
>  	unsigned int dpad0_sources;
>  	unsigned int num_encoders;
> -	unsigned int num_groups;
>  	unsigned int swindex;
>  	unsigned int hwindex;
>  	unsigned int i;
> @@ -670,11 +670,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  		return ret;
>  
>  	/* Initialize the groups. */
> -	num_groups = DIV_ROUND_UP(rcdu->num_crtcs, 2);
> -
> -	for (i = 0; i < num_groups; ++i) {
> -		struct rcar_du_group *rgrp = &rcdu->groups[i];
> -
> +	for_each_rcdu_group(rcdu, rgrp, i) {
>  		mutex_init(&rgrp->lock);
>  
>  		rgrp->dev = rcdu;
> @@ -711,8 +707,6 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	/* Create the CRTCs. */
>  	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
> -		struct rcar_du_group *rgrp;
> -
>  		/* Skip unpopulated DU channels. */
>  		if (!(rcdu->info->channels_mask & BIT(hwindex)))
>  			continue;
> -- 
> Regards,
> 
> Laurent Pinchart
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
