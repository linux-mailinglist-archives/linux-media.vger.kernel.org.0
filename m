Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAABE54E372
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 16:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377090AbiFPOba (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 10:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiFPOb2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 10:31:28 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAD13B3F8
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:31:27 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id c24-20020a9d4818000000b0060c2372addeso1112047otf.11
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J1Q67Iw7jkAAyddX1EAlkhQzYa/RpLBKldIrfTRAJgw=;
        b=TpYYn9McHcVRC1h5C7LbUHqQHLFXLv1NGHeczqETZODcUZ07VcmEVs1AN0CL5KvYyw
         CRen8iuZk1J+VnTt+mt3d7otP5trCd6J7dZDmEXc17M3xSOAiEWCF13Xii1TTG9mlNDu
         1+jDBKNp4VqMHoJubqZzoa82kIVzbUVdNTfvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J1Q67Iw7jkAAyddX1EAlkhQzYa/RpLBKldIrfTRAJgw=;
        b=B0A9g1B3TuOHLDE8NSoEdfTQe76bIaOxa6If/d+XdaQb1EL2FLy5elXMHCLSQsn5VO
         0f6jZd6FuEnc1s2HZqlaGRYxEzarAbmK20zoZvNh7sMkGVAg9KAJ8+RPxdn+9arno1SV
         d2zuwq0TJ8aVGUf8iFnpJGhJegwXy1uhFBT9BWIwg9ARZHLKqpWjO9dMVeJAMZboDb0B
         2ZljPdOJ+66GCVpgiHFUFv1sFh/YVkRmtyRDPN/4LBaHQb9yEKIY70TF2tPTRgUGyUJl
         dQ8ZCiQgv8WzMYm3U0OdM2VrKZ/KF9/HIsh6e/8uWMNSvY953yKxc3KtkZthm+iKaIB0
         dbZA==
X-Gm-Message-State: AJIora/xx4Tatjj/VzovZ9PY95tgyvB2rrlItY8vXSDTFrU2aFQAzM6I
        ZGBJUpRrNEl7MbMVTmrNmRy5nA==
X-Google-Smtp-Source: AGRyM1tP1qLGEzRCiAH8XfeWeIIBmAJOWcGc9wWlpgQNNRDYG8uL6zrcFg888NM3XYEPL1Ob/+xF3Q==
X-Received: by 2002:a05:6830:55:b0:60c:3192:695e with SMTP id d21-20020a056830005500b0060c3192695emr2147431otp.22.1655389886885;
        Thu, 16 Jun 2022 07:31:26 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id p84-20020aca5b57000000b0032ebb50538fsm879917oib.57.2022.06.16.07.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:31:26 -0700 (PDT)
Subject: Re: [PATCH 3/3] media: vimc: use data link entities enum to index the
 ent_config array
To:     Daniel Oakley <daniel.oakley@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
 <20220616100747.48124-4-daniel.oakley@ideasonboard.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f676bf50-5aef-f06f-82f8-9c7a93e18656@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 08:31:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220616100747.48124-4-daniel.oakley@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/16/22 4:07 AM, Daniel Oakley wrote:
> Future additions to the ent_config[] could break the association between
> the index of the struct vimc_ent_config entries in the ent_config[] array,
> and the index defined by the enum proposed in the previous patch. Using
> designated initializers solves this by linking the 2 together clearly in
> code and prevents the array not reflecting the enum. There is no
> functional change intended.
> 
> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-core.c | 22 ++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 

Thank you for the patch to improve code readability. Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
