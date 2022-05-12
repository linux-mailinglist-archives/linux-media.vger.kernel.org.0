Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26EF524829
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 10:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242107AbiELIm7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 04:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351679AbiELImo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 04:42:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9F544A0C
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 01:42:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2D686D7;
        Thu, 12 May 2022 10:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652344946;
        bh=4U7V+jH6JnIVctZ0a6vgd68/lLwTJry6efWUvgEpm8w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YKJBmd62FT4CCxbr3TIKPmSSfKf21oCarlU9O6M+LgAXv+ftl906LAa0K5tgk1qHA
         +ExxN96smM0v/t2HxiA+WTIdfW6VGt54ifm2vuH55RSr5TDpi7FnAy3eIjLBtyvuGs
         +n6ypc5ZNLfwN3dZ0QOuZ2FNJGyeClu0VC87ydNY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220512080859.9923-1-info@benjaminmarty.ch>
References: <20220512080859.9923-1-info@benjaminmarty.ch>
Subject: Re: [PATCH] media: i2c: adv7180: fix reserved bit in Video Selection 2
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Benjamin Marty <info@benjaminmarty.ch>
To:     Benjamin Marty <info@benjaminmarty.ch>, linux-media@vger.kernel.org
Date:   Thu, 12 May 2022 09:42:24 +0100
Message-ID: <165234494429.2416244.11071203482635474383@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thank you for your patch, and your investigation into this issue.

Quoting Benjamin Marty (2022-05-12 09:08:59)
> This bit is marked as reserved in the ADV Hardware Reference Manual.
>=20
> Resetting this bit seems to cause increased video noise. Setting this bit=
 according to the Hardware Reference Manual reduces the video noise immedia=
tely.

It's quite minor, but please try to wrap your commit messages:

> Resetting this bit seems to cause increased video noise. Setting this
> bit according to the Hardware Reference Manual reduces the video noise
> immediately.


> Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> ---
>  drivers/media/i2c/adv7180.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 4f5db195e66d..d99b22286b74 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -1014,7 +1014,8 @@ static int adv7182_init(struct adv7180_state *state)
> =20
>  static int adv7182_set_std(struct adv7180_state *state, unsigned int std)
>  {
> -       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std << 4);
> +       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
> +                            (std << 4) | (0x01 << 2));

This should be defined using a macro and use BIT() to be clearer, for
instance:

 #define ADV7182_REG_INPUT_RESERVED BIT(2)

That definition should live near the defintion of
ADV7182_REG_INPUT_VIDSEL.

If the bit is documented with a better name, then use that of course,
otherwise perhaps even a comment in the code saying that failing to set
the bit increases visible noise would be suitable. (or that setting the
bit reduces noise, I guess it depends on if you think this bit is
performing noise reduction, or if not setting it is introducing noise)

--
Kieran



>  }
> =20
>  enum adv7182_input_type {
> --=20
> 2.36.1
>
