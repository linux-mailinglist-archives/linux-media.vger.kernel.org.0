Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9DC3D5225
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 06:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhGZDYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 23:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbhGZDYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 23:24:39 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495C0C061760
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:05:08 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id da26so8823050edb.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IIvcSyU1E65bR7w1DDg8slGET/s8Q+m7sc5AZf8NFiE=;
        b=hMUCP2c9a3KgKSQMGqbSls3L6icE6DQGge9ygXLIKD6TRuRMyExvyHjwxw0zKcC9T8
         nIRCN687oSlbROKVwvlrRTnF5QE4Zqpr3ZHO7ugRFTWJW6BlSRMOnpyLdS61LYBkYHnM
         N2/1CvH+wigM0xKkoQBTL0QsgmHN+4GbsEGNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IIvcSyU1E65bR7w1DDg8slGET/s8Q+m7sc5AZf8NFiE=;
        b=ok2C8zbFP0MxSiyHczdBggEPbSJx/rC0XlJVw5Vo75hNFjhPoL3WmMR5m3n3ey9h8g
         Y7eBzb8drZTlfhIYDKvAjed8KqvhGnY6NCXNb8RQrRxT2EjbnSN6DT06yjHNWVO98isZ
         l89eEaNyxghvZI5pHAUAluTxZGpy2ArG7OV0bxesdGqisc2uSDP2/p7dog0C1Wk0Wc4+
         hgh8P+sbn2PcyDXPjVhlDuW/P014bcrUcG0jABoDUCFX2iiBTh7h67wlVsOoOTaWcSOC
         6TREsE0yJ8Nv2i2ZYKi30S9SXPBajr9mRrb4/3BZkRDzzuFHJViKnbi8AupyoUIunSIg
         eDDA==
X-Gm-Message-State: AOAM530gBeJOak6MfcpdraK8UBf9TwTbgELa6glZpBVSxjl3rNHwEux3
        EEFKKF4NNvEocNGdtA6S7L5bnL+nc0tcoQ==
X-Google-Smtp-Source: ABdhPJy1Wg2wmNd/Khzk6AaFQG+0pIHdvgu2QbP3DMuTy5XhVbUNCv+A/UDpQqLecnhxDG7yfuiSvQ==
X-Received: by 2002:a05:6402:452:: with SMTP id p18mr18820901edw.34.1627272306513;
        Sun, 25 Jul 2021 21:05:06 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id w10sm13793130ejb.85.2021.07.25.21.05.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jul 2021 21:05:05 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id b9so8567163wrx.12
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:05:05 -0700 (PDT)
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr16953638wrs.192.1627272305067;
 Sun, 25 Jul 2021 21:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-9-senozhatsky@chromium.org> <3c80786a-7422-3736-7261-8605260eb99f@collabora.com>
 <YP4zHRh+jHJGbNHz@google.com>
In-Reply-To: <YP4zHRh+jHJGbNHz@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 26 Jul 2021 13:04:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D6hSoLJaBMdV-fpzn43Y6qRULR4ckejrJp_89Qpe6Xnw@mail.gmail.com>
Message-ID: <CAAFQd5D6hSoLJaBMdV-fpzn43Y6qRULR4ckejrJp_89Qpe6Xnw@mail.gmail.com>
Subject: Re: [PATCHv3 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 12:59 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (21/07/22 19:26), Dafna Hirschfeld wrote:
> > Also, the 'cookie' cb returns buf->dma_addr which is not initialized for
> > the noncontiguous api. So it is not clear how drivers should use the new api.
> > Many drivers call vb2_dma_contig_plane_dma_addr which returns the cookie.
>
> Hmm, that's a good find. Is ->dma_addr the same as what we have in
> sgt.sgl->dma_address for non-contig?

Yes. As per [1]:

"The return sg_table is guaranteed to have 1 single DMA mapped segment
as indicated by sgt->nents, but it might have multiple CPU side
segments as indicated by sgt->orig_nents."

[1] https://www.kernel.org/doc/html/latest/core-api/dma-api.html#part-ii-non-coherent-dma-allocations
