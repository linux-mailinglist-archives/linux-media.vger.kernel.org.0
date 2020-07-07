Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2A2216DC6
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 15:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgGGNd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 09:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGNd4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 09:33:56 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AACC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 06:33:56 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id f2so17170183wrp.7
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qfPkaBsCUPqKB5cxuI7H1w/uM8W3M8e+DQjS3BSVh6s=;
        b=CljyF4bRBHLB3T419rP9vq46t13zDwUabTMh8u6200UTrMjCc+m0TzUll153B5t3GO
         qz770aLyCbH+y00MjOECHRR3G0VtfV3qwbux5NYYDvnS471JBf6D7F1zkD5wPql64hi4
         wJskl09teop82HNnTB2poKH4Y8h9Wq64cplCx+EbeE0n8RXOZBLpXZSq9nmiaFoL5JvP
         b/bUVVJdFbNdiodVNcQl/jtur3BmcCLs0XgbVQ7Z93nz9YtjIU5G88J5sKUYyiL8/VmI
         HtL9u55S4/CqPb8HDf5I6CHAW517SQEm/0FzIkav3j8RGgXhI04sIp5A3Xjmu7LyLG/V
         WV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qfPkaBsCUPqKB5cxuI7H1w/uM8W3M8e+DQjS3BSVh6s=;
        b=D7vKCEimAHzIp4CbOLvmJ42GbTXMOMEbspqDLHkyYT91jfubvRrO/PtCz1/NFh/LuK
         XXesxrctOh+N7OxMIV711uEMOn2ojJxP9OCwiBYwoGlEVu4W/qgg86x/fMgE0XZ+cGo0
         1W6YrczEJwOJ6UCT2Zekgzk5YkgajNLC8+Lt21QgSx3SdwI6br9D/ItWRSmS2n9Gl2xS
         RjP3xnAxay7dGX28qbF2lnt/KgExYLPxTvJVpR61c1dQQ2BYruVjQNPuYGQ2zJipyzLw
         RLCFxCfJv57YuYWGYLhLPrV9qytD9Kxelqe5OIa0IPWsReXWN89onJqN+na1cx2AQnyJ
         K9Lg==
X-Gm-Message-State: AOAM531bFYlgIuPEtpND6+dEGSbSbcycJOWxXEfsA2RIWvDZzwJF485n
        ewIL/6v4zLVTx9ILpJhWdQnjXtxQQMhEvUsXfM1/yA==
X-Google-Smtp-Source: ABdhPJx90n7MI4AogG4l2K/7Yx9uiVwDqdIosCIkDYKB/bPppCuiaMKV/su7OqSAEWhny/IFSNJ+5wNzfdXtIHnpgh0=
X-Received: by 2002:adf:81c7:: with SMTP id 65mr51375014wra.47.1594128834652;
 Tue, 07 Jul 2020 06:33:54 -0700 (PDT)
MIME-Version: 1.0
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 7 Jul 2020 14:33:37 +0100
Message-ID: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
Subject: v4l2-compliance tests for cache flags
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Sergey, & the list.

I'm running the latest v4l2-compliance (85ec2917 "v4l2-compliance: fix
stateful encoder tests") against the Raspberry Pi vendor 5.4 kernel
tree. That means the kernel isn't supporting
V4L2_BUF_FLAG_NO_CACHE_[INVALIDATE|CLEAN] flags on the buffers, nor is
anything advertising V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS. I'm
getting failures in setupMmap.

With patch "784be6a v4l2-utils: test cache_hints for MMAP queues" the
test deliberately sets V4L2_BUF_FLAG_NO_CACHE_INVALIDATE and
V4L2_BUF_FLAG_NO_CACHE_CLEAN on the buffers that it queues.
Nothing in the kernel is expecting to manipulate those flags as the
behaviour wasn't really defined before, but the test is failed if they
aren't cleared. The v4l2 core would only clear them if the kernel
includes the patch "f5f5fa7 media: videobuf2: handle V4L2 buffer cache
flags", which currently means only linuxtv/master as that patch isn't
even in 5.8-rc3.

Is it really valid to look at the V4L2_BUF_FLAG_NO_CACHE_* flags at
all if V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS isn't set? If the
capability isn't advertised, surely the state of those bits is
undefined.

Thanks
  Dave
