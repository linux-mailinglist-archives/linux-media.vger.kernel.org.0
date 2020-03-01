Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7D4174A74
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2020 01:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbgCAA3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Feb 2020 19:29:39 -0500
Received: from gloria.sntech.de ([185.11.138.130]:55746 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbgCAA3j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Feb 2020 19:29:39 -0500
Received: from p508fcd9d.dip0.t-ipconnect.de ([80.143.205.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j8CU0-0004yv-LN; Sun, 01 Mar 2020 01:29:24 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Justin Swartz <justin.swartz@risingedge.co.za>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] [media] dt-bindings: Add binding for rk3228 rga
Date:   Sun, 01 Mar 2020 01:29:23 +0100
Message-ID: <7950264.35eqgo7tFu@phil>
In-Reply-To: <4e66b3f029c56d7c7709d39ed15894b86f51fd37.1580768038.git.justin.swartz@risingedge.co.za>
References: <cover.1580768038.git.justin.swartz@risingedge.co.za> <4e66b3f029c56d7c7709d39ed15894b86f51fd37.1580768038.git.justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Am Montag, 3. Februar 2020, 23:40:15 CET schrieb Justin Swartz:
> Indicate that the rk3228 rga is compatible with that of the rk3288.
> 
> But if any rk3228-specific quirks are identified in future that
> require handling logic that differs from what is provided for the
> rk3288, then allow for the compatibility string "rockchip,rk3228-rga"
> to be matched instead of "rockchip,rk3288-rga".
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

what is the process in the media-world for this dt-binding only patch?

Do you want to apply it, or should I just also apply it with the following
2 dt-patches? There shouldn't be any conflicts with the media tree
as this patch really only affects the rga binding document.

Thanks
Heiko

> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.txt b/Documentation/devicetree/bindings/media/rockchip-rga.txt
> index fd5276abf..c53a8e513 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-rga.txt
> +++ b/Documentation/devicetree/bindings/media/rockchip-rga.txt
> @@ -6,8 +6,9 @@ BitBLT, alpha blending and image blur/sharpness.
>  
>  Required properties:
>  - compatible: value should be one of the following
> -		"rockchip,rk3288-rga";
> -		"rockchip,rk3399-rga";
> +  "rockchip,rk3228-rga", "rockchip,rk3288-rga": for Rockchip RK3228
> +  "rockchip,rk3288-rga": for Rockchip RK3288
> +  "rockchip,rk3399-rga": for Rockchip RK3399
>  
>  - interrupts: RGA interrupt specifier.
>  
> 




