Return-Path: <linux-media+bounces-38872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F1B1AA2C
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 22:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7763B21DC
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 20:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E02231C8D;
	Mon,  4 Aug 2025 20:34:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C3214818
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754339691; cv=none; b=sCdQl7YARs3Q5Q0NcqiUM9n8SCuLLVbF6ap/niwr4N6tzVhdWZbgdVWwvexX8lS72C8GJeb0iI7DhAcjtkAD/GrdZj1180d3dw5K2bkrY7VVBMuiStqvoSrHf26fECaGu9GPSSjJBB0rGqGr/pfAzdlXVBLCK9Zg3jb099ySb8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754339691; c=relaxed/simple;
	bh=lbNYix99u8/MVauGkrPAVJJeUtAJbn52tCJ3h9KkWDc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lmTAFQDPuL1QJiTgj3FYejPoCiBINITz55juy4e0YcSprQabvWrR8TsU0ywvFz2yXUU8/nJAKcBaSQqMCZuS0EtTxBSaa+z+SFUF/FR4hT07x+nYEk0pgf8uDYV38CmwoyfdZJnOR610EhbpoysTTfrmhfw+CKiOT5tBx7cUbyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from a.c.8.e.8.b.c.b.6.6.1.e.1.e.0.a.c.6.e.0.c.6.2.0.0.b.8.0.1.0.0.2.ip6.arpa (a.c.8.e.8.b.c.b.6.6.1.e.1.e.0.a.c.6.e.0.c.6.2.0.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:26c:e6c:a0e1:e166:bcb8:e8ca])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: chewi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C5FF9340441;
	Mon, 04 Aug 2025 20:34:48 +0000 (UTC)
Message-ID: <4e121ca800ea9e4f890687271423de90f7fdf88c.camel@gentoo.org>
Subject: Re: [PATCH] meson: Allow BPF code to be built with GCC
From: James Le Cuirot <chewi@gentoo.org>
To: Sam James <sam@gentoo.org>, Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Date: Mon, 04 Aug 2025 21:34:41 +0100
In-Reply-To: <87v7n2q1ku.fsf@gentoo.org>
References: <20250803081759.13952-1-chewi@gentoo.org>
		<aJB5rmwRfiYv7sJb@gofer.mess.org> <87v7n2q1ku.fsf@gentoo.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-DGwG2Jf72QpCpTgq5mwU"
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-DGwG2Jf72QpCpTgq5mwU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-08-04 at 21:22 +0100, Sam James wrote:
> Sean Young <sean@mess.org> writes:
>=20
> > On Sun, Aug 03, 2025 at 09:17:59AM +0100, James Le Cuirot wrote:
> > > GCC can also target BPF, but it does not understand the "-target bpf"
> > > arguments passed to Clang.
> > >=20
> > > Detect it as either bpf-gcc, bpf-none-gcc, or bpf-unknown-none-gcc, t=
he
> > > same as systemd does.
> >=20
> > Thank you for the patch, I had not looked into this yet.
> >=20
> > > Determine the include paths with the compiler used by the rest of the
> > > build rather than Clang, which might not be installed or might not gi=
ve
> > > the right answer, especially when cross-compiling.
> >=20
> > Fair enough.
> > =20
> > > Check whether Clang actually supports the BPF target so that
> > > auto-detection doesn't cause the build to fail when it doesn't.
> >=20
> > clang has supported BPF for a really long time. We've never bothered to
> > test whether clang supports BPF before and I've never seen this be a
> > problem; why introduce this test?
>=20
> Clang takes a long time to build and you don't actually have to enable
> all targets.

To expand on that, I have personally built Clang without BPF in the past.
systemd does this check, albeit with a more helpful error message. I can ad=
d
one if you like. But most of all, you don't want a situation where the buil=
d
might fail even if the user didn't explicitly ask for BPF support.

> > > Disclaimer: I haven't actually tested the result of the GCC build.
> >=20
> > Let me test this.
> >=20
> > I do wonder why you default to bpf-gcc rather than clang. Any particula=
r
> > reason?
>=20
> Clang *tends* to have BPF as a target (just not always), so having the
> less common option > the more common one means the less common one can
> be used.
>=20
> i.e. if Clang was first, even if you have a cross BPF toolchain w/ GCC,
> you probably can't then use the GCC path. But maybe it should be an
> option instead.

There wasn't any particularly strong reason. I figured if you have bpf-gcc,
then that should definitely work, whereas Clang might not. Gentoo favours
bpf-gcc because it has wider platform support and is quicker to build. Chan=
ces
are that the rest of the build is being done with GCC. systemd allows you t=
o
choose, but I didn't see the need. I imagine either works equally well.

