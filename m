Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09BE52333A0
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 15:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729480AbgG3N5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 09:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbgG3N5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 09:57:36 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADA7C06174A
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 06:57:36 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id l6so25610155qkc.6
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=swB4gM5/Sd34+RuLXe4ebGLoqKKPMlJrxzDtJ86OY8o=;
        b=ElJmz2ZYVZwbLk/3G64W4s/3aJGLxePkXOtMUKp0atmEd4+v8cnbJbC3GS1fxeMKXb
         RO0SxPF8d2cy2PqimJ+cI0MM4Umk4mHoHUyzINy/3fhrqK5ikEv/4MxDWTEBeowS6ROl
         b6CfyD/bZkLZnpUIkqED3RJwQC5vkGSJin0RctcQFE57iW8XDlgQlVbNt1mJ9AABAlI2
         AT0Ac4QBita8mYG51kmHbZXIe3UUOvZKvPQk4gBTcy+Jc2jmvrw06dXQPX3aMeIv8ZiH
         b4yxobYO9/y9T1BUjqEz9HoEB9tPYD/+2CNStQpALXdf3lWzNV8X+ON5KqFx3czETx+M
         5LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=swB4gM5/Sd34+RuLXe4ebGLoqKKPMlJrxzDtJ86OY8o=;
        b=MTdg0qYsDCxR/ZZ5d8skXpgxE5f59rnfD/NLXeHPGCxVFrnwGoOYlBG1AmpJsBKyop
         rdUVP87018smHGD2z4W3o19aa7NwyvVrwvaiPJWOO7nSMEM/+QbwTzO6Xj/aO3OROO0v
         p5ZzXO3/wwFIoE3TkfmLguXNmlqKl/T3mRVnWfu90GdZaoNh6R7mZo8BIDH1k+Ik3SH1
         is6TnMcLrx7XZVz4b7ZdYndixpzdk5T8xHP7YyFyLaZksWdj2iOAVQJOOw2g/kPtNoMu
         ofYI13Ikmf6ZIB6p1aegzBGOFCr0dJOhMyycvA8dl56hAgXl49ac4rh5ulDyBM8B+WRl
         rW6A==
X-Gm-Message-State: AOAM533s9zrfPWAoSFAsTeHPM8ua6DuFl3zr14+TLmN+3H5BP91rSpKn
        bpOgsKqYRElvb/DnVGFcPjMv4g==
X-Google-Smtp-Source: ABdhPJzPkHLNJBZVdH8dOzQCTNrpkJEAuR+3sHOQnsQ2ETHZ0yd/YXNBy4jXja0jaOUk3UBJBgCKDQ==
X-Received: by 2002:a37:6644:: with SMTP id a65mr37224452qkc.4.1596117455468;
        Thu, 30 Jul 2020 06:57:35 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id x29sm4824919qtx.74.2020.07.30.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 06:57:34 -0700 (PDT)
Message-ID: <8d287abcc4e2e86b5eaeca5a97b57004be8f6669.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/6] Add new controls for CQ and Frame-skip
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>
Date:   Thu, 30 Jul 2020 09:57:33 -0400
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 21 juillet 2020 à 10:45 +0300, Stanimir Varbanov a écrit :
> Hello,
> 
> Here is v2 with following changes:
> 
>  * 3/6 Added references for VBV size and h264 CPB size - requested by Nicolas

Thanks for this enhancement. No more comments on the doc from me.

>  * 4/6 Fixed compile warning
> 
> Previous version can be found at [1].
> 
> regards,
> Stan
> 
> [1] https://lkml.org/lkml/2020/7/20/619
> 
> Maheshwar Ajja (1):
>   media: v4l2-ctrls: Add encoder constant quality control
> 
> Stanimir Varbanov (5):
>   venus: venc: Add support for constant quality control
>   media: v4l2-ctrl: Add frame-skip std encoder control
>   venus: venc: Add support for frame-skip mode v4l2 control
>   media: s5p-mfc: Use standard frame skip mode control
>   media: docs: Deprecate mfc frame skip control
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 53 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h      |  2 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c  | 37 ++++++++++++-
>  .../media/platform/qcom/venus/hfi_helper.h    | 10 +++-
>  drivers/media/platform/qcom/venus/venc.c      | 20 +++++--
>  .../media/platform/qcom/venus/venc_ctrls.c    | 18 ++++++-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  6 +++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 12 +++++
>  include/uapi/linux/v4l2-controls.h            |  8 +++
>  9 files changed, 160 insertions(+), 6 deletions(-)
> 

