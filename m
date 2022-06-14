Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40F354AB1A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 09:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353196AbiFNHtR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 03:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354892AbiFNHsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 03:48:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5623ED1F;
        Tue, 14 Jun 2022 00:48:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47F6F2F3;
        Tue, 14 Jun 2022 09:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655192932;
        bh=Lmf29ePnN/ox7ZxVM/I+rH4S0NOUHlQzJaAr7gUZsQc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TmAEmD/yOrHJok/214AN8WAC36wyZHgPAVFkU6Q8OpY8LiorXGuaneZEtRerLf4p5
         0M2QNCg4V0icvw2wO3q6yKYNnfMVWRL8vmx6M8ke1x6PNyh2yoZ6xy1aPrLNJogjyw
         FiMgIk0E5/QNVx9UPb8Ba0ynUSHDJAYKL5iZhVKI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220607134057.2427663-2-bryan.odonoghue@linaro.org>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org> <20220607134057.2427663-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: imx412: Add imx577 compatible string
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        daniele.alessandrelli@intel.com, devicetree@vger.kernel.org,
        jacopo@jmondi.org, linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.j.murphy@intel.com, sakari.ailus@iki.fi
Date:   Tue, 14 Jun 2022 08:48:49 +0100
Message-ID: <165519292991.2106738.7053584318305411054@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Quoting Bryan O'Donoghue (2022-06-07 14:40:56)
> The Sony IMX577 uses the same silicon enabling reference code from Sony in
> the available examples provided.
>=20
> Add an imx577 compatible string to allow for chip differentiation and
> accurate description of hardware in dts.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> index 26d1807d0bb6..d1561841ccbc 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> @@ -19,7 +19,10 @@ description:
> =20
>  properties:
>    compatible:
> -    const: sony,imx412
> +    items:
> +      - enum:
> +          - sony,imx412
> +          - sony,imx577
>    reg:
>      description: I2C address
>      maxItems: 1
> --=20
> 2.36.1
>
