Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3AB3477B6
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 12:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhCXLum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 07:50:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40304 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbhCXLu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 07:50:26 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lP21p-0002yB-QT
        for linux-media@vger.kernel.org; Wed, 24 Mar 2021 11:50:25 +0000
Received: by mail-wr1-f70.google.com with SMTP id n16so980638wro.1
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 04:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j6ICBaIRtR92sFlFDpgBO1W3R8p5hB8q11IeI20mTpY=;
        b=SjVoi4yHX4GNkVsQ9yH02VtYfAtrivX51cKBKMxJ1FZ2jy9CD31MTJM0zRLHBdv1bP
         KAcKB6Ol8IRC2Nzq+6Ikd+a0c7E52MVtuiqDVchysw4nhydFt7RsxuzmNqG0QK9tYvwF
         Mejqg4vAXJ9T1dZzkClf6e6mvqGcw2XGWAjZBRwyPuzQm6DTKknA/7IZ9atBG+SCeL2v
         UY2PqBpX6YUbuzu+Du0uGyF0kUANuqQm+lSl2+cdpPlxSgSHUV/DbVfJRS5gV2zR8+NY
         D6TitbByOUCQgSUl4EqlgQduJgBCemlzsJ6PUriNc9WAKW5wOFnNu3t8b0rvrND169eJ
         bLrw==
X-Gm-Message-State: AOAM530Z+OzCFvfadQjQhP+lVFwAgJeMqEWEED6ytOq4Gsy0FPLS/0KW
        pG1Tp5KrekmSIfux7LYBXpdKiihnLdHG4ddKfQ1R9In1EnTY7fJXKmQmqDm/V3PgsFPhT3H2/jE
        pXoHcw/XPWu7yhREHCQIGCkhM9czg4HiTkIo7lOPB
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr2978368wra.179.1616586625580;
        Wed, 24 Mar 2021 04:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzNPQXkZv9eOgW+TpNoc/A6JZ7hwoorJU1/GfIJqCXYYTBu4y1CfAC551/hZslZun1WKNqgg==
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr2978355wra.179.1616586625413;
        Wed, 24 Mar 2021 04:50:25 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c8sm3096442wrd.55.2021.03.24.04.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 04:50:25 -0700 (PDT)
Subject: Re: [PATCH] s5p-jpeg/jpeg-core.h: fix kernel-doc warnings
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <5973dfa5-9c4d-8ab5-dcb7-6ccdf4863403@xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a0631a1b-023e-1606-8ef4-3ff22f91e499@canonical.com>
Date:   Wed, 24 Mar 2021 12:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5973dfa5-9c4d-8ab5-dcb7-6ccdf4863403@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 09:39, Hans Verkuil wrote:
> Fixes these warnings:
> 
> drivers/media/platform/s5p-jpeg/jpeg-core.h:136: warning: Function parameter or member 'irq_ret' not described in 's5p_jpeg'
> drivers/media/platform/s5p-jpeg/jpeg-core.h:136: warning: Function parameter or member 'irq_status' not described in 's5p_jpeg'
> drivers/media/platform/s5p-jpeg/jpeg-core.h:168: warning: Function parameter or member 'memplanes' not described in 's5p_jpeg_fmt'
> drivers/media/platform/s5p-jpeg/jpeg-core.h:168: warning: Function parameter or member 'subsampling' not described in 's5p_jpeg_fmt'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
