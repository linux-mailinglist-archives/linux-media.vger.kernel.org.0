Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A87303DE4
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 13:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392360AbhAZM6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 07:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392365AbhAZM6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 07:58:13 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62996C0698C6
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 04:56:39 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id dj23so19598077edb.13
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 04:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rH4rr1SnYvL9K62Ub8DyhAEQN4Ic5cSs1nbnJHOUTjQ=;
        b=xfJq63PGWuythSzr4ByBtDoadek3HXxFhL4aye8BPSw70Mho+eF8fwuu+F040Jffyu
         IDR2qZWvdiADHimvg3fstBdeTEoUM9GSyjU3XBnOeH6/lLb4l5M7oUaCamWTcVT/PZBk
         18PR2HT4lZ+4F+v0Tx3w6Im08ocWRUV0RZtroJ7LasTh0eeoU++y7GyDlMcYa2/4Bwm2
         AreBBvSD13QzVKjjtEVwC0BXKktGzSMQU8Vk76EFPcQ3/v3eovgQ6r4KicK4Z6OmwpCN
         2u//Wm+UYZF2GBQzoUGkzqUWOBMrv/G0M1y7JnXjGXwuZSslhQday02gl6KEYRgi9fpI
         /VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rH4rr1SnYvL9K62Ub8DyhAEQN4Ic5cSs1nbnJHOUTjQ=;
        b=I+jZS8lwEQANtr6uyQ8Nimoi7jbg7lj1EkQmg3D896drrc83c2DwaNZLczAwtkjBi3
         ZoaBwIc6HhZrBDHRD1y2bW76+WLcg4J9JI8BTaYi1D25raQ1DsBvPL6IwmhtzzC+1ZYI
         p4ItTcljspJRiw+Kywx08XZNKZaoti6ZQQx+zsn/bXXJmWtlGQC6MfSBmoSTHM2QDuiI
         InquPrGLJjpHDqwbHgLJl+ddeEgcQY3yLAhkoma5tTLVIn5cCIwKSK3oOXEQ+dUU0eRe
         BhHNuOQpCFxYr+jIfITvpNymZaSGif6TpQk1qEkxYwGQrm7B856pEA/eKT3BvLA3mC4L
         t0Zw==
X-Gm-Message-State: AOAM530Fi+05AhhLs52iLhrhCUIs4MpaeZzxXVfsg7n5LFsJkQeeU4KU
        VXFlsiWhJ2yAqijTxVN5WI1XeGJCtNX3YEgP
X-Google-Smtp-Source: ABdhPJwac9lzUnHGfRXJt3Z+kSVTr6sUpD8pwpLyf+fbeL+Byx1uvwyHgQ6Bqtpg+Ds+slrmATkBaA==
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr4462032edt.160.1611665798137;
        Tue, 26 Jan 2021 04:56:38 -0800 (PST)
Received: from [192.168.0.4] (hst-221-83.medicom.bg. [84.238.221.83])
        by smtp.googlemail.com with ESMTPSA id s21sm9756274ejz.87.2021.01.26.04.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 04:56:37 -0800 (PST)
Subject: Re: [PATCH v2 0/4] MFC private ctrls to std ctrls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <4882147f-7f3f-d1e1-03eb-0abddb4f1b4c@linaro.org>
Date:   Tue, 26 Jan 2021 14:56:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans, any comments ?

On 1/15/21 11:26 AM, Stanimir Varbanov wrote:
> Hello,
> 
> Changes in v2:
> 
>  * use _DEC_ instead of _DECODER_ in the name of the new controls (Hans)
>  * rebase on top of media master branch
> 
> v1 can be found at [1]
> 
> regards,
> Stan
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/cover/20201109173541.10016-1-stanimir.varbanov@linaro.org/
> 
> Stanimir Varbanov (4):
>   v4l2-ctrl: Make display delay and display enable std controls
>   venus: vdec: Add support for display delay and delay enable controls
>   s5p-mfc: Use display delay and display enable std controls
>   docs: Deprecate mfc display delay controls
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 25 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h      |  2 ++
>  drivers/media/platform/qcom/venus/vdec.c      | 10 +++++++-
>  .../media/platform/qcom/venus/vdec_ctrls.c    | 16 +++++++++++-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 16 ++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  4 +++
>  include/uapi/linux/v4l2-controls.h            |  3 +++
>  7 files changed, 74 insertions(+), 2 deletions(-)
> 

-- 
regards,
Stan
