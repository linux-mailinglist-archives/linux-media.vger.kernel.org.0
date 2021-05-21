Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855ED38C84D
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhEUNjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235936AbhEUNi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:38:56 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC3AC0613CE
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:33 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id k16so20113639ios.10
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QTl2sSUU/s7VqJED6BBjvvTTnkniEWQTs02ROUyY35U=;
        b=BYahTz/2unNRZyj5oIDnvi41zYnBfRj4coQDpobKujlEc0wBN8as9PE6id1T2r+OqO
         wo2+h6DS9JZ7IVtET7EEOeegtmZg8t1Yuh/rlkvxZldK0mwLkcUm4wuwk72iDgsOXqk9
         GF9LHuhDFpj6idVeDTo90zSCNGKHnQqZyyKDHUf44aCSR7QLP+uSAgXR0acL9juPHiEj
         RuHzOHrgt56iIgbWmcn8s5CNaazEs8aR1+DQqm5/PdZTDV1OQ4piS8vSJbHdP7eZZjvy
         sX/Ov4UDny+2bXWvn0azbM2fGG9Ox/UXnMRXmqPTDSTmEAMVaVIW/BE3dR59DG39Ggwz
         rPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QTl2sSUU/s7VqJED6BBjvvTTnkniEWQTs02ROUyY35U=;
        b=Ni/PoxD4q8hoAa245dPqktAsr57UlKhnHQcRgu0Spgm+h6QolRmgdIp7UAvYbpzGQL
         afDAxHDJ2ERRzOb1IZFiEdFmkHcgtxwq6rVs0PtsZgyJvxm5B3Gw6G/KYIv4Uat+xvmi
         7Qy90Dr8Gqh+Qqa+FSDa7/VlxlFOTEXODepRuOWTAD4FbU5OrYUrrylIHyRDivRT6zzN
         BnJSlKTUL4dY7LJlXesWo4nz6gZu5+r+B7zDHEYsl7ELg+MpXgh/1FtchuSQHQ3cKae2
         xh3AJqnj/N9aHlTTAv911WcLO5CF3if2eqr1VDmlNpH6mCdbS3W2MD74LYwA4bA9eZMm
         /DFQ==
X-Gm-Message-State: AOAM533XieEUw/iaLeY5D/MXfPWP/gQqN4DKMiSbfF6Xni5PPzjGBwwS
        yBZH4LatmCuZievZNIBqvjKxyVrlAn1/N+cSUwCIHA==
X-Google-Smtp-Source: ABdhPJxteMqua21cI5k0SroJrGXwA1Ap+kuKB8k2NuAdu4F7fPSRrlrKGWsEOEctuuLB9dPBwaK0FXXFxOv9zkrQwy0=
X-Received: by 2002:a6b:e00a:: with SMTP id z10mr12609020iog.109.1621604252650;
 Fri, 21 May 2021 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-6-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-6-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:37:21 +0800
Message-ID: <CA+Px+wUaA9o+Aom4weuTH4TDpCfFpxv0YHDArCJswEs6QmCw0A@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP commands
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> [hsinyi: fix double-free issue if flush buffer was not dequeued by the
> time streamoff is called]
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Per guideline[1]:
> Notably, the last Signed-off-by: must always be that of the developer submitting the patch.

In the case, should you provide another signed-off at the last line?

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
