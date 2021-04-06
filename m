Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD5135514C
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 12:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbhDFKzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 06:55:05 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50643 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231339AbhDFKzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 06:55:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TjMBl4T2r43ycTjMElNcue; Tue, 06 Apr 2021 12:54:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617706496; bh=KGNqE7vtP9+apsVEQYS3HwyvXAaxHklSuPGEUI1hzkQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LYdeDXQeL/YsRcoQOgNGrpvRBN20u1hq4XiQFUszeYziYxHO0c4NkZ4k0tamDh6Ec
         bCFrNmZ5OAUqW858uwUMB9ebAIQLBrhaAI4WVFTL9fvuMUDxXdzuC1rCTVJA/CmgFA
         DSNW0VJAIuAX4Yj76V/KywFh0ik88bWKggyDlnu/++MGMNZ94id3BwQ9V9kVSW/Fit
         4mMHIdAbCaGaUMcskiGL1nPi9hO/RbThkAiC0PTH+O63o3Q3ltERt9TwZbDQDh2fkT
         lzJWRX03q6ZylNvmQsND/9gBaJYTqq3Ulx89yQ+t5gki3BzcyzEpGCVory3SH855Xq
         aMl6BOdHm3F+g==
Subject: Re: [PATCH v8 01/13] dt-bindings: mfd: Add 'nxp,imx8mq-vpu-ctrl' to
 syscon list
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20210401160003.88803-1-benjamin.gaignard@collabora.com>
 <20210401160003.88803-2-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <430b380d-a437-dfdc-5fe7-c5cfe2a44935@xs4all.nl>
Date:   Tue, 6 Apr 2021 12:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401160003.88803-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNUlMbdwNq3v4AT78E7WX19Tqn0ScOtvTMR8PCQm+vYaaalzuFAzpeW+uB2V06rsoPQims10Rzebi13I8RHuqiXt9oWnHoZIYvyVbTfW1xD7azqfQp5c
 iOyxlx6fz9UrHgY63yuJl/Lgk28DiSLwqC1cr3J0KA0UM58ynYIUo6RehsTEKopyStCLRsL4ClIsecG4mZfZ7yAG20nTrjE4+f8rJnUXxwGyFIeTYY88C8WC
 kZxbvQRj/MaKFw/8R9jnFhLJGl6MGhL6FvYGkpG4Ed3IAVN8vkTR6LxnwdKHxrgtf1ol+izQwb1PUn7pYiIsUNQ+9+DJPdj3SZmuKqPGRj1tCu1E8XvwjIKP
 /e0nYfaXyI9EKStq7GUCuteTqchAWihH1iMuQ2VjRKlI0PR9qlpHrs/9CfcbIBZt9CLcCTrFT/iNVrMV8f2lxk2XWGawrF9Cj7K+PSQHWg2js3Sxm1x6DWU9
 3s7AobvTnc1/fcUZFs8G0hYqSer4oWCE9PzyyBQ4iaWTHfUowzEzdL34eHpGm2KiWuMknDRd4BYbVnU15qUx7IC/aPgfzX1pEg7T9vaY4Amg7Ko5s6syoz5i
 oGH9gbZdkpjpeSpbt62iY/KOiuoeenqFD2jVEuGU+AbyF272+/hFkW04Rf2qIaLpDbtn/dnlDshDCgux1cepO6Sydh8zigIWTngD3FGTgyJQQUafKn5czBca
 dGjH3GY3f1ZT6V5uXFoVRM25JJjPawa7kmfLba1XHs2bGnVLJuoF8LiIfGX6T+aVN1zhpHEk63IQHRuQElyPFQnLsbBi8W1YPQuQgWaRXRNSU0qbOGNuC/mr
 bHWdSpsF5j+eKlAVbS+6+vvpTDHyGtlc+7b932u08S3cpK8QX+ZYVt1j0DizwGN9yzE0NsBcFsNz5IvF5ZPs6yQGkx2/p3D2dsVQZycerAYqNNUzmdfYedlw
 PP0leHqZpMSMW3rOpnKvdkn7nN/GW4knsg6G80nVFO73qwS/YX94MAAOY9HXat35ZzLbx0eslDm1lHQGMUgEeY+ll/ol6Qyos1GFWE7THMuFPq0T
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

The commit logs in this series have a few too many grammatical
mistakes. And since I want some other changes as well, I'll just
review the text so it can be fixed in v9.

On 01/04/2021 17:59, Benjamin Gaignard wrote:
> Add 'nxp,imx8mq-vpu-ctrl' in the list of possible syscon.

in -> to

> It will used to access to the VPU control registers.

to the -> the

Regards,

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
> version 8:
>  - Add Lee ack
> 
> version 7:
>  - Add Rob ack
> 
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index f14ae6da0068..ae22c4730613 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -44,6 +44,7 @@ properties:
>                - hisilicon,peri-subctrl
>                - microchip,sparx5-cpu-syscon
>                - mstar,msc313-pmsleep
> +              - nxp,imx8mq-vpu-ctrl
>                - rockchip,px30-qos
>                - rockchip,rk3066-qos
>                - rockchip,rk3288-qos
> 

