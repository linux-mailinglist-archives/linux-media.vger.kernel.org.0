Return-Path: <linux-media+bounces-2374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3C8120DC
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 22:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5E01C21163
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 21:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6677FBAA;
	Wed, 13 Dec 2023 21:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="uFLvdARc"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E99DB
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1702503832; x=1703108632; i=ps.report@gmx.net;
	bh=eq++nPzRhQAY72CKYdT7xMTIOm0oaK8ZrRP3G26ozDE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
	 References;
	b=uFLvdARcgN5k+TsHqXzzVUW4a5d0zhZZKguTpvZtNsVQ2QawOFgWBLE/YghE6AmI
	 x6L6lpp4ox7quc3bbmi/tavNlEaDQl6BkY1byPyLywPvg/9gKZ/XTExQFc9d0Snvf
	 AH3UZlXnaJvf/GxhjRGZ4b82qb7uB4IISHbnG/ILuavRpfYnHq0R/Leuug8D0quit
	 gG87j8mVrUlCvt0QMJsWstuRceYEMdQiHQzZzkODXqz+5kmmL18dJyjO4gClTOkF2
	 b/It4xW/0EddLNmK78Enw9nDnVM1llOSxj+Fc4JNk3SHL78evkssM4QYz9hRGC4IE
	 AFNkdQ3W5DForGBGkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.181]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oFz-1rSK6v29BN-00wjBn; Wed, 13
 Dec 2023 22:43:52 +0100
Date: Wed, 13 Dec 2023 22:43:51 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Le Cuirot <chewi@gentoo.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] meson: Fix building with -Dv4l-utils=false
Message-ID: <20231213224351.3f31b5fa@gmx.net>
In-Reply-To: <20231212152418.20584-1-chewi@gentoo.org>
References: <20231212152418.20584-1-chewi@gentoo.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zx32Y5NviSTEaiTaxN0EmsNEUU2Gkx1sBojoVhKdsPBaKPxKqtE
 /MVXQpA6x/W1ghgH9i1XjBJOwznsAOBjK5kgvs9MiZTWhgQUjyTSaf9CrqUbK5gf1whfbco
 yEWU1VjUqv11VLdAcZOVypeFtdHIEp7aQHGHp4i8sw0I+N92mnmPF4kKclB7uLMkiB05obJ
 bm7+Jx7ov3K0+qQDQDzgw==
UI-OutboundReport: notjunk:1;M01:P0:ec4l/D638fo=;Ap8nhtb76jGuGzGtHs2vM/p3Udv
 RHCcwc9pOjKSuuNCt8kJ05Sp9IRITa4ZcS5SiQ+mHTAmWGEbOch63XUNuVnyfhXlm14QwgYA4
 BMM1bAVJcpLanmxQ0K4meWVif34lhb4YI9ZH3woCCFBuInb2l75QiRIhWwTs+3KsYhO3LciCv
 sLb0EarMJIrdj8AxzdrYinuJ8QkDAE/I4MsDily5euFzcU3i1etVOZfvwoIigTFuPImwbDyGV
 t9Gqc3aGMyeVKtIMMWZGXc7ZMWmzWBe92EUBwK3UHKl6U/Gh8/ds/XYra6AF62x2U2se6nzhn
 xUnl8jIeSwbOxejgMgz5Y3hdIX0VeVhTAaZGiTU4H5eXkZPgM3QBIdWdiMk2SMUqS6B8TEcUc
 /B6XFbsINMcqryXV7LWRIdeb8ylAHNcncTw0kqsHPmQ+NcS8zHXTCoTcdVStDNgF3UKnUWWrD
 k8EdA81IziU1FGK3tTS9DZdp/IdFaats1R5F6DqUuRUJKsSU8Ibab94hrzOnHoDfSyk/saJOL
 kT9SVJXqZNk44VFVpSuaMTeWG7HuUPGOcj+WGGSZsrl66YJDWujbZZZycLBLejY3iGlLkkgey
 kJrl+YRloXahLaKymdJx2X2HasG8Y4nCGIxhMLzqR1roBEy6vKfLIztT0NNJ0mDkAeLULESZ4
 BaLDBQjydYvaX2+s6hVO/6gbNLoSDH5X5EBcCBHskd75/2Q2jH+t1uqqST4bw3eMvGRJlkrKQ
 sxSqVZ8LdRVPbDlcTKgYl4yrQZzrZgxzkxoqCq8QgiuzO7gL9chnoviiXw3fzG5bkMl5Ufb2O
 cqVqpuQWjtobm7+r3u5eEuv8aUk+8W6aMOAzi8P9QyQVDeJK7MYC/VPYM8xocs5AZq4eR/0/+
 4858Wa+EUYLk2tXCeCY8B0ob4j6FuDtx1SQa2bs2rv2zYZpj0Pl/IRrmVzr+/nZECk8kWV4yr
 ny6reA==

On Tue, 12 Dec 2023 15:24:05 +0000, James Le Cuirot <chewi@gentoo.org> wro=
te:

> ir_bpf_enabled was referenced without being defined.
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 03508bc8..d9689d35 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -382,6 +382,8 @@ subdir('lib')
>  if get_option('v4l-utils')
>      subdir('utils')
>      subdir('contrib')
> +else
> +    ir_bpf_enabled =3D false
>  endif
>
>  subdir('doc')

Can confirm the following error/failure without the patch (using
buildroot where v4l-utils is known as libv4l package)

  .../libv4l-1.26.0/meson.build:406:32: ERROR: Unknown variable "ir_bpf_en=
abled".

and no error with the patch applied, so you can add my

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter


