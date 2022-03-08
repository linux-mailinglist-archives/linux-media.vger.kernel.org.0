Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B9F4D1D1E
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 17:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347997AbiCHQ1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 11:27:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240938AbiCHQ1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 11:27:10 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3AD50474
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 08:26:13 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id jr3so15034766qvb.11
        for <linux-media@vger.kernel.org>; Tue, 08 Mar 2022 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AdPvN+M5vrEsWsbRLhcP7voGnGTypdpC8v2QHOxSlyY=;
        b=PtwRFN5uV4IzBBMPrT9KcrtUu0cMY0hjpG2q6SdhGyBlA+HwFoI4XNLjFaJMcozTBX
         OO1kVHVNh7Suyx6Oucbn5hNVxLe/LCeEAPwovueROLHz29lrSQn5XkAo9FsUADFbHYzm
         vMKGkq0TBDKFueEB5XNHw3Bx4E7zJ6NYLqsjGvorehwEcy9CzhVe+twU2btKLN7sgC+Y
         h/qUO9Jpkpqw31Zj1KXmtre6dgP0bjK/HukxagjDcuxg41foL92t76aEYL4cxLzzK4Mq
         4/+EoBC9IVa69Nb/E9rffd/3f1VcU/olxQ1fNXyMWB0Lv7TV++IyP1QMxwvfliR3SGia
         +8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AdPvN+M5vrEsWsbRLhcP7voGnGTypdpC8v2QHOxSlyY=;
        b=OTrF4x42yRjfextCB+qv2Mc6vPagitI2/rlDTdG4Pa8jJpg4sVstISOFlJA+FzNNso
         NhxDhaZDPuuWyFq7l9V1F4MHrfgNmr/QEYLCkIaaDZbk26ULYWSrpq6+/dkYlPbF1E0Y
         CPNREXgm1cSy9n7yUW2NaMRIGfjx9JZmXhsv3R+EeGnGxcEqMETc+2yeTfctWn5nm6uZ
         hqC01KyAFiS1EmwsGJxBOectaelWQL1+zhTUFR50j8nCeb3k0aGrcIWiW1R2hsdF3xCF
         0jspRDsSE+BkTdcl6dZOqmJtxHJhieUL87WiP4J0KbDIP53GDZddgu6+8tXuDICpdykN
         xniA==
X-Gm-Message-State: AOAM533I3bXMrVcAXzsjNADBE9DQ3bH+5vXKvA10b9LCqJk4K+ONefbn
        nfq/mTL434QqlUbhb6420VxLjBCljHN20g==
X-Google-Smtp-Source: ABdhPJwQQz4o+8O/k5GaLCxxNi8zAyUw+fDQTYGFs1eER+/qbONVdb7XdGY03YB3DKR+BoODjKAIzQ==
X-Received: by 2002:ad4:4ee7:0:b0:432:5707:8120 with SMTP id dv7-20020ad44ee7000000b0043257078120mr12779645qvb.101.1646756772389;
        Tue, 08 Mar 2022 08:26:12 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id n8-20020a05620a152800b00648e52be61bsm7679224qkk.37.2022.03.08.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:26:11 -0800 (PST)
Message-ID: <59e9c85d1fbd6e4cd21acf3743a21bddad7774df.camel@ndufresne.ca>
Subject: Re: [PATCH] pixfmt-yuv-planar.rst: fix PIX_FMT labels
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue, 08 Mar 2022 11:26:10 -0500
In-Reply-To: <c0a9a647-5e27-52bd-65a0-b9663014887a@xs4all.nl>
References: <c0a9a647-5e27-52bd-65a0-b9663014887a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 08 mars 2022 à 09:25 +0100, Hans Verkuil a écrit :
> Two labels used _ instead of - so were never found and one new PIX_FMT was
> missing the label altogether. This led to these warnings:
> 
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-nv12m-8l128
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-nv12m-10be-8l128
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-mm21
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 72a74c8f0a0d ("media: add nv12m_8l128 and nv12m_10be_8l128 video format.")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index cc3e4b5791c5..8dff5906639b 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -257,8 +257,9 @@ of the luma plane.
>  .. _V4L2-PIX-FMT-NV12-4L4:
>  .. _V4L2-PIX-FMT-NV12-16L16:
>  .. _V4L2-PIX-FMT-NV12-32L32:
> -.. _V4L2_PIX_FMT_NV12M_8L128:
> -.. _V4L2_PIX_FMT_NV12M_10BE_8L128:
> +.. _V4L2-PIX-FMT-NV12M-8L128:
> +.. _V4L2-PIX-FMT-NV12M-10BE-8L128:
> +.. _V4L2-PIX-FMT-MM21:

I had never noticed that - was needed here, good to know.

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com> 

>  
>  Tiled NV12
>  ----------

