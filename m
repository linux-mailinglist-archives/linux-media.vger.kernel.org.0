Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74BE26E49F5
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 15:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjDQNdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 09:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjDQNdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 09:33:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C237D84
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 06:32:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 85FC2621B7
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 13:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E507FC433A8
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681738378;
        bh=YnO373PW8kFPYYEga0WKpnzfKPRu65AqgaMNSJcVERc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K+tF1m4CWen8Pb45l6Ofuvy5jJZrWa5OkbOtta7j9xSL9G6y1gPoqts4Q7UuO4GIY
         vhukENSBwvZtBPGFtgwEl245KEawE/4qE3mlVHVJgDb5sUOUiYCAcJVEk/c6neLYTl
         gWZ+D5r+BhCMIH3FySxEc1RlW1VGUGCUhFO1J3cCv6Ok5U5Dk2R4prsB113sohqUqt
         nqBChqzzQf2rpWp0MJuiPL2aaKMhVj/aTsoWw5SNZn052dMEKL77RG5Ft0cQV0OkaG
         n8EkRY3W4SuI9QX8da2TQcMPdtePDgCAt7XK27g20SCvea4ea8RyHM4+SgxBlXm0Eq
         map3H+TcMyv/Q==
Received: by mail-pl1-f171.google.com with SMTP id p17so14477036pla.3
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 06:32:58 -0700 (PDT)
X-Gm-Message-State: AAQBX9d2qHbQhhu7scAfj9Gj4sbGRZHaDuMKCIX36fXVn0mU3HyzjELG
        EMdHZ277ir/xLkqXNJKKtzTK4Nt9aTs6MO8g4oUmzg==
X-Google-Smtp-Source: AKy350Y5U4Z/dfv+AvSqZXRHfVhVpKBzwMX3b9aXK5doLIcEmW2NRnzfpKko53ahGbE+qIVjBzucEnKmTK75Bh9acDc=
X-Received: by 2002:a17:90a:2944:b0:247:2c8e:9911 with SMTP id
 x4-20020a17090a294400b002472c8e9911mr3535372pjf.5.1681738378299; Mon, 17 Apr
 2023 06:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104613.61224-1-jernej.skrabec@gmail.com> <20230415104613.61224-3-jernej.skrabec@gmail.com>
In-Reply-To: <20230415104613.61224-3-jernej.skrabec@gmail.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 17 Apr 2023 15:32:47 +0200
X-Gmail-Original-Message-ID: <CAN6tsi72CP+DO-MG0=7Ajmqnd-q7r4bw_rxnvya-e4wUVEeujg@mail.gmail.com>
Message-ID: <CAN6tsi72CP+DO-MG0=7Ajmqnd-q7r4bw_rxnvya-e4wUVEeujg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: dw_hdmi: Handle snps,disable-cec property
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wens@csie.org, samuel@sholland.org, devicetree@vger.kernel.org,
        jonas@kwiboo.se, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
        hverkuil-cisco@xs4all.nl, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 15, 2023 at 12:47=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> New DT property allows to skip CEC initialization.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 603bb3c51027..e7e8199d2fb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3615,7 +3615,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_devic=
e *pdev,
>                 hdmi->audio =3D platform_device_register_full(&pdevinfo);
>         }
>
> -       if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
> +       if (!plat_data->disable_cec &&
> +           !of_property_read_bool(np, "snps,disable-cec") &&
> +           (config0 & HDMI_CONFIG0_CEC)) {
>                 cec.hdmi =3D hdmi;
>                 cec.ops =3D &dw_hdmi_cec_ops;
>                 cec.irq =3D irq;
> --
> 2.40.0
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
