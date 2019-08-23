Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF6C9B545
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 19:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387707AbfHWRQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 13:16:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39094 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387598AbfHWRQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 13:16:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id s11so920278pfe.6
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2019 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m/DpmKdoj0HbvB1qyNNmkuLxnsG1UWxBDMu6haWmyfk=;
        b=I2Manzko/wGlM7GadUNr7MneDIkFgtNuaQWW3gusvAFqTyc8UVSsEi3dDb9uISZ2ro
         7may81ewFA6iYVo9Z18pBkn4Oz93u3RfOKzFDOip3vm+2DLwTnfXcs/joHVNcml8En9b
         zdO9R63vAW9+Pwl+1DpVnp8qtBcA9DX4tyyjs3ofuYlA8isRTR4ddKXSkTstLl6QA+qi
         l3EStFuqjtYP4+yXgxc0vrW8hnCjFApot2SnqF7I0WWb2VdFSEGCNTRsSvMlQY1lzHpD
         MojsrcbWPLdXgagxhii2RojbgeHI7+C721+ZoHS7S1Tec8PtPKa3xsOOPtKVca5ysW7s
         ygnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m/DpmKdoj0HbvB1qyNNmkuLxnsG1UWxBDMu6haWmyfk=;
        b=fkzPSGe95Tk850Q1HMk6CAWJK9EpA2NEkL5nIHIlKkSiVJCFuU+D20/X6web+ePmlS
         kOvn5qWInmASBe8LIj5sCfCD/Iy/zVsjI6X11nEFzkuGqLlt5OVA1mEQJ8WUHKdb/OV1
         LOCiRYoFSwgyBNk2IauBjKuOis3ZHx53/2VXM/D6tb6H2ndDDWe1h/tVY0ysQgY41eBA
         iVmMKKEm7Bfs+4JWTAFpnF5FD7m+Mr3rpeALNTh1dmHAOhxX/Zy6qqn+RO5CJao0pnn4
         1OIqIa1ylee+p9QFFcI6qyvylaL1CMdE4H2aGToFk7dFRvzJk/rmkh2UEqbzyB+cbXJz
         H+cw==
X-Gm-Message-State: APjAAAUTuKfrD9+Y/jm7N/T3Hgb/Jq3CAw76aUEWNvMUzPMBOokwsNjf
        72BW/J5/mI+MRv3AMfmcbYMG0CC0iH5VPUuxunSJhQ==
X-Google-Smtp-Source: APXvYqxT7RxeOMCTj3qivid/BR4Ce4YdmJ0i6gdLDgbf88ZUnnm2E6y14200bmYlmMGL1hZWLgGhIoRJAPtDpVNlNDU=
X-Received: by 2002:a17:90a:6581:: with SMTP id k1mr6320376pjj.47.1566580586731;
 Fri, 23 Aug 2019 10:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com> <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
 <6af3f619-4356-2f67-ed76-92beceb1e0a0@arm.com>
