Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD9C489892
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 13:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245467AbiAJM2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 07:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245449AbiAJM2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 07:28:12 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29732C061751
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 04:28:12 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso15687078pjb.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 04:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GMIzhkmmngSBJoZ4oqPJUHPjBz9SRIscCPEDnBVJc6E=;
        b=ffIYnKHb6BhhgItIaSTXD7c6zplkCkLz3euRZhzFuXCosLKRjG5YWQ+G2ViS8DG3Yz
         vFo+w9uho+1RAHKHj+IRnv+ur24aK86m9UZOs65d/euR52xJ/uz2BNHs9EWNaESjARs/
         DIsWAL1GzBv2VtuHUZQoMVckSa/LYHidEaVFsq01twxDU0oaxXjJnTgP5DkvwJxZo4jc
         5hP4ZaG6gcEHaXErPothmJH6yELEfofuKIZF+QCiEaype0qy2bXtCAPw+HnEBg+wrH4h
         XUozt2RKnUfdpiUIw0jjnR9EmgvEZceRXCVyJrI7qzkTDbYTRbSeSqisadEvCxU7CvNa
         ImLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GMIzhkmmngSBJoZ4oqPJUHPjBz9SRIscCPEDnBVJc6E=;
        b=7WiXSaRUzDl9g0ndcJruz04kTuVvif3S67OLggtwPtOaLasmS1cjRg8nvV/7pdxYoB
         te56swvgveFYim8XPfLjUyhl3HoxmpHgDTuwsX7D09apreTYdQ7U77ZNSIQyFrCeReSx
         +d64Khc6dwzeM7n9Yqh9h/mNZvPLJRwMlRo0aFWkl/Im/+d+70Hhu7yMsJz4PS3/Owiw
         40AkPk6IJfjLBKbLWKcV+/fLCLxRdweFAHw1lBvfmEtjuD7Zrj85NM0aY/q2Q//bFSMw
         XirsKdDXqIAbhaegw/hZGjCok7fS+nq2Sp+dTG+HAG3ixh2y9W9WRGYjFN7ZWuBcmdBh
         La2w==
X-Gm-Message-State: AOAM530V8dYpWsCM9OpCYNt0U/I3/d3OjEIZtFbrs/UrTgTec9JBTkud
        QzpyyKxQznoNc92tHWzY95B92DvchGS3urnNYxSN9A==
X-Google-Smtp-Source: ABdhPJxlZFX9ueU4XGGwEmz13wBlIfoXutWPv1Vt2WEcNYFED6TxBxQAc3ndTpQxtAJz7teExhC6w0OBYi/Lb+TYE5Y=
X-Received: by 2002:a17:902:e3d5:b0:14a:37bd:5ca3 with SMTP id
 r21-20020a170902e3d500b0014a37bd5ca3mr4516466ple.65.1641817691443; Mon, 10
 Jan 2022 04:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org> <20220109024910.2041763-2-bryan.odonoghue@linaro.org>
In-Reply-To: <20220109024910.2041763-2-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 10 Jan 2022 13:27:59 +0100
Message-ID: <CAG3jFyumQ=QJDXRp=Nydni3oBQ_s0i4373O4_kXCMZwY+Z-1nw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] media: dt-bindings: media: camss: Fixup vdda
 regulator descriptions sdm845
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, devicetree@vger.kernel.org,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Bryan,

Thanks for submitting this series.

On Sun, 9 Jan 2022 at 03:47, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> If we review the schematic for RB3 Thundercomm document Turbox-845 we see
> that the CAMSS CSI PHY has the same basic power-rail layout as UFS, PCIe
> and USB PHYs.
>
> We should therefore have two regulator declarations as is the case for UFS,
> PCIe and USB.
>
> Cc: devicetree@vger.kernel.org
> Cc: robh@kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sdm845-camss.yaml          | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 9ca5dfa7f2260..ae0642b9ae5ec 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -203,9 +203,13 @@ properties:
>        - const: vfe1
>        - const: vfe_lite
>
> -  vdda-supply:
> +  vdda-phy-supply:
>      description:
> -      Definition of the regulator used as analog power supply.
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
>
>  required:
>    - clock-names
> @@ -217,7 +221,8 @@ required:
>    - power-domains
>    - reg
>    - reg-names
> -  - vdda-supply
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>
>  additionalProperties: false
>
> @@ -361,7 +366,8 @@ examples:
>            "vfe1",
>            "vfe_lite";
>
> -        vdda-supply = <&reg_2v8>;
> +        vdda-phy-supply = <&vreg_l1a_0p875>;
> +        vdda-pll-supply = <&vreg_l26a_1p2>;
>
>          ports {
>            #address-cells = <1>;
> --
> 2.33.0
>

The patch looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
