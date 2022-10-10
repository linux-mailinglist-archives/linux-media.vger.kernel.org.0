Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 538C85F9FA7
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 15:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiJJNxS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 09:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJJNxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 09:53:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3927D41D07;
        Mon, 10 Oct 2022 06:53:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C450DBB0;
        Mon, 10 Oct 2022 15:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665409994;
        bh=/67ACH0+//Wwnwe1btR/BwYHqwMKltroKChanyim8Lw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h0slmZlhAlOT/EIJ6NH3aSYi25LfXpOFDCGSEE+dnb9LtazXW/5NgokH1yy/tWHRK
         aRTix5mwgnLtUUqgAjhoC90HW9fAdJu128ywPQnVb1IAsYPD1aQQghkqfq9l6y5rpx
         JFV1x4CQzq51omIRiShkwuUf2rD0FqMy/kov411M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221009144146.1199437-1-niklas.soderlund+renesas@ragnatech.se>
References: <20221009144146.1199437-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] media: adv748x: afe: Select input port when initializing AFE
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Date:   Mon, 10 Oct 2022 14:53:12 +0100
Message-ID: <166540999229.3760285.2092310778890819597@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Your other patch for adv748x has the prefix:

	media: i2c: adv748x:

I'm not sure if the i2c: is required though.
There seems to be a mix of usage in the driver already so I don't think
it matters too much.

Quoting Niklas S=C3=B6derlund (2022-10-09 15:41:46)
> When moving the input selection to adv748x_reset() it was missed that
> during probe the device is reset _before_ the initialization and parsing
> of DT by the AFE subdevice. This can lead to the wrong input port (in
> case it's not port 0) being selected until the device is reset for the
> first time.
>=20
> Fix this by restoring the call to adv748x_afe_s_input() in the AFE
> initialization while also keeping it in the adv748x_reset().
>=20
> Fixes: c30ed81afe89 ("media: adv748x: afe: Select input port when device =
is reset")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/=
adv748x/adv748x-afe.c
> index 02eabe10ab97..00095c7762c2 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -521,6 +521,10 @@ int adv748x_afe_init(struct adv748x_afe *afe)
>                 }
>         }
> =20
> +       adv748x_afe_s_input(afe, afe->input);
> +
> +       adv_dbg(state, "AFE Default input set to %d\n", afe->input);

That's now two places with this message. But we likely can't put it in
adv748x_afe_s_input(), as that isn't always setting the default, but the
current...

And it's probably not worth an extra function just to dedup a single
debug line :S

So - it seems reasonable to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Though does this now mean that a normal boot will show (with debug
enabled)

AFE Default input set to 0
...
AFE Default input set to 0

?
--
Kieran




> +
>         /* Entity pads and sinks are 0-indexed to match the pads */
>         for (i =3D ADV748X_AFE_SINK_AIN0; i <=3D ADV748X_AFE_SINK_AIN7; i=
++)
>                 afe->pads[i].flags =3D MEDIA_PAD_FL_SINK;
> --=20
> 2.37.3
>
