Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE57C392B32
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 11:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbhE0J5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 05:57:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35266 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbhE0J5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 05:57:30 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D8B2B2C;
        Thu, 27 May 2021 11:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622109356;
        bh=0HnzxuKrvsUiPX1AvlG73K9baINdqPN6r/ZhNJLibfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGlFkF6NtgsSKpj/4LnUokGLb36OjAxskPTNLqWT06zrcyZ5nYKgsd5QVv/gRyfHj
         3Ldl/zg7WZztZpO4jY9luR/WAfFUhfWID5Xp0r9u8LY0x+tfaaN2SIXj0cdDWPcpYu
         ga40p2KR6ulzcC9wRywsEha2egpxfvBl26fPcms4=
Date:   Thu, 27 May 2021 12:55:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski@canonical.com, kernel@puri.sm,
        paul.kocialkowski@bootlin.com, shawnx.tu@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 4/4] Documentation: i2c-cardlist: add the Hynix hi846
 sensor
Message-ID: <YK9spmRbW6rvA5Sr@pendragon.ideasonboard.com>
References: <20210527091221.3335998-1-martin.kepplinger@puri.sm>
 <20210527091221.3335998-5-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210527091221.3335998-5-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Thu, May 27, 2021 at 11:12:21AM +0200, Martin Kepplinger wrote:
> Add the SK Hynix Hi-846 8M Pixel CMOS image sensor to the i2c-cardlist.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  Documentation/admin-guide/media/i2c-cardlist.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/media/i2c-cardlist.rst b/Documentation/admin-guide/media/i2c-cardlist.rst
> index e60d459d18a9..185e07a3da43 100644
> --- a/Documentation/admin-guide/media/i2c-cardlist.rst
> +++ b/Documentation/admin-guide/media/i2c-cardlist.rst
> @@ -60,6 +60,7 @@ Driver        Name
>  ============  ==========================================================
>  et8ek8        ET8EK8 camera sensor
>  hi556         Hynix Hi-556 sensor
> +hi846         Hynix Hi-846 sensor
>  imx214        Sony IMX214 sensor
>  imx219        Sony IMX219 sensor
>  imx258        Sony IMX258 sensor

Mauro, is there any value in this list ? It's incomplete, and it's
actually the first time I hear about it :-) Could we drop it ?

-- 
Regards,

Laurent Pinchart
