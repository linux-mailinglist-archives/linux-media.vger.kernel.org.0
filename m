Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F3E543242
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 16:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241020AbiFHOMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 10:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241014AbiFHOMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 10:12:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290961E300B
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 07:12:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A1B4A6601843;
        Wed,  8 Jun 2022 15:12:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1654697531;
        bh=hQUP7cEI0AWKsbc9SQmbhIi2CTWYXwaOWDPEI4VofXQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=E0eL7kltgQq2ZAZKx2e5jZ+eueeYtVZUMwXeFc9bYmTNqsx6HrPp8bUsLR1AvCacX
         pSzbDgAw1M727zBcn0olTSctecLSGCNqGqWB+A5iAX4GOtvqd0CBw4HTbFn2GaqJzA
         ZkQjour43Q4QoLeA0ZagsVNRI/D/AKpueBYbQu/LUT0rH1KnGwmalW80l3vhFbbFAs
         9I+6Mk7/VyxtyzIfZNkNw8X6vcOMdbYKek+JAgIYOhbmcFFMMbQcIMs8TBTBLClQZg
         3ue0HPTEbPChLjZb1uOxnyAVc9iyAsJ0YAVZe9Yi1KnvBOHBVj9oIiL0adIe2aFHQZ
         tCfKDgBHQIagA==
Message-ID: <9193f2c255211dc480368b8b83b9e7e3ddb725c0.camel@collabora.com>
Subject: Re: [PATCH] mediatek/vcodec: Enable incoherent buffer allocation
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Justin Green <greenjustin@chromium.org>,
        linux-media@vger.kernel.org,
        "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
        "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
        mchehab@kernel.org,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Date:   Wed, 08 Jun 2022 10:12:00 -0400
In-Reply-To: <Yp8hI3654zQ+3WcE@google.com>
References: <CAHC42RegxBFjqMwR2gv8EwqE0FG+oS7QA9rcopapktf7tD_y-g@mail.gmail.com>
         <YpbDJ+PUmUTcOD3n@google.com>
         <CAHC42RfnEmBzzLpRikJovq6-E-VWf04Wxrc6Go96y5w2MKT2YQ@mail.gmail.com>
         <92a0163fa2bb20a5c577ca0222e497f0e2bee926.camel@collabora.com>
         <Yp8hI3654zQ+3WcE@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 07 juin 2022 =C3=A0 18:57 +0900, Sergey Senozhatsky a =C3=A9crit=
=C2=A0:
> On (22/06/01 11:13), Nicolas Dufresne wrote:
> > I'd be very interested to learn from Sergey on why this feature wasn't =
enable
> > more broadly.
>=20
> Well, we needed this for one particular device and we didn't plan on
> expanding this to drivers that we cannot test, verify, etc. and for
> the hardware that we don't run.

Fair enough, should have been better documented, as folks may expect more t=
hen a
single driver supporting it. I'll see if I can improve this. Justin's use c=
ase
it to improve performance of software conversion of HW decoded frames. So h=
e's
only reading the buffer, so dmabuf/mmap is not as relevant here.

>=20
> > I notice though the begin/end access bits have not been
> > implemented, so when used with DMABuf, this isn't going to behave quite=
 right by
> > default.
>=20
> We cared only for MMAP buffers. Got time to cook patches?

Eventually, my ultimate goal is try and complete the DMABuf support in V4L2=
,
this code you added in the contiguous allocator also exist in the SG and vm=
alloc
one in some form (and is pretty generic), and both are also missing the
begin/end ops for DMABuf (only works for MMAP), including tracking the atta=
ched
device coherency. If that code was complete, I think we could eventually ma=
ke
this feature available by default (but not turned on, as I suspect flush
overhead will regress some use cases).

The memory synchronization support we have now is all for MMAP, and is in
general very inefficient for DMABuf were we know more about the importer. M=
ost
devs seems to have avoided this problem. I felt like your hint work was par=
t of
it, but of course, if you were not using DMABuf, those hints are needed in
replacement to DMABuf Sync API (which can be used for the same purpose). Pe=
rhaps
not great that we duplicate modern API into legacy kind of APIs, but as lon=
g as
V4L2 supports mmap, there is little choice but to do that.

Nicolas
