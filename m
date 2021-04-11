Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A129935B757
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 01:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbhDKXIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 19:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhDKXIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 19:08:41 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0766C061574;
        Sun, 11 Apr 2021 16:08:24 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q10so7941288pgj.2;
        Sun, 11 Apr 2021 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=y3OO3ieVmLEwl+ife04UOYUCAMow1hzkBN//gQUlMpA=;
        b=gZa1XQqOhnFshkh4twv2e6nHTxXyn50PCEHsmnHWoWb39ijE2/XeX619XzzQNi7wEU
         nnLei4oEl36w7mpVVVdvD4Cs5Iczg7ESkuWAsWpq1J6+0HoBrUjbsbmLsDZjPw7Z7waY
         2uJ79UX0oY8T32BCFUmRxsiTY7mY/+KsipeBnQHURXo2PVV2bUOOcHjBdM2mZ4VOEBOZ
         Wr6wFxtm1+xdcNC7P8hiG3HF+KLyk7NcSIfe+Am5FWYugGNtVmGwu/7OkLg3u2rZ9eKh
         xsmvg3a5ZhFato6XANJFOvF+snksG0vMWuy8mYpUr6UwTRdazoaMxhY27w/39lXCvKOs
         w90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=y3OO3ieVmLEwl+ife04UOYUCAMow1hzkBN//gQUlMpA=;
        b=IHppcYRPDFCk8QR9syNc+2GMm8IEnY1vs0Qasyvp1s2IMq5kdKzy38J9pFqy534h7r
         K7rF1vZa+whtaIgnRkqkz95Gg6qnQ52KAQDWYdHad5KzgE81VKDPekuJITGID4Jg8mFn
         wsdtUmJsqjH1wGm5dT5NQ/KlcrZtJRT+lIkVd1mta/I/EdInpTKfZCL5wKnSfwF3XIgN
         10Goo/wZccu5F+QCYTWEaAQ/BwepZawjX/vFJgCX158j5o+MQNrKSlBRzZMEzBYj41Wf
         vWNh6CG5laQyffbhyToLhG1cl9E/7iIiR6A6YshYv587t0shBp2U/wJEWIIErEQyO7XO
         RDLQ==
X-Gm-Message-State: AOAM531S6p1/i19qXRbAAD6kvlfWRaElNhMGABlN2YfQt7dK5TfthPWR
        4KaOS3ffWWOdbPzEWtN60WSor/InC0DCiw==
X-Google-Smtp-Source: ABdhPJzSk70k6LM9VSsUsO9urpktgQ/uiFzNlIvQGx3TpOESw3ocvMlPyB6hVyVkuqDU/LIVc/QP3Q==
X-Received: by 2002:a63:f91e:: with SMTP id h30mr24117266pgi.117.1618182504181;
        Sun, 11 Apr 2021 16:08:24 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id m14sm7492873pfh.89.2021.04.11.16.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:08:23 -0700 (PDT)
Date:   Mon, 12 Apr 2021 04:38:15 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 0/6] staging: media: intel-ipu3: cleanup patchset for style
 issues
Message-ID: <YHOBXzA0Dk/yLfJY@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tian.shu.qiu@intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 0/6] cleanup patchset for style issues
Message-ID: <cover.1618180659.git.mitaliborkar810@gmail.com>

This pacthset fixes the style issues reported by checkpatch.pl

Mitali Borkar (6):
  staging: media: intel-ipu3: replace bit shifts with BIT() macro
  staging: media: intel-ipu3: preferred __aligned(size) over
    __attribute__aligned(size)
  staging: media: intel-ipu3: remove unnecessary blank line
  staging: media: intel-ipu3: reduce length of line
  staging: media: intel-ipu3: line should not end with '['
  staging: media: intel-ipu3: remove space before tabs

 .../staging/media/ipu3/include/intel-ipu3.h   | 91 ++++++++++---------
 1 file changed, 46 insertions(+), 45 deletions(-)

-- 
2.30.2

