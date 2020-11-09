Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9AC82AC982
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 00:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730140AbgKIXo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 18:44:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgKIXo5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 18:44:57 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC81CC0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 15:44:55 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id oq3so14832839ejb.7
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 15:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NItVTPQJT2kAjNu1ETSkMiz4X0SK4Dvc9o6+cAnG4FU=;
        b=f2s5ISiX2NTkP8UTQgo9j5/W5MEy4drOUs8Fd0oKAnhsq/V5WizwKpnN4TZmjqIcdI
         3qMMuMlorh0hQM+hiq6WnLpx2sswTLf5TxeiDwiCLgHlEnBYcjU4wdnsDwmWiP27aEth
         qLr0kDT9YNqUiPqwBoNwFwhDDrTO6rvDfEccb9AQbCJZuFwF6V3qle1Fv+tQkcVbgMBK
         OaSfj/3xhixptSyiXdLPKgI75DIZqSJwrYbnsr+n/laSMPgHlUksxHs9dWs18FMoo7iB
         BcVkz2g5FFTSqAXzkCnXMdB5CfU5ZEku9zR58FESzq2n4cZGSnuV5ANwJp+49vpU/t3p
         hF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NItVTPQJT2kAjNu1ETSkMiz4X0SK4Dvc9o6+cAnG4FU=;
        b=C9bkCGdDfOcQV8aman7+XIzniucoWMU1lUl0Fs+z7VgSG00ShDyxQXUTiM4R7olKRG
         yNHZxNyQrKaO5AXWucZc0NnwlwnC5T0AcKUGRphUrYvEBfxwLN/g0IIvNSFXSS/KuxzC
         oLrb/jMSlFqObNqaUZGcbjbXjSLsAEd99QIbbQcPJUSjUJqxZHygVqdZlqF80yI/kt1P
         DsPdo0jX7IvrKPoRMFrbcTqyjwIa84+dzoBv9ksMA6ia39vS3CeAle1pPTfJFCzbSw+4
         DewnTuD3c89aILYipeiFt9tN6Bf1fbLu+soijlzzWv4l0HfJ3Jr7VJSpe24v0ZT0oEXD
         fpyw==
X-Gm-Message-State: AOAM53060JsyJ9QWF/9N6fO/3UQN+as0rHYaQFCRjzTphJrt6gPQjkQT
        tPtC+JjJdZchLNGe5u6AtJnJEA==
X-Google-Smtp-Source: ABdhPJyCQO54uVQ40RKc89lI+n8d8Bsjz2fCIwfOUcA/RQoxqdNLI/zQAkPbYYQQVMkJT+ruB/RqZw==
X-Received: by 2002:a17:906:8319:: with SMTP id j25mr18340054ejx.68.1604965494577;
        Mon, 09 Nov 2020 15:44:54 -0800 (PST)
Received: from [192.168.0.4] (hst-221-20.medicom.bg. [84.238.221.20])
        by smtp.googlemail.com with ESMTPSA id f7sm9461242ejz.23.2020.11.09.15.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 15:44:53 -0800 (PST)
Subject: Re: [PATCH 0/3] HDR10 static metadata
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
 <2f907743dbb77f4c2f871675070065dd372514be.camel@collabora.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e0f8548b-3502-3baf-61d0-51ff2d15a1d4@linaro.org>
Date:   Tue, 10 Nov 2020 01:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2f907743dbb77f4c2f871675070065dd372514be.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/9/20 9:53 PM, Nicolas Dufresne wrote:
> Le lundi 09 novembre 2020 à 19:31 +0200, Stanimir Varbanov a écrit :
>> Hello,
>>
>> This patchset adds two HDR10 HEVC v4l2 controls for Content Light Level
>> and Mastering display colour volume plus implenmentation in Venus encoder
>> driver.
>>
>> Comments are welcome!
> 
> It is not a formal review, but I did walked through the new API and
> everything looks fine to me. One question though, are you aware that
> the H.264/AVC equivalent is identical ? What is you plan for that ?

Thanks for the question, I haven't thought for avc, yet.

I guess we have few options:

1. introduce hdr10-ctrls.h, common control IDs
2. duplicate structures and control IDs in hevc/h264-ctrls.h
3. common structures and separate control IDs for avc and hevc
4. another option?

I'd prefer option 1. We could extend later option 1 with hdr10+.

> 
>>
>> regards,
>> Stan
>>
>> Stanimir Varbanov (3):
>>   v4l: Add HDR10 HEVC static metadata controls
>>   docs: media: Document CLL and Mastering display
>>   venus: venc: Add support for CLL and Mastering display controls
>>
>>  .../media/v4l/ext-ctrls-codec.rst             | 61 +++++++++++++++++++
>>  drivers/media/platform/qcom/venus/core.h      |  3 +
>>  drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++
>>  .../media/platform/qcom/venus/hfi_helper.h    | 20 ++++++
>>  drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++
>>  .../media/platform/qcom/venus/venc_ctrls.c    | 16 ++++-
>>  drivers/media/v4l2-core/v4l2-ctrls.c          | 61 +++++++++++++++++++
>>  include/media/hevc-ctrls.h                    | 41 +++++++++++++
>>  include/media/v4l2-ctrls.h                    |  2 +
>>  9 files changed, 240 insertions(+), 1 deletion(-)
>>
> 

-- 
regards,
Stan