In-Reply-To: <6af3f619-4356-2f67-ed76-92beceb1e0a0@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 23 Aug 2019 19:16:15 +0200
Message-ID: <CAAeHK+yhbUcuLhoetjGUbqM4j9fX84hbwmxzNPF+e1zXj6nKNw@mail.gmail.com>
Subject: Re: [PATCH v18 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
To:     Cristian Marussi <cristian.marussi@arm.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        kvm@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 23, 2019 at 3:56 PM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> Hi Andrey
>
> On 24/06/2019 15:33, Andrey Konovalov wrote:
> > This patch is a part of a series that extends kernel ABI to allow to pa=
ss
> > tagged user pointers (with the top byte set to something else other tha=
n
> > 0x00) as syscall arguments.
> >
> > This patch adds a simple test, that calls the uname syscall with a
> > tagged user pointer as an argument. Without the kernel accepting tagged
> > user pointers the test fails with EFAULT.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > ---
> >  tools/testing/selftests/arm64/.gitignore      |  1 +
> >  tools/testing/selftests/arm64/Makefile        | 11 +++++++
> >  .../testing/selftests/arm64/run_tags_test.sh  | 12 ++++++++
> >  tools/testing/selftests/arm64/tags_test.c     | 29 +++++++++++++++++++
> >  4 files changed, 53 insertions(+)
> >  create mode 100644 tools/testing/selftests/arm64/.gitignore
> >  create mode 100644 tools/testing/selftests/arm64/Makefile
> >  create mode 100755 tools/testing/selftests/arm64/run_tags_test.sh
> >  create mode 100644 tools/testing/selftests/arm64/tags_test.c
>
> After building a fresh Kernel from arm64/for-next-core from scratch at:
>
> commit 239ab658bea3b387424501e7c416640d6752dc0c
> Merge: 6bfa3134bd3a 42d038c4fb00 1243cb6a676f d55c5f28afaf d06fa5a118f1 3=
4b5560db40d
> Author: Will Deacon <will@kernel.org>
> Date:   Thu Aug 22 18:23:53 2019 +0100
>
>     Merge branches 'for-next/error-injection', 'for-next/tbi', 'for-next/=
psci-cpuidle', 'for-next/cpu-topology' and 'for-next/52-bit-kva' into for-n=
ext/core
>
>
> KSFT arm64 tests build is broken for me, both setting or not KBUILD_OUTPU=
T=3D
>
> 13:30 $ make TARGETS=3Darm64 kselftest-clean
> make[1]: Entering directory '/home/crimar01/ARM/dev/src/pdsw/out_linux'
> rm -f -r /home/crimar01/ARM/dev/src/pdsw/out_linux//kselftest/arm64/tags_=
test
> make[1]: Leaving directory '/home/crimar01/ARM/dev/src/pdsw/out_linux'
>
> =E2=9C=94 ~/ARM/dev/src/pdsw/linux [arm64_for_next_core|=E2=80=A68=E2=9A=
=91 23]
>
> 13:30 $ make TARGETS=3Darm64 kselftest
> make[1]: Entering directory '/home/crimar01/ARM/dev/src/pdsw/out_linux'
> arch/arm64/Makefile:56: CROSS_COMPILE_COMPAT not defined or empty, the co=
mpat vDSO will not be built
> make --no-builtin-rules INSTALL_HDR_PATH=3D$BUILD/usr \
>         ARCH=3Darm64 -C ../../.. headers_install
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/unifdef
> ...
> ...
>   HDRINST usr/include/asm/msgbuf.h
>   HDRINST usr/include/asm/shmbuf.h
>   INSTALL /home/crimar01/ARM/dev/src/pdsw/out_linux//kselftest/usr/includ=
e
> /opt/toolchains/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-=
linux-gnu-gcc     tags_test.c  -o /home/crimar01/ARM/dev/src/pdsw/out_linux=
//kselftest/arm64/tags_test
> tags_test.c: In function =E2=80=98main=E2=80=99:
> tags_test.c:21:12: error: =E2=80=98PR_SET_TAGGED_ADDR_CTRL=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98PR_GET_TID_ADDRES=
S=E2=80=99?
>   if (prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE, 0, 0, 0) =3D=
=3D 0)
>             ^~~~~~~~~~~~~~~~~~~~~~~
>             PR_GET_TID_ADDRESS
> tags_test.c:21:12: note: each undeclared identifier is reported only once=
 for each function it appears in
> tags_test.c:21:37: error: =E2=80=98PR_TAGGED_ADDR_ENABLE=E2=80=99 undecla=
red (first use in this function); did you mean =E2=80=98PR_GET_DUMPABLE=E2=
=80=99?
>   if (prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE, 0, 0, 0) =3D=
=3D 0)
>                                      ^~~~~~~~~~~~~~~~~~~~~
>                                      PR_GET_DUMPABLE
> ../lib.mk:138: recipe for target '/home/crimar01/ARM/dev/src/pdsw/out_lin=
ux//kselftest/arm64/tags_test' failed
> make[3]: *** [/home/crimar01/ARM/dev/src/pdsw/out_linux//kselftest/arm64/=
tags_test] Error 1
> Makefile:136: recipe for target 'all' failed
> make[2]: *** [all] Error 2
> /home/crimar01/ARM/dev/src/pdsw/linux/Makefile:1237: recipe for target 'k=
selftest' failed
> make[1]: *** [kselftest] Error 2
> make[1]: Leaving directory '/home/crimar01/ARM/dev/src/pdsw/out_linux'
> Makefile:179: recipe for target 'sub-make' failed
> make: *** [sub-make] Error 2
>
> Despite seeing KSFT installing Kernel Headers, they cannot be found.
>
> Fixing this patch like this make it work for me:
>
> diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selft=
ests/arm64/Makefile
> index a61b2e743e99..f9f79fb272f0 100644
> --- a/tools/testing/selftests/arm64/Makefile
> +++ b/tools/testing/selftests/arm64/Makefile
> @@ -4,6 +4,7 @@
>  ARCH ?=3D $(shell uname -m 2>/dev/null || echo not)
>
>  ifneq (,$(filter $(ARCH),aarch64 arm64))
> +CFLAGS +=3D -I../../../../usr/include/
>  TEST_GEN_PROGS :=3D tags_test
>  TEST_PROGS :=3D run_tags_test.sh
>  endif
>
> but is not really a proper fix since it does NOT account for case in whic=
h you have
> installed the Kernel Headers in a non standard location like when you use=
 KBUILD_OUTPUT.
