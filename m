Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77D754D037E
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 16:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237846AbiCGPz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 10:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiCGPz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 10:55:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76ADB74603
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 07:55:00 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id w12so2637803lfr.9
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=ys+q+CpDeD9ATNVwzxHewDGYsVeTZm+qBzNQowXg4lc=;
        b=Qvqq8v5HShp62GDHZHplbADn9cvnxbmOzkPPjvt0kKnkQ9uS2p/qAcU679iRZHavVh
         YJdpbU4GlHWRH7/quw/uwJVGGGkEo2HFxxMvYuBE61NouJaB0IpSdiqANOetD1ep6op9
         iM7rL09Fw/Asf8qin3lIgpkImPkyFu/+wSXP+oAVLJGwUG/1V5ryQ6mz+mDVC8Y0PXir
         B9SqsPTeV6cyoCmChwZS9ydnVyriHVDwzFksc/pG+rwVNW8eZF+5Sndui+MhdVh8aB4V
         5lYio3qpRtCknH+5hbF+a5sE/JHRtw0Yuecbfxmu65Oe82ScY/E3gvejg3zTpoC4is2f
         dCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=ys+q+CpDeD9ATNVwzxHewDGYsVeTZm+qBzNQowXg4lc=;
        b=jsuBvwVmnTLL5+odwYn3wKOLf6YQ9GoI3TvMqNxANDyFyrkU5pGVB3AGn7f/1D2FFw
         fTSNJ0BXlGyHLQav/BqqqDS4H4LhGtlr5jIzV1DCW1qthvFEVs0AwzfiSnEYcY7eyNAz
         TvhClLqdy2EZH5YtuuzaMQGT68DgAP1uUnQ9Akyn46Ur4va0bp5EeWo/gsilmd8kAcu8
         qNT4HMZLC3SaoaLNYJD8kEfLsYjOnVhFoc/QhETM9sQpzcffRKSTv4OCUqZZ3l1hS79o
         /K2WPEo3wL1XPnkbdGVZ509Upj9rqjUUGQIvXrh8tFuLRKe8PzPMh4spHCGDBNYTIsT4
         DmhA==
X-Gm-Message-State: AOAM532vNLAnnRYutj0ciIrlCTfvzSRcELjZKhHGN97M38+4BHgId8WC
        haRdIa8dC1u7mPY9GM4DWXQ=
X-Google-Smtp-Source: ABdhPJzPetxapSUm96tkKeqxwk0GezGS4Hbs6T2m3neusxBBFX50QkdieBjdLGY8eCIKmuM99DUuiQ==
X-Received: by 2002:ac2:597c:0:b0:448:25a2:5397 with SMTP id h28-20020ac2597c000000b0044825a25397mr7080112lfp.655.1646668495965;
        Mon, 07 Mar 2022 07:54:55 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8e97000000b002356c31ebb2sm3281557ljk.30.2022.03.07.07.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 07:54:55 -0800 (PST)
Date:   Mon, 7 Mar 2022 17:54:52 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Shashank Sharma <contactshashanksharma@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220307175452.73918180@eldfell>
In-Reply-To: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aG_exnUQwDlYfcntEJNgDng";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/aG_exnUQwDlYfcntEJNgDng
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  4 Mar 2022 13:49:59 +0100
Shashank Sharma <contactshashanksharma@gmail.com> wrote:

> From: Shashank Sharma <shashank.sharma@amd.com>
>=20
> This patch does some small changes to make the core logic of
> edid-decode tool available to a shared library wrapper. With
> these changes, the EDID's 'state' variable will be avialble
> to another process via some library API calls.
>=20
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
>=20
> Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>

Hi Shashank,

thank you very much for working on this!

> ---
>  Makefile        | 22 +++++++++++++++++++++-
>  edid-decode.cpp | 15 ++++++++++++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 1843700..ebf3370 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,14 +1,20 @@
>  ifeq ($(OS),Windows_NT)
>  	bindir ?=3D /usr/bin
>  	mandir ?=3D /usr/share/man
> +	libdir ?=3D /usr/lib
> +	includedir ?=3D /usr/include
>  else
>  	UNAME_S :=3D $(shell uname -s)
>  	ifeq ($(UNAME_S),Darwin)
>  		bindir ?=3D /usr/local/sbin
>  		mandir ?=3D /usr/local/share/man
> +		libdir ?=3D /usr/local/lib
> +		includedir ?=3D /usr/include
>  	else
>  		bindir ?=3D /usr/bin
>  		mandir ?=3D /usr/share/man
> +		libdir ?=3D /usr/lib
> +		includedir ?=3D /usr/include
>  	endif
>  endif
> =20
> @@ -19,6 +25,11 @@ SOURCES =3D edid-decode.cpp parse-base-block.cpp parse=
-cta-block.cpp \
>  	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
>  WARN_FLAGS =3D -Wall -Wextra -Wno-missing-field-initializers -Wno-unused=
-parameter -Wimplicit-fallthrough
> =20
> +LIB_NAME =3D libedid-decode.so
> +LIB_FLAGS =3D -fPIC
> +LIBLINK_FLAGS =3D -shared
> +LIB_SOURCES =3D libedid-decode-api.cpp

libedid-decode-api.cpp does not exist yet in this patch.

