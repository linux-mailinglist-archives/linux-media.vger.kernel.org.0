Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F0D39702F
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 11:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbhFAJU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 05:20:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:43186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231139AbhFAJUz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 05:20:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B8C4610C9;
        Tue,  1 Jun 2021 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622539154;
        bh=6Er6l12ar/ez4rBGzampK8mAPf2M6VtNhVvzSo+mIF4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fi7HXlh2cwnEF6vwhnVKxLyhjHf8y/XLZosflr6UfEjEBO+j7xBum9NwpSvCOp5HX
         htakLoDJpKU83jQSKGyGAFMr+Rq0B/x4Mg8/VzUFQEM2wvJUqcrBBjg/PC5fnVxHBz
         YvY6UZUTw9YlV0NPThDt6Zv8qrMHy6yChkBE5BXUeCpHPbTEi7RJGnglHVGRpHOsgs
         zEi5nIsV35SBCziDVjRW8ThcUd1J2748CnJHKxI6hu9hv0D7rFgdoQmbcMTXgE/Yey
         Ajdq3XJfEWLb0qxF4qCoUlN4tXH8HqbVOF17RfFb4cWu4CIDzK08NU0Uij6aPueHgl
         ZvDqhccJC67uA==
Date:   Tue, 1 Jun 2021 11:19:10 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] media: av7110_v4l: Fix build error
Message-ID: <20210601111910.11df774f@coco.lan>
In-Reply-To: <20210601111617.5856e175@coco.lan>
References: <20200909133844.6812-1-yuehaibing@huawei.com>
        <20210601111617.5856e175@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 1 Jun 2021 11:16:17 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Wed, 9 Sep 2020 21:38:44 +0800
> YueHaibing <yuehaibing@huawei.com> escreveu:
>=20
> > drivers/media/pci/ttpci/av7110_v4l.c: In function =E2=80=98vidioc_s_fre=
quency=E2=80=99:
> > drivers/media/pci/ttpci/av7110_v4l.c:163:11: error: SSE register return=
 with SSE disabled
> >   if (freq < 16U * 168.25)
> >       ~~~~~^~~~~~~~~~~~~~
> > Get rid of float pointing math to fix this.
>=20
> Out of curiosity: what compiler are you using? This sounds to be a compil=
er
> issue, as compiler should be optimizing the code by doing the math evalua=
tion
> at compile time instead of doing it during runtime.

Nevermind. A similar patch was already applied upstream.

Please ignore this e-mail.

Thanks,
Mauro
