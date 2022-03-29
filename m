Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35044EAEA5
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 15:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbiC2Nmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 09:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbiC2Nmc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 09:42:32 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711EC527F1
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 06:40:49 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id hu11so14361797qvb.7
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 06:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=OX8uzX6cgkseXeRBYjHM47D6ZNq3XzBbHTvAN/4NfGI=;
        b=sFtk4eBC34EHTFHpofTMUaiDbxm3jMEFknlxuJ7E8YKR0t/sJcRsdn4blofaCgMRYj
         BSUJ1+NAP6PulVGl9DMx8VZVRII71wc6m5gXub+QXqaqpVzvb45nwvJdC2pKVDRAsyuI
         WX7FopRIBjNrAM/Z9kYPOqTwAmE4vBHezRQBlMimsNC7JywP6zv6ViDsLIFo1sCOmNv8
         Yvmh2KNDpSyiBi4A2wziBEkiXZ2EhRC8Tn9hDjRFDFPwCmVTPF4viVZsJEcn125h7C91
         7FlgWkdx8nflgF7VohVqBqGyhglYNolDunbrMkQFFpe7r0V2PuNlWLL81BzO8Si3EOfs
         kdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=OX8uzX6cgkseXeRBYjHM47D6ZNq3XzBbHTvAN/4NfGI=;
        b=nvsegLK17H/vPIM92dvvrZskSey/BOS25S6hrQ2545C6lTfT3BpkGOcgR8/smx5/62
         HpP6sOGP2A6bu7FWkgLofi5BjZJ1X2h2oBX9yngy44xbrigtqThSzIu7gv35lykqdKsG
         WSJR/WrSvDbh/TQfv57Mpe4/dBx4lEfC+FYz27KeHVVfGelwCz4BaHcnR6FtKnZuIMoo
         /sF82IVukKhVsmVWN+cUuUumiiN7CFHUFe/XTO4729i4+ILT0KpvgGLrwnEVDGcj2zXB
         vyNblYwVxscY1NPKERhb6dBVhS1DVUzWYX9pQ863C4WgiVlgxumjx01u5QRr6OIQrqrv
         eAGQ==
X-Gm-Message-State: AOAM532Gvg9PPnmpZdzkzZeY4ia49+Gp7kzaFCqwAe+QrgO+pin8X57o
        cKVVAovpgTkW17pDznJRD47r+Q==
X-Google-Smtp-Source: ABdhPJwHaZa4QGYsWt/LUhJpekp72RsXv+ubveLeD4EjzM+7VH63XURE9ZZ3SS373zSjgJ9Nvbo+yQ==
X-Received: by 2002:a05:6214:4112:b0:441:720:8434 with SMTP id kc18-20020a056214411200b0044107208434mr26593457qvb.23.1648561248500;
        Tue, 29 Mar 2022 06:40:48 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y66-20020a37af45000000b0067dc0fc539fsm9684780qke.86.2022.03.29.06.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 06:40:48 -0700 (PDT)
Message-ID: <515bd7309493ef0b920bd8e20d856de2959ba3b7.camel@ndufresne.ca>
Subject: Re: [PATCH] staging: media: rkvdec: Update TODO list
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>
Date:   Tue, 29 Mar 2022 09:40:47 -0400
In-Reply-To: <20220326183715.67332-2-sebastian.fricke@collabora.com>
References: <20220326183715.67332-1-sebastian.fricke@collabora.com>
         <20220326183715.67332-2-sebastian.fricke@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le samedi 26 mars 2022 =C3=A0 19:37 +0100, Sebastian Fricke a =C3=A9crit=C2=
=A0:
> VP9 support has been added to the driver by f25709c4ff15.
> And the VP9 uABI was merged with b88dbe38dca8.
>=20
> The remaining codec that keeps this driver in staging is HEVC.
> Update the TODO list accordingly.
>=20
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/rkvdec/TODO | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/TODO b/drivers/staging/media/rk=
vdec/TODO
> index e0f0f12f0ac5..2c0779383276 100644
> --- a/drivers/staging/media/rkvdec/TODO
> +++ b/drivers/staging/media/rkvdec/TODO
> @@ -1,6 +1,6 @@
> -* Support for VP9 is planned for this driver.
> +* Support for HEVC is planned for this driver.
> =20
> -  Given the V4L controls for those CODECs will be part of
> +  Given the V4L controls for that CODEC will be part of
>    the uABI, it will be required to have the driver in staging.
> =20
>    For this reason, we are keeping this driver in staging for now.

