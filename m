Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4431F69EB
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 16:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgFKO1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 10:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbgFKO1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 10:27:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFDEC08C5C3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 07:27:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r15so5254511wmh.5
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6oNSKO/bfHkroY5E6w01GRrWanZd3YtLMnWhvnjnTpA=;
        b=j2Zm8WTakmUV2T5y/+dMnLN/v4wOdjhGJvK5fkIK2O+ryCylfrjDzedqOoet78T75o
         Ldpf9ZChG1Qa8baFLKfR/dMZfYDYfM/dHdjOp3Yx66MPkJNvGhfScPuLyNt4jF9UKrN9
         lHtbYaVmspsKGB1HNStwdkVEgJW9qsM01+RiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6oNSKO/bfHkroY5E6w01GRrWanZd3YtLMnWhvnjnTpA=;
        b=MGPVA4Q88bJDaQhtFaEQqgPE9lUtUuHkLLNyHME6sMEzUGrNl+Jis7M+B+zjlEqDT6
         YWSajpqyRJ2IweYJ0SMMkCmDYkUhsyW2tc+Cqs6dwwhutg+0BJd4gMv3uXqc3EcDzSDl
         yLI2Fy9sXYW4+hlSdPX/gLOMAjdVss+J5AK3CTbqIAiGWPQgTBKPh5NXzr7CF56XPLGT
         sZfHEUK9ralhB1vzsr9NAgjpWuwq3uAdnpuNJvS2sqF1+77pjdcEdcs6F/VaE5QlvGho
         NA7p55u56yBRzYXr4YBCQY0u9L3ZrGp9Iw98X0JjGhmSJZUUOKSdUnsXNKV4KbK5kBBh
         7WIQ==
X-Gm-Message-State: AOAM531o3ycHuGnFoqRHanWiB9hdk3CMbZOs8IyA2rxOA4o0fYhtVMlK
        6aa0GNRgfpt7zImnSrx1MS0IMA==
X-Google-Smtp-Source: ABdhPJwcHlML3GVU5KUrSHCPpOa1Dg4OCgzoWnC1F47mU912hVUwl1saC95zTHAPsWEKo1Yl3nrQ2g==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr8960381wmi.59.1591885649589;
        Thu, 11 Jun 2020 07:27:29 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id g3sm5808646wrb.46.2020.06.11.07.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:27:29 -0700 (PDT)
Date:   Thu, 11 Jun 2020 14:27:27 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH RESEND v9 09/18] media: platform: Delete zeroing the
 reserved fields
Message-ID: <20200611142727.GC158633@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-11-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-11-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:44PM +0800, Xia Jiang wrote:
> Delete zeroing the reserved fields because that the core already
> does it.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
