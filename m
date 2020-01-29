Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6A014C69C
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 07:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgA2Glx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 01:41:53 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42926 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgA2Glx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 01:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=UzxtC+5VKBmSK8pmD0yb1S41XbcWrtzdaXNSIIHui54=; b=dSdGRKvUYMFNHsiKFu5YuUiyZ
        0sdPxaahmZDTEyOlzi+8Elkpk5T4bDFoaHa8iJAsa4J0PlYmy/itZjcdp11VP09D9fv4a4OEOKuN0
        xe3QW131QpZS0ihapPIYxf6+usFhsftbgl2HbpQzt7UySu9sldJGJNrPwk+EXl9RqPiAXUtbUBveR
        2xnRa4g/ifl8l3WNTTAXBScM+ERTLvgI+7g6zpot8tnxo/JPIpR/TCyN2tH+tKcCgHdj1K9jf0/FF
        NK8hPv+bx3J5e6vaK8LtDOn1hCH5NV/P6zP/R5kzYBH5LF6F7FesxY1pZCTs/va+HxrgStEUm/4GC
        fh897q11g==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwh2t-00083K-6H; Wed, 29 Jan 2020 06:41:51 +0000
Date:   Wed, 29 Jan 2020 07:41:46 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: usb: remove some broken references
Message-ID: <20200129074146.5f6077ca@kernel.org>
In-Reply-To: <244ed240-46aa-aa73-6f89-df7944d42cbf@infradead.org>
References: <00008303fde6b4e06d027d3b76ae7032614a7030.1580193653.git.mchehab+huawei@kernel.org>
        <20200128134228.3c6f56b9@lwn.net>
        <244ed240-46aa-aa73-6f89-df7944d42cbf@infradead.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 28 Jan 2020 15:47:18 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 1/28/20 12:42 PM, Jonathan Corbet wrote:
> > On Tue, 28 Jan 2020 07:41:00 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >  =20
> >> It seems that some files were removed from USB documentation.
> >>
> >> Update the links accordingly.
> >>
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =20
> >=20
> > Applied, thanks.
> >=20
> > jon =20
>=20
> This warning has been around for quite awhile now:
>=20
> lnx-55/Documentation/usb/text_files.rst:22: WARNING: Include file u'lnx/l=
nx-55/Documentation/usb/wusb-cbaf' not found or reading it failed
>=20
> Looks like it has been moved to drivers/staging/wusbcore/Documentation/wu=
sb-cbaf.

=46rom the log of the patch that moved it:

  commit 71ed79b0e4be0db254640c3beb9a1a0316eb5f61
  Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Date:   Tue Aug 6 12:15:09 2019 +0200

    USB: Move wusbcore and UWB to staging as it is obsolete
   =20
    The UWB and wusbcore code is long obsolete, so let us just move the code
    out of the real part of the kernel and into the drivers/staging/
    location with plans to remove it entirely in a few releases.
   =20
    Link: https://lore.kernel.org/r/20190806101509.GA11280@kroah.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The plan seems to remove it in the future.

In any case, it makes sense to remove the broken link from the=20
documentation.

Cheers,
Mauro
