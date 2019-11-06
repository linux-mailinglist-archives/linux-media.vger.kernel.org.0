Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C27DFF11D1
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 10:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKFJLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 04:11:40 -0500
Received: from retiisi.org.uk ([95.216.213.190]:56104 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727041AbfKFJLk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 04:11:40 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7E462634C87;
        Wed,  6 Nov 2019 11:10:23 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iSHKY-0002Vn-Ih; Wed, 06 Nov 2019 11:10:22 +0200
Date:   Wed, 6 Nov 2019 11:10:22 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 20/20] MAINTAINERS: Add ti,cal.yaml
Message-ID: <20191106091022.GE6253@valkosipuli.retiisi.org.uk>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-21-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104193140.31145-21-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 04, 2019 at 01:31:40PM -0600, Benoit Parrot wrote:
> Add ti,cal.yaml to the MAINTAINERS file.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8077b453f2e9..d360df48f9f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16315,6 +16315,7 @@ W:	http://linuxtv.org/
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  S:	Maintained
>  F:	drivers/media/platform/ti-vpe/
> +F:	Documentation/devicetree/bindings/media/ti,cal.yaml

This should be done no later than adding the file itself.

-- 
Sakari Ailus
