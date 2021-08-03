Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4803DED2C
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 13:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235905AbhHCLtf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 07:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbhHCLtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 07:49:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E331EC08EAC9
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 04:47:01 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m13so39200598lfg.13
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=etK0elpS05hz7Km273394Meji45lu69rkvmUfpsPSIQ=;
        b=Tfds44W/7N6OvbAyP0TRdJLdBh4VucrnQroHeSiqwZDxfmA/2aGndP7kOTFdbAzzVv
         qffehGnqve2NBSPHMYGdm9DisaX3EvAc4/s09ESqikbBbjAv9wW0b59PQCadqWSEVKKC
         Rty/MzA4FfFXkICzwfYucun6omh3dosNSMpc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=etK0elpS05hz7Km273394Meji45lu69rkvmUfpsPSIQ=;
        b=syb2i+LqKGtmhBuI1n6DLDA9Tu9RKrjkouL8+uGMWI/sdoOa6DAB+imwxmS3vzpTFD
         p3A50bjDJxNg7zRomvUm8fsDNwkAvi2WusLCAXwId8VERDQTlnITQ5ZHQixbU97Qm8aM
         ZqQMCCzx/knL/6aBx43OfLS30qDHiQhKEmUZWF/1jEUwV39lej9KYLUR5dOt5ciOl9DX
         5dJ1oRrPBXQ06KUktu9gx69KzEKHfJgGIIpa9NCJZevP3iOEKjFEZwoufpHvI7VliV4l
         Ro4pxLOpxousi41QSYZhFpR/bkI8y5JzzT94LbFbNuIkRp9qnKVcSmZDMUhLIWpG4RRf
         l7HQ==
X-Gm-Message-State: AOAM530I22Yfzxf6SES8/i0/CERSy5c8XjeqiNU/JtafHdMJq9IESbCi
        x/ya2eYn1dsv0MMF0AnlFO4vT5qNdi4gpw==
X-Google-Smtp-Source: ABdhPJy5dEX3nRUA3RHE4rrOjq0+VpoxZS3RWacbzIIoPSbZAqr00pKs7ijc2s6Wh98ztzBYgj+qdg==
X-Received: by 2002:a05:6512:3f28:: with SMTP id y40mr9048989lfa.345.1627991220367;
        Tue, 03 Aug 2021 04:47:00 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id p4sm1086066ljg.2.2021.08.03.04.46.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 04:47:00 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id b6so16432555lff.10
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 04:46:59 -0700 (PDT)
X-Received: by 2002:ac2:4433:: with SMTP id w19mr6028378lfl.30.1627991219371;
 Tue, 03 Aug 2021 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <CAFqH_527RL56P=zEg7yTaeeqTvFOjT3ThxpX-Qumk25dR6+-bA@mail.gmail.com>
In-Reply-To: <CAFqH_527RL56P=zEg7yTaeeqTvFOjT3ThxpX-Qumk25dR6+-bA@mail.gmail.com>
From:   Eizan Miyamoto <eizan@chromium.org>
Date:   Tue, 3 Aug 2021 21:46:42 +1000
X-Gmail-Original-Message-ID: <CAOak1e90y_2aaD4ssH9WfqUUXjUSWkN_rLW51NujkD7oMayhew@mail.gmail.com>
Message-ID: <CAOak1e90y_2aaD4ssH9WfqUUXjUSWkN_rLW51NujkD7oMayhew@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
To:     Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Enric, thanks for your comment.

> > ... Instead of depending on the presence of a mediatek,vpu property in
>
> Looks like there is something missing in the commit message?

That line is a continuation of the commit message header, I.e., it's
meant to read:
"use mdp-rdma0 alias to point to MDP master Instead of depending on
the presence of a mediatek,vpu property in the device node"

Eizan
