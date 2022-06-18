Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A3055059E
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 17:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbiFRPLy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 11:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiFRPLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 11:11:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118C9BAF
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 08:11:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCDAE6DF;
        Sat, 18 Jun 2022 17:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655565108;
        bh=i+CGZvGl67ZXxr5thvwnI8ELt+05AyGVmOR6w2twooE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lLHBGRlZxE2MR8Y8s2LvPnT4XXuHUy0FqtYbJoCgLhHnLEQjME29tgThzCrJ7+anN
         vQVgDwn4JJNTGFnDRYvV5YWkkLAyYIUIti3N8eCX6JjRDSRRGrCmIRCIz6CiLuckc9
         hBiP4vJwGHs5fbKXO//83T20EvaW1MuaT2UaVLVo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220617084519.32129-1-jeanmichel.hautbois@ideasonboard.com>
References: <20220617084519.32129-1-jeanmichel.hautbois@ideasonboard.com>
Subject: Re: [PATCH] media: staging: ipu3-imgu: Fix BNR wb gain documentation
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, laurent.pinchart@ideasonboard.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Sat, 18 Jun 2022 16:11:46 +0100
Message-ID: <165556510615.40008.11658985834321067362@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi JM,

Quoting Jean-Michel Hautbois (2022-06-17 09:45:19)
> The documentation states that the BNR factor is a multiplier coded as
> u3.13 and with a range of (0, 8). This is not correct, as the isp is
> adding 1.0 to the gain applied, ie Pout =3D { Pin * (1 + Gx) }.
>=20
> It means that a gain of 1.0 should be coded as 0.
>=20
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drive=
rs/staging/media/ipu3/include/uapi/intel-ipu3.h
> index dbdd015ce220..caa358e0bae4 100644
> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> @@ -626,8 +626,11 @@ struct ipu3_uapi_stats_3a {
>   * @b: white balance gain for B channel.
>   * @gb:        white balance gain for Gb channel.
>   *
> - * Precision u3.13, range [0, 8). White balance correction is done by ap=
plying
> - * a multiplicative gain to each color channels prior to BNR.
> + * For BNR parameters WB gain factor for the three channels [Ggr, Ggb, G=
b, Gr].

As with the equivalent change on the libcamera IPA side, there are 4
channels, and the text could be updated to match I think.

With that done:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> + * Their precision is U3.13 and the range is (0, 8) and the actual gain =
is
> + * Gx + 1, it is typically Gx =3D 1.
> + *
> + * Pout =3D {Pin * (1 + Gx)}.
>   */
>  struct ipu3_uapi_bnr_static_config_wb_gains_config {
>         __u16 gr;
> --=20
> 2.34.1
>
