Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51652489B86
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 15:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235708AbiAJOqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 09:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbiAJOqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 09:46:04 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65594C061748
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 06:46:04 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t18so2635895plg.9
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 06:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3u/nL4+caw2Jc6IrZh81voTa4JaYMHLEUh8UW2kMetU=;
        b=Coa54SP3EZ0u2iOAHnQzPsnXwqYKLKpQ+Ogki3z4yqL5nrh9xPva9o39S5DdVOXTrG
         DL0vfNmNXJR9hkJKx2aitxhyM/LM0epvyQfLadl0aq2T8ysglO2Uvc3Mr4iMsvrKgwiC
         3ad4wPTW1lmpbHwdgyc8m+n10Y7P/k+EuDHWuubOOUurVLWZoB5nf9zcHnrPRTtFfsHR
         jLWzTJFZzEz2dxH4r9qXDdWoZxaNzROuiSooR/BlHrHuYChtrqDuUmCrQNnS5TbhMqsX
         MiJRlxqvaM5w3frycJuGyZL3P4gE9nogsii/JeakVAwO0LJk7G8xLZzbHGFIZ/t44FgR
         4AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3u/nL4+caw2Jc6IrZh81voTa4JaYMHLEUh8UW2kMetU=;
        b=iVZWpVxBjtlD+rAUutVsKl/vssoT1eNcDM9YyRLZFJpHrR2PSgeMXUc1DQH9DndvQa
         Rzx4J0D+wYOJCYjV7zAQo3rz/rZSqbsdGzkB3bibzVySzmpktvAIj+owQVrxyRdBWiY6
         9VfO3aTWmpFX6gAEk35aB62Cv4ezsBbry5fnowd6Uds+XIFfLAtK0yqEq+oVYxG1vLSt
         olWrqu5GCNc3JyizSImXoCwk4JLjMXP+VRk6wbQ9obsW9d6Oq+8gsvrqRE5us7A6Kfm6
         ++cONb9GjjfUz4k84rpFpHxO2xsbTHYiBNPmzMAvVGcWdJhqPPwnSRRL9ctZPNUfQuDn
         FKWg==
X-Gm-Message-State: AOAM5333kNmGuRuMp8cowGGdIog/8hz/cFHhOp24RzyoNjQ3xwMtS6Zl
        MLM+18Y6GQbR/H9CG/zyJK7jSmqT+ocD1bA0ysTDuQ==
X-Google-Smtp-Source: ABdhPJxkj9vZBJ5acFie1CWTAvpX5sUJm13cdTZeiLum3gzwMZ/po9/Md+Al1zj/iwQZKt4Gu/OrmhQMbpQTwrE22fU=
X-Received: by 2002:a17:90a:5295:: with SMTP id w21mr28949560pjh.179.1641825963818;
 Mon, 10 Jan 2022 06:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org> <20220109024910.2041763-5-bryan.odonoghue@linaro.org>
In-Reply-To: <20220109024910.2041763-5-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 10 Jan 2022 15:45:52 +0100
Message-ID: <CAG3jFyu3XuKjFM7Vv7nE+EomCCf7rDXtA+Zgt0pN=MCDmDcp_Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
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
> Add in the missing vdda-pll-supply rail description.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index c4db88dbf8766..f7bfd69b13620 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1116,6 +1116,7 @@ &cci {
>
>  &camss {
>         vdda-phy-supply = <&vreg_l1a_0p875>;
> +       vdda-pll-supply = <&vreg_l26a_1p2>;
>
>         status = "ok";
>
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
