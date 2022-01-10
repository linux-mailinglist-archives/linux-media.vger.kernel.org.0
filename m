Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3381748989F
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 13:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245515AbiAJMbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 07:31:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245519AbiAJMao (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 07:30:44 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBFCC061756
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 04:30:44 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id pf13so4654702pjb.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YQZQYOBer46h1ujEJ6mmYWM+KtgxyTu3PnhsySoPy30=;
        b=pcY09daCBUAsI6axXWs3+pmchIqKraUqTdFOh3AM4nyNjr+bil4uRdHZmrR81tIli7
         4snZqXITPkNklfdfbfxAT0u7Z84qvfSDE9CziQY58p0DoPfir+2fME6Qd8uAbH3NabOd
         yd6a/uRFShlmmE2ihGS2xn5SKrq5qX7Fgxf7oA+M81b10zMsAjtdaI1P/aAulD+Rfqcm
         LSCTglCPugGJxF1ZWdRF1GE+b2Z/E9UQ6IWaeUWJGWC4swoyvMGHK+70Yli58cBa48RD
         Vit0CMccNeZAhSnzrkhYNoMcCe1pGcwE9jxnvYBCfnjnhH0ASxZdp92LtsVLjCdh378w
         NcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YQZQYOBer46h1ujEJ6mmYWM+KtgxyTu3PnhsySoPy30=;
        b=e8fi6Sz9LpY2SmIEb7WcpalpZXBfjkFlHlany+YrEU5+4L7u9xpLakbaiDwa5gbjQ4
         uPm+iBkkjgOYFYpJokqXf07aYYVWQlr2Nsft0um/SfPssP4yfBdwfMusGRx1309nq0+1
         ItPf9/Nwg/c1yMwJQUcKOtmrQohNHRjjrek8Gys+NU0HheRDwVSqHzE65XDNBcWWt/WJ
         VcZexeKc8QO8tTTOuFRGjXptFpg6ekDuO8+KeiMhL138o7UnHF5jfDrrwoxGIzkLVlbX
         kkPUNqeAE65KLTq5Fwhk6+Stpe2MwiYzdilU7AeXkH/7y6MSfRmZv7L4CjKrG7s+jtvF
         qYTw==
X-Gm-Message-State: AOAM530p4CvnJ1Aha1LIcZG83oX8ZIloJ4uqPaRyazDIxtPBB3zz+CA0
        fzjJnM1OZ4abk08oUY6dbyXKPHe2kcq10VoMhOer+A==
X-Google-Smtp-Source: ABdhPJz/DEc3SFvgp2C1VlAHoL2dInzexIdNS7SWsLesJtixgM8LNaQncoyZ3TqCEd1gRENYW9xDTs8of6C4nTKDd8g=
X-Received: by 2002:a17:90b:4c89:: with SMTP id my9mr30232356pjb.152.1641817843691;
 Mon, 10 Jan 2022 04:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org> <20220109024910.2041763-4-bryan.odonoghue@linaro.org>
In-Reply-To: <20220109024910.2041763-4-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 10 Jan 2022 13:30:32 +0100
Message-ID: <CAG3jFyuAkng+WTF9fvooL0XrmUWtML-NN0UGj8E37suTrvNmow@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: sdm845: Rename camss vdda-supply
 to vdda-phy-supply
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
> The dts entry vdda-supply connects to a common vdda-phy-supply rail. Rename
> to reflect what the functionality is.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 13f80a0b6faaa..c4db88dbf8766 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1115,7 +1115,7 @@ &cci {
>  };
>
>  &camss {
> -       vdda-supply = <&vreg_l1a_0p875>;
> +       vdda-phy-supply = <&vreg_l1a_0p875>;
>
>         status = "ok";
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
