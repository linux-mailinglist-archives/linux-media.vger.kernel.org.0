Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57C157B11C
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 08:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239995AbiGTG2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 02:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240025AbiGTG2g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 02:28:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A0A4E87C
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 23:28:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d12so28587202lfq.12
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 23:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZvCLm5C4QwrCvu37BPIif9T1t6U/v2ik0pFn7OOeGZc=;
        b=EDcfoiOEv5QDtsjnmB+++fYI+PYvq75KR2vME7ZodpkSxQyxdgKu5xeKDYtiB+BBnl
         I8WRvH+SfCLC6PwLlYlptY/tcl9taDXlyncqeTDLoK2P+1XZIvUJV2LUgusNHDpEDggf
         SGt7Co6UnZ5Lq80j1ZC4MVG31B3eO394wWqFRKreaipg+Nnkt1xsowSg70s2ETyFxjzi
         zkLxIZlFburRLBAh7eM5UbrYuCwIiC+n3A3TnTnvAV40xQB+yleW8tObS64Q+crcntZa
         /mTE0MGAqlWL/EY4kCOSFPHxTxj6N6/AoP/2mmwHO0zlD4E+niQ4ht5AedKGDeO01s7F
         IlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZvCLm5C4QwrCvu37BPIif9T1t6U/v2ik0pFn7OOeGZc=;
        b=ftsJSkKLiHs5LhnYU8ha6PEVZ12dN1RhrKZNqsOZYKEbGFAeeoSU01w21m6+pAMxBt
         CrLsdRr4ef8GjA9tFP5ncUr9sxsKK6DmW63rGnXmNNhIx7jql3ABEILI8uFr4EZceGef
         WqAU3lk7EQDpag0ljOwejYFoF6aWY7mWkGyAVzAGBhSEVFYSKUwjoxZkau9J5Uq/onxP
         rfkB5VQTC83DzAmHguGxEt42hz+EBirEFrKasdr5B+NhwddN5HqxOmGWv3X4xCVpaBFm
         6y3argtfDMmKIFrDl48dehX5ZuTTvTFhIgoqAC/F8Lo1Uvs5Dl8PQeFJvEkY0NC1UBv2
         6AMA==
X-Gm-Message-State: AJIora9/KlGpb0Ofn7XyPAJzDhAGqXJcKVize+OdfEVdvZ5s8xBUYY7E
        SxTWco8hU1nDgNLsrmHb1Ky1sQ==
X-Google-Smtp-Source: AGRyM1u+UekMgIs8vfRrABHoyjMOU+hs7YnksYxtseaC7qX43voYEegkZQl8Z5I17mIeh0wH55NsCg==
X-Received: by 2002:ac2:5972:0:b0:489:cb5d:9c4b with SMTP id h18-20020ac25972000000b00489cb5d9c4bmr18270243lfp.45.1658298511658;
        Tue, 19 Jul 2022 23:28:31 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id 11-20020ac25f0b000000b0047fb3ea0659sm3604186lfq.292.2022.07.19.23.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 23:28:31 -0700 (PDT)
Message-ID: <d506a523-6638-78f3-6a7d-2d9312302403@linaro.org>
Date:   Wed, 20 Jul 2022 08:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] dt-bindings: media: mediatek-jpeg-encoder: Add MT8188
 compatible string
Content-Language: en-US
To:     Jianhua Lin <jianhua.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220719100214.2096-1-jianhua.lin@mediatek.com>
 <20220719100214.2096-2-jianhua.lin@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220719100214.2096-2-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/07/2022 12:02, Jianhua Lin wrote:
> Add compatible for MT8188 jpeg encoder.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
