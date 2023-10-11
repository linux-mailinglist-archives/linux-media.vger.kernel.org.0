Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A816C7C589A
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 17:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbjJKPxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 11:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjJKPxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 11:53:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A82AF
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 08:53:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FCFC433C7;
        Wed, 11 Oct 2023 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697039619;
        bh=MnO8wJp465DdExZJRZLI7W6XXLulnYsF87wpSrZwreQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GfhTU6ZrR5sBsSzYOeUYCMK63LVu1HNPRTqF9WSJqknq3/esdLUPE1ux81ClCURHR
         gnv6X/8qh2Q9hf6ynadEUOWzxYWOo00uFUL0MGHbwwx4aaNAhahC41adQIXRuGIDkW
         lxfW8j/QhRBZLneMC1bRNi6mQdgeoqHCFdrFg83Y/KJrko21MsX5rB+cL69iVCdg8/
         JHNDKod8XjP8Pa1+Rwtc3SHN91q72ifKl3u77/sn0gvuKBQJXvNZSe2Rq7GgZLtwwW
         LYgEQUrLw7FGgtoAuXehPkhXMnkvoXisdV/5HUGDQrYnsl48I45LTTtMQyh1nCSDUZ
         8Gpt0nDmrF0Ug==
Date:   Wed, 11 Oct 2023 16:53:34 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <20231011-conflict-monument-75379ef495cc@spud>
References: <20231010151208.29564-1-jacopo.mondi@ideasonboard.com>
 <20231010151208.29564-2-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KEVs/b1oHkhND5Gc"
Content-Disposition: inline
In-Reply-To: <20231010151208.29564-2-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--KEVs/b1oHkhND5Gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Oct 10, 2023 at 05:12:07PM +0200, Jacopo Mondi wrote:
> Add bindings for OmniVision OV64A40.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Lee Jackson <lee.jackson@arducam.com>

What does Lee's SoB indicate here?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index b19995690904..df089d68b58c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15821,6 +15821,13 @@ S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/ov5695.c
>=20
> +OMNIVISION OV64A40 SENSOR DRIVER
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.org>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git

Binding looks fine to me, my question is here. Usually having a tree
here means that you apply the patches yourself. Do you?

Cheers,
Conor.

> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> +
>  OMNIVISION OV7670 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> --
> 2.42.0
>=20

--KEVs/b1oHkhND5Gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSbE/gAKCRB4tDGHoIJi
0pCWAP0ZcldETACJlOJa1TJiTQjumDEj5ycQxWyYzAR4ZxHDVQEAlV83HEEkg1Ln
dAnXq1t9Nfy0Yv5DsTwrabgY5E4l9QY=
=g8nS
-----END PGP SIGNATURE-----

--KEVs/b1oHkhND5Gc--
