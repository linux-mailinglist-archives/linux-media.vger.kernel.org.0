Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D858B56FB8B
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 11:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbiGKJcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 05:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbiGKJbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 05:31:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944CB74DC3
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 02:17:12 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bu42so7723968lfb.0
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 02:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uJtXuRvdgMPQ1UnDvhoOm/1EA7XoOpO+RRB/+tZI2oI=;
        b=sDcaOypRR7yO+xtRmQGTq9WiuyfG8Ly2V27pjiKC3a0XERSnVVerKNe+E8fW9lDU7O
         SQM5rV4qroLaUSTj5jbdR4HtD+QzUrvn5cjAYOHuLms9bCFzgcmEUYuSUtGh6N7OTVpF
         +Z8ziEwxjKsBZ68xw3GkteRriytvhoyxOnbekvsu+mtrb0cNcVkuTWyQHQq69O+FHMBF
         ir8a27N57e1Xkm/yoLKLQv8i9qkU+FCxiVgUVUKW05p0y38h7cYKy8UtoJccpv/XnUFw
         tVQZIPTWEuxibT1uaziba9zUR1Ui26QnHL1lILjvGJhf8yDocE+cuUuzLDEauVlE1X9U
         Jk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uJtXuRvdgMPQ1UnDvhoOm/1EA7XoOpO+RRB/+tZI2oI=;
        b=rECgkxWCZoNz9mC8RGvvSVpAbKLR51xaAHmvxpMMm8XjGy7TM0yh8Ne3xl469IVBeH
         gS79Y/LM5B8lzOLFzwCMJHsp5Gmw17GknB32Qo6RMhuPaYf1RhSYfgV127SJv3jNydTc
         GlmddCCXH2b+g/55dQBv18CoAnhZE0Rm9voL3ET94je3CE4x1uAoQ66bDpv5zArc7A+8
         nGqsGs9DnZGj2sMNL+ipqHHNQAd5h8MwXTWVGlIt2FKCV0h9CM7EAyqkXKzFJBn9j1e6
         hmTATFbsz666OjganVP6NNel157lNghVZIeqY3v32L1koU5tUOmQQstak0xlSuDiUK2X
         4x/g==
X-Gm-Message-State: AJIora/erAXDS1iPQ2uRYxm8Tlp83jAxvzyY0FnOWp2bQapcqtFyVJRk
        8dZ467ulUhrPdi7qWFThuItslQ==
X-Google-Smtp-Source: AGRyM1uoJemPp3B8wL5ggdfxU6hbjp4QvOS3TChZ6cMs9Ji5rhldcYajVkYUbMKg2XQROAz6HaT2Yg==
X-Received: by 2002:a05:6512:3b06:b0:481:507e:e3a0 with SMTP id f6-20020a0565123b0600b00481507ee3a0mr11986657lfv.616.1657531030032;
        Mon, 11 Jul 2022 02:17:10 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id v16-20020a056512049000b00489c665af61sm1427018lfq.274.2022.07.11.02.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 02:17:09 -0700 (PDT)
Message-ID: <5490fe33-2c0a-3af2-2b62-cce9f607003a@linaro.org>
Date:   Mon, 11 Jul 2022 11:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] media: dt-bindings: media: Add compatible for ov9281
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
 <20220711081639.150153-3-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711081639.150153-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/07/2022 10:16, Alexander Stein wrote:
> This is a slightly different hardware with identical software interface.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
