Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219E54968C7
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 01:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiAVAdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 19:33:17 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:35372 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiAVAdQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 19:33:16 -0500
Received: by mail-ot1-f44.google.com with SMTP id n22-20020a9d2016000000b0059bd79f7777so13399827ota.2;
        Fri, 21 Jan 2022 16:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JgHgZjIQSFjUKHeVHA6Be/II8KK2159XAo+dJ28h5Iw=;
        b=eOIG3FGiyP++i7z3AzxL1p8czZQ2bKV+NSjzXCxefkWd1piHc6UufuOd416HDDmOg0
         A85BUin7HpTyHRh+I1Vs4vGJBz6OXhoYAlzeZMavISmsvLcQVzCfdYl2uQAoGJcHgdF3
         V1cmkKCxrvSILJuZJXSR4TTaebC4UHuwemSvECTAIZNQXPY6B5ppoYmHJ4run9vz4qD6
         v27ecNrGXiv/tI3GIgVAMyztFBKYf1x1o8P72vDKLvSzPYy6uKYuepwZjgxRkYDtcogz
         uoY/leSVzMlr+PDlg8dLCRX/GqkQ5HEgII/gb/Q2h1UKw5dEq6mbHuzNOoVrMN2Mkmjs
         Nu3Q==
X-Gm-Message-State: AOAM530zPsqbMFo5ftFm+eAJYQ4s2ByjTa+uSiHTMeUIm8qtjjP5pCkv
        DWQBMF/rb/Iarl7EsF9XTmKR1KZgRQ==
X-Google-Smtp-Source: ABdhPJxjBROuljU1xYDh+nWX6Y01ye1HdqjULCerpZcNWqus75bZ0viTgmwFhDAGBs2sfaebdpS8jg==
X-Received: by 2002:a9d:410c:: with SMTP id o12mr4586336ote.342.1642811596233;
        Fri, 21 Jan 2022 16:33:16 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u17sm1439377ooq.5.2022.01.21.16.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 16:33:15 -0800 (PST)
Received: (nullmailer pid 1916997 invoked by uid 1000);
        Sat, 22 Jan 2022 00:33:14 -0000
Date:   Fri, 21 Jan 2022 18:33:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     bjorn.andersson@linaro.org, robert.foss@linaro.org,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, jonathan@marek.ca,
        todor.too@gmail.com, andrey.konovalov@linaro.org,
        hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hfink@snap.com,
        linux-arm-msm@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH v3 1/8] media: dt-bindings: media: camss: Fixup vdda
 regulator descriptions sdm845
Message-ID: <YetQyjjpwMa5TqiG@robh.at.kernel.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
 <20220111125212.2343184-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111125212.2343184-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 Jan 2022 12:52:05 +0000, Bryan O'Donoghue wrote:
> If we review the schematic for RB3 Thundercomm document Turbox-845 we see
> that the CAMSS CSI PHY has the same basic power-rail layout as UFS, PCIe
> and USB PHYs.
> 
> We should therefore have two regulator declarations as is the case for UFS,
> PCIe and USB.
> 
> Cc: devicetree@vger.kernel.org
> Cc: robh@kernel.org
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sdm845-camss.yaml          | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
