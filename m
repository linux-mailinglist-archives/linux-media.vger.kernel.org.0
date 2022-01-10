Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AAA489C03
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 16:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbiAJPTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 10:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236041AbiAJPTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 10:19:02 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965E8C061748
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 07:19:02 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id ie23-20020a17090b401700b001b38a5318easo261443pjb.2
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fl2K3YD4/pXePXs1c4MTaO2s6ftC1qeQwSmigiyA0Ig=;
        b=VL9nJH9KG1/qrmm2oxG8JUigYJoOgmKxBtslyxMR5fAJ9/32h1BQSsgnbx1xJSXzH9
         DwQZxB+LhCTR4Y8HSTzquBquq3i7+gBWlspS2gv7Mgb6nzwD7b3oz2kw90d/GGznMu5t
         Ys/JAMrmMiJ++bUqp/SnM+IU6pEFcggFTxXNsoJFnkrcdvzlsZUdEB2FGbNHUGpYA7kP
         MdkJFPg0MZfhpNJu/Y8tKdDMLur6mCXASpnC0KZbgwUqO4fs/OeL4o4+7WuWr54DFRBM
         rlsaIDHjAH9oBJ7gBvtLTAzEYq0TqlEpqu/S5fYWrIeHfspHQHNAWaQNNWc7sHZGsN+9
         MTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fl2K3YD4/pXePXs1c4MTaO2s6ftC1qeQwSmigiyA0Ig=;
        b=0f6pxy9wnIpaIb/4x9InW/gSVYdDv2IOs0q1Q4pgHxbb0iD3MPjwDAJ9Q066HOK7Ii
         sz38/xqlETcQKNCrM3/9xpeiO6cWqCD3obd4B8BTOy6e1C/qqYuR/T2UKBHu27UrymM6
         Iq0Ycf45AJ5r8RrsoXTKEBc6Vw1V9iz85+qYW2jAYVs98nmqUKCssLY1OFA7zYaf+7bI
         WzAPl+ZV1sMHLS0Ey4yKy9zk6C5PRDZ02ZJ+8tzjkLjhYzyLpS2UsuWxEc4wNiasWS1U
         YgKXrN6RfCEm1o0slxDDP4ZY+onShuR0RfvrBozMq20/34F9jFhIpVxdgtQsvyFs9SUL
         M1Og==
X-Gm-Message-State: AOAM531dZnRfmpW03NcVjY8tVuhJVvdINbba7A3bMRuAt0O+KfEXciPs
        MvBNInNgL2S8H2E8Vzd3EfCwqrzgodv/E65ya/5xpw==
X-Google-Smtp-Source: ABdhPJz0tOx9UF5u5eixT1SI8uqBpaU2bn72hM1DsLW6ZSRHlb83cvRDtaBNsdRaXKPkgPubpn0sDBMy5TIZQ2nRVfo=
X-Received: by 2002:a17:90a:5295:: with SMTP id w21mr29109495pjh.179.1641827942034;
 Mon, 10 Jan 2022 07:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org> <20220109024910.2041763-7-bryan.odonoghue@linaro.org>
