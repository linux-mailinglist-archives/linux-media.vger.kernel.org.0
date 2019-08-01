Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B91C67DB92
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 14:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbfHAMdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 08:33:38 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47008 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfHAMdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 08:33:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71CXa2N064413;
        Thu, 1 Aug 2019 07:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564662816;
        bh=yhT9eES5F/NMsVEY5D3Fsl/rw0/dUbFlppEz+lgQ5FQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=UfOYyYudOMDXF0XaKl4dEi1jFXHwhFqRoTE8DSaiZpHkGXb0h9SoPImg0eS9F06Ff
         MS6ZSIgUEn0iLWToTKf2R9Zye1lGoTrsNZG0Dli0nWNzaML652rRJjsS6NEYm9PpsX
         ZUEMIeF7nsHIfLsgsTk9+plzdRFtVsHJYSYSSph0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71CXagW053160
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Aug 2019 07:33:36 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 07:33:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 07:33:36 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x71CXZZR049514;
        Thu, 1 Aug 2019 07:33:35 -0500
Date:   Thu, 1 Aug 2019 07:35:06 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] am437x: remove unused struct vpfe_pixel_format
Message-ID: <20190801123506.u6or63lylh36qjvb@ti.com>
References: <b29844e0-4dee-a6a5-913c-59c40f8ab77a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b29844e0-4dee-a6a5-913c-59c40f8ab77a@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Tue [2019-Jul-23 14:59:47 +0200]:
> struct vpfe_pixel_format was defined, but never used. Remove it.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
> index 17d7aa426788..4678285f34c6 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.h
> +++ b/drivers/media/platform/am437x/am437x-vpfe.h
> @@ -65,12 +65,6 @@ struct vpfe_hw_if_param {
>  #define VPFE_MAX_SUBDEV		1
>  #define VPFE_MAX_INPUTS		1
> 
> -struct vpfe_pixel_format {
> -	struct v4l2_fmtdesc fmtdesc;
> -	/* bytes per pixel */
> -	int bpp;
> -};
> -

Looks fine to me.

Acked-by: Benoit Parrot <bparrot@ti.com>


>  struct vpfe_std_info {
>  	int active_pixels;
>  	int active_lines;
