Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B2E38C14F
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 10:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbhEUIID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 04:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhEUIIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 04:08:00 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D118FC061763
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 01:06:36 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id n10so19293252ion.8
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RT+JgsYt45829ZHd2BYc40XqO99OHa9pHrzKSSD5j9A=;
        b=kLDJ66UxJgXBhTlXqQcr4bzo/A2l5Q8HqghhVGTZn1NhjtsLvIntyyuByjyK72XJiV
         EguZV7WiHzjL9tIOuUpIheqlo/zIR7fCiXRdRsiM9XgCDiG83jwTK8jfkfWII0aiEc+B
         XLW4AK2y3GYblWpuR0WfCpTNh59ZKDqfw+BUVoJ2NPRJ9b+p4M7w32T5SIS0ZEyI8iTF
         uZuzVOQ6hRqrSmIIzBC73CSBQ6vQkLdiJzGnB1y4VMW6hz66G7NvqwOFP97s21DQ5hvw
         VPRizS0txzrgGhqLjoUKanc3unVj53BjOFJS5QE2/1UNWd370D6MHF3o4TDKN7Pdd7uN
         yxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RT+JgsYt45829ZHd2BYc40XqO99OHa9pHrzKSSD5j9A=;
        b=LEwCQdkmYpdXshkeV1dgg4SfFsw3f9cW4F/pJ1IpQh4yXV/AjnYphxqHBDIOR2Poza
         YbnROKmwplk2RmzGZxXs3+fWyP3VZNi18DsAIF5ez4iuqQc5rzG6/yKR7w3ADGfRuEv8
         hIOt1sC69PYnaC48Ak9sqyMKaHLmLzzbvGyCQPIYdP/vu7MF6IeNTWSSjzcLy2aqVrE5
         /t9RGYF0fO8CTzt/Gp3+mfix70jNL1sSp/KiKTiFzr8b5xS81ePQyQC1OogWwdE0T0yr
         Vdr54a2h+zi4RsF/GjIxnvVXqrXCUv+gwCCH4Q1Jix57MpAIkume4aX4CD9RIz2KVY7u
         ELDA==
X-Gm-Message-State: AOAM5309/6OOQJ2J9vGJFw0cYQX/Dmsq1dD0Fn5/6kFwKKOxbYC8ivGr
        M1bww7gq15ZgiauOzHAiqXxxuJLdwjbC7MBiDkHeIg==
X-Google-Smtp-Source: ABdhPJzli/TP6ekzSUzbblqRjUcznUEUpI63eE2KDBygtddGTKqTJLATk1eu/Q+8mrD9doz5sb8hrdaLnSgi1Azv0y0=
X-Received: by 2002:a05:6638:3010:: with SMTP id r16mr2626171jak.126.1621584396061;
 Fri, 21 May 2021 01:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210521070139.20644-1-irui.wang@mediatek.com> <20210521070139.20644-6-irui.wang@mediatek.com>
In-Reply-To: <20210521070139.20644-6-irui.wang@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 16:06:25 +0800
Message-ID: <CA+Px+wXOKM6y4aHsHTGOiT-VJJ=wzghNDiKSkgaxiefhs+mO3A@mail.gmail.com>
Subject: Re: [PATCH v4,5/6] media: mtk-vcodec: Add MT8192 H264 venc driver
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        linux-media@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 3:02 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Add MT8192 venc driver's compatible and device private data.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
