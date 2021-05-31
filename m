Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8500A396954
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 23:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhEaVir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 17:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhEaViq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 17:38:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00765C061574
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 14:37:04 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v5so16514290ljg.12
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xmq2scWKpFh/sB+sCVejNqW7wFBtlG/dgqmf4pA4DZE=;
        b=Ga39Y8PjVrqj8cItL+kfQ1t7Ioh6X5DQP5D0s1tMtCj+egvtv7TTb8BthLlFdviz/c
         V776dylsrdKqrZVPu9g0HLTgtV7HLjloO8/FkVphHWO8bF+BhNCy7946fOsB6Dq2Z98c
         1a6+n0jQwvMDYCVWWhTTAEkXz3iSjlczmL28+3NKc38pDXldaaD/qjqwlYdsn4yvTxoG
         vHAVhnV+2U2QRi8h1YRoDb0zldrJ2WJpRZMoV+7y7QK1vuZmA7LYKNyqYG7BwRU2nmg/
         RmNCrdMAoTofCtvcyd53AEgy8QgrpWd7NMksfE8ojmvwV5hkFfd4xi8+Y/bXWAgO4xSp
         eHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmq2scWKpFh/sB+sCVejNqW7wFBtlG/dgqmf4pA4DZE=;
        b=Oaxgq4IjvsZkwYne1leAqA9WwZC/0n6aNCmXAikSC2+s2cJij6faZ8Tn8StQhy3+F/
         cKOY+A7kNu7VBRjUzrn8UCH1opGNPjmbN4SCH/eGOBB8r/IGH+MrTLHqECujRISyuo5q
         HCi2Mji6GOCQOBznluzemxMdWOElxHXEEElkFlqux4S6zd5WKvh+kE8DBRftazRd7mFN
         7ZxCwwpx4uLiroPU/ERGZUngAUoiAlPjDbccGHS9qXmWwQG1J5foBugvrpwFz+vbAkbW
         3tpZw3ASG06AsHsKTvTELNhjwqc1MF8oG392Jj8VoJdDPaevEgnrJeD1CHUs5d2at5DE
         w7BA==
X-Gm-Message-State: AOAM5320wF+sMhuD7Tma/N9mxjb3jBhLyPKqppD4bGRvvIHIUXl8qhvx
        PRFRfjaLz5A8a36H0k42F4uvhyy4Tjc4j8zQD0k=
X-Google-Smtp-Source: ABdhPJyZyYq23muPCExmKDEJqq4u+5Bl59xp+14+L6sI8VrvxFNcUItBREtUP1iXaEgRXm1lO1TMouJCNjeDOruacaA=
X-Received: by 2002:a2e:824c:: with SMTP id j12mr18107678ljh.490.1622497023369;
 Mon, 31 May 2021 14:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <e2d6324c-b001-7468-2eb6-3df9f044ae8c@xs4all.nl>
In-Reply-To: <e2d6324c-b001-7468-2eb6-3df9f044ae8c@xs4all.nl>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 31 May 2021 18:36:52 -0300
Message-ID: <CAOMZO5CSWnnCA29GWySYAJNeZGfHom_4LfRP3JNBR2CZFyFpxw@mail.gmail.com>
Subject: Re: [GIT FIXES FOR v5.13] Three fixes for 5.13.
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 5, 2021 at 8:38 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Philipp Zabel (1):
>       media: video-mux: Skip dangling endpoints

Looks like this pull request is still missing to be applied. I don't
see this patch in linux-next yet.

Without Philipp's fix the imx-capture driver is broken in mainline.

Thanks
