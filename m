Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D64A505F1
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 11:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfFXJkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 05:40:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52196 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfFXJkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 05:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=SQGku99uBgbU7ma59D3XS3nWDVO1r+EpJl/3CtZ3/N0=; b=UXXV/FCTkYY4tDQstf35czmEu
        HoKMp2KEqqW32I1D3m08tCAUVFTQdpB8EJJ7PALxvC10iL6GnkwQOupXW46r2Et8rLiCqgV6TjPge
        pgUnWPKQjSlj8Zv1gcFk4AzmM+TV2MpY0k01uC5oNM4nSP6SkpVwYViVwK2n+I/SL2X3Q3jZr17ig
        rDXf2S91eztUD7UmqtrN1OG5Lth3fgIp6g5hqatYrH5qEgLGODCQ2tw4LmPouM4BYhAkH7N71NR5C
        /pQ+g6B5jUMuo2ABLKZcY3to968zK5+g13rM8+Fa3mgsO5GGge0OjhGK497rEfhtitCIedgHEx0eM
        eQQszieKw==;
Received: from [179.95.45.115] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfLSJ-00062B-PH; Mon, 24 Jun 2019 09:40:08 +0000
Date:   Mon, 24 Jun 2019 06:40:04 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        helen.koike@collabora.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] media: vimc: stream: format comments as kernel-doc
Message-ID: <20190624064004.224cccfb@coco.lan>
In-Reply-To: <a1973442-5ccb-5ba3-e508-132514b6e83e@collabora.com>
References: <20190623164024.9836-1-andrealmeid@collabora.com>
        <20190623164024.9836-3-andrealmeid@collabora.com>
        <a1973442-5ccb-5ba3-e508-132514b6e83e@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 23 Jun 2019 18:27:22 -0300
Andr=C3=A9 Almeida <andrealmeid@collabora.com> escreveu:

> On 6/23/19 1:40 PM, Andr=C3=A9 Almeida wrote:

> > - * Calls s_stream to enable stream in all entities of the pipeline.
> > + * Calls ``vimc_streamer_s_stream`` to enable stream in all entities o=
f =20
> ``vimc_streamer_s_stream`` could also been written as
> :c:func:`vimc_streamer_s_stream`. In this latest setup, the
> Documentation output would display a nice hyperlink to the documentation
> of=C2=A0 vimc_streamer_s_stream function. Is this a good improvement or it
> will be too verbose?

The best would be to use: vimc_streamer_s_stream(). Kernel-doc already
handles it (don't remember if it uses :c:func:, but I guess it does),
and this is the recommended way.

Anyway, there's a patch under discussion right now at Linux docs ML that=20
will auto-replace these to :c:func`` automatically, not only on kernel-doc
tags, but also within the .rst files. It should be able to recognize
existing :c:func: tags, so no harm done if it is there somewhere.

Thanks,
Mauro