> +
>  all: edid-decode
> =20
>  sha =3D -DSHA=3D$(shell if test -d .git ; then git rev-parse --short=3D1=
2 HEAD ; fi)
> @@ -30,11 +41,20 @@ edid-decode: $(SOURCES) edid-decode.h oui.h Makefile
>  edid-decode.js: $(SOURCES) edid-decode.h oui.h Makefile
>  	$(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) $(date) -=
s EXPORTED_FUNCTIONS=3D'["_parse_edid"]' -s EXTRA_EXPORTED_RUNTIME_METHODS=
=3D'["ccall", "cwrap"]' -o $@ $(SOURCES) -lm
> =20
> +libedid-decode: $(SOURCES) edid-decode.h oui.h Makefile
> +	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(LIB_FLAGS) $=
(sha) $(date) $(LIBLINK_FLAGS) -o $(LIB_NAME) $(LIB_SOURCES) $(SOURCES) -lm
> +
>  clean:
> -	rm -f edid-decode
> +	rm -f edid-decode libedid-decode.so
> =20
>  install:
>  	mkdir -p $(DESTDIR)$(bindir)
>  	install -m 0755 edid-decode $(DESTDIR)$(bindir)
>  	mkdir -p $(DESTDIR)$(mandir)/man1
>  	install -m 0644 edid-decode.1 $(DESTDIR)$(mandir)/man1
> +
> +install-lib:
> +	mkdir -p $(DESTDIR)$(libdir)
> +	mkdir -p $(DESTDIR)$(includedir)
> +	install -m 0755 libedid-decode.so $(DESTDIR)$(libdir)
> +	install -m 0644 libedid-decode-api.h $(DESTDIR)$(includedir)

libedid-decode-api.h does not exist yet in this patch.

I find it a little odd to have these targets here without the actual
files. Maybe the first patch could already have a library building but
expose just parse and destroy functions without any getters yet?

> diff --git a/edid-decode.cpp b/edid-decode.cpp
> index 4a90aba..babff4a 100644
> --- a/edid-decode.cpp
> +++ b/edid-decode.cpp
> @@ -21,7 +21,7 @@
>  #define STR(x) #x
>  #define STRING(x) STR(x)
> =20
> -static edid_state state;
> +edid_state state;
> =20
>  static unsigned char edid[EDID_PAGE_SIZE * EDID_MAX_BLOCKS];
>  static bool odd_hex_digits;
> @@ -1012,6 +1012,19 @@ static bool extract_edid(int fd, FILE *error)
>  	state.edid_size =3D edid_data.size();
>  	return true;
>  }
> +struct edid_state *extract_edid_state(int fd, FILE *error)
> +{
> +	bool ret;
> +
> +	ret =3D extract_edid(fd, error);
> +	if (ret) {
> +		/* update the number of blocks */
> +		state.num_blocks =3D state.edid_size / EDID_PAGE_SIZE;
> +		return &state;

A library should not give out pointers to global mutable data. That
would break having multiple EDIDs loaded at the same time.

I would expect to be able to keep and cache 'struct edid_state'
instances created by this library until I explicitly destroy them.
I would not expect parsing a new EDID to overwrite the previously
returned object. IOW, I would expect to own the object created by the
library.


Thanks,
pq

> +	}
> +
> +	return NULL;
> +}
> =20
>  static unsigned char crc_calc(const unsigned char *b)
>  {


--Sig_/aG_exnUQwDlYfcntEJNgDng
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmImKswACgkQI1/ltBGq
qqcO5g/+NP/6uKHBAbAvLTd2ZuS65BsobB2Z4n67w7rNaQcyQWqbn+QTSH3gIW7e
HbRUJa/POB5pLJq1vkCFWmYKSUFGQqvRXsjxQteVOV0PpLfHlLaTy+t0koilWHB/
EAuvHDeW0+BiQa+bNSRhfQop8si8V5XGC4MyeBBywUcFTzUSoYAhSevsmG52432q
FT+VtDL65gH3unGIIAJYqGPSfet7HvFhs7sDkWryyOuv3myZL/o621ovJkwnHIxL
P9RBQRIPPSXcNf6MD2ZZvi7GY5cJhYwo2LyHE1zYTxgSxgqTzxF7WFLGjYKcjyo3
S3cWA3ek164KdhUsWJGZpudmyRwPsckNpvVXygSKE0W4J6sQWZ1apoLcj3yGosYi
CTq8qnrY4k7b37EckmEhgCbEgU33vDuKsABh/UaR+ITtKrxzGdpHU5/yDShNvrCX
LWXk+StdsKEFcnVT73gV/2v+WNnsFHEH8u0MyJ5Z+p4Y0Ji8irS8KZRXrNMg7utv
d+Y7BHZwNT0XwlDBvzVYrvUSIoNm9p9OPNr+0lUpzLUxMbQx0RJGMkL34blmLXtD
tlFT9mpZ0wpKWdRH9ytQcEc6UctBpLRBqtvderXt8SMfpM7ekD7hoM/TMRZxPHOO
M1hk9WnmgF2ZooT8xP1bAzyV2vqXUbUpDf9BUAxQYry6m8qyJKg=
=QOCJ
-----END PGP SIGNATURE-----

--Sig_/aG_exnUQwDlYfcntEJNgDng--
