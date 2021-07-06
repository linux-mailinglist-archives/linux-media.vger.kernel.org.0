Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181193BC634
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 07:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhGFFws (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 01:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhGFFws (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 01:52:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8663DC061574
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 22:50:07 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t17so36336477lfq.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jul 2021 22:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=KORVGOPU4e+cmTa3wpSMThwoEFK+drTgWm5Ve0PudBE=;
        b=cgo2Hwyjh5htDBsUVWTQT0yg9DnuwTjpeexnabOQvSTDvulWm+UhN+zrjdcXdvpVpx
         h/0rGAUz8DbdGH1bwCmsTpxSjwMqoaax7kbUBsWxlSmJ2C087Q6frsSyFS33Ojt9THVN
         oyNL5cgR5AtFOW7CvBsLMpWBtJbl0chCLAsTPfNPkDOa+vgNTBvz4IQlgFUEqlXFRpnB
         R8NNnaAWwyUBjWp/BdduOD7rBOEDHUKW4DB6rs44sPqjuJSWcKTjojboWGSqdn+Q67Tw
         tq132O0bnAG6ci+tIMny0iuku0ZUyTXcuyXXXy4m6xCg9TDrrnS/j5FueUO2wUKRt89i
         YsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=KORVGOPU4e+cmTa3wpSMThwoEFK+drTgWm5Ve0PudBE=;
        b=S4AngMcOO//pbpdBKSEgKv3JG7az1U+eg/ikbD/t2HOiKmlcE4dL8u64na+reIRfqU
         OYi2NtZ6d7nh23y83iBkDqLL0VV5+81LEAb9CpoFCMj1/7xb0HW5q40gKn+4zywEhs49
         2qb6b0DkrsXJ0LT5+4a6JvYNTmZqROSrrPLUObMIt5nZDQNpjPoGgFxDPaWLqFiEpsig
         WXwizJZdWjQqyG0uMIwJWHJIXVV0UTmMY0ghksJjIyKGqn/olw5p1GJeFLF2fP2lnz0t
         0w7WKnFI4P51wf4IPjmZTnYEeyW93epD8ZSYfb1+znR6Ea4a0XLOTwPie4n5HD0RL/hz
         R08A==
X-Gm-Message-State: AOAM5331dodG/xUSbJFbw0XHyX3lkJs3TnUCVnmt8OmaRDYoUfNWO7WG
        6GjpJtOCEsKrk/JCAMypcXiykNxMHJRUfnbG3JpvSWf2/ZJP3A==
X-Google-Smtp-Source: ABdhPJwrJ6zWyQz6SnN40RQnuDSeFLL+Aa7tVoJYifVIdZgKhoJBvu84SSnTndUhHdFXgf7bchST2LRYqpBTggFzWhE=
X-Received: by 2002:a19:4c09:: with SMTP id z9mr13219799lfa.450.1625550605600;
 Mon, 05 Jul 2021 22:50:05 -0700 (PDT)
MIME-Version: 1.0
From:   Prince Singh <mrprince0088@gmail.com>
Date:   Tue, 6 Jul 2021 11:19:54 +0530
Message-ID: <CAJ1tOf2erxbES-5imSS3rRd4Ufqc6EJtz5OKM3+m8edJx5p8vA@mail.gmail.com>
Subject: Webcam not supported by UVC driver
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I am using POP OS 20.04 on my lenovo Ideapad S34015IWL. It has Syntek
Integrated Camera which it shows when using lsusb command but does not
seem to be working with wither cheese or guvcview. It has not been
working for a year. I thought it was a hardware problem but I found
out recently that camera light flickers and stops whenever I open
guvcview.

The ID for the camera is 174f:2426. Can you please fix this. My exams
are coming and I need my camera to work. Also suggest some external
webcams I can use if the problem cannot be solved.

Thanks. Looking forward to hearing from you.
