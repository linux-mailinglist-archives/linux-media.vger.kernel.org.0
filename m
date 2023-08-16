Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23B877E252
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 15:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245418AbjHPNOp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 09:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245429AbjHPNOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 09:14:38 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752D32123
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 06:14:34 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d3d729a08e4so6182754276.3
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 06:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692191673; x=1692796473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ps0ezi6BbE/dOQS5Zv8WHPzCnGOgQGimydMZPi3OwEA=;
        b=UHQsMab+UKQiY/x4Cvucj/6jRnXY5zYFK2PSNTZNBGfZDXjTsBo9ccfazJjcGGN+AL
         hfrHdNs0SyBWb7hDrvjoe8aFe9XX75C1CrTdFbjQJouEBBT532gnWK0zj3sIqhV0GJ9c
         zU9+3u56Eo67easSPJ0ULJ42cRGjSW9zTWQfR2lbkV0hYQowzonlXOgk3lbP+24gHeC7
         A7kd02YCaSESRQafEid7jn3sinNprYibkrE/+kDGaKlvI0yjxO8AV8ztvg/8hk0Xo/c5
         TJqdK+CEDIQnIxqYJpu11riGaaIcdtbGLv2p+Frvrw+bOnD3m9fCjCki8a5ns9G1nEYh
         nWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692191673; x=1692796473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps0ezi6BbE/dOQS5Zv8WHPzCnGOgQGimydMZPi3OwEA=;
        b=Vq70qEuHA2ndpW8tWTTEAQc0AiMpbVY5lXRnCjrIvGfIRmwrDb4lnwbSSOJWEj5ot/
         NwXQx10Yb7W8EB4nxu0ithvVqSitp5x5RlD9qIsoBie9X3kzT6yR1YBRN0K65nWBJ+iR
         GrDRLlsnHtwg5hCvjkcldbXjz4tz9ovARqAw4ogLWy2RxPGz8CjRahnJCrqE23OhC/nl
         knfnyWhOJ3pTDpzWjLtkjWcp9BdcND6LD/iflAgwOogNgMhFMfOBd1jHX9pGv+a8WLW6
         MRXv6G/0XWntpNPLXrg/5Zzpn/Fpv6g+boIFg8GvAcyOpi0OMzBEgmkQl/S2UOw1yTzr
         ietw==
X-Gm-Message-State: AOJu0YxH+CCqxdAZykDa3KzFXm+Ud/ynwZEYxWQTiRd819svAiLGG2IA
        +2z1jzudr5PXAuM0tAiC2vUnFx+S0K4Ss9O3gavtkQ==
X-Google-Smtp-Source: AGHT+IGKZ4RWnzjsWo4DnKHE3xoKinJgbhJCua6rwHR/iEng6W17crQo1AvKOP5s6UKzGEoNDQw+sgBOpsYORz89Njo=
X-Received: by 2002:a25:dbc1:0:b0:d62:b91b:10e3 with SMTP id
 g184-20020a25dbc1000000b00d62b91b10e3mr1670653ybf.48.1692191673659; Wed, 16
 Aug 2023 06:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-2-git-send-email-quic_vgarodia@quicinc.com>
 <c29d5e28-5b9d-1327-0feb-e5ed27afcd3a@infradead.org> <b4de638e-9cab-2662-92b0-e2d1a18018a1@quicinc.com>
 <540b263a-3a1e-fd09-c6c2-18371e460e5e@linaro.org>
In-Reply-To: <540b263a-3a1e-fd09-c6c2-18371e460e5e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 16 Aug 2023 16:14:22 +0300
Message-ID: <CAA8EJpq1o3VRMTgWb-uFf7qTQ897ishiJ9HTNWcxHgLyyfpAOg@mail.gmail.com>
Subject: Re: [PATCH 01/33] MAINTAINERS: Add Qualcomm Iris video accelerator driver
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, 16 Aug 2023 at 15:00, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 14/08/2023 19:44, Dikshita Agarwal wrote:
> >
> >
> > On 7/29/2023 4:18 AM, Randy Dunlap wrote:
> >>
> >>
> >> On 7/28/23 06:23, Vikash Garodia wrote:
> >>> Add an entry for Iris video encoder/decoder accelerator driver.
> >>>
> >>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >>> ---
> >>>   MAINTAINERS | 10 ++++++++++
> >>>   1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 3be1bdf..ea633b2 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -17671,6 +17671,16 @@ T: git git://linuxtv.org/media_tree.git
> >>>   F:        Documentation/devicetree/bindings/media/*venus*
> >>>   F:        drivers/media/platform/qcom/venus/
> >>>
> >>> +QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
> >>
> >> This entry should immediately follow:
> >> QUALCOMM IPQ4019 VQMMC REGULATOR DRIVER
> >>
> >> to keep the file in alphabetical order.
> >>
> > Sure, will fix this in next version.
>
> I think TBH before we see a next version, there needs to be a conclusive
> argument on why a new driver - instead of an update to the existing
> venus - is the way to go.
>
> We have an ongoing corpus of working code that people use. The attempt
> to at least _try_ to integrate 8550 and beyond to upstream venus should
> be made.
>
> If it fails, then we can discuss a branched driver.
>
> Its not up to me but, that's certainly my honest and unvarnished input.
>
> Instead of investing time in V2 - please invest time in upstream venus
> or make the technical argument conclusively _prior_ to V2 as to why V2
> and beyond is the "only" way forward for 8550 and beyond.

I'd second this request. At the very least (as I wrote in response to
another email), consider reworking venus into core and interface
specific parts and making iris3 use a common base layer.
We already have drivers which work across multiple platforms, taking
care of differences. Few to name: GPU, display, sound, DSP, camss.


-- 
With best wishes
Dmitry
