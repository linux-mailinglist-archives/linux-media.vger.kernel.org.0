Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473E6670FAB
	for <lists+linux-media@lfdr.de>; Wed, 18 Jan 2023 02:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjARBM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 20:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjARBMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 20:12:41 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BF04DCE9
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 17:06:33 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id mg12so7267563ejc.5
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 17:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ShTmxSJXe9bG7EdfM5n7W4obQRT36vojvBzqe2LAzEY=;
        b=pZshoTDIWonMzbts+iSk6eqAXIty/XSzGtUDl9PJeQ8XVUyN/eHTt2p93ttz9KQgTu
         9wfLh03a2Yb3RFXF3Sru73t0ORxZsuNA+p8nNqcl89jHRmba9Nt5u7K6/H0O2u8Dy6Qq
         I5UHAGKvsW2h2rCWGoKhMd7Zbo7kvESJIZWJ8RX79n7YMMu1z7Nz1jxAKVxhutkTa5OL
         3lZJt4S31txk7HCAkWRoOz4c+86BN1b5X+30T1zblG8B/4T9LZDn6c8diFa/F/Fhl5r8
         b5BLOL4Pz7VtVUp68bH80NkeocjPtgKEm4YLe8ons9LlWTl/LkY870OpXlxUItBZHYpG
         qKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShTmxSJXe9bG7EdfM5n7W4obQRT36vojvBzqe2LAzEY=;
        b=tytSOPEFHDY3HbeIp4OkbJBqqudSWgnSAj0sX8uEFsSY3Lh2D4Z2FSyfTYyBxYDkZU
         /pKBLd4NLwdqmcGFrKOBGCfaRvdxDwXh5aZqkuGPKPEQaGA5oYjC4o9DNO+twgrUPYV5
         pKLaluLfMa/5aUoxMDkHmnEWDnT1Z1PuhRoXFJKJWIPP4TEe9tyNjpAUuxceheS7jRDY
         EAtd5tjcVT4/WjXRhZ7MHK2hIOb0hoMaQNPDxThG1CQZ9mtkN2wAfjq7muMfK82F+ak1
         EAcbl9ElZGl8crvCFToav6asx+A9TI11abyHHrE1YEMRhaLhBFOv+eDU+TrJfdRUt4Ju
         NrRw==
X-Gm-Message-State: AFqh2kpgMYBP9kL0WiQEEFqXj5jpCbbzv85qo5/z9qdNQkblM457n8pd
        x52mNbuPCM9eJ1PypStRImKaEA==
X-Google-Smtp-Source: AMrXdXtu4QsednS1nJEdQYpyn+WjmVTWu3VSvaUMOChD1AOs4/QnNcqLZuuyzhNt6LzroTs4JBrteQ==
X-Received: by 2002:a17:906:6844:b0:86e:f478:f598 with SMTP id a4-20020a170906684400b0086ef478f598mr4836197ejs.44.1674003990637;
        Tue, 17 Jan 2023 17:06:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906210a00b007c0f2d051f4sm13786939ejt.203.2023.01.17.17.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 17:06:30 -0800 (PST)
Message-ID: <e14e929b-884c-4250-bce8-0c21fe4f1c8f@linaro.org>
Date:   Wed, 18 Jan 2023 03:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/gem: Add check for kmalloc
Content-Language: en-GB
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/12/2022 11:11, Jiasheng Jiang wrote:
> Add the check for the return value of kmalloc in order to avoid
> NULL pointer dereference in copy_from_user.
> 
> Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

