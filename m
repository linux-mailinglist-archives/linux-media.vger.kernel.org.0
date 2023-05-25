Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB1671113F
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 18:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239950AbjEYQpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 12:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbjEYQpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 12:45:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E20F1A8
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 09:45:38 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:17:6c0::7a9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 649B9660296C;
        Thu, 25 May 2023 17:45:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1685033136;
        bh=ZipLwAG5pY+3P7LSKHOPd31Z7Acd3V1B6yyJMtko3+E=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Pa2d/BPuW/CyClZRXenLWk68wWnQ4ZRkOn+mfOklDjlGlhJGzP2WRQQB/c1zxjnjJ
         UJ/qZ2upMzsEJTMLyZb5Ur/h8Met22nvMsQWeZpNY5kNBNawh9K77Wyb7SxqRyP7qa
         Mfq5hAu4f4lv6NEAabtAbCYNme5ZYpsRVBhbpY7U5mu3w7VUmXNfnLX9zYoppfpw+O
         FQ4KTZHeOIfuPVToNNgZEGr/s3fPSIHAO7FfMZABgbk3L3vylvM3V/ccaKXYBMJMP0
         aRxUWdbFjHuW8Ctxa1JaYF4C6rxJMLcTXvVvmAexEqdhBqkZ1rqGzDmthVjkOi7sKg
         zlZn2D2x0v8ow==
Message-ID: <c6619ea163206dc31e90234c80070cda3ddb744a.camel@collabora.com>
Subject: Re: [PATCH] v4l2-tracer: Fix libv4l2tracer.so loader
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl
Date:   Thu, 25 May 2023 12:45:28 -0400
In-Reply-To: <20230525002045.82937-1-deborah.brouwer@collabora.com>
References: <20230525002045.82937-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Deborah,

Le mercredi 24 mai 2023 =C3=A0 17:20 -0700, Deborah Brouwer a =C3=A9crit=C2=
=A0:
> From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> The code was still assuming libtools being use, so it didn't work
> installed anymore. Also, it didn't work installed if the full
> v4l2-tracer path was being passed.
>=20
> Fix this by always trying next by libv4l2tracer.so loading (using stat()
> to validate) and always fallback to the installed path otherwise.
>=20
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Mind adding you Singed-off-by ?

> ---
> Hi - thanks to Nicolas for this patch.
> I tested tracing and retracing on both installed and uninstalled
> v4l2-tracer including with and without an absolute path and it
> all works as expected.
>=20
> Note that I've got three sets of v4l2-tracer patches outstanding now,
> but they all still apply independently of each other:
>=20
> Tuner patches:
> https://lore.kernel.org/linux-media/cover.1684453027.git.deborah.brouwer@=
collabora.com/
>=20
> Debug patches:
> https://lore.kernel.org/linux-media/cover.1681245372.git.deborah.brouwer@=
collabora.com/
>=20
> Thanks,
> Deb
>=20
>  utils/v4l2-tracer/v4l2-tracer.cpp | 33 +++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>=20
> diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-t=
racer.cpp
> index e3f002a9..7c3662be 100644
> --- a/utils/v4l2-tracer/v4l2-tracer.cpp
> +++ b/utils/v4l2-tracer/v4l2-tracer.cpp
> @@ -5,6 +5,7 @@
> =20
>  #include "retrace.h"
>  #include <climits>
> +#include <sys/stat.h>
>  #include <sys/wait.h>
>  #include <time.h>
> =20
> @@ -295,24 +296,26 @@ int tracer(int argc, char *argv[], bool retrace)
>  	fclose(trace_file);
> =20
>  	/*
> -	 * Preload the libv4l2tracer library. If the program is installed, load=
 the library
> -	 * from its installed location, otherwise load it locally. If it's load=
ed locally,
> -	 * use ./configure --disable-dyn-libv4l.
> +	 * Preload the libv4l2tracer library. The libv4l2tracer is looked up ne=
xt to
> +	 * the executable first in order to support uninstalled build.
>  	 */
>  	std::string libv4l2tracer_path;
>  	std::string program =3D argv[0];
> -	std::size_t idx =3D program.rfind("/v4l2-tracer");
> -	if (idx !=3D std::string::npos) {
> -		libv4l2tracer_path =3D program.replace(program.begin() + idx + 1, prog=
ram.end(), ".libs");
> -		DIR *directory_pointer =3D opendir(libv4l2tracer_path.c_str());
> -		if (directory_pointer =3D=3D nullptr)
> -			libv4l2tracer_path =3D program.replace(program.begin() + idx, program=
.end(), "./.libs");
> -		else
> -			closedir(directory_pointer);
> -	} else {
> -		libv4l2tracer_path =3D LIBTRACER_PATH;
> -	}
> -	libv4l2tracer_path +=3D "/libv4l2tracer.so";
> +	std::size_t idx =3D program.rfind("/");
> +	struct stat sb;
> +
> +	if (idx =3D=3D std::string::npos)
> +		idx =3D 0;
> +	else
> +		idx++;
> +
> +	/* look for libv4l2tracer next to the executable */
> +	libv4l2tracer_path =3D program.replace(program.begin() + idx, program.e=
nd(), "libv4l2tracer.so");
> +
> +	/* otherwise, use the installation path */
> +	if (stat(libv4l2tracer_path.c_str(), &sb) =3D=3D -1)
> +		libv4l2tracer_path =3D std::string(LIBTRACER_PATH) + "/libv4l2tracer.s=
o";
> +
>  	if (is_verbose())
>  		fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_st=
r());
>  	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);

