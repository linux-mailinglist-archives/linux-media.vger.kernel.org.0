Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB8679C9BB
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 10:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbjILIWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Sep 2023 04:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbjILIWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Sep 2023 04:22:06 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D8F10CB
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 01:22:02 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so6803478a12.2
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506921; x=1695111721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=134sTkyIYJwq60odkndkVX6XDM2LNYnyGhf+IscYT2k=;
        b=xmx4BB15ZzCthDe7UZX4jn8qu8cXgrtwIqKBKFYOKo3qzxeAv/6etrXvo+Fwc/MoHL
         sJfebo7UGdPR7GPAxboVT8fFR3nnZLgmHVW2epJJcBq5wknMOKBT7XcCbAsKOhsKUEtJ
         +5CxIsIbPeFAiPP20HmZ0Oraga/05zvpQbo/QlGGKDVy4z5PL7PZQg2a+McNABaNfL44
         MUqG9PBF/I7bz0Juk5kX9cylpeq16/LDGjoHIN1APagpcuHTN7bIjqNYo5C53oSiPjzj
         2iKFL0ZkllgCtfrOoIZYV2JSq9c2Lc4s9D9lx142DA48kXa79BAGflaroWKZd0YritWk
         6uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506921; x=1695111721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=134sTkyIYJwq60odkndkVX6XDM2LNYnyGhf+IscYT2k=;
        b=VOaz2YzLNIhfBXI5IeKgW0YVfXJijZ3s0a0EzI30RXHy2SjrXHjQAzvq0F2H6WxSTc
         RzPz+IgwICJ8Oh5aZU8QHeG5dLcy4k9XWABcygRTt7mbWAGuwIyVCoEbomkvRpBH9Vco
         3sekRSm2lRhzYKNo0vr3RFLjmhwG1+xpPxZfN0Wgd3v++TQGLhRNh97VyYTN/smyB3eT
         Y8LtsSjCJUl7MKwLoYsYrplSEZtT7KyGdEHIjxw63zkbxvE5mxF1jXtSEhERy9uyOCf7
         kGN81X8qNTFvoDbLYSKvj/tiYTeXrsEc/7I7ia1+7iRlkA3B8mlSAFyzcKLJIVJKzY4D
         ea7A==
X-Gm-Message-State: AOJu0YxSsZ6eTmR55tBywOenh31LJlkAdNnywNMQj3cL5f/WOISUj9Oi
        5j0ap3jTe2cL5ItKwleezIXqrA==
X-Google-Smtp-Source: AGHT+IGYjGp3CXvM/xYQNS9e1ApRDKROqociEYndRpvvCGZhoBavvvSx1h696r7SBp0u74hDwV9oCQ==
X-Received: by 2002:aa7:d8d0:0:b0:52d:212d:78e8 with SMTP id k16-20020aa7d8d0000000b0052d212d78e8mr9546980eds.34.1694506920920;
        Tue, 12 Sep 2023 01:22:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5611858edt.71.2023.09.12.01.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:22:00 -0700 (PDT)
Message-ID: <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
Date:   Tue, 12 Sep 2023 10:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-12-moudy.ho@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075805.11432-12-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/09/2023 09:58, Moudy Ho wrote:
> Add MT8195 MDP3 basic configuration in file "mdp_cfg_data.c"
> and corresponding driver data.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

...

>  	{}
>  };
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 06b7d2b0b814..8b69bd8b91c6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -21,6 +21,9 @@ static const struct of_device_id mdp_of_ids[] = {
>  	{ .compatible = "mediatek,mt8183-mdp3-rdma",
>  	  .data = &mt8183_mdp_driver_data,
>  	},
> +	{ .compatible = "mediatek,mt8195-mdp3-rdma",

You keep adding undocumented compatibles. Your way of organizing patches
does not have any sense. DTS should not be mixed with media subsystem -
they *CANNOT* go via one subsystem. In the same time bindings are always
going via subsystem, so why are they missing here?

This does not make any sense and such mess at v5 is confusing.

Best regards,
Krzysztof

