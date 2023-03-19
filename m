Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1186BFEBA
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 01:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjCSAsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 20:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCSAsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 20:48:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F32217147;
        Sat, 18 Mar 2023 17:48:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E0B7B80A1F;
        Sun, 19 Mar 2023 00:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C96EC433D2;
        Sun, 19 Mar 2023 00:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679186897;
        bh=6fDKQXZJ9krh3EnppLc7iK85jT9i5LmJrN2d9hE260I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Frb0lU6LiRqzswobXmjwk6tXZgL1973HzbJnjiOMLi2o4cT/Ublgh5QNPrpSq8JXc
         nSVeMNeFJH9dzuUIlVE9JGxI0P8yyZGcsdZ8cDAKVX7kRa4GmQLvBOmuzamS74qIzg
         O+8UE8NqaaeEbUFxZxWVbvpfc0YVVEBhuF1L+b7egaIkhgaEsB2PGRA/v5dIZ47R+l
         ex9V+DSac9/W6aqqf+LOOheZN+w+Spzke3H1Z1Phe2DdJZhZwaw53Q1b6WWM7XYJDk
         QZO0fkMuRQMEXEk64nHOma7C+lhsZqHpNns94ubQzvvPqE6dvUqq4svtlw7wpZiPTE
         XklKbh4rWWRHw==
Date:   Sun, 19 Mar 2023 01:48:12 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jens Axboe <axboe@kernel.dk>,
        Nathan Chancellor <nathan@kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        linux-hardening@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
Message-ID: <20230319014812.2ef3c995@coco.lan>
In-Reply-To: <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
        <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
        <CAKwvOdmJkQUe6bhvQXHo0XOncdso0Kk26n8vdJZufm4Ku72tng@mail.gmail.com>
        <6414c470.a70a0220.6b62f.3f02@mx.google.com>
        <CAHk-=wi5yk0+NeqB34fRC-Zvt+8QZVPTiny9MvCxxjg+ZqDhKg@mail.gmail.com>
        <CANiq72m46OzQPtZbS_VaQGgGknFV-hKvhBw8sVZx9ef=AzupTQ@mail.gmail.com>
        <CAHk-=wgTSdKYbmB1JYM5vmHMcD9J9UZr0mn7BOYM_LudrP+Xvw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 17 Mar 2023 13:51:17 -0700
Linus Torvalds <torvalds@linux-foundation.org> escreveu:

> On Fri, Mar 17, 2023 at 1:42=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > It is comparing against just the `.code` in the `m5mols_default_ffmt`
> > table, i.e. the `MEDIA_BUS_FMT_VYUY8_2X8` (8199 =3D 0x2007) and
> > `MEDIA_BUS_FMT_JPEG_1X8` (16385 =3D 0x4001), see =20
>=20
> Yeah, I see what it's doing.
>=20
> But:
>=20
> > If the condition had `++type` instead, it would not be a problem,
> > because the loop stops before we go into the out of bounds access thus
> > no UB. =20
>=20
> Yeah, but clang really should have generated a proper third iteration,
> which calls that "out of bounds" case, and then returns, instead fo
> falling off the end.
>=20
> I do think that on the kernel side, the fix is to just change
>=20
>         } while (type++ !=3D SIZE_DEFAULT_FFMT);
>=20
> to
>=20
>         } while (++type !=3D SIZE_DEFAULT_FFMT);

Yeah, that seems to be the right fix to me too.

Ack on such change:=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?i=
d=3Defbcbb12ee99f750c9f25c873b55ad774871de2a

Regards,
Mauro


>=20
> but I would *really* like clang to be fixed to not silently generate
> code that does insane things and would be basically impossible to
> debug if it ever triggers.
>=20
> We would have spent a *lot* of time wondering how the heck we Oopsed
> in m5mols_get_frame_desc().
>=20
>              Linus
>=20



Thanks,
Mauro
