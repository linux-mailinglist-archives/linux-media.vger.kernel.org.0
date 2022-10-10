Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1246D5F9B67
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 10:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbiJJIvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 04:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbiJJIvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 04:51:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15ECC4E847;
        Mon, 10 Oct 2022 01:51:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79DBC4DB;
        Mon, 10 Oct 2022 10:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665391875;
        bh=87IEKzF7DYNsk0fq38E7M+HB5C03eadds4RSpd6nbIA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sRR/0Q3aA0jjE1jZqUmcRPe7KT4LXoM1hK84efu/aRV1SghtMfopxKxlUNbThUAJW
         IH4mH4wjwfLc8UL8HLXAcBe+Km3v8TN1eVKxa7HlfDh6DlGbu3H7H757d8Rp9+rQ0h
         4Y1/kXANzq5bQihUqv9MGpThEp0qq/yCVHLrR40Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221008141205.3493964-1-niklas.soderlund+renesas@ragnatech.se>
References: <20221008141205.3493964-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] media: i2c: adv748x: Remove dead function declaration
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Date:   Mon, 10 Oct 2022 09:51:13 +0100
Message-ID: <166539187307.3760285.3172855036838354991@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2022-10-08 15:12:05)
> There is no implementation of adv748x_register_subdevs(), remove the
> declaration in the header file.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x.h | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv7=
48x/adv748x.h
> index d75eb3d8be5a..6f90f78f58cf 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -428,9 +428,6 @@ void adv748x_subdev_init(struct v4l2_subdev *sd, stru=
ct adv748x_state *state,
>                          const struct v4l2_subdev_ops *ops, u32 function,
>                          const char *ident);
> =20
> -int adv748x_register_subdevs(struct adv748x_state *state,
> -                            struct v4l2_device *v4l2_dev);
> -
>  int adv748x_tx_power(struct adv748x_csi2 *tx, bool on);
> =20
>  int adv748x_afe_init(struct adv748x_afe *afe);
> --=20
> 2.37.3
>
