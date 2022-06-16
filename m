Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C169B54E356
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 16:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377001AbiFPO0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 10:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376809AbiFPO0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 10:26:38 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BC9326D1
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:26:37 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id k24so2073817oij.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7gyjoBTpzixAxRqZA3/emcQSVqqQ/9R5rTQU8mjTtYI=;
        b=ff8fhI5Cvpgr3Du5htNbpBBu9yvDlHFdqxs0qTRXOa5+Xdmxp9GkhDjdPHT3IuBUlR
         Qj8HELA9IKyW8xYAknOHppVXw+ftxyCR3Lzo6TSASHUsBD6dTWY1LE0SuKSdz8+kn9jz
         QzjvZCqnUI5oEY422993lFBU+cfmrAyVcJJU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7gyjoBTpzixAxRqZA3/emcQSVqqQ/9R5rTQU8mjTtYI=;
        b=teiUWARMO3HQgFe96vQePGk6UwaKMKreARVVU3HWACw+DAxYeGWsbMA9BScNkq0tt8
         7I3XCdExHj7B0pECQS+q6isYlI6D0rfIW+Br6ioCieXSAJsePJZ7KA4bHpbgr3WU3UGO
         td7b6c8hHbQnNX82NGW9m242Ed3Q3HWFSuJk9CUe971a64quU3iCrXyPD+xnvbDp0AoE
         4bYitfxngfDmC28Y0TARskyCde0zvoYIrHvhstKyFK01zbwpxT5idt5+DZFIVG6iNLky
         3E4GCZZTVaxlQfq2oX6WQNV6eV4YSNC2qq4Q9oktmaRBr9FIxTPMK8HXiIBX2A9Zx9U4
         YkvQ==
X-Gm-Message-State: AJIora/dopr7LQxPKFQG822jt1VD5S565gmyXfxEcfjOwPL31nTdTMmC
        ncVHSU96+0XzFu1KmpGTTsvTXQ==
X-Google-Smtp-Source: AGRyM1voRKHSHMVnZVNuRtyQ51gykrHDNX3EFpkqWhvhVTQYkuEl7u2amMgOPF/uIExIOE5nJead8A==
X-Received: by 2002:a05:6808:1687:b0:32c:3e3e:89b1 with SMTP id bb7-20020a056808168700b0032c3e3e89b1mr2829297oib.60.1655389596247;
        Thu, 16 Jun 2022 07:26:36 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id l20-20020a05683016d400b0060603221276sm855817otr.70.2022.06.16.07.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:26:35 -0700 (PDT)
Subject: Re: [PATCH v1 1/2 RESEND] media: vimc: add ancillary lens
To:     Yunke Cao <yunkec@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220610010111.3418214-1-yunkec@google.com>
 <20220610010111.3418214-2-yunkec@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a8a7a932-bed2-b24f-4b9c-310a689e64bd@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 08:26:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220610010111.3418214-2-yunkec@google.com>
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

On 6/9/22 7:01 PM, Yunke Cao wrote:
> Add a basic version of vimc lens.
> Link lens with sensors using ancillary links.
> 

Please add more information to the commit lg describing what this patch
adds. Describe why this feature is needed for one thing. Also describe
how it fits into the existing code so we can do a better review.

> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>   drivers/media/test-drivers/vimc/Makefile      |   2 +-
>   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>   drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
>   drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
>   4 files changed, 170 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
> 
> diff --git a/drivers/media/test-drivers/vimc/Makefile b/drivers/media/test-drivers/vimc/Makefile
> index a53b2b532e9f..9b9631562473 100644
> --- a/drivers/media/test-drivers/vimc/Makefile
> +++ b/drivers/media/test-drivers/vimc/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
> -		vimc-debayer.o vimc-scaler.o vimc-sensor.o
> +		vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-lens.o
>   
>   obj-$(CONFIG_VIDEO_VIMC) += vimc.o
>   
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> index ba1930772589..37f6b687ce10 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -171,6 +171,7 @@ extern struct vimc_ent_type vimc_sen_type;
>   extern struct vimc_ent_type vimc_deb_type;
>   extern struct vimc_ent_type vimc_sca_type;
>   extern struct vimc_ent_type vimc_cap_type;
> +extern struct vimc_ent_type vimc_len_type;
>   

Code looks good. With the above suggested changes to commit log

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
