Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82288710FBB
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 17:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241466AbjEYPgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 11:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241327AbjEYPgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 11:36:15 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AD51BB
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 08:35:58 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-75b1975ea18so59086885a.3
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1685028958; x=1687620958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bfOYl9Of3AOhAYGhu0IXdioMyXF4FQk+PSO2IbVFd7A=;
        b=HW6Fi/0ouVdalJKexenZnGevdCMn9/EhaJ0yhZubDZeZ2S3oeiBdNgDewpllV3RrnU
         Y4Ks8kz9nYCpgOMCNKXEvX9y+39S1T3jkcS7pzAKG5I4V2uXca3sSncnhoawC5sozcPW
         BiVDOonYjbShGdotzNCU9L74HEI00PXA2xehIPNJZq4ZHSU563q3s8hCLzw2sx6hc7I6
         INWFlRJor6xxZGlHUZmor6MF7aJnejv69YyxIciZyOVyoZoeMpYNX+4aOfJRP495fVgv
         5KrOovELrrt3qx+GwlxiQ3Vve+WY3gGYGS/WP//lNdYIMqxMhsp+77x/niBW22TDsI0/
         Q8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685028958; x=1687620958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfOYl9Of3AOhAYGhu0IXdioMyXF4FQk+PSO2IbVFd7A=;
        b=cPk328sTciRBGl9F4VjJoXAxDRf40aXMpsOjlxvlQUkr4wWIvYFJMi+VX/P9M6abhL
         pfDLAJkKv8w4GonA3EkzToTk02cNmOZOrUuNWgoG/4LjQ9y1/2KzPbEgY02ZwMWNzt1B
         Xn3AXUsJ+OOLe9v+zsG+pXkGdWh0futOPnI578+Ut7NyhS1R7HInzp1evYfD4yocgTsy
         G20oKDbiNJ38b5tCOvqn9UV5FCa7FJDHCOBSgoBg7aRvcSCDvUwSNtfWRjEfWsrSWEFp
         qKt32JN/68apbjNC3BBjDhyUpD26Vcq1oS6fN+m0b4XlxH3GZgfZS52CBXd/0rIp77ko
         aGVg==
X-Gm-Message-State: AC+VfDzoC/FJ7Nm+dSEjz58jP9MfQrtpCvh+MvbMhP6YkI5Rwt/kscBG
        XRvFckaoUBpDXXnq8d/JDge2Fg==
X-Google-Smtp-Source: ACHHUZ4p0kYXueIRcRgDA5TqNXoCPrji9giBre9XHeYYL0MTfM1HpzC35WspVsTKetriJZzqelNaLA==
X-Received: by 2002:a05:620a:8e87:b0:75b:23a0:e7b7 with SMTP id rf7-20020a05620a8e8700b0075b23a0e7b7mr9715250qkn.24.1685028958039;
        Thu, 25 May 2023 08:35:58 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6c0::7a9])
        by smtp.gmail.com with ESMTPSA id w9-20020a05620a128900b0074e389245e6sm471558qki.41.2023.05.25.08.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 08:35:57 -0700 (PDT)
Message-ID: <c9539387beb6e06aed4994cbd8c60abe2a2c45e4.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rockchip: rga: use v4l2_m2m_buf_copy_metadata
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Tretter <m.tretter@pengutronix.de>, jacob-chen@iotwrt.com,
        ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, heiko@sntech.de
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date:   Thu, 25 May 2023 11:35:56 -0400
In-Reply-To: <20230523090309.3323983-1-m.tretter@pengutronix.de>
References: <20230523090309.3323983-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 23 mai 2023 =C3=A0 11:03 +0200, Michael Tretter a =C3=A9crit=C2=A0=
:
> The v4l2_m2m_buf_copy_metadata function correctly copies the metadata of
> the buffer. Use that function instead of open-coding the metadata copy.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 67dcf22e5ba3..e4b8ce9ab3c6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -76,10 +76,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
>  		WARN_ON(!src);
>  		WARN_ON(!dst);
> =20
> -		dst->timecode =3D src->timecode;
> -		dst->vb2_buf.timestamp =3D src->vb2_buf.timestamp;
> -		dst->flags &=3D ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
> -		dst->flags |=3D src->flags & V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
> +		v4l2_m2m_buf_copy_metadata(src, dst, true);
> =20
>  		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
>  		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);

