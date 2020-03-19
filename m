Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77CD718BB10
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 16:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbgCSP0c convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 19 Mar 2020 11:26:32 -0400
Received: from gloria.sntech.de ([185.11.138.130]:45962 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727402AbgCSP0c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 11:26:32 -0400
Received: from ip5f5a5d2f.dynamic.kabel-deutschland.de ([95.90.93.47] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1jEx3z-0001ef-OB; Thu, 19 Mar 2020 16:26:27 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 8/8] hantro: Add linux-rockchip mailing list to MAINTAINERS
Date:   Thu, 19 Mar 2020 16:26:27 +0100
Message-ID: <1737479.UCjzuJY553@diego>
In-Reply-To: <20200318132108.21873-9-ezequiel@collabora.com>
References: <20200318132108.21873-1-ezequiel@collabora.com> <20200318132108.21873-9-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, 18. März 2020, 14:21:08 CET schrieb Ezequiel Garcia:
> The linux-rockchip mailing list is relevant for the
> Hantro driver, given this support the VPU present
> in Rockchip SoCs.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 28bbbb6c73ef..dc56b9bfc3b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14313,6 +14313,7 @@ F:	Documentation/devicetree/bindings/media/rockchip-rga.txt
>  HANTRO VPU CODEC DRIVER
>  M:	Ezequiel Garcia <ezequiel@collabora.com>
>  L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
>  F:	drivers/staging/media/hantro/
>  F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> 




