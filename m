Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A41F25C292
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 16:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729306AbgICO2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 10:28:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729353AbgICO2J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 10:28:09 -0400
Received: from coco.lan (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 521892072A;
        Thu,  3 Sep 2020 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599143276;
        bh=RpJ/Acz/rkFmpeYcR0KIQTeH7ShlVwP3XrcWxrYHMBg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YiD9KinC/bM6LRtBh7UMcfZV76qOTfP9S/SPTFurA4lfiNopWQVaOWwypGZhMtf6h
         xvM8EOYhHRnh0poIRllkIuhQFm/V6IByyWXAhdm0zpJqhR5bAsxa4xW9yAZX2NbxvX
         9aTQsVDku6BfHP3ww1QpHdVBkuo+5OXM9H5V/6RM=
Date:   Thu, 3 Sep 2020 16:27:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] media: atomisp: get rid of
 -Wsuggest-attribute=format warnings
Message-ID: <20200903162751.1dd13300@coco.lan>
In-Reply-To: <20200903140724.GE1891694@smile.fi.intel.com>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
        <6c77d765707b1e6b2901fd23d85b4d032f1a1799.1599141140.git.mchehab+huawei@kernel.org>
        <20200903140724.GE1891694@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Sep 2020 17:07:24 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> On Thu, Sep 03, 2020 at 03:57:32PM +0200, Mauro Carvalho Chehab wrote:
> > There are some warnings reported by gcc:
> > 	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:164:2: warni=
ng: function =E2=80=98atomisp_css2_dbg_print=E2=80=99 might be a candidate =
for =E2=80=98gnu_printf=E2=80=99 format attribute [-Wsuggest-attribute=3Dfo=
rmat]
> > 	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:170:2: warni=
ng: function =E2=80=98atomisp_css2_dbg_ftrace_print=E2=80=99 might be a can=
didate for =E2=80=98gnu_printf=E2=80=99 format attribute [-Wsuggest-attribu=
te=3Dformat]
> > 	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:170:2: warni=
ng: function =E2=80=98atomisp_css2_dbg_ftrace_print=E2=80=99 might be a can=
didate for =E2=80=98gnu_printf=E2=80=99 format attribute [-Wsuggest-attribu=
te=3Dformat]
> > 	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:176:2: warni=
ng: function =E2=80=98atomisp_css2_err_print=E2=80=99 might be a candidate =
for =E2=80=98gnu_printf=E2=80=99 format attribute [-Wsuggest-attribute=3Dfo=
rmat]
> >=20
> > That are due to the usage of printf-like messages without
> > enabling the error checking logic.
> >=20
> > Add the proper attributes in order to shut up such warnings. =20
>=20
> > +static int  __attribute__((format (printf, 1, 0)))
> > +atomisp_css2_dbg_ftrace_print(const char *fmt, va_list args)
> >  {
> >  	ftrace_vprintk(fmt, args);
> >  	return 0;
> >  }
> >   =20
>=20
> Why not to drop it completely as well?

Because of this:

	make -s CC=3D"gcc -fno-diagnostics-show-caret" CF=3D-D__CHECK_ENDIAN__ CON=
FIG_DEBUG_SECTION_MISMATCH=3Dy  W=3D1 M=3Ddrivers/staging/media/atomisp/ 2>=
&1|grep -v ": In function =E2=80=98"
	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:858:52: error: =
=E2=80=98ftrace_vprintk=E2=80=99 undeclared (first use in this function); d=
id you mean =E2=80=98tracepoint=E2=80=99?
	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:858:52: note: ea=
ch undeclared identifier is reported only once for each function it appears=
 in

Basically, kernel.h defines it as a macro:

	#define ftrace_vprintk(fmt, vargs)					\
	do {									\
		if (__builtin_constant_p(fmt)) {				\
			static const char *trace_printk_fmt __used		\
			  __attribute__((section("__trace_printk_fmt"))) =3D	\
				__builtin_constant_p(fmt) ? fmt : NULL;		\
										\
			__ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs);	\
		} else								\
			__ftrace_vprintk(_THIS_IP_, fmt, vargs);		\
	} while (0)

Now, a different thing would be to get rid of using trace as a debug
mechanism. Right now, I don't have any strong opinion, but I guess
that, while this driver is still at staging, it sounds good to be
able of using traces instead of dmesg for debugging purposes, but
to be honest, I didn't test yet to use ftrace for such purpose.

Thanks,
Mauro
