Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC03D5179
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2019 20:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbfJLSC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Oct 2019 14:02:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44288 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbfJLSC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Oct 2019 14:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kIXNVhGXWi2oG5ZBfvydGma5EGr4jmXkENGYfFlmAPw=; b=JhoZfEictj3xHafj5aUL/j9QY
        Sve3nUCz8z5Kl0SsYOjl+gwn3aPsPjq0C5IOy6VgVrTKZzQXMupsoAdQUZ0ceBIKCqNshUmwAzE2f
        Ayz86JcXL/o4ftDpYXS+GTb4kS3ZT8fEo64TELKyo7nfRw5iKT7kH3I8d5l7te9QHqmi2yG6bCLOX
        RqH4dUm/ZFjHJ85X1FTXYvE/HOqBHbLhhwpspoFbP8pLIpR/mBk+r/BeQ6XfUVw9udeZEQdKNGSzJ
        TQh/eZMfDiKHFohPM4oC4hMpFZFPyrXWFEyMOqHfm/1hLd/2mlne9yibUBzRbrhRof3l9wOV8XZF3
        NVDoqQtJg==;
Received: from 177.17.141.107.dynamic.adsl.gvt.net.br ([177.17.141.107] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iJLii-0006CY-PE; Sat, 12 Oct 2019 18:02:25 +0000
Date:   Sat, 12 Oct 2019 15:02:20 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     clangers@toucansurf.com
Cc:     linux-media@vger.kernel.org
Subject: Re: v4l-utils  undefined symbol: dvb_dev_alloc
Message-ID: <20191012150220.1bff18ed@coco.lan>
In-Reply-To: <35A2C1D4-DE40-490C-AFE6-E426EC1EC0AC@toucansurf.com>
References: <35A2C1D4-DE40-490C-AFE6-E426EC1EC0AC@toucansurf.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 12 Oct 2019 18:28:41 +0100
_ _ _ _ _ <clangers@toucansurf.com> escreveu:

> I've been waiting for a working version of DVB-S2 capable tools and utili=
ties to appear in a stable release of Mint=10, but  it hasn't happened yet,=
 so I decided to build the latest stable v4l-utils from source.
>=20
> I built v4l-utils version 1.18.0 on Linux Mint 18.3
>=20
> the compilation process appeared to run through OK with only 9 warnings (=
see below), but the resulting executables fail due to a lib ref issue.
> configure: WARNING: doxygen not found - will not generate any doxygen doc=
umentation
> configure: WARNING: libelf library not available
> configure: WARNING: Qt5 or higher is not available
> configure: WARNING: ALSA library not available
>   CC       control/libv4lconvert_la-libv4lcontrol.lo
> control/libv4lcontrol.c: In function =E2=80=98v4lcontrol_create=E2=80=99:
> control/libv4lcontrol.c:728:3: warning: ignoring return value of =E2=80=
=98ftruncate=E2=80=99, declared with attribute warn_unused_result [-Wunused=
-result]
>    ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
>    ^
> libtool: warning: relinking 'libv4l2.la'
> libtool: warning: relinking 'v4l2convert.la'
> libtool: warning: relinking 'libv4l1.la'
> libtool: warning: relinking 'v4l1compat.la'
>=20
> Most of these look insignificant but the fifth one looks a bit worrying.

Shouldn't have any real consequence. it is just because there's nothing
like:

	ret =3D ftruncate(...)
	if (ret) {
		/* some error handling logic */
	}

>=20
> End result :-
>=20
> stupiduser@somehost ~ $ gcc --version
> gcc (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 2016060
>=20
> stupiduser@somehost ~ $ dvbv5-scan -V
> dvbv5-scan version 1.18.0
>=20
> stupiduser@somehost ~ $ dvbv5-scan /usr/share/dvb/dvb-s/Astra-28.2E
> dvbv5-scan: symbol lookup error: dvbv5-scan: undefined symbol: dvb_dev_al=
loc
>=20
> stupiduser@somehost ~ $ dvb-fe-tool -m -a0=20
> dvb-fe-tool: symbol lookup error: dvb-fe-tool: undefined symbol: dvb_dev_=
alloc

Probably you have an older version of DVB libraries installed on
your machine. It is trying to use the older library when you try
to run it.

There are some ways of solving it:

1) Make configure to override the old library with:

	./configure --prefix=3D/usr

(the default is to install it at /usr/local)

2) Ensure that the dynamic linker will use the libraries from
/usr/local

Depending on how your distro is set, you could need to add a
new file at /etc/ld.so.conf.d/, in order to teach the dynamic
linker to use the /usr/local/lib directory to seek for libraries.

For example, create a "/etc/ld.so.conf.d/local.conf" file, and make the
system use it by running, as root:

	# echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf
	# ldconfig=20

PS.: You may need to remove a previous install of the V4L and DVB
libs, in order to avoid any conflicts.

3) use the environment var LD_LIBRARY_PATH in order to add=20
/usr/local/lib to the list of directories it will seek for a=20
library.

Thanks,
Mauro
