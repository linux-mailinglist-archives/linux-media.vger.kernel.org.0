Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE2526A98C
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 18:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbgIOQRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 12:17:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37152 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727610AbgIOQQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 12:16:14 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BCE3276;
        Tue, 15 Sep 2020 18:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600186327;
        bh=yWcHzfZaIL+JJoYu6WgRXH1lmt2hAIodJaLy5+l5lQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WixtAFmwupVy7MRyDTZqdZRI02yRepxuWJ4yPMNnxeJtBh+AktZupVFYDc6j/uPZv
         l1VpY8FBzuH0HnIh/pcPbkaK060agSmlL6VBG9R3sca6dF87vJkU+nP2QN7Zg3Jrhk
         Z6YpX097SeLzHq2RkY1wMphh7PvJZUGsMYtNd14U=
Date:   Tue, 15 Sep 2020 19:11:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
Message-ID: <20200915161138.GB26029@pendragon.ideasonboard.com>
References: <20200915131216.21137-1-fabrizio.castro.jz@renesas.com>
 <20200915131216.21137-2-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915131216.21137-2-fabrizio.castro.jz@renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Sep 15, 2020 at 02:12:14PM +0100, Fabrizio Castro wrote:
> Renesas are expanding their DRIF support and offering,
> I'll be the internal maintainer for DRIF.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thank you for volunteering :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26af84f97353..9f49e5ac90d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10898,6 +10898,7 @@ F:	include/media/drv-intf/renesas-ceu.h
>  
>  MEDIA DRIVERS FOR RENESAS - DRIF
>  M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
> +M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported

-- 
Regards,

Laurent Pinchart
