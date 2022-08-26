Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCD65A244E
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 11:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343805AbiHZJ22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 05:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245712AbiHZJ2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 05:28:14 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB94D87CC
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 02:28:08 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b44so1361029edf.9
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+vtYiNY9Ss2yRQTk64ADf2RL0NuIhj2V6XzRrRPxM14=;
        b=Mj0a3FEme42dJOUmG1W3NjEM8XYpk6Bzg70GV7QkP3OT/naiJ2TQBjTR/ZdFKRCKGh
         uqHqUSAJvBX4q75IZoYM7Vblz072E/G/ix4gVqnpEftKp+xFpuw14kvZA1dCXrmQJgXk
         Uu96c1JKAGhpwgeK6/Am+Y8wGJGaiRc4oIki0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+vtYiNY9Ss2yRQTk64ADf2RL0NuIhj2V6XzRrRPxM14=;
        b=oWBEs42lb6cClTX3zTfrgywH8hO0CMHzcDjjtky31QZwhZJ7zdUSZeLBu0lgqB0zyz
         xqcBrGU+yoWWaicFQT1Z2XwwUlQKCEbPBkWSVmH/fEVmfe/jpdAo5N2rR1n5Xv06BsdY
         A6c5+wYO/8NEmeqT4W2BGE5Vl4lPtwvzXfROqdHzX51MMm8PLD/EtZ+u96uCKO+NCsXa
         uEnYBWsY36qikTcWLCzA0CMlLzM4CG+RW5+WSn8z8nPqUgQDzev87gEmgUDAW6mSWNfz
         y3Frv15SAIU6J+o7lMHqpJK9491xBr3e1ptfpC5NXDDCFtAzTlRe3AwRQW164diDxU9I
         P6Ig==
X-Gm-Message-State: ACgBeo3qjKagguENSnkA0LXo1VH1wJ9GCMMNcIP8rLN6DxlbfJoKqzB1
        FtIdjb7JX89WhuXYZJhELNgVPPqp1xke66NxVTvVMg==
X-Google-Smtp-Source: AA6agR7ENjgZPHoyi85eBaw33/icN8L8VhM07glbE9b1f1i7Bh1D+kCoyBLe4MDTT8Y7TcC4diYYrU5J7y1AOIDwBNg=
X-Received: by 2002:a05:6402:27d3:b0:43e:5490:27ca with SMTP id
 c19-20020a05640227d300b0043e549027camr6322666ede.307.1661506086694; Fri, 26
 Aug 2022 02:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220825225312.564619-1-daniel.almeida@collabora.com> <CAGXv+5F78Y9ioYSMdPP1uGAchr=si0Dqwhd1o1eC2uqi8hynTg@mail.gmail.com>
In-Reply-To: <CAGXv+5F78Y9ioYSMdPP1uGAchr=si0Dqwhd1o1eC2uqi8hynTg@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 26 Aug 2022 17:27:55 +0800
Message-ID: <CAGXv+5FT2+T1wE_u0c=otNSjUg_q83Jv9uk_hG3U21CU+_0yFA@mail.gmail.com>
Subject: Re: [RFC PATCH v3] media: Add AV1 uAPI
To:     daniel.almeida@collabora.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 26, 2022 at 5:09 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> n Fri, Aug 26, 2022 at 6:53 AM <daniel.almeida@collabora.com> wrote:
> >
> > From: Daniel Almeida <daniel.almeida@collabora.com>
> >
> > This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
> >
> > This design is based on currently available AV1 API implementations and
> > aims to support the development of AV1 stateless video codecs
> > on Linux.
> >
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---

[...]

> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 00828a4f9404..d39d4eec2a97 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h

Checkpatch also complained:

WARNING: please, no space before tabs
#780: FILE: include/uapi/linux/v4l2-controls.h:2323:
+#define V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED ^I^I 0x00010000$

ChenYu
