Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6116544BEA7
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhKJKdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 05:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbhKJKdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 05:33:05 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C19C061766
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:18 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id k4so2582344plx.8
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/H97nPqB7O+Ha49bdQqeIeu5pMRHp/3DE9p9icaUgqM=;
        b=PUuEyw9XBots469I4b/mSNfuAjfpd7qQMzH59EqV6M8zrGuW5q/CfOy/XJM/r7hsaF
         ndro4ZRi2k2UFXbYR7Y2TD+wsPKHpZaqWMHSaQC5u0vRq/R4W4M75LnQ6wwHqTSRhgjA
         gNhSq0Dc8jWZWpqCIgVAsX8h+/O3mbrRqDeGIUv2lwZ2U3bRdIAyjPOH7bVnTrFrFM5/
         FjN72YqxEMlv/SAj8JL4+P+sZFmb9ZhnqE0y/Dg5uFA/hcBKG1196tdQW2bAJXYHe/fz
         wZWqGkamOre8skZ1KLmAgmEvyTB8aiEzTVhVd5dmXMR4WSLYYi9i0jUTIq125egaczwZ
         gM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/H97nPqB7O+Ha49bdQqeIeu5pMRHp/3DE9p9icaUgqM=;
        b=6bPlq7Dji6wK+pYTHsliWX7e0G8+7/Qh0aNhAcc89L8GsK+jZWi++J4jweyQAm1PT4
         VdbbhzZDddZi34NtWeIlOpX76gmH8b1an9yGSCK1FPbB7mwAwtQ60tDYMeTc0BDPH5k8
         /9elHs5g+bTToTMZnMyan3Aw+8Uhj0cJgvGCjetanoZx+pLHu5lJNunmOeDnJRxUMGd3
         R8O0hNpfy08ozXvTOWbTJvV2lXPrwpnJqtxI12bQyNzjxdq0FuaaNz9BI7bOWdzOiGZd
         cuQUdJpg1VdP8IjQ1tEy3mCxhustPkmCNAt4n+OsAheDZJyuvVfSPw86NZxl0ehIsnyi
         G0SQ==
X-Gm-Message-State: AOAM53352C/rQ7hZnJbFzVLvKJd7uRo+Fqaw0uv1WMCrPg6dCmrqVnqh
        rNOGG2feGDmlGWFo2tOORPtz1hxfZp/FgVPsgvEBGg==
X-Google-Smtp-Source: ABdhPJz1qeQBdRPNXYe0xOwKF+EIkcWuZ9iABV9TtnSScZMDJCzYb6hg0DTj4FGiTtJpUHr1yfmX7QThpigva/yBGZE=
X-Received: by 2002:a17:90b:4ac1:: with SMTP id mh1mr15543616pjb.30.1636540217454;
 Wed, 10 Nov 2021 02:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com> <20211109125030.26299-5-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-5-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 10 Nov 2021 18:30:06 +0800
Message-ID: <CA+Px+wU6iwjisS1_Mdxdt6eb4pjLQp_Z16bA_ewEhCe80worKw@mail.gmail.com>
Subject: Re: [PATCH v9, 04/19] media: mtk-vcodec: Build decoder pm file as module
To:     Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 09, 2021 at 08:50:15PM +0800, Yunfei Dong wrote:
> Need to build decoder pm file as module for main device
> and subdev use the same pm interface.

Why does it need to be a module?  Could you provide more explanation
in the commit message?  For example, any compile errors under some
circumstances?
