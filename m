Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E059697B15
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 12:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjBOLsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 06:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbjBOLsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 06:48:03 -0500
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E4934332;
        Wed, 15 Feb 2023 03:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1676461678; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eK7FTufvvh/PUkMPLhMCuTLvlOakIRiSdHn809pGIAM=;
        b=gt34pCB7dpTTgzPuIlKNZ9EszHHnoZQoVSn7txesg55cbL/5cgURvw71ZGr+OeLlUD3orH
        a9e8gMsV+mHZbxv3FYnqPW4NRZnR3hTGkp9rLXcdGmtaCt1bbzFNuVhAEAkWNr/WwjjzQ5
        stQeYpxs/6nMbC/q3iNPiKhKu21usq8=
Message-ID: <d540965a25138772fa063d62e907ffd611f93205.camel@crapouillou.net>
Subject: Re: Question: partial transfers of DMABUFs
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Date:   Wed, 15 Feb 2023 11:47:55 +0000
In-Reply-To: <836d600a-bb1c-fbb2-89f5-7c79c3150e8c@linux.intel.com>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
         <836d600a-bb1c-fbb2-89f5-7c79c3150e8c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maarten,

Le mercredi 15 f=C3=A9vrier 2023 =C3=A0 12:30 +0100, Maarten Lankhorst a =
=C3=A9crit=C2=A0:
> Hey,
>=20
> On 2023-02-15 11:48, Paul Cercueil wrote:
> > Hi,
> >=20
> > I am working on adding support for DMABUFs in the IIO subsystem.
> >=20
> > One thing we want there, is the ability to specify the number of
> > bytes
> > to transfer (while still defaulting to the DMABUF size).
> >=20
> > Since dma_buf_map_attachment() returns a sg_table, I basically have
> > two
> > options, and I can't decide which one is the best (or the less
> > ugly):
> >=20
> > - Either I add a new API function similar to
> > dmaengine_prep_slave_sg(),
> > which still takes a scatterlist as argument but also takes the
> > number
> > of bytes as argument;
> >=20
> > - Or I add a function to duplicate the scatterlist and then shrink
> > it
> > manually, which doesn't sound like a good idea either.
> >=20
> > What would be the recommended way?
>=20
> Does this need an api change? If you create a DMA-BUF of size X, it
> has=20
> to be of size X. You can pad with a dummy page probably if you know
> it=20
> in advance. But after it has been imported, it cannot change size.

Yes, the sizes are fixed.

> You don=C2=B4t have to write the entire dma-buf either, so if you want to=
=20
> create a 1GB buf and only use the first 4K, that is allowed. The=20
> contents of=C2=A0 the remainder of the DMA-BUF are undefined. It's up to=
=20
> userspace to assign a meaning to it.
>=20
> I think I'm missing something here that makes the whole question
> m,ake=20
> more sense.

I want my userspace to be able to specify how much of the DMABUF is to
be read from or written to.

So in my new "dmabuf enqueue" IOCTL that I want to add to IIO, I added
a parameter to specify the number of bytes to transfer (where 0 means
the whole buffer).

The problem I have now, is that the current dmaengine core does not
have a API function that takes a scatterlist (returned by
dma_map_attachment()) and a transfer size in bytes, it will always
transfer the whole scatterlist.

So my two options would be to add a new API function to support
specifying a bytes count, or add a mechanism to duplicate a
scatterlist, so that I can tweak it to the right size.

> ~Maarten

Cheers,
-Paul
