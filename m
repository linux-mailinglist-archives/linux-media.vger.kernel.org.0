Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91417D896C
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 22:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344732AbjJZUFj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 16:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbjJZUFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 16:05:37 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23AD1B2
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 13:05:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507b9408c61so1884561e87.0
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698350733; x=1698955533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvOjbgMEiNiwKtiviiRB3Jrac69AW/ULZDJDyb5mOHQ=;
        b=P4D7ta40bUsOEize9zzj1mKfohkiPXxhP2CVpUFlOM8fzhc1eRaHNJw7Oi/OwzEGBK
         wEcX6jI7dZFXUY0uHav9JJsvx9mowaROLvDG60su/yR90XkaZvrKNuZgU/vNz3h6khl5
         sZN90EA/2WeIug3Aa2nJ1/xYTC2D/aN/cLqrv2p7YcnV+a+HccWGezM5YzK+iMI9TCRa
         Xcw2xvHgvM/e8C07wecuF7EvpmzYlxumS/mZusZEe+/vJ9Q6La8PZLvWpJnMLwrATe5u
         Y359zoJm4Qn/JtanAE8bUzoXT681Bl2e2yScNcc9R2FA6XpO+GfhuMWEgJ7TjyDTHcsj
         Va2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698350733; x=1698955533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvOjbgMEiNiwKtiviiRB3Jrac69AW/ULZDJDyb5mOHQ=;
        b=rp451IEjf6CQNwoBUMML2skSmG23sOL9GddN5n1RRlZQsQAL/rcv3kZ0duEjHMj8yu
         4+2sfmWmcIF/HGY2a2bajBpgK92qev3xu8co61GCuNCSDwkohYoj8Xq5UCyO4qZrk7ps
         prbG6t7o0H195dI5aeA92KZukTjGJCz+LV0kd7tSzD3GQDriR9tvX222DrlvEhrgvoI+
         soxSGSlukB3D8DQyPc0u2oiDVDal/i3KAHll4TuZrZBnYTUOgjRgBOOHyzSJM2b25oPL
         ryJMUafB29kPWRB0rNE1elhNxB7bceN8wZWDRuI4hPkGkwXl2flsEtjQvJzoWN/eHCRF
         AmXA==
X-Gm-Message-State: AOJu0YwyQ9W+xFemhhGDWPWaYYOWLfo/X3HGj4zMu7uF+N3EfuaLIJOq
        fMWHSbMflukB+v01CKXCJXpcew==
X-Google-Smtp-Source: AGHT+IFEMzDSwODrY3eUmO9ZckI4cUk7p2AKD827UDJVPZI2qPIMi2X4T4qAJW+b0BiLQ16V6StHpA==
X-Received: by 2002:a05:6512:6cd:b0:503:3644:4a98 with SMTP id u13-20020a05651206cd00b0050336444a98mr344546lff.2.1698350732782;
        Thu, 26 Oct 2023 13:05:32 -0700 (PDT)
Received: from [172.30.205.86] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t6-20020a19ad06000000b00503f39e6bcesm672812lfc.95.2023.10.26.13.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 13:05:32 -0700 (PDT)
Message-ID: <883ce8a7-80e1-4065-a957-424d0b4a6535@linaro.org>
Date:   Thu, 26 Oct 2023 22:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: qcom: camss: Flag which VFEs require a
 power-domain
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, andersson@kernel.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231026155042.551731-1-bryan.odonoghue@linaro.org>
 <20231026155042.551731-2-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231026155042.551731-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/26/23 17:50, Bryan O'Donoghue wrote:
> At the moment we have some complex code for determining if a VFE requires a
> power-domain attachment. Particularly discordant in this scheme is the
> subtle reliance on VFE and VFE Lite declaration ordering in our resources.
> 
> VFE id is used to determine if a VFE is lite or not and consequently if a
> VFE requires power-domain attachment. VFE Lite though is not a correct
> delineation between power-domain and non power-domain state since early
> SoCs have neither VFE Lite nor power-domains attached to VFEs.
> 
> Introduce has_pd to the VFE resource structure to allow the CAMSS code to
> understand if it needs to try to attach a power-domain for a given VFE.
> 
> As a side-effect from this we no longer need to care about VFE Lite or
> non-Lite or the id number associated with either and which order the
> VFE/VFE Lite was declared in.
> 
> Add the flag and populate the resources. Subsequent patches will disjunct
> on the bool.
Generally such things are expected (?) to ship together, but I see that these
patches are quite big as they are, so this is totally fine!

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
