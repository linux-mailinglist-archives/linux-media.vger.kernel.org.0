Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA6671582A
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 10:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjE3IRJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 04:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjE3IRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 04:17:07 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00D6A8
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 01:17:04 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7748eb38f6aso120372039f.2
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 01:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685434624; x=1688026624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fy7SR/HzB92IkMAazWT76QIOXbthJ6EyN1HdPKvysFk=;
        b=CJFljht/URfulrX/BQQogdLgAkSiPQ4armqx1rnpAnDA25GIL1uBk1DT6+MFFy7CFz
         fHkftFqZFmrOM3xaCf724X834CCsBoi6QqnNS4npXZCuQho58RU6JSyM/c8aZrOUGxpu
         DCVqYBUTeIi1qwFx3McTy7IiBkpiVVZ+F+/es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434624; x=1688026624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fy7SR/HzB92IkMAazWT76QIOXbthJ6EyN1HdPKvysFk=;
        b=SOK0Ru3sLOEyIEp+Xlu79IAt5apld+WraSGS17zuzkKvBjKO7iBtJf9uDeVIVD3nUK
         sNnf79sVBDMpX2UfLjcUOhg4I5AA9ZgZvf4iVyeBBno2tiddb83hatYLqrmqHlm798um
         46HgVunj/pm/yMy76NSffdFGJZW9NDj7/26GKJJXRoShOdiscqJAJ192NDFxN+VIRtq0
         AD6rWgWg4V/QNUA+jzJ/pIIfltQCCGJMQX732yqGO8eaMm3EWT49/s3tteF0rDW+Cr6L
         dedmuCdEQz2ryf2e7V94xb0C0TOYmpZGWsIhCS8qB1J9VmIlu95FJ8ZY9cJNxDaymOyN
         dFhg==
X-Gm-Message-State: AC+VfDxmezwh6elL3iSt1VLwbIwJVcaGjzT8GHTSYzC08rcyx168eCLv
        G08pWzBMbfT9v5UyOBS0VtoZSclu6lAvBuL7Lw1rIQ==
X-Google-Smtp-Source: ACHHUZ7dX+6887Swu18EzqkpWeZMTbRgNzYYTJ2VvJG6BkRYa9Oe3UhPb4JyBuAIjw+rXVBucmBYHzH71y45f6iv+oE=
X-Received: by 2002:a92:d203:0:b0:335:56cb:a3a with SMTP id
 y3-20020a92d203000000b0033556cb0a3amr1027018ily.16.1685434624188; Tue, 30 May
 2023 01:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230526063149.1801196-1-treapking@chromium.org> <2bae7dea-afc5-96b5-c6d1-f4724bae155c@collabora.com>
In-Reply-To: <2bae7dea-afc5-96b5-c6d1-f4724bae155c@collabora.com>
From:   Pin-yen Lin <treapking@chromium.org>
Date:   Tue, 30 May 2023 16:16:53 +0800
Message-ID: <CAEXTbpcbuRawcqnTQeuSD9Qpym25bpH+2hjHSTA9A2EbxtixGA@mail.gmail.com>
Subject: Re: [PATCH v6] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-media@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Angelo,

Thanks for letting me know. Then, this patch is not needed.

Regards,
Pin-yen

On Mon, May 29, 2023 at 4:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/05/23 08:31, Pin-yen Lin ha scritto:
> > From: Alexandre Courbot <acourbot@chromium.org>
> >
> > When running memcpy_toio:
> > memcpy_toio(send_obj->share_buf, buf, len);
> > it was found that errors appear if len is not a multiple of 8:
> >
> > [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> >
> > This is because in ARM64, memcpy_toio does byte-size access
> > when the length is not a multiple of 8 while access to the
> > vpu iomem must be 4 aligned.
> >
> > This patch ensures the copy of a multiple of 8 size by calling
> > round_up(len, 8) when copying.
> >
> > Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM bu=
ffer.")
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> > ---
> > This is a re-send of v5 because it was marked obsolete, but this patch
> > is required for MT8173 platforms.
> >
>
> Hello,
> I have solved this issue in a different way and the commit was already pi=
cked.
>
> Please check:
> ab14c99c035d ("media: platform: mtk-mdp: Fix mdp_ipi_comm structure align=
ment")
>
> Regards,
> Angelo
>