> > Thanks,
> >=20
> > Sean
> >=20
> > >=20
> > > Signed-off-by: James Le Cuirot <chewi@gentoo.org>
> > > ---
> > >  meson.build                                   | 23 +++++++++++++++++=
+-
> > >  .../keytable/bpf_protocols/cc_sys_includes.sh | 10 ++++++++
> > >  .../bpf_protocols/clang_sys_includes.sh       |  9 --------
> > >  utils/keytable/bpf_protocols/meson.build      | 12 +++++-----
> > >  utils/keytable/meson.build                    |  2 +-
> > >  5 files changed, 39 insertions(+), 17 deletions(-)
> > >  create mode 100755 utils/keytable/bpf_protocols/cc_sys_includes.sh
> > >  delete mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.s=
h
> > >=20
> > > diff --git a/meson.build b/meson.build
> > > index 88781e59..0aff6970 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -83,11 +83,32 @@ endif
> > >  v4l2_utils_incdir =3D include_directories(v4l2_utils_incdir_arr)
> > > =20
> > >  prog_bash =3D find_program('bash')
> > > -prog_clang =3D find_program('clang', required : get_option('bpf'))
> > >  prog_doxygen =3D find_program('doxygen', required : get_option('doxy=
gen-doc'))
> > >  prog_grep =3D find_program('grep')
> > >  prog_perl =3D find_program('perl')
> > > =20
> > > +if get_option('bpf').allowed()
> > > +    bpf_args =3D []
> > > +    prog_bpf =3D find_program('bpf-gcc',
> > > +                            'bpf-none-gcc',
> > > +                            'bpf-unknown-none-gcc',
> > > +                            required : false)
> > > +
> > > +    if not prog_bpf.found()
> > > +        prog_bpf =3D find_program('clang', required : get_option('bp=
f'))
> > > +        if prog_bpf.found()
> > > +            target_bpf =3D run_command(prog_bpf, '-target', 'bpf', '=
--print-supported-cpus', check : get_option('bpf').enabled())
> > > +            if target_bpf.returncode() =3D=3D 0
> > > +                bpf_args +=3D ['-target', 'bpf']
> > > +            else
> > > +                prog_bpf =3D disabler()
> > > +            endif
> > > +        endif
> > > +    endif
> > > +else
> > > +    prog_bpf =3D disabler()
> > > +endif
> > > +
> > >  dep_alsa =3D dependency('alsa', required : false)
> > >  if dep_alsa.found()
> > >      conf.set('HAVE_ALSA', 1)
> > > diff --git a/utils/keytable/bpf_protocols/cc_sys_includes.sh b/utils/=
keytable/bpf_protocols/cc_sys_includes.sh
> > > new file mode 100755
> > > index 00000000..0a8fa277
> > > --- /dev/null
> > > +++ b/utils/keytable/bpf_protocols/cc_sys_includes.sh
> > > @@ -0,0 +1,10 @@
> > > +#!/bin/sh
> > > +# Get C compiler's default includes on this system, as the BPF toolc=
hain
> > > +# generally doesn't see the Linux headers. This fixes "missing" file=
s on some
> > > +# architectures/distros, such as asm/byteorder.h, asm/socket.h, asm/=
sockios.h,
> > > +# sys/cdefs.h etc.
> > > +#
> > > +# Use '-idirafter': Don't interfere with include mechanics except wh=
ere the
> > > +# build would have failed anyways.
> > > +"$@" -v -E - </dev/null 2>&1 \
> > > +	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/=
.*\)|-idirafter \1|p }'
> > > diff --git a/utils/keytable/bpf_protocols/clang_sys_includes.sh b/uti=
ls/keytable/bpf_protocols/clang_sys_includes.sh
> > > deleted file mode 100755
> > > index 9dc4af12..00000000
> > > --- a/utils/keytable/bpf_protocols/clang_sys_includes.sh
> > > +++ /dev/null
> > > @@ -1,9 +0,0 @@
> > > -#!/bin/sh
> > > -# Get Clang's default includes on this system, as opposed to those s=
een by
> > > -# '-target bpf'. This fixes "missing" files on some architectures/di=
stros,
> > > -# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h =
etc.
> > > -#
> > > -# Use '-idirafter': Don't interfere with include mechanics except wh=
ere the
> > > -# build would have failed anyways.
> > > -$CLANG -v -E - </dev/null 2>&1 \
> > > -	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/=
.*\)|-idirafter \1|p }'
> > > diff --git a/utils/keytable/bpf_protocols/meson.build b/utils/keytabl=
e/bpf_protocols/meson.build
> > > index 1e4f0064..dbb926c4 100644
> > > --- a/utils/keytable/bpf_protocols/meson.build
> > > +++ b/utils/keytable/bpf_protocols/meson.build
> > > @@ -10,9 +10,9 @@ bpf_protocols_files =3D [
> > >      'xbox-dvd',
> > >  ]
> > > =20
> > > -clang_sys_includes =3D run_command('clang_sys_includes.sh',
> > > -                                 check : true,
> > > -                                 env : ['CLANG=3D' + prog_clang.full=
_path()])
> > > +bpf_args +=3D run_command('cc_sys_includes.sh',
> > > +                        cc.cmd_array(),
> > > +                        check : true).stdout().split()
> > > =20
> > >  foreach file : bpf_protocols_files
> > >      output =3D file + '.o'
> > > @@ -21,9 +21,9 @@ foreach file : bpf_protocols_files
> > >                    output : output,
> > >                    input : input,
> > >                    command : [
> > > -                      prog_clang,
> > > -                      clang_sys_includes.stdout().split(),
> > > -                      '-D__linux__', '-fno-stack-protector', '-targe=
t', 'bpf',
> > > +                      prog_bpf,
> > > +                      bpf_args,
> > > +                      '-D__linux__', '-fno-stack-protector',
> > >                        '-O2', '-c', '@INPUT@', '-o', '@OUTPUT@',
> > >                    ],
> > >                    install : true,
> > > diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> > > index e214e0b5..56e61a79 100644
> > > --- a/utils/keytable/meson.build
> > > +++ b/utils/keytable/meson.build
> > > @@ -22,7 +22,7 @@ ir_keytable_c_args =3D [
> > >      '-DIR_KEYTABLE_USER_DIR=3D"@0@"'.format(ir_keytable_user_dir),
> > >  ]
> > > =20
> > > -ir_bpf_enabled =3D prog_clang.found() and dep_libbpf.found() and dep=
_libelf.found()
> > > +ir_bpf_enabled =3D prog_bpf.found() and dep_libbpf.found() and dep_l=
ibelf.found()
> > > =20
> > >  if ir_bpf_enabled
> > >      ir_keytable_sources +=3D files(
> > > --=20
> > > 2.50.1
> > >=20

--=-DGwG2Jf72QpCpTgq5mwU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJFBAABCAAvFiEEPxcZ3tkwcedKm2a8EiZBXQDdMTcFAmiRGWERHGNoZXdpQGdl
bnRvby5vcmcACgkQEiZBXQDdMTcVPQ/+N1LjlMupI2rRv95wKhWkz+hos2D6CCdT
8tte1Fs82EZOsjUJY+PbOsBd/IQ10B/iiAGms1ksbVTgW/PMWv9ZnWJm4N+QAsyR
z6xMkdQ3km+SCjwZeJbZLgtTPBoTXfj2ySVpLWMcMW9sGEaJ3Z7ZbKLarCeZq1zy
ZZK/y41LR3RosK4n2zo8kBDCu3PnmOdI2T8cnjQysRVdrwr1tvaZsKekVFj9pWpD
EMmwANWeUE7UJz8Is1+dKmlfG6s+SSjN6Fhil+hDt7cc295PQ/Hw7P9Vy2c9QkbA
sK49ELm+buxWvWobR4FSlmVKmQW9zqWj8v8jTjrGEHmWfh0rtg6lcIcfY6pyxnOn
Yj/pXWxFFcIcLk6UgYIA+TRWRad3wmpg1OwrF8XLuofGCBJZ70T1ROV6vz5EeUH0
kF5RB5fkiSPBdtb+Vl8pxYGvy1ge9tGLkl+lxtFxI33RljRBmFr4anDPVLYt8quf
EvtnqrcPNaqkCYsVAqa2o4Qa/N59iQMzlVjyjmrZJMtJfBK+dUKzrYCqogMhf6HQ
oAri9utf6ql/rnJ8Naw2cjbZL5LKIpRtuZbS2vSO4znPR+9pJQaxg/Wf2uqq7li7
y5yZlTfVs2ItOlaOujy9ENLY0KLmo5eW+ak9XmL0/qn46f3hMdOyYyGjZ1GJRHIM
EKm2Y8YQWZA=
=fpFB
-----END PGP SIGNATURE-----

--=-DGwG2Jf72QpCpTgq5mwU--

