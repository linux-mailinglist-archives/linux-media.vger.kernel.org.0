Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48CD3BCB50
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 13:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhGFLDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 07:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbhGFLDq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 07:03:46 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2617AC061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 04:01:08 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id a6so24439057ioe.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 04:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYk8/MFnVtA7gBfngdQB39lzbb1HLN8KQZCQ/UZ++gI=;
        b=mqRfuAl9FMaPmM8mndYbPgNaTr/4muXGUtAj0aCIVo1DzDJZHyZxeNF57pK/mEv4G2
         bCYhHwF3fX7HA8RxBT8bMsEaXi5swrk6OA2lSrk7s9Bd3Y1QYqzG8ChA2G1FIhPDgDs6
         Mftlv3kB7UFCoozmFUffi/lYHnU1fchrthktlfUbcONCXWyLYtWUsMJsZNM169S4pNZd
         QxaLqqDFtyZ8OuBFNuBPSLrOHtb8+4L6a5s7/JrMGfJj+pvUNYtDQHNz2oqYH9mjum96
         VNtiixoAp3LPgG7Roj8oGTOI8UBQWLwtgFEkf+QxM1lQjGOY+BIkqTtd06ukNz327txp
         bWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYk8/MFnVtA7gBfngdQB39lzbb1HLN8KQZCQ/UZ++gI=;
        b=f5A4dx97Uys6ebVzhnkZoDAfHZB+qYbV44ntYfuSxLU4Nz0K8y1cFreZa6eW6vLfDI
         7mwgjRkxdvXMrihkZuP6VLaFJ8B/1YJUGx3KNAHDACg5voYGj8/J4gNaPZwzF2RFp4+q
         tsHIr4BRJ1Q6CJyQYOuY3O8cT09RX0ZuZ+asMs4HygQl0LahHPXkfr2gUOlXLYUz81Ql
         EDifs7dSXGdcD91b8dVj0tcRVxtfIvxw36C8s4Bzp3wKoPNL1+Dqqo4mdixIcPH1kKOT
         Jsy+Qv3ckJdWunSS4lbXZvkLqfxPJpfppGjctahgEVy8akDxej/Kv+uM+74CeD/VTLP4
         u69A==
X-Gm-Message-State: AOAM531GIBvlzH5h2c9DiGsO7NDaG6wN26qD5v1OSwfs0A/hdk784O7u
        DJkZCAEXvx06wPAmj/5e6gi8S5uwzbiKDjgXXHLaNA==
X-Google-Smtp-Source: ABdhPJwfVqDJZJ8YMxlfHDI/5iWfU93hNngTm71CYO5d2lEfAycitsV1Wbt0lZDaTUxVYOgEgo1j1trbkKDAIraFWas=
X-Received: by 2002:a5d:96cb:: with SMTP id r11mr586569iol.53.1625569267395;
 Tue, 06 Jul 2021 04:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com> <1625038079-25815-9-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-9-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 6 Jul 2021 19:00:56 +0800
Message-ID: <CA+Px+wVwuujSM2MN3VC=kAAU4+M8ZwDhVE3WbUe9R39EuEWDuQ@mail.gmail.com>
Subject: Re: [PATCH v2,8/9] media: mtk-jpegenc: Generalize jpegenc HW
 operations interfaces
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Generalizes jpegenc select/deselect HW and set params interfaces.
No code is using the functions.  The patch needs to be submitted with
other patches.

> +static int mtk_jpeg_select_hw(struct mtk_jpeg_ctx *ctx)
> +{
> +       int hw_id = -1;
> +       int i;
> +       unsigned long flags;
> +       struct mtk_jpeg_dev *jpeg = ctx->jpeg, *comp_jpeg = NULL;
comp_jpeg doesn't need to be initialized.
