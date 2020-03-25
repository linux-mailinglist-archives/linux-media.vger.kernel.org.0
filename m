Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFCA19320A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 21:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgCYUpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 16:45:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51180 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbgCYUpm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 16:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=jeLX2eDvorNrgXxmnXUFLq3GqxHiIApgN7ztDvCeAso=; b=OkJcxH3c1qgGvhyuFVIArN7OYX
        d02hElVqTGg/qhhpLaU8hrK01yC/AhI2iFobDU6k7XGC65VzetnNv7Pcf+cFfH0b4+yjXTnOISCLA
        CNydCSXLyD+Awz2GqIjZxU9HfNSeqZssG4xZmORspOyFuAGa1oZIjCy5mMGCz/W02T5sQzkJxrS4C
        IaTIJ/pZV79z30nnWCPdcm9TpcVvFXTU/HYStGQW1apBsqpfq2oIJH9OKvFxOMtcleVQ2YFe96rAz
        fepKzeAK439dPx/IWCLXR+pBwJ3zKCRrHCpe7ZHfAxst0dPD8yGty8zVeHtPaVLDhnjdPgBobDP9I
        QfC/RHaw==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jHCuC-0003XO-F5; Wed, 25 Mar 2020 20:45:40 +0000
Date:   Wed, 25 Mar 2020 21:45:36 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>, sean@mess.org,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: We should settle on a name for the new DVB virtual driver.
Message-ID: <20200325214536.387c9494@coco.lan>
In-Reply-To: <66165ca2-1e48-2dbf-cf5b-c3b583e7d0c6@gmail.com>
References: <66165ca2-1e48-2dbf-cf5b-c3b583e7d0c6@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 25 Mar 2020 17:00:30 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> It has come to my attention that this patch=C2=A0 -=20
> https://patchwork.linuxtv.org/patch/62494/=C2=A0 - has reorganized a few=
=20
> directories in the media tree, pushing test drivers into their own=20
> directory.

True. Please notice that this was not applied yet. It may suffer some
changes, but yeah, it makes sense to have a separate directory for
test drivers.

> In an effort to reduce the amount of renaming down the line, and also to=
=20
> adapt to the new structure presented above I think it is a good time to=20
> come up with a name for the DVB virtual driver. It might also be a good=20
> idea to move it to its own directory as well while we're at it.

Yes, agreed.

> My personal preference is vidvb, which is somewhat in line with the=20
> naming scheme used by other virtual drivers for the media subsystem.

"vidvb" works for me, but maybe "vidtv" would even be better.

Regards,
Mauro

Thanks,
Mauro
