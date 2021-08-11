Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54FE3E8F4E
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 13:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237154AbhHKLQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 07:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbhHKLQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 07:16:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD829C061765
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 04:15:46 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w20so4895459lfu.7
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4L1scxTWu6C9n26vo2qgoZeLEILa/cvadfoeBRn16c=;
        b=PBc4H6TCN8oNeqbaSgDwDWagMBXKbNt1oKWB35rQaKRrQtpSKCgtaCrQCExT3sbXU3
         EtL2uzoqZr4BiELxdl+Ag+4acwfWjjW1GXa5Qc0sjQzLjVwazoUZaGYZc0MPqNoOImuN
         erckDhpJnqjfJqupW69vQsiXFvAcQyHG1nvsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4L1scxTWu6C9n26vo2qgoZeLEILa/cvadfoeBRn16c=;
        b=TP2ThodLZuDFXd6QSNXrhfaw3wVWUotXr5BOdmyfZ510rpcFb+nlF/7AkjzJJUysW2
         hyvl5CQ5XXJAwSCpz2I6cT4DKmp/iJYyMiG/yb3fAaTnodwq+POuG+AtURqvvyJjjlJo
         yEEDCTZ+DlzkU3K3fDLc4J074hBivoFtpYL+M1jOw9NKcEZveRAbRSYN6TO/peJqbKoT
         BD9FIAojEPIG5NTtcCnVrpY5XvgSOTF//p3GlIV34Q18Oa1U8R+DSfIsx0z9c2BFnAAH
         hZabc3YdDI19/MbENpV+qS1Er8uVL/Kr8izzHRNH+og7ib+9oKFpSKP84b4ozifDCxj9
         PW8w==
X-Gm-Message-State: AOAM533/oomjAsbgMtuW88BETLRsnfqjDwsvdZ2Mkwe0NI+dH/fm9uzj
        VGLDr88fzgo58NjuNtqMGy9/w6Vpi7JOU9gU
X-Google-Smtp-Source: ABdhPJwoWX6bdbRz98a3RU7hpTIzyJWIt21fChwCasX43f/xCZB5SN8Rt6KuBLN9clkowIG4fEr8RQ==
X-Received: by 2002:a05:6512:36d9:: with SMTP id e25mr25313090lfs.553.1628680544860;
        Wed, 11 Aug 2021 04:15:44 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id u15sm2194624lfs.203.2021.08.11.04.15.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 04:15:43 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id z20so4953775lfd.2
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 04:15:43 -0700 (PDT)
X-Received: by 2002:ac2:55b4:: with SMTP id y20mr24729347lfg.33.1628680542749;
 Wed, 11 Aug 2021 04:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <0aff1abb-734f-c714-6ecc-c906862255c3@collabora.com> <CAOak1e8n6JpNKODfM57OTtbCNz8UBbj+wefwipVWP_Ep6SHmHA@mail.gmail.com>
 <014b8075-8588-d741-e6f2-edc0567e8c8f@collabora.com>
In-Reply-To: <014b8075-8588-d741-e6f2-edc0567e8c8f@collabora.com>
From:   Eizan Miyamoto <eizan@chromium.org>
Date:   Wed, 11 Aug 2021 21:15:25 +1000
X-Gmail-Original-Message-ID: <CAOak1e-+v1e+x1SE_Pr2T8eH+gyLikBL6J243ry5tkWAVVx7tA@mail.gmail.com>
Message-ID: <CAOak1e-+v1e+x1SE_Pr2T8eH+gyLikBL6J243ry5tkWAVVx7tA@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-kernel@vger.kernel.org, wenst@chromium.org,
        houlong.wei@mediatek.com, yong.wu@mediatek.com,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        chunkuang.hu@kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, Aug 9, 2021 at 5:53 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> You can send it also as a separate patch. I don't care too much.

Great. I've sent a separate patch to make mtk_mdp_comp_init static in
https://patchwork.kernel.org/project/linux-mediatek/list/?series=529639

I will continue with further work to use the clk_blk_* API.

Thanks,

Eizan
