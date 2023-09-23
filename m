Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC587AC402
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 19:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbjIWRhC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 13:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjIWRhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 13:37:01 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F09B19A
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 10:36:54 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4051fea48a8so44542995e9.2
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695490613; x=1696095413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dn6phUldCWNuUnLwZIK8/YMmtjChSj8cWy1kooP65ek=;
        b=yI8ytZhcK16sAq00377W7OqEgIssUAOpDJkXXPe3l1XfZ4Bls077Ka4EoPSocXXXQm
         aGHLLNUuzSi5PDA7nLMi54ALm5h86LEO2UwYGECEHkVfyo2x6uxAu82z4xD8Cs2schYo
         Cr6ybE72CyE8vuOWT5mqMDj9GPtAqLEYvJgnyde+G73JcUXFdwdeXj1Ilfonz1z6niKZ
         pB8DdslSVjAuglUy352jG0fhOmWPeVgi7eZm64fsVocjyK6KTyF1g436hPGKWRmwP6CI
         vjhT/Xw37t9Ds1jA+99jCmRhIkCCpic7/02rjEZnvdFZsS8wk/uR5Q0556rKpO+jAIev
         AY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490613; x=1696095413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dn6phUldCWNuUnLwZIK8/YMmtjChSj8cWy1kooP65ek=;
        b=YXnhsVJk8v/Chr0NeQH1xNfVwXiMC8X+IcxxN6uSHXwdSaukz9b/SZGc2H0aCE3sKd
         RoFSuRVvZY5f52ygu3NL3B2VCqFplZlnvXAIZyFBgx5uUaZn6s+Ao5sxuflNrFg76fxs
         EHRaTi5balwHdx37ZdCGoMt5qp2lhqlXT7p9YLf7fKbIuJ5Xx1nUAuAU1iP83+cZEiAT
         Zn//O20bHsh0vkgmDzlLhiUtunMfJ5X8ahD3OSSGTq+X2LSE8pXUpdcagluyt733PA6W
         dRhTn8vRnKlpEQfIZXKDv5OkAly1wMtsDXaTtVuqLrAF9GqRdWCeH9kqPgdXnktnaP8O
         0j9g==
X-Gm-Message-State: AOJu0YzFGAYjX0gQn0w6rWUSjWEQkv782CW8BVwrZB0ewvZaGDa5mqyH
        8PwZ5bDDKLZKwsDLKFV51+wLlQ==
X-Google-Smtp-Source: AGHT+IEvo9mHZh26ly7OkIqoP9oOmRajb274z0zwHS+GCNlpI9LxxNC0Imkzhh9QWjYIELh+B5vy3A==
X-Received: by 2002:a05:600c:2101:b0:401:2ee0:754a with SMTP id u1-20020a05600c210100b004012ee0754amr2397634wml.13.1695490612950;
        Sat, 23 Sep 2023 10:36:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003fc04d13242sm10682300wmi.0.2023.09.23.10.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:36:52 -0700 (PDT)
Message-ID: <4f15a450-4344-ed5a-0504-9a2f0a9daa0d@linaro.org>
Date:   Sat, 23 Sep 2023 19:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 00/16] introduce more MDP3 components in MT8195
Content-Language: en-US
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2023 09:21, Moudy Ho wrote:
> Changes since v5:
> - Rebase on v6.6-rc2.
> - Dependent dtsi files:
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=786511
> - Depends on:
>   Message ID = 20230911074233.31556-5-shawn.sung@mediatek.com
> - Split out common propertis for RDMA.
> - Split each component into independent patches.

And ignored previously given feedback. That's not the way you should
work with upstream community. It feels like a waste of my time and it is
not fair that Mediatek is doing it :(

Best regards,
Krzysztof

