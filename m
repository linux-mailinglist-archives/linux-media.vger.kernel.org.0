Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4633244DBA8
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 19:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbhKKSlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 13:41:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:33138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233062AbhKKSlH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 13:41:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90D386103A;
        Thu, 11 Nov 2021 18:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636655898;
        bh=hetZbE77HSI+PGb8R1q4OktyDHnguTD1LEsgKycsX+M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N+cG8Gt+GH1LTVHu3ixGuVC73R2cTQDCyL74DQ0XLuOwFaxHBPBD3yYXuq/MCm3Kh
         NIBmoRSHVqyxm8luiHXKvvcup+gyrjRyalrmKyHjDFT3FHJmKbw0UIKvOGPtg8tHqw
         AxzwUP0Q1PeXIb+kuivZ/mhn/czrHJP+qCHRm2vxlpCa9NoQpAiiFYG+6/1I1hW4Zx
         /Fk5JFCpfcB+Z3oZabeXGU1YB24lOBcKKMw/IjssvmoNG4UF0PrL+PmBLspXk4U12V
         vc5Lr4bGyWzurfNhFC+UBzhX7mrO0CywxTWTcDr5tNu91LwAoPxNofXh+rgCJygL99
         ic8kNKQXpghLg==
Date:   Thu, 11 Nov 2021 18:38:12 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <20211111183812.0f33fdaa@sal.lan>
In-Reply-To: <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-5-kitakar@gmail.com>
        <20211026092637.196447aa@sal.lan>
        <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
        <20211028123944.66c212c1@sal.lan>
        <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
        <20211101141058.36ea2c8e@sal.lan>
        <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 11 Nov 2021 23:34:23 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> Sorry for a little late reply. This is hard to explain...
>=20
> On Mon, 2021-11-01 at 14:10 +0000, Mauro Carvalho Chehab wrote:
> > Em Mon, 01 Nov 2021 22:38:55 +0900
> > Tsuchiya Yuto <kitakar@gmail.com> escreveu: =20
>=20
> [...]
> >  =20
>=20
> > > This is not directly related to this series, but how we should reduce
> > > the ifdef usage in the future? Here are my two ideas:
> > >=20
> > >   1. (my initial idea) remove `#ifdef ISP2401` part and make ISP2401
> > >      part completely irci_stable_candrpv_0415_20150521_0458
> > >=20
> > > this way does not require (relatively) much human work I think.
> > >=20
> > > But as Mauro says, the `#ifdef ISP2401` part (irci_ecr-master_2015091=
1_0724)
> > > is basically an improved version. =20
> >=20
> > No. What I said is that the if (ISP2401) and the remaining ifdefs are b=
ecause
> > of BYT x CHT. =20
>=20
> I need to elaborate on this. Indeed some of them are really because of
> BYT x CHT, but others are stuff from irci_ecr-master_20150911_0724.
>=20
> What I meant when I mentioned "remove `#ifdef ISP2401` part" is that,
> removing things which was _initially_ inside the `#ifdef ISP2401` on the
> initial commit of atomisp.
>=20
> Also I believe we can remove more `if (IS_ISP2401)` and `/* ISP2401 */`
> things as well as the some remaining `#ifdef ISP2401` things.
>=20
> I added about this below and hope it clarifies things...

It is clearer now. Yeah, we can touch on whatever is inside the
ISP2401 ifs, as we can now test them. Touching things for ISP2400
is harder, as we depend on a test platform.

