Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB597252BF
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 06:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbjFGEUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 00:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbjFGEUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 00:20:03 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CB91FEA
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 21:17:01 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-46010179da6so1385594e0c.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 21:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686111415; x=1688703415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuclnzYeNveopGINoAYYFBKbv8upkWfI9n54Jz9FA3Q=;
        b=D73qIExEXrmex1ZlLVlh7POvJC210UlDrSai+53A+TZLy1S6QkaU4lB/pSpPaNtGlf
         q1M7a0egDbfTOn+Ngn6lrowfsL6s2T21Fp2MwKaWhKymknVUOD2tk86PresDkg2eX2BH
         HJvtUM9VHQJSD2gSuDvs8M5j/3AM+SLhqHBjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686111415; x=1688703415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuclnzYeNveopGINoAYYFBKbv8upkWfI9n54Jz9FA3Q=;
        b=OC+d5bsCdYUDDeIak+ntU5ReyY9wx/kzgy4HtbyrFJEyUSCKgO0LjsNbSM7UWpGJVu
         tjP3ovEm9jdwMFSQGMUMrdGDrH+d0XI6lu7Ox0v7okQdz3b1JPCHS1M8AX39dzqi8oIj
         OVkhFNS5gbsdcd6JyC1sY/lZPoDibWZQ5fZBBXXPeRRlQyBx06hKKJzl5XjibtilVcmd
         rSmlw+kl0sCZQSGCsoNOjZjErlYRIUhbcFV+nTnIDR/UraW3aH2Za2v81VuKS+zAevYl
         0+xnhhA/mDKOhCWVq5JvdY6WDdNlOBnYH9Z+Gu5aP9B41qsLvwTvrbyuNb4Gt5s0qP2a
         VLxA==
X-Gm-Message-State: AC+VfDx+7XuyZdAccqg1l3w0X7qSYb5dPZ6LN0vcyzhnrY4EaBRFIjTv
        Ng5mHAnJXKtA+KF+bUGDsN6Gw7PSfFUfLoJ1tek=
X-Google-Smtp-Source: ACHHUZ7eZM+gUw6TDIKRGQKsomXrepvT2m6nCC7Dj3ZcgUpOlfr8+bKFqoVofrQjFPyIC0msAvpf5A==
X-Received: by 2002:a1f:41c8:0:b0:461:b166:8310 with SMTP id o191-20020a1f41c8000000b00461b1668310mr1393534vka.3.1686111415609;
        Tue, 06 Jun 2023 21:16:55 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id k18-20020a05612212f200b0045a6d3e046esm1390134vkp.4.2023.06.06.21.16.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 21:16:54 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-46131c80909so1262258e0c.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 21:16:53 -0700 (PDT)
X-Received: by 2002:a1f:6d81:0:b0:457:134a:50ef with SMTP id
 i123-20020a1f6d81000000b00457134a50efmr1490189vkc.0.1686111413362; Tue, 06
 Jun 2023 21:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
 <20230525014009.23345-2-yunfei.dong@mediatek.com> <b32b82f5-8555-39cf-9311-017a42b24e66@collabora.com>
In-Reply-To: <b32b82f5-8555-39cf-9311-017a42b24e66@collabora.com>
From:   Fei Shao <fshao@chromium.org>
Date:   Wed, 7 Jun 2023 12:16:17 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhM26=2FTtVjVvo6d0aWqo+KVa1s9=8xHL1VgYSqkuDvQ@mail.gmail.com>
Message-ID: <CAC=S1nhM26=2FTtVjVvo6d0aWqo+KVa1s9=8xHL1VgYSqkuDvQ@mail.gmail.com>
Subject: Re: [PATCH v4,1/4] media: mediatek: vcodec: Avoid unneeded error logging
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 25, 2023 at 4:11=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/05/23 03:40, Yunfei Dong ha scritto:
> > Since the LAT decoder works faster than its CORE, getting the trans
> > buffer may be done only after CORE finishes processing: avoid printing
> > an error if the decode function returns -EAGAIN, as this means that
> > the buffer from CORE is not yet available, but will be at a later time.
> >
> > Also change the log level for calls to vdec_msg_queue_dqbuf() in H264
> > and VP9 LAT decoder drivers to avoid excessive logging.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
