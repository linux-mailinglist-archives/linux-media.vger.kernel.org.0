Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91DD44BEAB
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhKJKdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 05:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbhKJKdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 05:33:15 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D596C061767
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:28 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id gt5so1196418pjb.1
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BL/ijtIxlYFTdIaPRxg1NuofUxGQzYinoPWGFB9zPEs=;
        b=oon4kKhSj7merVzvPBZvRplsjLDFbY6jj7MxoEEpCv5XCaxgftMX9iQSg2wZgT5bmh
         5GSs8rWijTpI31ovFFuakG9K9AAZdhQBKS1mhPi76SPrvNr+SNCoiyCWyIrU8CSCh2YC
         ip9t6JVaopp4KmCDK4b/pAWLlCqzs36IVlHxjuyGxtMmNzUws9ccTj38yd3EviK+6dsE
         puAwS46GaQ5dzqgphAdiIf/mlSnqbrFXyBbKZmcpXOuiVC8ectlztG/GN6cOGvUCHqdV
         qmXeEnMckfRwc1Fhe/svZO5BHI75kgDk/5rOCHY+BuwjUvYMBL6gOCfLMi3NO1r31Dc9
         k4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BL/ijtIxlYFTdIaPRxg1NuofUxGQzYinoPWGFB9zPEs=;
        b=lVhh8r8W/tI3Z/eOIbes/BWt/hZYO5CVQF3EtsBkhZEaE7JiRyuaM/YVK9vjOYXYZx
         Tj7WRXN2u7IyTmNPOM+vLUU5xKqs6sZktV+/nfFONcCFzYQ7gx6r5Ezzjk5379N1GU9U
         vwCl+2dSuOdqdxnYRnENdOWCjMvMtHvov3lSMiHJPMW5MUwN+rHxUjQUoTKoZur0DZew
         ubyaQQgFcqKQ/2McTKSKDRx3mPWRo9NEvhjIHiu1W+1IQTthU+c3rLT8Yc7sTvNB8/fG
         rDtitG0HXPwOg9BOnQPDkp7uKeE1q/QyXUhE2UbgcRF+/eil3EeoAqOD1hZmOZpaU66S
         tz2g==
X-Gm-Message-State: AOAM5338X5oWK5Derk38CS2sr99Irp4HundkQ+nmqcuqVfv/jqwpky/T
        ih3Bzx9O+OkxTK9Q5ZcEI14T98q/U8i1N9fTOVl2vA==
X-Google-Smtp-Source: ABdhPJwVgFxj/vjgnycu/+1rEWt9aVPNT6j63gpsvXFnkemxO+5cDmd7zOvOIUlgeIO++x6gV0UCGw/o6pLmfakrEQs=
X-Received: by 2002:a17:902:7289:b0:142:805f:e2c with SMTP id
 d9-20020a170902728900b00142805f0e2cmr14242448pll.42.1636540227601; Wed, 10
 Nov 2021 02:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com> <20211109125030.26299-6-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-6-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 10 Nov 2021 18:30:15 +0800
Message-ID: <CA+Px+wWiFDB9rqOzsTjjXAyKF9+AfEmC4ZrnYQTCi7ePuCUGXg@mail.gmail.com>
Subject: Re: [PATCH v9, 05/19] media: mtk-vcodec: Support MT8192
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

On Tue, Nov 09, 2021 at 08:50:16PM +0800, Yunfei Dong wrote:
> Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".

The patch adds a new compatible string.  A separate dt-bindings patch is needed.
