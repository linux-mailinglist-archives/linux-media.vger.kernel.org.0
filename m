Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4026C4E7383
	for <lists+linux-media@lfdr.de>; Fri, 25 Mar 2022 13:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356264AbiCYMdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Mar 2022 08:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354065AbiCYMdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Mar 2022 08:33:38 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DB5D0828
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 05:32:03 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id k7so6069337qvc.4
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=30XACj7MPd58k847MdVpAvMgBiu+f7RKwoRCwiRj2M0=;
        b=1/NHMBlMYr4S0tmnHJKQ1f0aW5m7ZbjeTgsJFToM+Np2p06XtO28uIwvqjpeaBwFrc
         CoxMmjLhXUK3mF/YrXlidIrQ4Cet/DoXiSYLOFSfBT9oOQSrvE8Y6thLB+4eEin7LyWH
         ChKLuVY1EpJhr8KBvKtkemqI5T9ogjhN34If0J5MqBGG9raCWGRFJzanax9S3ChXS9ln
         M31syk/lXoBjd8fAjNTNIuDsDHioKLAqRdR5wT0YnCvLrtJKRx1zlrtsvb537R59e+Ir
         UiOqGIHPEMXkYORMWFSj1QfT5pZ90P31+0yGw2IOATq9Nr6q4Rq//Aamjv2BNohm+qDm
         2gXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=30XACj7MPd58k847MdVpAvMgBiu+f7RKwoRCwiRj2M0=;
        b=GFyxrugUldwN1av/uZC+vFCn6UANJITzB1QJXJQvws7SQBfb39X+5FawJHCkqoXS32
         NexeM1C4/caRNM2etHhNgKYlu8EzcjiWBfbhsCxemWoHIs4LALH8pEHPBNJawiZDkkvW
         rCVPq2MoeabxAv3K4Fh3fXM/lQaW9IgvTI4DRwTZlSHwYHP1xJ8HUqvPgkPVkDTqKx/x
         1s2A4rfsr3bm4HyIYWsz1khye03G69EurBh0ezR1SM6FOflN1rnyUF4UmQp7Mo8mNQF5
         EvTUEpHWGJ/Yyt6fc+UM5k2h3nBrmzAzMCAL1nOE3mtr5NIBRQY0yZX3XIRz+rb09nTE
         kM/w==
X-Gm-Message-State: AOAM533yCvWfxgJR92psVCAoUTGK2UxbyxsV1qf4ofY1wMNd3m87ILJb
        SW9j8gswQY4ZmDMgbJ7bFU7CgA==
X-Google-Smtp-Source: ABdhPJwh60ijI4et7gSBCzSpldFuMn9qAvmRXI4SQhFPJAvcgwyP6HGP6nO3vGEVcXf2E1A3Vb3Wbw==
X-Received: by 2002:ad4:5de6:0:b0:441:6595:72cd with SMTP id jn6-20020ad45de6000000b00441659572cdmr8431975qvb.73.1648211522828;
        Fri, 25 Mar 2022 05:32:02 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id c10-20020ac87dca000000b002e1db1b7b10sm4949196qte.25.2022.03.25.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 05:32:02 -0700 (PDT)
Message-ID: <f80128c50d3dacff0af70bd88521abae42476f85.camel@ndufresne.ca>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Boris Brezillon <bbrezillon@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Laura Nao <laura.nao@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
Date:   Fri, 25 Mar 2022 08:32:01 -0400
In-Reply-To: <fe24d151-6097-aa8e-7691-5e4d81fa42c6@collabora.com>
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
         <a7c858461b99de2d4afad22d888acc3a74850240.camel@ndufresne.ca>
         <9ec970d6-ea09-802c-419b-b2ef26800990@collabora.com>
         <5be83f0b343c04d877a2c2d805fb5f71ca9973b1.camel@ndufresne.ca>
         <fe24d151-6097-aa8e-7691-5e4d81fa42c6@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
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

Le jeudi 24 mars 2022 à 21:20 +0300, Dmitry Osipenko a écrit :
> The root of the problem is that DRM UAPI is more flexible and allows to
> customize offsets for both S/MPLANEs, while V4L doesn't allow to do it
> at all. I'm exploring all the potential options, so far neither of the
> proposed variants is ideal.

In GStreamer kmssink, the way DRM is used, is that if you have 2 planes in your
pixel format, but only received 1 DMABuf, we will pass this DMABuf twice (well
GEM handles, but twice), with appropriate offset.

With this in mind, the idea for V4L2 could be to always resort to MPLANE for
this purpose. The tricky part for userland is that it needs to know the dual
pixel format and map that accordingly. That is a bit difficult and this is
something Helen was trying to address with the v4l2_buffer_ext (that and
allowing space to store DRM Modifiers in the future).

The second challenge is the overhead. In DRM, as we "prime" the DMABuf into
handles, this gives a kernel object to store any relevant information about the
buffer. So having it duplicate can be done at no cost. In V4L2, the driver would
need to handle that more often. Specially that despite the recommendation
(except for primary buffer decoder, were this is mandatory), we don't force a
strict DMABuf / Buffer IDX  mapping.

Nicolas
