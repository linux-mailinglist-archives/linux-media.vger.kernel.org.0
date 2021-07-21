Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEE83D0D5D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 13:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238248AbhGUKkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 06:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239112AbhGUJmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 05:42:08 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBF4C061574
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 03:22:44 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t3so1732474edc.7
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=EoadOl7TVuMkTnmi2DFKQaplLjP7jgrfB4DpOdjoNG4=;
        b=Xu7D1swazJfwaiKEj7Ls/fZ+iyuiWxb0iZCkxuWzeQmEgK92SJZbDXgRuxtqcywpUi
         PcNmNMl0KG9Rt36J2nEUc2C6LJltFRayxsntwRGgTqD/iHek9YMXHzIiE25Fz4qJcVpB
         dYDASxPHltFUvhaEAyCYi+UJZ9skQloSpqMjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=EoadOl7TVuMkTnmi2DFKQaplLjP7jgrfB4DpOdjoNG4=;
        b=achmL4KvlAPq41S0EJYFumzhI3W+YpFcEmini/gD5B1Ep8B8VAI6PTbSd/OWZOyy71
         JlKB7g6nfox+4KsTBnkGLLtRvbF3yX4AbvQjK+w3mVfn5zaQm4UTcHbx+ZEWvAHNwuwO
         LQNJg1rLDEnFlGBxf3MO5NUIU43QlXBdAv7ZAFLJzMrWepfPG6GxyiPJzWGkPFZtLvL7
         brEOLhDzDeP5zX1c0f0iKaPw3xXHXvJbc24q6UsxYFd/Wy7zffDpXvazm4gfPBP3XaCo
         yBSZrJYWqCca55utJpxNzdxXEJH2AmztAIHLxfbSIAe1Sy1Z0DV5XNhHxD57hEa3qOYp
         ke0A==
X-Gm-Message-State: AOAM531gWrs9GpsE6VpPl28bhTv1pja3dLpYR6OM/tw0ZNdjE+u79W/2
        Vvi7eR5+HgAdKQBmfVPrINllocMRh95JuQScqKGDEDfXJOs=
X-Google-Smtp-Source: ABdhPJx7Xl4nT+3la5abPLBL5RRrsmI8mwZ4wOCONq6jpRGnTowEMmgTsgyHaml3GNteoaOyu60aBlyllTa07YRvOnU=
X-Received: by 2002:a05:6402:2788:: with SMTP id b8mr47263585ede.244.1626862963019;
 Wed, 21 Jul 2021 03:22:43 -0700 (PDT)
MIME-Version: 1.0
From:   Hirokazu Honda <hiroh@chromium.org>
Date:   Wed, 21 Jul 2021 19:22:33 +0900
Message-ID: <CAO5uPHM-n9Rh6MPTNoyzOGR-jV5-qy3zj67MZuSM8uaAN=RNXw@mail.gmail.com>
Subject: Clarification about V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

There are V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING controls in
V4L2 extended codec controls. [1]
There are various layer structures. For example, the typical 3 layer
structure is shown in https://www.w3.org/TR/webrtc-svc/#L1T3*.
The document doesn't state the details about the layer structure that
will be produced by a driver with the control.
Is the layer structure up to a driver? Or must a driver produce a
predetermined layer structure?

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-codec.html?highlight=V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING

Best Regards,
-Hiro
