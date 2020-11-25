Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE6D2C36E6
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 03:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgKYCq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 21:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgKYCq6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 21:46:58 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F643C061A4D
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 18:46:58 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id t6so970341lfl.13
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 18:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KerQ9Iv5uRC8y/oyJ5H9vFpn79bTM4xjZkKRVKH2tQ0=;
        b=lF0N4JHRQSynJbooJkAKI2A7bPU13aiKpsjkPlZxgP6u4rbyjSZ2peN4RjKOQXRjIJ
         j3kFWWmkKbwG3L+Jkh/BV3g1xglRPCydH/R40zQdDa5cXvoDkWeu7r+FvYtVgy4UTd66
         UtSGGBEqbG2G6G9q0pYlF1H0vLnJ+0f8P9UU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KerQ9Iv5uRC8y/oyJ5H9vFpn79bTM4xjZkKRVKH2tQ0=;
        b=lHxEbAlTYRnAEq5C6vcZ5VEAYgaz83tz80eRk1q0Ft+UHlLCTmvOavSSgHrcX4MzV0
         KXibqsxrKjiaIwsjZOpChn3j1ZRaIv8AN5H7M8T70lWYe+A219Z+3ZUCLQoPXXX9fX2e
         /tO8pKB8UBX/SqM48kl+YQIBZk4pLdS38VD3tutdWYEojZ44+URQYlJl7EqxeuY/3WAP
         OAfTTeDutDFkZmsDIQeulq/RUXVCkxh9ymDBQlShvE72VEnd/dopMJEGngTv3Qeh0sCt
         8eeX+SCl9r562t6jG2RIcy1n1Xsz7Bivg5o9qZ4Z/YOR/iWdDwb+eZsZlLaHi5Uz5umk
         6wsQ==
X-Gm-Message-State: AOAM531NEHiAMXKM6Kz4HPmIx3xFK+ZsfEGjEDjUAgOmRYO9fKom8nEf
        dj2Uzcoavc6Skg2qmqjzMRDADGuXzI8IzQ==
X-Google-Smtp-Source: ABdhPJzCLJBGEvCvt1QK0tmXMAXp5cTTxQniInT7g58t82wwPnNi4g/DE/QGCaaCodKh6DYlH4/Gtg==
X-Received: by 2002:a05:6512:3711:: with SMTP id z17mr393106lfr.350.1606272416178;
        Tue, 24 Nov 2020 18:46:56 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id y28sm92361ljn.18.2020.11.24.18.46.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 18:46:54 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id i17so694691ljd.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 18:46:54 -0800 (PST)
X-Received: by 2002:a2e:b4c6:: with SMTP id r6mr511760ljm.248.1606272413969;
 Tue, 24 Nov 2020 18:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20201029011721.6705-1-irui.wang@mediatek.com> <20201029011721.6705-2-irui.wang@mediatek.com>
In-Reply-To: <20201029011721.6705-2-irui.wang@mediatek.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 25 Nov 2020 11:46:43 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWGNH180gtmonmO=40dD7fAscTsvvYE=sj8+i5WeR5x1Q@mail.gmail.com>
Message-ID: <CAPBb6MWGNH180gtmonmO=40dD7fAscTsvvYE=sj8+i5WeR5x1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: mtk-vpu: dump VPU status when IPI times out
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, matthias.bgg@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Maoguang.Meng@mediatek.com, Longfei.Wang@mediatek.com,
        Yunfei.Dong@mediatek.com, Andrew-CT.Chen@mediatek.com,
        erin.lo@mediatek.com, PoChun.Lin@mediatek.com,
        houlong.wei@mediatek.com, hsinyi@google.com,
        srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 10:17 AM Irui Wang <irui.wang@mediatek.com> wrote:
>
> when IPI time out, dump VPU status to get more debug information
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
