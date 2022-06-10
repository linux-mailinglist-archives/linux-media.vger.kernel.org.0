Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E536546D4C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 21:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347854AbiFJTd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jun 2022 15:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346441AbiFJTd4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jun 2022 15:33:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC5A2F007
        for <linux-media@vger.kernel.org>; Fri, 10 Jun 2022 12:33:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7761530A;
        Fri, 10 Jun 2022 21:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654889632;
        bh=yRzu7BULaZYs4XmCmUFPlBx+8ESKax2VOzC9XHleYXg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PN3Nqaz5NDK+Ytais5Y5oQehsfMGsKtEK7SRG1hx8JpmdkFQ72q1cPD0SAqUKDiM3
         rPUvm1dTRKJ9V2jTM78oipjJxkb3Wkj1cilyMz6xLYol4l59cy+iKLPrjzUm82Yfd/
         EL5aYOX3Fj2XwJrTZg4uq3OsHb1PMiLZNYYHQv6Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609053631.7210-1-laurent.pinchart@ideasonboard.com>
References: <20220609053631.7210-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: uvcvideo: Replace broken URL
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Fri, 10 Jun 2022 20:33:50 +0100
Message-ID: <165488963023.1070686.17997116958441371667@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-06-09 06:36:31)
> The link to the web page that explains continued fractions is broken.
> Replace it with a link to the corresponding Wikipedia page.
>=20
> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 77ac5716f99d..20d80d810d1f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -350,7 +350,7 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denom=
inator,
> =20
>         /*
>          * Convert the fraction to a simple continued fraction. See
> -        * https://mathforum.org/dr.math/faq/faq.fractions.html
> +        * https://en.wikipedia.org/wiki/Continued_fraction
>          * Stop if the current term is bigger than or equal to the given
>          * threshold.
>          */
> --=20
> Regards,
>=20
> Laurent Pinchart
>
