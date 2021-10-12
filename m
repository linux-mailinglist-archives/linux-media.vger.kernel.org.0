Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D77642A851
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 17:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237079AbhJLPgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 11:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237192AbhJLPgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 11:36:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB6DC061745;
        Tue, 12 Oct 2021 08:34:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k7so68000065wrd.13;
        Tue, 12 Oct 2021 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BP/Jzg1o84avvBiAAVMKsyPyktS8JE3pNY0emzlJRR4=;
        b=ECwqR6XRApqzjnKzFwgGgnGPhONoNpqYRGNWWmqUAk/S2Kl0ketM+2GZniFXr+WEHW
         Q/gR1ZiIJL6XEiiU5Xf/vYUrnHHzMxIkKLY76jNIEUEeXfPg4gDk80U/47j2kLsKTFY6
         mSSKzus4KuRovaOlCiCoB/JtSXXiGYgZZMMVrVyZ40TZFRIDyUZfF1RaiP+Drj6EfFPR
         G4os43c51rOxBbv+wtClXXDwV/5obJ2M9vZxWRVRaXOv043mRuRLoaVJZH4gRdN77F29
         TNiDok6/LdinixEar9eHYa1jVsKu3G6tbhg/kGlNTlrguc/7Sa2tFA9weEN1H8uTF6Ak
         VGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BP/Jzg1o84avvBiAAVMKsyPyktS8JE3pNY0emzlJRR4=;
        b=PksXipY/HgUjL5CeP7M6XLXJKW1Yh8nuFvoCha8zSOu4zuYzQBi4Hvh3sDRN+JjeRr
         VLxGoUvpZraRXDGW5/PoZuqmfXZpUVdegID25FGvQXchPZFWpf560E46agiu/33gHMO5
         0jTL0Bzz6GO8yKrYnT2TRYVu/RAOuR5NnNR9W/IoE/FnUYKidNmcAiNcn62z7Dm8cBxW
         zn+aeJYD5KgMvqN3oxQNlh72YcNWvfp77hijMO2yKvv8lsetDZ6UbUJ49WPLDz0rQXyC
         VrJ+rPq9WP6rhUI9i9kLaiDwg6IdfSjEEBBsiqJherChA/FMJ3uncrz1zuLO9yO3YJyR
         s8Zg==
X-Gm-Message-State: AOAM531clalO032KVi4OssAsNjz8jf8CnAxZAyo8F84UDf47dx5xgf3G
        0Y427tQo5TaoHM+sDdIUc6Y1olS2r5NdJg==
X-Google-Smtp-Source: ABdhPJxTqeLCMlwwJrqItDvWvZrbEbSTwEDtZ98ME6yzw3kWZ8DXDs4wp5uQOOcfJ4LNcmavhLTNQA==
X-Received: by 2002:adf:a387:: with SMTP id l7mr32531103wrb.214.1634052862098;
        Tue, 12 Oct 2021 08:34:22 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id q12sm2735972wmj.6.2021.10.12.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:34:21 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk,
        ezequiel@vanguardiasur.com.ar,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 0/4]  media: HEVC: RPS clean up
Date:   Tue, 12 Oct 2021 17:34:19 +0200
Message-ID: <21222555.EfDdHjke4D@kista>
In-Reply-To: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin!

Dne torek, 12. oktober 2021 ob 16:35:48 CEST je Benjamin Gaignard napisal(a):
> This series aims to clean up Reference Picture Set usage and flags.
> 
> Long term flag was named with RPS prefix while it is not used for RPS
> but for mark long term references in DBP. Remane it and remove the two
> other useless RPS flags.
> 
> Clarify documentation about RPS lists content and make sure that Hantro
> driver use them correctly (i.e without look up in DBP).
> 
> These patches are the last in my backlog impacting HEVC uAPI.
> From my point of view, once they get merged, you could start talking
> about how move HEVC uAPI to stable.

With your changes, HEVC uAPI controls still won't be complete. Cedrus needs 
entry point control, which in turn needs dynamic array support. I'm a bit lazy 
implementing that control, but I guess I can take a look in a month or so. 
rkvdec also needs more fields for HEVC. With patches collected here:
https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/
patches/linux/default/linux-2001-v4l-wip-rkvdec-hevc.patch
fluster HEVC test score is reportedly 121/135 (8-bit tests only).

I would certainly wait with moving HEVC uAPI to stable.

Best regards,
Jernej

> 
> version 2:
> - change DPB field name from rps to flags
> 
> Please note that the only purpose of commits 3 and 4 is to allow to test
> G2 hardware block for IMX8MQ until a proper solution isuing power domain
> can be found. Do not merge them.
> 
> GStreamer HEVC plugin merge request can be found here:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1079
> 
> With those piece of code fluster score is 77/147.
> 
> Benjamin
> 
> Benjamin Gaignard (4):
>   media: hevc: Remove RPS named flags
>   media: hevc: Embedded indexes in RPS
>   media: hantro: Use syscon instead of 'ctrl' register
>   arm64: dts: imx8mq: Add node to G2 hardware
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 14 +++---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 43 +++++++++++++----
>  drivers/staging/media/hantro/hantro.h         |  5 +-
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++--------
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 48 ++++++++++++-------
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
>  include/media/hevc-ctrls.h                    |  6 +--
>  7 files changed, 84 insertions(+), 61 deletions(-)
> 
> -- 
> 2.30.2
> 
> 


