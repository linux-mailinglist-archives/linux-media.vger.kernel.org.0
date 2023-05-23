Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1875670DC09
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 14:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236586AbjEWMKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 08:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232993AbjEWMKt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 08:10:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEDC120
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 05:10:47 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3093eb8cd1fso4598776f8f.1
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684843846; x=1687435846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGk02VW36o8oi9xKpds5rY0RuBS6XODiauPH5sa2EDk=;
        b=1+hx8JRMv8bN6bR9C5NNLW6j3oMCk8dl5nP2zPiCTdzFTyYS6CMOWzYCAiyr2LbJKq
         stWoCqsYd1ZFVflnqCQlsMXyKLScSJgyNJfWrF8oy3pkxaPTIpyLGGrB5Pble1GU5YbF
         2eS4IGtUlX3yflBdysz+r7R63PGwkXLgQ84zSRvb07Kh8UBAqV4thC5UN2FaoD9Vu6M9
         FszYXip6ViB509VU11lVE1QKqOfqcMft+qzm4ZM6dAhDfnZK8vfdlk8PGmKDSJC58IG6
         w30vkFHRYKAmLbtlms+ciDK/pCVgcWb9Vd0i0bB+IqDOLVFdnLSjFVYeWXQE6wWQyzOW
         a1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684843846; x=1687435846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGk02VW36o8oi9xKpds5rY0RuBS6XODiauPH5sa2EDk=;
        b=iiV7PuGfEWqilS2eGKXGEmJUwloyUeKC3J4tXznqu5ppbcXtTKpWLatqkUO9L8eKFu
         Wxxg87AGsFud4Kbso7syBXg18qqjfPlJ5wAen9N16pmntLE50COT62BiaEteV5XHu7qn
         muDzqLv500qsaOP+WUvfUW2tth7WhbmP9b9Yomui8CWQm1fdLgiq+eawHMFSxvX2c3CE
         NsYeH7y/VnD+rk4WgOsMpxZp6NhzCj4Y5BjPasH9/KQ7nGKw7qRLDENLNZmpyqCsDZsl
         LzTmgMHR32L22zFVUZojH+nXJ8JofjJERub2aZzmO2OYyBj2TL62cecYxqKqpfvynWeX
         r8pQ==
X-Gm-Message-State: AC+VfDytAxdXCwdRRNMUFHYDD4cghUjxrJ6+tPFgbT2NEiviQBiESMMa
        tFflJ2hCu7W/cIFMj4xdkXdVD9/CI+j3j3Q7M0I=
X-Google-Smtp-Source: ACHHUZ42YAfaQnb/Yc6os9IZAlXJp0vBw8ve0qBJR7shOA52HC7aoC6d1NzgFID1WFdnGb+5LV4Qkw==
X-Received: by 2002:a5d:6b4c:0:b0:2f5:83a8:a9a9 with SMTP id x12-20020a5d6b4c000000b002f583a8a9a9mr10876277wrw.16.1684843846192;
        Tue, 23 May 2023 05:10:46 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k6-20020adfe8c6000000b003095a329e90sm10788563wrn.97.2023.05.23.05.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 05:10:45 -0700 (PDT)
Message-ID: <2a22b9e1-a828-8a88-e125-f8e603bf1796@baylibre.com>
Date:   Tue, 23 May 2023 14:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] media: mediatek: vcodec: mtk_vcodec_dec_hw: Use
 devm_pm_runtime_enable()
Content-Language: en-US
To:     Fei Shao <fshao@chromium.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-media@vger.kernel.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
References: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/05/2023 08:16, Fei Shao wrote:
> Convert pm_runtime_enable() to the managed version, and clean up error
> handling and unnecessary .remove() callback accordingly.
> 
> Signed-off-by: Fei Shao<fshao@chromium.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

