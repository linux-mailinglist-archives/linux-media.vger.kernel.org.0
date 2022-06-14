Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF0E54AAEB
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 09:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351876AbiFNHr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 03:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244775AbiFNHr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 03:47:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BAC3E0F4;
        Tue, 14 Jun 2022 00:47:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D15AD2F3;
        Tue, 14 Jun 2022 09:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655192872;
        bh=UkIluiARurp7pMus3IaKIM9D/8UYrKJXRxOaweSAV+k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uPcakvoIda7MvRY9y8D1z94pd77W8LOq6DDNr/2DWIOWLWcfsYsOsXCyUjp9+B5qZ
         FLohaSEPsiY7D44CwI65YxvEz4s0eW88g31hUkj9dpQitWcB6qp2kDpAEn5qxvz+62
         OTgmjzJQsJpajhhv1a7xNiJeJoUZDNUi8Y40oVrY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org> <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 2/2] media: i2c: imx412: Add imx577 compatible string
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        daniele.alessandrelli@intel.com, devicetree@vger.kernel.org,
        jacopo@jmondi.org, linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.j.murphy@intel.com, sakari.ailus@iki.fi
Date:   Tue, 14 Jun 2022 08:47:50 +0100
Message-ID: <165519287039.2106738.7280731508740095491@Monstersaurus>
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

Quoting Bryan O'Donoghue (2022-06-07 14:40:57)
> The Sony IMX577 uses the same silicon enabling reference code from Sony in
> the available examples provided.
>=20
> Add an imx577 compatible string and re-use the existing imx412 code.
>=20

As discussed in the cover letter, I think this is a reasonable way to
accomodate the imx577 (and certainly better than letting any real
hardware be defined as if it's an imx412).

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/imx412.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index a1394d6c1432..3b7011ab0a8f 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1282,6 +1282,7 @@ static const struct dev_pm_ops imx412_pm_ops =3D {
> =20
>  static const struct of_device_id imx412_of_match[] =3D {
>         { .compatible =3D "sony,imx412" },
> +       { .compatible =3D "sony,imx577" },
>         { }
>  };
> =20
> --=20
> 2.36.1
>
