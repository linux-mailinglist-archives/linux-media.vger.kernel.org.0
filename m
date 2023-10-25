Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5BA7D6690
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 11:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbjJYJS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 05:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbjJYJS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 05:18:27 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0D0132
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:18:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507be298d2aso7972201e87.1
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698225503; x=1698830303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BAHJikpep9ynpiLuY3eXxwOgPXKE7wTHSFE/9ZFm21A=;
        b=bRT28XsLgswaqZEF4ilV0xXxuzoFkSdowsODyRo4sNDxCUM4JRJzFZU/NBT0wLzk3s
         3IIcn5mnJ9KIf1AzV8/jWonC6sK059gxMWlAuC1G6XKbGNkHJof74IWhxOJX4HtEM36y
         dtlRNQFQ51ppRbqomBh32eDWmOhlODtdiqMAtwo3gKi3KOZu03afBdeuHs5b1MAXxegQ
         RuMlu6b5G8d2EJ4IbU0vBsXPlUv5QrwTCpQDmXuZArHzZk0c19ZZPte6pGONndVwxxfo
         0e4hk8cKGqh/xtXDaQdloq2BkQyqBvoR9j+VGU7haqiRwMMflu/R+05FihxlAFfpxPsj
         aETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698225503; x=1698830303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAHJikpep9ynpiLuY3eXxwOgPXKE7wTHSFE/9ZFm21A=;
        b=PQX/a3UkUSlc4bzYKyExYTtxxbL3vwKeg6V3998a19ef5xO3j/Mj7r9OyAx/kvG65F
         sUkDXKmmbJpzO8lsg/JZIO7fRjzfSmqmj0nEk+3WJG2ZITvVeWKJkhWH5Eqj/Vut7eWB
         go0aNQk4lv/cVjKZ8Ht1zp02k7jg/M57B+w6BmV71Ky3poLKcPmPQbYuxQj9ngH3xRau
         2OwPstgYT19Lem0oJo8QaBmedjbNRzIFzVzSaZ+sOG2jkckUDhRBdOenrLqNOiqalDLS
         Uj7shXFB5D0WZbk47r4nv+COAEwIoHNBP2j7noaBCNYBANsjVY6NEZDExW5vPyeCWW+W
         yw6g==
X-Gm-Message-State: AOJu0YyIEP9HuqHZTHfcaCvDX88eF0bS3o8ZTWnzzUGl5B6EhxgAAPIY
        PJpQZDlzjic1uJPpJPJyYS+5ig==
X-Google-Smtp-Source: AGHT+IGm96vi+l1CKUKEFUw2b075VE/cmmy09HWIJtcYPHTWh4c621SNC0JpC+WCWMSyx9UpnDQJaA==
X-Received: by 2002:a05:6512:3085:b0:4fb:8939:d95c with SMTP id z5-20020a056512308500b004fb8939d95cmr12502304lfd.30.1698225502780;
        Wed, 25 Oct 2023 02:18:22 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w4-20020a05651234c400b005057a5587f0sm2471866lfr.52.2023.10.25.02.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:18:22 -0700 (PDT)
Message-ID: <d0d30b6b-3664-4531-a71f-6faec3330d2c@linaro.org>
Date:   Wed, 25 Oct 2023 11:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Use common VFE
 pm_domain_on/pm_domain_off where applicable
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231024224255.754779-1-bryan.odonoghue@linaro.org>
 <20231024224255.754779-3-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231024224255.754779-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/25/23 00:42, Bryan O'Donoghue wrote:
> For the various versions of VFE we have a boiler-plate
> pm_domain_on/pm_domain_off callback pair of the general form.
> 
> - Error check.
>    Not always done but applicable to all.
> 
> - device_link_add (DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
>                     DL_FLAG_RPM_ACTIVE);
> 
> - Error check returning -EINVAL on error.
> 
> - Return 0
> 
> Reduce the pattern down to a common callback. VFE 4.1 is a special case
> which to me also indicates that it is worthwhile maintaining an indirection
> for the vfe_pm_domain_{on|off} for now.
Are there issues when powering it off like all the others?

> 
> Otherwise lets chuck out a bunch of needlessly replicated code.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
