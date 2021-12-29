Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF8E481018
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 06:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238797AbhL2FgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 00:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbhL2FgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 00:36:20 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7376C06173E
        for <linux-media@vger.kernel.org>; Tue, 28 Dec 2021 21:36:19 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id g22so17650196pgn.1
        for <linux-media@vger.kernel.org>; Tue, 28 Dec 2021 21:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nsu5SLu33j/sE27MQRMv94REvtF5KHoUUdJ/rRJCBKc=;
        b=LhGTWxNvS8f/k6IwrYBQ9w+endDRu4HsYOTFu77KuXJeWzeMmaw4hKbczXWI/szDDk
         wS4FZUCSdhkkh2Mn4fAK/stz6O2G7EcqFlEBlPQpKd8E6vA9/z8DzNyE6Ix4EwfqQFOF
         wjEckNlMPsww8Z5MFcn/GJUpSlbdroyWpjmndn9A/3brVFseH0ZbtG8hzf3O0OykSxWZ
         B0ZVZq/f2NHlyuqqmNdQFMZEy5B9BSd62iU0AYsI7oM7jKhW/0J20tjrdxvJVGjuDGF5
         45ARdKJqro60BwRNng8lAOOynIvKiiijeukxyu01rlWZpyq4hFhRrthVM7Kh95aisejd
         ynpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nsu5SLu33j/sE27MQRMv94REvtF5KHoUUdJ/rRJCBKc=;
        b=PY3CI01i1ZP+GKun4sy3cjQH55upSAHBmIC8OrPtDwlLPdHZjxVB+ycJzc/3zcl/Ub
         XZtOibbunvwb9t52UsYJTIX8mUjqnd0lgDO1ufJYENIlSPfoFvduXn3StR41DmTtKKsL
         iFk7/Djvt+783Yv9P5VI+S7+2eI+yRVnFF/1fbD8VPKMLdpBU0vgOxnauvZ9DgJqTJ8i
         xx3ehYq+f/FerKxi2l7d2QdO7HCYkRLDYLB9nIgT5bi89Ylx6j0IhPgLLSeRz5QLlqkD
         w8zKFqpH75ffdLBW0K/D1kamSs8vO7svliZKHdZGcR9CkyAL2iMK22q2cMwfRobqkdKt
         Fjng==
X-Gm-Message-State: AOAM533wf16Llvnd7WFwN6c9paiVhI0b2KPsYhgYFqOV/d4gQ4Ltj3hk
        UnNLDysKKk5zwrqjm4t4qCNpOg==
X-Google-Smtp-Source: ABdhPJzQuki0iGD+cAH6k2vcVjIwQQyRJUo+cD69ZoMLZ/4KGBWqzam4XH+vbVYrMkUhzsc3Kiugrw==
X-Received: by 2002:aa7:8bc3:0:b0:4bb:d87:c988 with SMTP id s3-20020aa78bc3000000b004bb0d87c988mr25335502pfd.66.1640756178267;
        Tue, 28 Dec 2021 21:36:18 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
        by smtp.gmail.com with ESMTPSA id bg23sm20695639pjb.24.2021.12.28.21.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 21:36:18 -0800 (PST)
Date:   Wed, 29 Dec 2021 13:36:13 +0800
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
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
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2, 02/12] media: mtk-vcodec: Using firmware type to
 separate different firmware architecture
Message-ID: <YcvzzZJJBoVtsU/y@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-3-yunfei.dong@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 28, 2021 at 05:41:36PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> MT8173 platform use vpu firmware, mt8183/mt8192 will use scp
> firmware instead, using chip name is not reasonable to separate
> different firmware architecture. Using firmware type is much better.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