>
> Am I missing something ?

Hm, PR_SET_TAGGED_ADDR_CTRL is defined in include/uapi/linux/prctl.h,
and the test has #include <sys/prctl.h> so as long as you've updated
your kernel headers this should work.

(I'm OOO next week, I'll see if I can reproduce this once I'm back).



>
> Thanks
>
> Cristian
>
> >
> > diff --git a/tools/testing/selftests/arm64/.gitignore b/tools/testing/s=
elftests/arm64/.gitignore
> > new file mode 100644
> > index 000000000000..e8fae8d61ed6
> > --- /dev/null
> > +++ b/tools/testing/selftests/arm64/.gitignore
> > @@ -0,0 +1 @@
> > +tags_test
> > diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/sel=
ftests/arm64/Makefile
> > new file mode 100644
> > index 000000000000..a61b2e743e99
> > --- /dev/null
> > +++ b/tools/testing/selftests/arm64/Makefile
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# ARCH can be overridden by the user for cross compiling
> > +ARCH ?=3D $(shell uname -m 2>/dev/null || echo not)
> > +
> > +ifneq (,$(filter $(ARCH),aarch64 arm64))
> > +TEST_GEN_PROGS :=3D tags_test
> > +TEST_PROGS :=3D run_tags_test.sh
> > +endif
> > +
> > +include ../lib.mk
> > diff --git a/tools/testing/selftests/arm64/run_tags_test.sh b/tools/tes=
ting/selftests/arm64/run_tags_test.sh
> > new file mode 100755
> > index 000000000000..745f11379930
> > --- /dev/null
> > +++ b/tools/testing/selftests/arm64/run_tags_test.sh
> > @@ -0,0 +1,12 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +echo "--------------------"
> > +echo "running tags test"
> > +echo "--------------------"
> > +./tags_test
> > +if [ $? -ne 0 ]; then
> > +     echo "[FAIL]"
> > +else
> > +     echo "[PASS]"
> > +fi
> > diff --git a/tools/testing/selftests/arm64/tags_test.c b/tools/testing/=
selftests/arm64/tags_test.c
> > new file mode 100644
> > index 000000000000..22a1b266e373
> > --- /dev/null
> > +++ b/tools/testing/selftests/arm64/tags_test.c
> > @@ -0,0 +1,29 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +#include <stdint.h>
> > +#include <sys/prctl.h>
> > +#include <sys/utsname.h>
> > +
> > +#define SHIFT_TAG(tag)               ((uint64_t)(tag) << 56)
> > +#define SET_TAG(ptr, tag)    (((uint64_t)(ptr) & ~SHIFT_TAG(0xff)) | \
> > +                                     SHIFT_TAG(tag))
> > +
> > +int main(void)
> > +{
> > +     static int tbi_enabled =3D 0;
> > +     struct utsname *ptr, *tagged_ptr;
> > +     int err;
> > +
> > +     if (prctl(PR_SET_TAGGED_ADDR_CTRL, PR_TAGGED_ADDR_ENABLE, 0, 0, 0=
) =3D=3D 0)
> > +             tbi_enabled =3D 1;
> > +     ptr =3D (struct utsname *)malloc(sizeof(*ptr));
> > +     if (tbi_enabled)
> > +             tagged_ptr =3D (struct utsname *)SET_TAG(ptr, 0x42);
> > +     err =3D uname(tagged_ptr);
> > +     free(ptr);
> > +
> > +     return err;
> > +}
> >
>