> > The worse part of them are related to those files
> > (See Makefile):
> >=20
> > obj-byt =3D \
> > 	pci/css_2400_system/hive/ia_css_isp_configs.o \
> > 	pci/css_2400_system/hive/ia_css_isp_params.o \
> > 	pci/css_2400_system/hive/ia_css_isp_states.o \
> >=20
> > obj-cht =3D \
> > 	pci/css_2401_system/hive/ia_css_isp_configs.o \
> > 	pci/css_2401_system/hive/ia_css_isp_params.o \
> > 	pci/css_2401_system/hive/ia_css_isp_states.o \
> > 	pci/css_2401_system/host/csi_rx.o \
> > 	pci/css_2401_system/host/ibuf_ctrl.o \
> > 	pci/css_2401_system/host/isys_dma.o \
> > 	pci/css_2401_system/host/isys_irq.o \
> > 	pci/css_2401_system/host/isys_stream2mmio.o
> >=20
> > Those define regmaps for 2400 and 2401. I was able to remove a lot
> > of things from the old css_2400/css_2401 directories, but the ones
> > there at pci/*/css*/ia_css_isp_*.c are a lot more complex, and would
> > require some mapping functions to allow the same driver to work with
> > both BYT and CHT.
> >=20
> > The better would be to test the driver first at BYT, fix issues (if any=
) and=20
> > then write the mapping code.
> >  =20
> > > So, we may also:
> > >=20
> > >   2. continue unifying `#ifdef ISP2401` and `#ifndef ISP2401` parts
> > >=20
> > > but this way needs more human work I think though. And if we go this
> > > way, I also need to rewrite this patch as mentioned in the commit
> > > message. =20
>=20
> What the idea #1 want to say is, let's remove things _initially_ within
> `ifdef ISP2401` (so, except things which were added inside it later
> upstream) including formerly within `ifdef ISP2401` things, i.e.,
> `if (IS_ISP2401)` and things commented with `/* ISP2401 */`.
>=20
> However, I don't say we can remove all the ifdefs like things formerly
> within USE_INPUT_SYSTEM_VERSION_2, USE_INPUT_SYSTEM_VERSION_2401, etc.,
> which later removed/integrated into `ifdef ISP2401` on some commits [1].
> We may temporarily revert those commits when we want to distinguish
> between what were formerly within there and what were not.
>=20
> Such ifdefs were added by them as a real hardware difference. Thus, I
> agree that we still need the CONFIG_VIDEO_ATOMISP_ISP2401 stuff to support
> both ISP2400/ISP2401 at the same time.
>=20
> This is what I meant "reduce the ifdef usage" in a previous mail. So,
> I'm not talking about if dropping CONFIG_VIDEO_ATOMISP_ISP2401 is doable,
> but talking about just how to reduce the code.
>=20
> [1] 641c2292bf19 ("media: atomisp: get rid of version-dependent globals")
>     bd674b5a413c ("media: atomisp: cleanup ifdefs from ia_css_debug.c")
>=20
> Anyway, if you agree or not on what I'm saying, can I send this patch
> without code changes in v2, i.e., looks OK for you regarding the code?
> I'll remove the commit message about
> irci_stable_candrpv_0415_20150521_0458 vs irci_ecr-master_20150911_0724
> in v2 anyway, which needs to be discussed further later.

No need for a v2. The /17 patch series was merged already, plus some
patches from the /5 that made sense to apply.

Ok, there are some followup patches that could be added, but please
send those in separate.

> The following notes are about what I have done until now for removing
> such tests. (More elaborated version than cover letter). You don't have
> to see them, but I hope it might clarify things...
>=20
>   ## `ifdef ISP2401` added in the initial commit of atomisp
>=20
> The `ifdef ISP2401` was the result of merging two different version of
> driver, added on the initial commit of upstreamed atomisp. And for the
> `ifdef ISP2401`, I confirmed I can remove (almost [1]) all of them against
> the initial commit of atomisp [2][3]
>=20
> [1] here are the three exceptions:
>     ("NOTE: ifdef ISP2400/ISP2401 usage in aero-atomisp")
>     https://github.com/kitakar5525/linux-kernel/commit/1a8488cdd31ad38a38=
05824700b29d1e5213d3f2
>=20
> [2] ("atomisp: pci: css2400: remove ISP2401 ifdefs")
>     https://github.com/kitakar5525/linux-kernel/commit/dd6723fc5b9fe040e3=
3b227b509a7e004243edce
> [3] ("atomisp: pci: remove ISP2401 ifdefs for main pci driver")
>     https://github.com/kitakar5525/linux-kernel/commit/1734341f84a96945af=
7635f6fff061db910f746f

Ok, if there are more if/ifdef ISP2401 that, if reverted will keep the
driver running with the firmware we're using, I'm all for it. Just send
the patches ;-)

>=20
> Here is the kernel tree if someone is interested:
>=20
>         https://github.com/kitakar5525/linux-kernel/tree/mainline+upst_at=
omisp@a49d25364dfb_first
>=20
> Especially, here is one of the part where this patch is touching
> for example:
>=20
>         --- a/drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_m=
ipi.c
>         +++ b/drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_m=
ipi.c
>         @@ -416,26 +362,16 @@ allocate_mipi_frames(struct ia_css_pipe *pi=
pe, struct ia_css_stream_info *info)
> [...]
>         -#ifndef ISP2401
>          	port =3D (unsigned int) pipe->stream->config.source.port.port;
>          	assert(port < N_CSI_PORTS);
>          	if (port >=3D N_CSI_PORTS) {
>         -#else
>         -	if (!ia_css_mipi_is_source_port_valid(pipe, &port)) {
>         -#endif
>          		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>          			"allocate_mipi_frames(%p) exit: error: port is not correct (p=
ort=3D%d).\n",
>          			pipe, port);
>=20
> By removing (almost) all of the `#ifdef ISP2401` things, (although we
> still can't remove like former USE_INPUT_SYSTEM_VERSION_2,
> USE_INPUT_SYSTEM_VERSION_2401) we can reduce the number of ifdefs.

