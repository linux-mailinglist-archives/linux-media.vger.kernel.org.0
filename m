Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B646654E36F
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 16:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbiFPOau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 10:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiFPOat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 10:30:49 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F5A12D37
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:30:48 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id q11so2055301oih.10
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c2FqTb0flpf1IMLkG+Ha12hnc0fcg88zbPvAn699a3Q=;
        b=LBi5QrEPa6GR2gSbGbqO+aolSVX/I/VJwanqEBJFZBVLNFEikVf5M31oxlcYbZFfFB
         cWhdNBoRdPeb7pjxky/f2MH13LGxoP4cWQL7TeLnmO2FIWPwoutT5OGTn7oAZ1IEU9gz
         4amfWzc4rjM+3z3SE/ptAHzfAdzYwB2IzKYeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c2FqTb0flpf1IMLkG+Ha12hnc0fcg88zbPvAn699a3Q=;
        b=FzPIqB3wj1kemgOoUKDAMSg6Gixh/nKPF7NFF0lq2gv5cjB1fDigWAjUslvXjGqlxM
         L+szu/62zPS4mj0j93LPHZ6zKyxdg32aDQpnRD6dg+iA4EFaDQydR4t8JZVLzX2QC2cw
         PtnZfwJ13ZwKADC5VrJ87vInLsjFs0+8TodkGtVcfodTrQaHUGWIfIUb2iegTF2inj+I
         1yP0586/VttnO2EaDl58r7SVMVh6KEmxWaxJeqyixtuIJWxd2kILlJS3brtn2C8Mz6eP
         p6iO4bslnKtMSTO61KBeGSBgChu8twpz5/w/yPZX0oYZUAmPPTHo4vj0SsEfZfOYnDuj
         cXEw==
X-Gm-Message-State: AJIora+6EyrgO9vIKwOVv3kDiV6SQtSO/mzkQffOfHxpclpXToS29hbn
        ndQfExFg/psVf6QrgtGY5YEDP8iQrHticA==
X-Google-Smtp-Source: AGRyM1vDrPaoqrbTq2WoIOyshriyAb3wknAfyL9IOMXOxgQaR+JEuL0V+6nvEqpA8cZaAlrn5mpcCg==
X-Received: by 2002:aca:3c44:0:b0:32f:15df:5c2c with SMTP id j65-20020aca3c44000000b0032f15df5c2cmr2638104oia.285.1655389847826;
        Thu, 16 Jun 2022 07:30:47 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id t4-20020a9d7284000000b0060e2c49b4e9sm857737otj.74.2022.06.16.07.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:30:47 -0700 (PDT)
Subject: Re: [PATCH 2/3] media: vimc: enumerate data link entities for clarity
To:     Daniel Oakley <daniel.oakley@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
 <20220616100747.48124-3-daniel.oakley@ideasonboard.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8a72c313-4624-022c-2845-fb902890d81d@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 08:30:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220616100747.48124-3-daniel.oakley@ideasonboard.com>
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
> The data_links array was hard to read and understand. By implementing
> enumerated vimc data link entities, clarity has been improved when
> defining data_links. This therefore should help new programmers to
> understand the codebase better. There is no functional change intended.
> 
> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-core.c | 36 ++++++++++++++++-----
>   1 file changed, 28 insertions(+), 8 deletions(-)
> 

Thank you for the patch to improve code readability. Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
