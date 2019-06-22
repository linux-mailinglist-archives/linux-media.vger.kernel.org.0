Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5CF44F85B
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 23:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfFVV6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 17:58:51 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52898 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfFVV6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 17:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=me29Zf11xoxFtU1yC8+ub+hR7h7A8THD7PgX16YAKdg=; b=MutIyoB/SRS6uVgqTcil8z4ed
        crDdeYP/YtYk+I7x4Kw2tYS9fJ9BxKMduORjBY8dj2//x5H1uHnW6tM43sydwRznWC0wYG+DZYcRv
        /V6YL5ZwEjTexaIupn1ku6aCs5ch/eazKRMhNvkkSNY8Cd7tTlZVXOZUZYqkGWLMaROSgxqVuULEc
        NnEDedKYRuV8UjwQIaufGzmFuehqK0wd29GEaETlY86IHR61wBbjNFtXl72UvsT3iqeSo0OE+sTQz
        XaDiGY0syDzEqiztfyo5SKd1fGLAh8XZT4s2uekN0qVlj2JL+ACkdo4544soNSdkCp7coq4eNRbhz
        1kZ0Gs5Sg==;
Received: from [179.95.45.115] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1heo24-0007cP-Hx; Sat, 22 Jun 2019 21:58:48 +0000
Date:   Sat, 22 Jun 2019 18:58:44 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        helen.koike@collabora.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: vimc: stream: add missing function
 documentation
Message-ID: <20190622185844.4b2392a3@coco.lan>
In-Reply-To: <c9602b72-7dbb-47ad-97ef-9348d7e1c3e9@collabora.com>
References: <20190617133221.21246-1-andrealmeid@collabora.com>
        <20190621181705.44415597@coco.lan>
        <c9602b72-7dbb-47ad-97ef-9348d7e1c3e9@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 22 Jun 2019 18:51:06 -0300
Andr=C3=A9 Almeida <andrealmeid@collabora.com> escreveu:

> Hello Mauro,
>=20
> On 6/21/19 6:17 PM, Mauro Carvalho Chehab wrote:
> > Em Mon, 17 Jun 2019 10:32:20 -0300
> > Andr=C3=A9 Almeida <andrealmeid@collabora.com> escreveu:
> > =20
> >> Add comments at vimc_streamer_s_stream and vimc_streamer_thread, making
> >> the vimc-stream totally documented. =20
> > I'm applying it right now.
> >
> > Yet, if this is fully documented, IMO you should add it to
> > Documentation/media/v4l-drivers, replacing the comments to kernel-doc
> > markups. =20
>=20
> This suggestion is a great improvement and it's simple to apply to the
> source. Where do you believe we can place this at[1]? Maybe something like
>=20
>=20
> Source code documentation
> -------------------------
>=20
> vimc-streamer
> ~~~~~~~~~~~~
>=20
> .. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.c
>    :internal:
>=20
>=20
> at the end of the file?
>=20
Yeah, this should be enough.

> > That would make easier for the ones to read the comments and, if someone
> > changes a function call, warnings will be produced, and the developer
> > will be warned.
> > Thanks,
> > Mauro =20
>=20
> Thanks,
> =C2=A0=C2=A0=C2=A0 Andr=C3=A9
>=20
> [1]
> https://git.linuxtv.org/media_tree.git/tree/Documentation/media/v4l-drive=
rs/vimc.rst
>=20



Thanks,
Mauro
