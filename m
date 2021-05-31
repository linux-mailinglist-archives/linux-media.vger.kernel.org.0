Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5B439598E
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhEaLTu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhEaLTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:19:49 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC7CC061574
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:18:08 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id g8so7716830ejx.1
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=77N0TwRUxI7ToWDCDOZD3ONLOxIP5ZchUURudLrl0w0=;
        b=RgQZVMzYa95lKgylWOWH2WemD/iXSkXhJysUUJ4EU++xttwgX+ztLlEaq9tIsJtt0T
         mND90Z/5WlNlntQ4NmoOXuB1cnLfeOL2FwGp3WGjZyZtOzK7vsHMZtRWFCV8UAqv66+t
         tkwlbs3wJ4rPKLWO02WgYkE+/ln9Xv9DA1UpWz/Sd9NEqL8cDjjIAlxBxeqMgwqRH3U5
         AJPnTtd0z6ZPAcTYJqCOoCR2E3yhGyxZdONf9Ya3nhLLeLVjHulijbkgJbolCk30U0pB
         mOpQyP1j7DHX5Q6cuuh/TkX+rMr5XIEMMZ4+ah09yJUMYht0ytso8Xo/UfugSuPTuWeA
         Lx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=77N0TwRUxI7ToWDCDOZD3ONLOxIP5ZchUURudLrl0w0=;
        b=XvGeKoYWBprF6fsr7Jitr0gn1AxrIvyizI8zNifhj4xs6eaJIYi077N4JHvq4VGg3i
         t3e6r9qOSRwCyYvhtq2TaXTRkVOn+FBrY5fG1woiLwooG/sFlfLpQ3v0F48tokK5oAB3
         /08voco7Ff45xha2Y2vEvPGx/vdJYdMTYJ09T0RSY/NCJByq/ufcoLOi4uhAKbE55PEB
         /FxPc0VGLCNNUP46P+Xs4i6PjKktTAo1YfGGK1qolTOM9Eb+Jeyk97QH+K5vrLHCpRwt
         +KFM/ArKhgzVSHZALQp2fjXMHE1MtC/Tox5gVfLHI3N0FwETf98p9mUlydl4UYYo5dQj
         I2pw==
X-Gm-Message-State: AOAM533CYewhxpThn7LllYee2bElIVbMDua6PEhkGYdUx7ZjRKoqoLV0
        TLxz4uzFtdFOK0dIiVXZ0uHqcg==
X-Google-Smtp-Source: ABdhPJyXBriaJvAS+hQ6OlK526Gslrgwlgszmd4ikiQN+zDPSbViZbWXSmu9OaixPcyKMBvOPeCQFQ==
X-Received: by 2002:a17:906:f9d1:: with SMTP id lj17mr1719852ejb.345.1622459886715;
        Mon, 31 May 2021 04:18:06 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-34.medicom.bg. [84.238.221.34])
        by smtp.googlemail.com with ESMTPSA id n13sm5812647ejk.97.2021.05.31.04.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 04:18:06 -0700 (PDT)
Subject: Re: [PATCH 2/7] media: venus: core: Add sc7280 DT compatible and
 resource data
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
 <1621417008-6117-3-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ebca15e9-6416-6e92-6b08-b60e19c3e26b@linaro.org>
Date:   Mon, 31 May 2021 14:18:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621417008-6117-3-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/19/21 12:36 PM, Dikshita Agarwal wrote:
> Adds a sm7280 compatible binding to the venus core.
> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 52 ++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