In-Reply-To: <20220109024910.2041763-7-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 10 Jan 2022 16:18:51 +0100
Message-ID: <CAG3jFys62DcODLpQH9rOE3fCvMTqKsy4gZFP6nvvA-i3bT=tiA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] media: camss: Set unused regulators to the empty set
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 9 Jan 2022 at 03:47, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> If a CAMSS block has no regulator set the regulator array to the empty set
> as opposed to setting the first element of the array to NULL.
>
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 60 +++++++++++------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 419c48c4f1d52..dcb37a739c95b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,7 +34,7 @@
>  static const struct resources csiphy_res_8x16[] = {
>         /* CSIPHY0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
>                 .clock_rate = { { 0 },
>                                 { 0 },
> @@ -46,7 +46,7 @@ static const struct resources csiphy_res_8x16[] = {
>
>         /* CSIPHY1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
>                 .clock_rate = { { 0 },
>                                 { 0 },
> @@ -107,7 +107,7 @@ static const struct resources_ispif ispif_res_8x16 = {
>  static const struct resources vfe_res_8x16[] = {
>         /* VFE0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "vfe0", "csi_vfe0",
>                            "vfe_ahb", "vfe_axi", "ahb" },
>                 .clock_rate = { { 0 },
> @@ -129,7 +129,7 @@ static const struct resources vfe_res_8x16[] = {
>  static const struct resources csiphy_res_8x96[] = {
>         /* CSIPHY0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
>                 .clock_rate = { { 0 },
>                                 { 0 },
> @@ -141,7 +141,7 @@ static const struct resources csiphy_res_8x96[] = {
>
>         /* CSIPHY1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
>                 .clock_rate = { { 0 },
>                                 { 0 },
> @@ -153,7 +153,7 @@ static const struct resources csiphy_res_8x96[] = {
>
>         /* CSIPHY2 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy2_timer" },
>                 .clock_rate = { { 0 },
>                                 { 0 },
> @@ -249,7 +249,7 @@ static const struct resources_ispif ispif_res_8x96 = {
>  static const struct resources vfe_res_8x96[] = {
>         /* VFE0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ahb", "vfe0", "csi_vfe0", "vfe_ahb",
>                            "vfe0_ahb", "vfe_axi", "vfe0_stream"},
>                 .clock_rate = { { 0 },
> @@ -267,7 +267,7 @@ static const struct resources vfe_res_8x96[] = {
>
>         /* VFE1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ahb", "vfe1", "csi_vfe1", "vfe_ahb",
>                            "vfe1_ahb", "vfe_axi", "vfe1_stream"},
>                 .clock_rate = { { 0 },
> @@ -287,7 +287,7 @@ static const struct resources vfe_res_8x96[] = {
>  static const struct resources csiphy_res_660[] = {
>         /* CSIPHY0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer",
>                            "csi0_phy", "csiphy_ahb2crif" },
>                 .clock_rate = { { 0 },
> @@ -301,7 +301,7 @@ static const struct resources csiphy_res_660[] = {
>
>         /* CSIPHY1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer",
>                            "csi1_phy", "csiphy_ahb2crif" },
>                 .clock_rate = { { 0 },
> @@ -315,7 +315,7 @@ static const struct resources csiphy_res_660[] = {
>
>         /* CSIPHY2 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy2_timer",
>                            "csi2_phy", "csiphy_ahb2crif" },
>                 .clock_rate = { { 0 },
> @@ -425,7 +425,7 @@ static const struct resources_ispif ispif_res_660 = {
>  static const struct resources vfe_res_660[] = {
>         /* VFE0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "throttle_axi", "top_ahb", "ahb", "vfe0",
>                            "csi_vfe0", "vfe_ahb", "vfe0_ahb", "vfe_axi",
>                            "vfe0_stream"},
> @@ -446,7 +446,7 @@ static const struct resources vfe_res_660[] = {
>
>         /* VFE1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "throttle_axi", "top_ahb", "ahb", "vfe1",
>                            "csi_vfe1", "vfe_ahb", "vfe1_ahb", "vfe_axi",
>                            "vfe1_stream"},
> @@ -469,7 +469,7 @@ static const struct resources vfe_res_660[] = {
>  static const struct resources csiphy_res_845[] = {
>         /* CSIPHY0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
>                                 "cpas_ahb", "cphy_rx_src", "csiphy0",
>                                 "csiphy0_timer_src", "csiphy0_timer" },
> @@ -487,7 +487,7 @@ static const struct resources csiphy_res_845[] = {
>
>         /* CSIPHY1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
>                                 "cpas_ahb", "cphy_rx_src", "csiphy1",
>                                 "csiphy1_timer_src", "csiphy1_timer" },
> @@ -505,7 +505,7 @@ static const struct resources csiphy_res_845[] = {
>
>         /* CSIPHY2 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
>                                 "cpas_ahb", "cphy_rx_src", "csiphy2",
>                                 "csiphy2_timer_src", "csiphy2_timer" },
> @@ -523,7 +523,7 @@ static const struct resources csiphy_res_845[] = {
>
>         /* CSIPHY3 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
>                                 "cpas_ahb", "cphy_rx_src", "csiphy3",
>                                 "csiphy3_timer_src", "csiphy3_timer" },
> @@ -605,7 +605,7 @@ static const struct resources csid_res_845[] = {
>  static const struct resources vfe_res_845[] = {
>         /* VFE0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
>                                 "soc_ahb", "vfe0", "vfe0_axi",
>                                 "vfe0_src", "csi0",
> @@ -625,7 +625,7 @@ static const struct resources vfe_res_845[] = {
>
>         /* VFE1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
>                                 "soc_ahb", "vfe1", "vfe1_axi",
>                                 "vfe1_src", "csi1",
> @@ -645,7 +645,7 @@ static const struct resources vfe_res_845[] = {
>
>         /* VFE-lite */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
>                                 "soc_ahb", "vfe_lite",
>                                 "vfe_lite_src", "csi2",
> @@ -666,7 +666,7 @@ static const struct resources vfe_res_845[] = {
>  static const struct resources csiphy_res_8250[] = {
>         /* CSIPHY0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "csiphy0", "csiphy0_timer" },
>                 .clock_rate = { { 400000000 },
>                                 { 300000000 } },
> @@ -675,7 +675,7 @@ static const struct resources csiphy_res_8250[] = {
>         },
>         /* CSIPHY1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "csiphy1", "csiphy1_timer" },
>                 .clock_rate = { { 400000000 },
>                                 { 300000000 } },
> @@ -684,7 +684,7 @@ static const struct resources csiphy_res_8250[] = {
>         },
>         /* CSIPHY2 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "csiphy2", "csiphy2_timer" },
>                 .clock_rate = { { 400000000 },
>                                 { 300000000 } },
> @@ -693,7 +693,7 @@ static const struct resources csiphy_res_8250[] = {
>         },
>         /* CSIPHY3 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "csiphy3", "csiphy3_timer" },
>                 .clock_rate = { { 400000000 },
>                                 { 300000000 } },
> @@ -702,7 +702,7 @@ static const struct resources csiphy_res_8250[] = {
>         },
>         /* CSIPHY4 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "csiphy4", "csiphy4_timer" },
>                 .clock_rate = { { 400000000 },
>                                 { 300000000 } },
> @@ -711,7 +711,7 @@ static const struct resources csiphy_res_8250[] = {
>         },
>         /* CSIPHY5 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "csiphy5", "csiphy5_timer" },
>                 .clock_rate = { { 400000000 },
>                                 { 300000000 } },
> @@ -772,7 +772,7 @@ static const struct resources csid_res_8250[] = {
>  static const struct resources vfe_res_8250[] = {
>         /* VFE0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
>                            "vfe0_axi", "cam_hf_axi" },
> @@ -790,7 +790,7 @@ static const struct resources vfe_res_8250[] = {
>         },
>         /* VFE1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
>                            "vfe1_axi", "cam_hf_axi" },
> @@ -808,7 +808,7 @@ static const struct resources vfe_res_8250[] = {
>         },
>         /* VFE2 (lite) */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> @@ -825,7 +825,7 @@ static const struct resources vfe_res_8250[] = {
>         },
>         /* VFE3 (lite) */
>         {
> -               .regulators = { NULL },
> +               .regulators = {},
>                 .clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> --

Thanks for the cleanup!

Reviewed-by: Robert Foss <robert.foss@linaro.org>
