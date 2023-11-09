Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E377E62D3
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 05:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbjKIE1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 23:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjKIE1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 23:27:47 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9562269F
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 20:27:45 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so588713a12.0
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 20:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699504063; x=1700108863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=Je/5w0H2VO8Ome6eJ7oQHEPbPQAcgcI+ks9aRuQH1gaBxFGW63U0vrrs3uwyPMnP0Q
         bfP59PTq29EUh55J1tJylIeokClozwOM4i6lxZ4DPB0I8FoCEQeu2ApmXfS2T1HDVMrI
         h6r1F9JeL5ANzS+2wCMylvEE3JbZrofylmWxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699504063; x=1700108863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=WgKUgAeCNdqdSgl1YHpK/cBuEDQHygjXpZ/ub14RzChl2V3LxHHffz1Lnr6iQbN8uE
         oozTJlW0tntULFa6O75kMuBgzt74/YhByLkZznRovnZtQj7ryixq/I+C0SNWzA5T8wxQ
         KT42oo/Dr4dP2qQdsHXYh6wIfUvAL/yIiFOTdJNHLZgiqPDtJI4BY1xmKYhLUzBN+079
         Vm1SNytlCR82FTI77bk5/LKvyVT1dE1Yhl/MCL70okbkrLoRH70vMj5klDpowng/tZZ+
         Xq9+RHgoIW3B+miduL/jqKWGry1h1Y1iCBwxrDAIpArZBMdoQFrtoupn7UC/Fcj4Q81d
         J9Ag==
X-Gm-Message-State: AOJu0YyZwuI1mZEVbGm4UqfClGNw0aE8x0B4bTXzJUG9C5JSMo9fN7CB
        EhrNBy3zZjzLVNx68iJQrisX4DIZsYMxTwz260g4+X0l
X-Google-Smtp-Source: AGHT+IHA7y4IHMgTmIquTQf2p6/NmDtoY7C8TsDDL3mQDcxUyXDJ2adEjkCTW2V2sTTSueb9uMvC+g==
X-Received: by 2002:a50:c09a:0:b0:53f:731a:e513 with SMTP id k26-20020a50c09a000000b0053f731ae513mr2971644edf.25.1699504063548;
        Wed, 08 Nov 2023 20:27:43 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id m6-20020a50ef06000000b00543525d9fddsm7431417eds.21.2023.11.08.20.27.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 20:27:43 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso2529615e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 20:27:42 -0800 (PST)
X-Received: by 2002:a05:600c:4ecd:b0:405:7400:1e3d with SMTP id
 g13-20020a05600c4ecd00b0040574001e3dmr3298654wmq.32.1699504062425; Wed, 08
 Nov 2023 20:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-6-benjamin.gaignard@collabora.com> <20231108085016.3kmhmdroh4qs53f5@chromium.org>
 <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
In-Reply-To: <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 9 Nov 2023 13:27:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Subject: Re: [PATCH v14 05/56] media: videobuf2: Access vb2_queue bufs array
 through helper functions
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 8, 2023 at 7:24=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 09:50, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:30:13PM +0100, Benjamin Gaignard wrote:
> >> This patch adds 2 helpers functions to add and remove vb2 buffers
> >> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> >> struct vb2_queue becomes like a private member of the structure.
> >>
> >> After each call to vb2_get_buffer() we need to be sure that we get
> >> a valid pointer in preparation for when buffers can be deleted.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++---=
--
> >>   .../media/common/videobuf2/videobuf2-v4l2.c   |  50 ++++--
> >>   2 files changed, 149 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers=
/media/common/videobuf2/videobuf2-core.c
> >> index 968b7c0e7934..b406a30a9b35 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -408,6 +408,31 @@ static void init_buffer_cache_hints(struct vb2_qu=
eue *q, struct vb2_buffer *vb)
> >>              vb->skip_cache_sync_on_finish =3D 1;
> >>   }
> >>
> >> +/**
> >> + * vb2_queue_add_buffer() - add a buffer to a queue
> >> + * @q:      pointer to &struct vb2_queue with videobuf2 queue.
> >> + * @vb:     pointer to &struct vb2_buffer to be added to the queue.
> >> + * @index: index where add vb2_buffer in the queue
> >> + */
> >> +static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buff=
er *vb, unsigned int index)
> >> +{
> >> +    WARN_ON(index >=3D VB2_MAX_FRAME || q->bufs[index]);
> > nit: Would it make sense to also ensure that vb->vb2_queue is NULL?
>
> Since vb->vb2_queue and q->bufs[index] are always set and clear in the sa=
me
> functions I don't think it is useful to test the both here.
>

Well, they are if the caller is not buggy. But I suppose the check is
to detect buggy callers?

For example, an m2m driver could accidentally call this on a buffer
that was already added to another queue.

Best regards,
Tomasz
