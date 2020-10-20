Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1F2293936
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393208AbgJTKeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393196AbgJTKeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:34:13 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A61C0613D3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 03:34:12 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t18so815619plo.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lzpOtrfPfcWZHMhbxVFAso3zmbyoevosVU5DoDXv9Mo=;
        b=aFT/cvThLhB55POIco8f/0mBdHT6mm5N58HYnifs0+xmoXJGYGXbBKPREXkS+cFCQS
         RCnHZ3A6Eckgu6OLSlpaeAMyf5cdMlxUwtM4nc6KJSEyh8hducwWZ8bsLqqc2OBwSSi8
         l7NvWgCoz0ZnQrM5t5ujJ9wXl3EmlTzDhcyMfMEzAkhTshBp76UJYVU7oEUNCXl8eb7C
         sGFmUrn+Y/Mk/6yohvnuL5gbKfyGFAPV5xCJRCZ0aJeaVEpuz24slRs6lMoOIOOVHMOP
         h9iYaspH0lFM8rGN5lgqcSgNrgR6b6tmFJv7nWdUQh6GRkls+Xt2N2tSm6OgliPxrObb
         ItGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lzpOtrfPfcWZHMhbxVFAso3zmbyoevosVU5DoDXv9Mo=;
        b=DnD910stFXi8TqfJqr8ucTAI6rCHxtWMKG8VzaHElogGfpPuBikwk/Tft7FgGE1Qfw
         8u+tOoil/IHJMKufQcFpaM6yZfc6vW67QlnqpUV0S5tHCgSs5mhaeb17YOm5VmCRWrXa
         yoKKYm3jQdaO/CYUkAk/pUML0UtmYdBSoIVFp4ichKCX7MT/uUqNg7nMeYCZNxWhY/wo
         lmdCAY/KKlVic3IT11C/ei02JYPY4qdHcKT1BVlGXHDTkaV24WzKvBPWBxTDyHRyqVU4
         gXqGec+HBeaJU1f3XlNrCkANsTwhGQRoZ8DpGGKTiuj8oy/G7MjlP610tOAxTM6OXL14
         QwSw==
X-Gm-Message-State: AOAM5334X0sUmFPf87Swv7I+QmCPf3pc//5i3iTJmGRvl13oH1tB0Y6N
        rQprGbCj5mGYd72wIhOWNg/p5AHwU7cE43tEEUDyDw==
X-Google-Smtp-Source: ABdhPJz4n96xfPtY7Qq/t0m+t19dxP/ixRJkoSC+czGLraIr6/v6So2kOZ1/BVGLeGlkn+Rba/TOHCWRGEho0Ld2KC4=
X-Received: by 2002:a17:90a:58f:: with SMTP id i15mr49869pji.19.1603190051635;
 Tue, 20 Oct 2020 03:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201018125237.16717-1-kholk11@gmail.com> <20201018125237.16717-6-kholk11@gmail.com>
In-Reply-To: <20201018125237.16717-6-kholk11@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 20 Oct 2020 12:34:00 +0200
Message-ID: <CAG3jFyv33Y+sD20Wm21kBhogO0BORw4n00U1e3Ts2hZabGQ+jA@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: dt-bindings: media: qcom,camss: Add bindings
 for SDM660 camss
To:     kholk11@gmail.com
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Looks good to me.

Signed-off-by: Robert Foss <robert.foss@linaro.org>

On Sun, 18 Oct 2020 at 14:53, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add bindings for qcom,sdm660-camss in order to support the camera
> subsystem on SDM630/660 and SDA variants.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,camss.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
> index 09eb6ed99114..498234629e21 100644
> --- a/Documentation/devicetree/bindings/media/qcom,camss.txt
> +++ b/Documentation/devicetree/bindings/media/qcom,camss.txt
> @@ -8,6 +8,7 @@ Qualcomm Camera Subsystem
>         Definition: Should contain one of:
>                 - "qcom,msm8916-camss"
>                 - "qcom,msm8996-camss"
> +               - "qcom,sdm660-camss"
>  - reg:
>         Usage: required
>         Value type: <prop-encoded-array>
> @@ -64,30 +65,36 @@ Qualcomm Camera Subsystem
>         Value type: <stringlist>
>         Definition: Should contain the following entries:
>                 - "top_ahb"
> +               - "throttle_axi"        (660 only)
>                 - "ispif_ahb"
>                 - "csiphy0_timer"
>                 - "csiphy1_timer"
>                 - "csiphy2_timer"       (8996 only)
> +               - "csiphy_ahb2crif"     (660 only)
>                 - "csi0_ahb"
>                 - "csi0"
>                 - "csi0_phy"
>                 - "csi0_pix"
>                 - "csi0_rdi"
> +               - "cphy_csid0"          (660 only)
>                 - "csi1_ahb"
>                 - "csi1"
>                 - "csi1_phy"
>                 - "csi1_pix"
>                 - "csi1_rdi"
> +               - "cphy_csid1"          (660 only)
>                 - "csi2_ahb"            (8996 only)
>                 - "csi2"                (8996 only)
>                 - "csi2_phy"            (8996 only)
>                 - "csi2_pix"            (8996 only)
>                 - "csi2_rdi"            (8996 only)
> +               - "cphy_csid2"          (660 only)
>                 - "csi3_ahb"            (8996 only)
>                 - "csi3"                (8996 only)
>                 - "csi3_phy"            (8996 only)
>                 - "csi3_pix"            (8996 only)
>                 - "csi3_rdi"            (8996 only)
> +               - "cphy_csid3"          (660 only)
>                 - "ahb"
>                 - "vfe0"
>                 - "csi_vfe0"
> --
> 2.28.0
>
