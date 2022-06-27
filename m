Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BEA55DB0E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236439AbiF0TWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 15:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233903AbiF0TWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 15:22:52 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9A2B4A8
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 12:22:52 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id n15so16251788qvh.12
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 12:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=bxBno7+SL6O/QexjLMo/vLGSojvzHFTdtEvsOic6/QY=;
        b=QIYUa+pnxTHN9Sa+6CZaesQzsxxxxr39mZpDszwhh1FS7daUt2Xnzo8c7FOPuunGlu
         3yjh41Y8FzFargtWOHXQAcKKNH8Qc3N5Hk2FI06ypzT18OrUNbl0UxCRjfYvizGU7vwQ
         iuSJM1mCDJLYeBp6Tg3TZUgJiB5Y09/z4THXCAtAVSci3lkvBdUyI9SluJfIZlezpCcC
         v+okhssj5/0VOEwHg7NSmvczeyG1poDBchOyd/0NP4Kayy6MdnROV5ur8WwMi3Gpa4s7
         aQ2gDLN1eOF6iPSwr9TvgeOD6DFbagMC4IyakmJz6C8/j8OXtjEzqAfJPEGVkCxeVwnd
         qlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=bxBno7+SL6O/QexjLMo/vLGSojvzHFTdtEvsOic6/QY=;
        b=n6WmImpU+ERTHShsTP9N5DIJgoZ+OrLJcnlPOcauO4Z+sfvkxJE9y9pzhp5CJgpTlp
         CbQXN6V1d03xkO+uLFvwXxPOGAwiIxBiDUjZet+blHOzbuoiY2HOyLMwfG4m3XyWsRxo
         ErRa254GZxngODvgCg+3DX8RI4tPSIPd3g0ZNTr2KGUEvdkpN6Mr0tcDS6EE/4PWB37I
         u7RDA04nU18eGbetCqviUxFHTHPbQuiGn1At6mipKYXe0jk53ZxJSRFoIu8QfLSJweQq
         2VpQBU9SXcwAcX99BFhD2HusW9+VwP1Wb+wB3+aMtcOD8hgH+lAbos0aKetlctWdZ/ob
         T0Kw==
X-Gm-Message-State: AJIora80RR/14z+BfLgr3oLYKT4O5J6VBOdNUWfU2Gobazxlkh57zSPj
        KlBwFZOm+zUjTgEtgieo1X0c2//s+Fgzqg==
X-Google-Smtp-Source: AGRyM1v8JGm0DemvwMerCZn0l7Blkmzxae72nXas4dBIoqWV/dSDHaim1DxfSEya2EvuIL9S1Diqmw==
X-Received: by 2002:a05:6214:2409:b0:432:bf34:362f with SMTP id fv9-20020a056214240900b00432bf34362fmr10174053qvb.66.1656357771243;
        Mon, 27 Jun 2022 12:22:51 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id bj35-20020a05620a192300b006af50b6f10csm79710qkb.61.2022.06.27.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:22:50 -0700 (PDT)
Message-ID: <813ace58a5334ff763ec28363e039f62151c0a0a.camel@ndufresne.ca>
Subject: Re: Proposal: A third buffer type for the reconstruction buffers in
 V4L2 M2M encoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     ayaka <ayaka@soulik.info>, linux-media@vger.kernel.org
Cc:     Randy Li <Randy.Li@synaptics.com>
Date:   Mon, 27 Jun 2022 15:22:49 -0400
In-Reply-To: <F81CE6D5-7081-477A-AA8D-9A9FC0228905@soulik.info>
References: <F81CE6D5-7081-477A-AA8D-9A9FC0228905@soulik.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mardi 28 juin 2022 =C3=A0 00:12 +0800, ayaka a =C3=A9crit=C2=A0:
> Hi All
>=20
> I think we need a separate buffer queue that manages those reconstruction=
 or
> auxiliary buffers for those V4L2 M2M drivers.
>=20
> There are some drivers already allocating internal buffers as the
> reconstruction buffers for its encoding instance. The
> driver/media/platform/chips-media is one here, its coda_alloc_context_buf=
()
> would allocate the max allowed references for its instance as the
> reconstruction buffers. You can't control the lifetime of the reconstruct=
ion
> buffer here, which means you can't control which buffers would be as the
> reference.
>=20
> It may look not bad for a hardware encoder that has a control chip that c=
ould
> do some encoding bitrate control. For those stateless encoders, which are
> controlled by the user completely, it would be better to let the user dec=
ide
> the lifetime of a reconstruction buffer.
>=20
> For the SVC situation, a layer may refer to a buffer in another layer, wh=
ich
> is encoded many times ago.

I would love to see a proposal for SVC support, that would greatly help to
understand where external reconstructed frames buffer management falls in. =
Just
"controlling lifetime" is to weak of a justification for the added complexi=
ty.

>=20
> I am not sure which way is better, I would implement one from the feedbac=
k.
> One is reusing V4L2_BUF_TYPE_VIDEO_OVERLAY, it would support REQ_BUFS,

I don't think a re-purpose is a good idea.

> SET_FMT, GET_FMT, QBUF, and DQBUF besides the existing m2m operations. An=
other
> idea is extending those ioctls to the media node that the stateless m2m d=
river
> uses for allocation request_fd token.

CODA goes passed this, it hides an internal pixel format, which have no use
outside of the chip. We'd have to introduce more vendor formats in order to
allow S_FMT and friend. Having to queue reference buffers also requires in =
depth
knowledge of the decoding process, which is for stateful decoder a miss-fit=
. I
think.

>=20
> Please notice that the reconstruction could use a different pixel format =
than
> the one used in input frames. For example, Hantro H1 could use the NV12_4=
L4 in
> its reconstruction buffer and an FBC format in the later generation of ch=
ips-
> media's codecs.
> Also, there are some decoders having an online post-processor. This means=
 it
> can't do pixel format transforming independently. The driver for those de=
vices
> may need this.

Even for decoder, when then is an inline post-processor, an extra set of bu=
ffer
is allocated internally.

I'm not sure what I could propose on top here, since there is very little
skeleton in this proposal. It is more a feature request, so stepping back a
little, perhaps we should start with real-life use cases that needs this an=
d
from there we can think of a flow ?

>=20
> Sincerely
> Randy

