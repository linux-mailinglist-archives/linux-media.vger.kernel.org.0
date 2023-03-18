Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7643C6BF936
	for <lists+linux-media@lfdr.de>; Sat, 18 Mar 2023 10:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCRJU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 05:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCRJUy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 05:20:54 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970A59033
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 02:20:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso4662870wmq.5
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679131252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu6SW76M44DHafkRSkNNVV2Y0xxvTOl/ACds05+1X8Y=;
        b=inOf34gptgalSVJ2zk7RE8vAZveUdYZVjYq5X7D4T477EtV4wodreJQPSk2e0JzZ9S
         2nWANOh2cn8YYdquhQ5IWG9oxk7HyM5oY7epWMywr/aOpfFDKP2M0xSeBXCO/bcFr9uG
         9osr5/Ia1G+bZRdqPFrQt+M9yl/rlLHAXzpvKYK/7CEOkeaQsdKmD0R9rgrbrSD93ARK
         U7rwqBcCa1ekC2TwkqGcwBC6D1lokZsU5CH1v+aEIrv63k8qJHvFrgFsaQCyIKjcnbwz
         yeQwaoUL85kNpGOwOCZzzIaTkGP/zzshqcJOcO6c5GlDfF06o08W4Q1Dkm1327NY8nPj
         ZVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679131252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu6SW76M44DHafkRSkNNVV2Y0xxvTOl/ACds05+1X8Y=;
        b=gEcqlgUs/DvncRJ/obCKGPkAWonooluIze4x2rr4O8VHbvBrvuilIxcsV/SXoTDQK4
         psdU/b2nyIHxQi6ZcKoHvkIZdeQAzLi5MS9tTzk9m+fsmhADfHv5SPRjq76lrWbDOEOI
         LUZ+1h1zh4G1jL53wQ8npZUgoiu5znPVcpJPzXFhzCq9QJifrBM6MJGZxTd7D776LEc1
         K+7pW7/GQzGPstnzRjkJPC6+rTgChHyuD8EvIjwVqNv40UIb++dK2UQEX1CcS1vjg1cr
         UStGsi1iBJoXGYX2NRlkrGxVJTM2Q/XT+gMrOoFfd6Wwg1KQm3lBqwd+MFP68fBXV+a/
         X70w==
X-Gm-Message-State: AO0yUKWBjrUked5Sz7vkBfcxFWw16++dH1fp542g4HQl1i87V7nq2uLA
        mFAy2zIegly1u1jVOD8GCtISxXnVJYk=
X-Google-Smtp-Source: AK7set+9Xuue4Ps2b+7kehgYw0bjnJtLkw0edZuPUhUD5WJzbHDwW/4Qm43zLz53Pz43pLKhRqo9/g==
X-Received: by 2002:a05:600c:3b87:b0:3df:eda1:439c with SMTP id n7-20020a05600c3b8700b003dfeda1439cmr4029819wms.11.1679131252036;
        Sat, 18 Mar 2023 02:20:52 -0700 (PDT)
Received: from archbox.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bcb94000000b003eaf666cbe0sm4247780wmi.27.2023.03.18.02.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 02:20:51 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [RFC 0/2] VP8 stateless V4L2 encoding uAPI + driver
Date:   Sat, 18 Mar 2023 10:20:50 +0100
Message-ID: <4586871.LvFx2qVVIh@archbox>
In-Reply-To: <20230309125651.23911-1-andrzej.p@collabora.com>
References: <20230309125651.23911-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thursday, 9 March 2023 13:56:49 CET Andrzej Pietrasiewicz wrote:
> Dear All,
> 
> This two-patch series adds uAPI for stateless VP8 encoding
> and an accompanying driver using it.
> 
> It has been tested on an rk3399 board and there exists
> a gstreamer user:
> 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3736
> 
> example pipeline:
> 
> gst-launch-1.0 videotestsrc num-buffers=500 !
> video/x-raw,width=640,height=480 \ ! v4l2slvp8enc ! queue ! matroskamux !
> filesink location=test_vp8.mkv
> 
> I kindly ask for comments.
> 
> Notably, the documentation for the added uAPI is missing,
> that is to be addressed when sending a patch series proper (not RFC).
> 
> For the RFC I also did not care to replace a BUG_ON() in the boolean
> encoder.
> 
> Rebased onto v6.2.
> 
> Regards,
> 
> Andrzej

Hello,

I can't offer much in terms on technical comments on the implementation,
but thank you for your work on this. A more general question: Is the
rate control done by the userspace component or the kernel or even the
hardware?

I tried this patchset (and the gstreamer merge request) out last night
and ran into quite noticable i-frame pulsing, and am wondering who the
culprit of that is. Looking at the vp8 encode params in the uAPI, it
looks like it'll be userspace in charge of rate control?

On a related side note, since I let this run all night with different
parameters I can happily report that it seems to be quite stable, no
problems encountered at all.

Kind regards,
Nicolas Frattaroli


