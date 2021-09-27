Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A3E4199E2
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 19:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbhI0RE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 13:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235694AbhI0RE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 13:04:26 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929C4C061740
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 10:02:47 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id q81so33870742qke.5
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNPetvOupXqRGUiN551DEoj5v4Vq3J9M2I/AbCZn9/s=;
        b=DaJH5fJcZaPTWSS82pjbCuzrmgUbbbI8rDumgBGUwFhl/oYhvIG/pZqFDRqj3etyng
         gynjZU/qESEM03OCs4i9F0KxLfb9njtq1177Zhh6o5nIU4Ak6ZFaHDvNbgLrAZMWuX+7
         /vo8yFf6ik5YAvsKvs/gkABlt5Fb5DP5jWTCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNPetvOupXqRGUiN551DEoj5v4Vq3J9M2I/AbCZn9/s=;
        b=qy95F5fLFu66WzolE+eTMv128JvIX/o4DuJtbaCztEATNquj5GwJamnmvgMZFwDL1M
         eB6antR4f5TjzoRy4zdy0J5G5T6M9IMzNfjBisHotuMXBuJ3/nu3WDfOWbtsrI0VZfwL
         nHIElcH1ONcuCFE0GPHNAaHQPBxxPA7WBLmE/aBkIqcNgblYgNoVyOEgNxzow8tuRlLv
         jCK2VtKAhyfkeUXhBZwTCHzTwaIfNNc/xiOItgoLmzVThNqWO+gnYgyBp1N47Gm/7Lpk
         z4/7StNUP6o8KD1vro9hPN8tBIzYALnpnBv7ry3BDBODepZfpl+maMiSrO/+w1Q6KtGm
         g/dA==
X-Gm-Message-State: AOAM533Wx6XBXJK/wr+TYKO1teQbQ50HK+e2PGQ5ZyuX98jcDuE5DLD2
        gyv1fnC5SbZwEuJ0Yet4tr+iZZ2n/4QYk9Gk+P+vnQ==
X-Google-Smtp-Source: ABdhPJwBRvTBeyV1410Jpc8AMLHK25Pf6f0uExAdgdt+d7oQNAG2MpwCW4ToDnxi98Sln0HasYsHB8qhK0klEJITwTM=
X-Received: by 2002:a37:a087:: with SMTP id j129mr979840qke.253.1632762166561;
 Mon, 27 Sep 2021 10:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com> <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
In-Reply-To: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Mon, 27 Sep 2021 10:02:36 -0700
Message-ID: <CAC-pXoMR=mOwnKqP5SFAfF3Ka5UrG0F8Mj=sJuEziU=uOKftoA@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for reviewing these series from Yunfei!
This series is one of the main obstacles for us at the moment for MTK
so please continue to help & support reviewing this series.

> > According to google's suggestion, it's better not to use v4l2 async
> > also.
>
> Hum? I haven't seen such objection on the mailing list.
Maybe coming from Tzung-Bi?
Yunfei, please let us know.

Steve
