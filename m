Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17DEE3DF046
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 16:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236412AbhHCO2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 10:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234328AbhHCO2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 10:28:14 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCB7C061757
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 07:28:02 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id qk33so36639109ejc.12
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=pA7gWraqq223oeUigO97Usrl9Fr34mfXW+fmxdHcPoQ=;
        b=R6G23C53vQuQm8MpllBDX+H/OntO2Gcm1fq88Z6tgMdH+NmGQeRA+bv39TQ9OlLUO1
         +mFO4MlUyrCrjVHtY0JGTAUHkRrVmVhXbRh/+gges5X2eAvI4WXkyLL2Skv2fQjTR8XZ
         6MgBqTp8XVR+0HeDPYS0UXeZmLGw5epMqoXL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=pA7gWraqq223oeUigO97Usrl9Fr34mfXW+fmxdHcPoQ=;
        b=DqAn7iRuA2ubOAlPpMQXUdhs44nbM6i/i5W2YkelvzhkpI8KFLWI7NsNlk/8OlU0tl
         SG+mk3A6/VarmRqqCEiu1THl6yrz2lr2zdyLtvdiQDHoZjLfNp7YnIKWI2sPCzYcBc99
         Il4jgdVUXH0AQ8JMwtH/PypKayariRUmEezM/6s3KkMAwqMs+MZT+M0fJSSztYoW0Bs8
         KopOsizQLAhypwmtmfWHSwN4pe74FAN9QuYDSHsGt+TG1szgVLDoyi9obnakNjN5KrlS
         zwS62W86sbeE/VJ+h3rCS9dzmrLEAc5PR/Ofeb4lqp0kZ4kiqQEWVvsDSDJwSyYpmLhb
         /QoQ==
X-Gm-Message-State: AOAM533M6MTTF1tN8k8dwNs+qZmrc/uj8kLkCFtKjv3I4+HyAuF5I1+c
        q5uEnU+cju2bnP5mouGQtCi6C0WZ2Sd5Qv5Dyvf0hr7ZqRg=
X-Google-Smtp-Source: ABdhPJzzfsRl1mScZORn3/hKwmFCpHbVxgCI/nW0dnv6G5AKKm0kWje4oSkkLyks99kbDmjdEzwd2BhL3uXOVpQ7kvc=
X-Received: by 2002:a17:906:b052:: with SMTP id bj18mr15149397ejb.55.1628000881041;
 Tue, 03 Aug 2021 07:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5uPHM-n9Rh6MPTNoyzOGR-jV5-qy3zj67MZuSM8uaAN=RNXw@mail.gmail.com>
In-Reply-To: <CAO5uPHM-n9Rh6MPTNoyzOGR-jV5-qy3zj67MZuSM8uaAN=RNXw@mail.gmail.com>
From:   Hirokazu Honda <hiroh@chromium.org>
Date:   Tue, 3 Aug 2021 23:27:50 +0900
Message-ID: <CAO5uPHOY9f_w2cWno_AhmCK_Sv-6raZRpUT+JUdO5gyEf_PpYg@mail.gmail.com>
Subject: Re: Clarification about V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Gentle ping, does anyone have an idea?

Sincerely,
-Hiro

On Wed, Jul 21, 2021 at 7:22 PM Hirokazu Honda <hiroh@chromium.org> wrote:
>
> Hi,
>
> There are V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING controls in
> V4L2 extended codec controls. [1]
> There are various layer structures. For example, the typical 3 layer
> structure is shown in https://www.w3.org/TR/webrtc-svc/#L1T3*.
> The document doesn't state the details about the layer structure that
> will be produced by a driver with the control.
> Is the layer structure up to a driver? Or must a driver produce a
> predetermined layer structure?
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-codec.html?highlight=V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING
>
> Best Regards,
> -Hiro