Sounds good to me.

>=20
>=20
>   ## `ifdef ISP2401`, `if (IS_ISP2401)` and `/* ISP2401 */` in the recent
>       atomisp
>=20
> That is for the initial commit of atomisp. For the recent version of
> atomisp, we can still remove `ifdef ISP2401` things (again, except things
> which were added inside it later upstream) as well as the former
> `ifdef ISP2401` things, i.e., `if (IS_ISP2401)` [1] and things commented
> with [2] `/* ISP2401 */`.
>=20
> [1] ("atomisp: pci: remove IS_ISP2401 test")
>     https://github.com/kitakar5525/linux-kernel/commit/397e543e493dfd60d9=
1e2b5cc164da342b26906c
> [2] ("atomisp: pci: remove `/* ISP2401 */` comments and its contents")
>     https://github.com/kitakar5525/linux-kernel/commit/b3928e3c1a70985397=
1715ce35459b9b79e708f2
>     These commits were made against
>     bd674b5a413c ("media: atomisp: cleanup ifdefs from ia_css_debug.c")
>     where I randomely picked.
>=20
> Here is the kernel tree if someone is interested:
>=20
>     https://github.com/kitakar5525/linux-kernel/tree/mainline+upst_atomis=
p@bd674b5a413c_before_get_rid_ver_globals
>=20
> I confirmed capture is still working here on surface3 (ISP2401). Compile
> tested for ISP2400. As you can see, there are some WIP and FIXME commits
> on top of removing such tests though. (The others are backports).
>=20
> Especially, here is one of the part where this patch is touching
> for example:
>=20
>         --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
>         +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
>         @@ -553,10 +548,7 @@ free_mipi_frames(struct ia_css_pipe *pipe) {
>          			return err;
>          		}
>        =20
>         -		if (!IS_ISP2401)
>         -			port =3D (unsigned int)pipe->stream->config.source.port.port;
>         -		else
>         -			err =3D ia_css_mipi_is_source_port_valid(pipe, &port);
>         +		port =3D (unsigned int)pipe->stream->config.source.port.port;
>        =20
>          		assert(port < N_CSI_PORTS);
>        =20
>=20
> So, we can also remove a lot of `if (IS_ISP2401)` and `/* ISP2401 */`
> things as well as the remaining `ifdef ISP2401`.
>=20
>=20
>=20
>   ## WIP: removing `ifdef ISP2401`, `if (IS_ISP2401)` and `/* ISP2401 */`
>      against the latest atomisp
>=20
> And here is the branch where I'm working on removing such tests against
> the latest atomisp:
>=20
>         https://github.com/kitakar5525/linux-kernel/commits/mainline+upst=
_atomisp+remove_unneeded_tests
>=20
> It'd be the best if I can show you working one,=20

Well, send the ones that were already tested, and won't cause
regressions to v4l2grab and camorama (e. g. it shouldn't cause
generic V4L2 generic apps to break).

It would be nice to also not break nvt and other original apps for
this device, as it could be useful later, in order to be able to=20
test the other pipelines, as currently only the preview one seems
to be working properly, at least with generic apps.

> but it currently has
> seemingly include issues on ISP2400 vs ISP2401 (as well as many WIP
> commits I added):
>=20
> 	drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c: In funct=
ion =E2=80=98ia_css_isys_init=E2=80=99:
> 	drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:29:9: err=
or: unknown type name =E2=80=98backend_channel_cfg_t=E2=80=99
> 	   29 |         backend_channel_cfg_t backend_ch0;
> 	      |         ^~~~~~~~~~~~~~~~~~~~~
> 	drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:30:9: err=
or: unknown type name =E2=80=98backend_channel_cfg_t=E2=80=99
> 	   30 |         backend_channel_cfg_t backend_ch1;
> 	      |         ^~~~~~~~~~~~~~~~~~~~~
> 	drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:31:9: err=
or: unknown type name =E2=80=98target_cfg2400_t=E2=80=99
> 	   31 |         target_cfg2400_t targetB;
> 	      |         ^~~~~~~~~~~~~~~~
> 	drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:32:9: err=
or: unknown type name =E2=80=98target_cfg2400_t=E2=80=99
> 	   32 |         target_cfg2400_t targetC;
> 	      |         ^~~~~~~~~~~~~~~~
> 	[...]
>=20
> The full output of the make error is here:
>=20
>         ("NOTE: issue: some undeclared errors")
>         https://github.com/kitakar5525/linux-kernel/commit/a932d16681f941=
161385659b9d0316a3a4975e86
>=20
>=20
>=20
> Regards,
> Tsuchiya Yuto
> > > >  =20
