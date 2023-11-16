Return-Path: <linux-media+bounces-446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99657EE0B5
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 13:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03F1EB20BC9
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8E72FE24;
	Thu, 16 Nov 2023 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="nZLxjX6E"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DC618B
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700137877; x=1700742677; i=ps.report@gmx.net;
	bh=ztIfj28+tynNiH7b0MBsWawOqU80oSyTgmGAP1uQfyY=;
	h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
	b=nZLxjX6E7oQb2tox9UWTy41ub2TdJXHaC8jnpuYR4B9ejnY2pB7vfhY1NPbXZQ8P
	 UPqhhuKFgGCXavwFbVFsxAyWL85mURrBAT23HrR46pR27KqwswYi7CAbLgOLJQr4y
	 /Rz+thPSVIaGI759LB6XuN78vUHgs943ms6QShF8J+JG9hCB3nwMiBNBbyhoGCjUk
	 cddBGmIZplNjlwnZfG89xEPJAI7It5DJBqv9y9H838JE5CkJ3mq/qTi6LfIIbWLnq
	 jTlzW720OZC4oya9tdSngVcgrugW1IVMjWErJbqc8U9YU1jja+k6E2ytRf5Zkyg2R
	 bdr5mI/XG9wDBzqpWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.247]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1rK2FO0OtL-00ssVm for
 <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 13:31:17 +0100
Date: Thu, 16 Nov 2023 13:31:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils v1 1/2] v4l2-tracer: wrap open64/mmap64
 functions only if linux && __GLIBC__
Message-ID: <20231116133116.6a25f5fa@gmx.net>
In-Reply-To: <20231116121947.28147-1-ps.report@gmx.net>
References: <20231116121947.28147-1-ps.report@gmx.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4MM3pIZqkXih5eoblRmx17R1NZq6zy1PmCpVqOJhAQwEO2IOEy+
 h0SIrukvSaGdEJWhAW/y5l60BAJOxNNC0NntYgmvH8Xkdu1bkwEIe3VshFwiTSHfoJsaGtJ
 m3Im5a7DZ87mcehvlV2jvFz07PLIQj889AeyRfPrTLseexeOnlDbB5PrSa4pRShQQRr+1it
 ulC2Qz46ZoDs+iNqd2lxQ==
UI-OutboundReport: notjunk:1;M01:P0:mnTyfDJBydE=;Qut+FsC+j3w9filXqH6uUzhvErC
 Ft0HnvJtMIalTsqKhYfvUXLN+ueGdDIW4YYfBhb70oFBHdwzdTeqSZTSZOehFLecA+bPbqKD9
 IsznThdy84/5RspUx1bceujqQApNWE0P2NJwg0bMX7zKDdEvZ41n3gkcRDFHzLLuAoRpIUzCN
 zp1rg4epQez9r605QY4ix7nGW57RtI71QfOA//dARjICH3CRsH7mWb5fvM78bAW0HH2DKxIpS
 j40mQrSm+hC9lXx4YpO7jQ+vT9o6GXrpRD3o2YyeqGLGzbyvgsQyTXwQvRSahML3uzcsjr6+l
 yi2otwA9kvlShykBf3XSIY4ylmRoXFLJQUfioX/J2Li89evw8sg/QREP2lmUqO5u+3/38hS0b
 D11RRyufeb2TOm1SCPKRh/HS6LYKJdEZx8ePqxu01i4FqUp3Y8XOoG4k27invYcoWa5RneeLK
 sQH+sx+t3gYm0/zyvqfjdUCdhzQUI+XXUnHV3DUI/YIYWXkUa1emxPu3yeMltpnAtgijf9i9L
 qnWYWKBzAyv+dY78w0Hc6HDvpyHJrzkHB0ieKCI1xXkikheS7KorNq7OblpiiqoVAX2wzsmTu
 YaSzCOgwkEzAjOn7RbEHJ/dOkXFsDKVXP0NKfavcYqsrjb6Jp0/Cjjm/6AeT0mE1oXW+spNc0
 CjdCPw5JbJ+QIWrxXBpglC3+r5Sy9v7O7eSgNy8vSezdaP+X4fldyRg1sNGW2wCxwiUYXr8/p
 cAW0XjwCBhjRfh4+9wFYsr2yIoWqp0cqde7Cn1UpMjqVJftx8G+kC6sk+aJn5wRBNKPbdEzty
 PQuVaPfYKH3eLJHDtkSeb4bj1VxLgIRJUk1noNsN4/Oe6uiMTrkV9SokkoBFjXkhoJzTg9Ha1
 2UzK0bhjXA6M/lUJe5r0sC153pO07YmuSwgFwUpoVIWXmW8jniCPEE3b3FEeEocqwPuH5uIN7
 Ura5Aw==

Ups..., wrong command line resulted in resend of old patches, please ignor=
e
and sorry for the noise...

Regards,
Peter


On Thu, 16 Nov 2023 13:19:46 +0100, Peter Seiderer <ps.report@gmx.net> wro=
te:

> Wrap open64/mmap64 functions only if linux && __GLIBC__, as done
> in lib/libv4l1/v4l1comapt.c and lib/libv4l2/v4l2convert.c since
> commit 'libv4l: Wrap LFS64 functions only if linux && __GLIBC__'
> (403a4e2697a1ff96fe2fa16589039595f21cadf0), should fix musl libc
> compile.
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  utils/v4l2-tracer/libv4l2tracer.cpp | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/lib=
v4l2tracer.cpp
> index a9f039c7..68f6304a 100644
> --- a/utils/v4l2-tracer/libv4l2tracer.cpp
> +++ b/utils/v4l2-tracer/libv4l2tracer.cpp
> @@ -89,6 +89,7 @@ int open(const char *path, int oflag, ...)
>  	return fd;
>  }
>
> +#if defined(linux) && defined(__GLIBC__)
>  int open64(const char *path, int oflag, ...)
>  {
>  	errno =3D 0;
> @@ -124,6 +125,7 @@ int open64(const char *path, int oflag, ...)
>
>  	return fd;
>  }
> +#endif
>
>  int close(int fd)
>  {
> @@ -177,6 +179,7 @@ void *mmap(void *addr, size_t len, int prot, int fla=
gs, int fildes, off_t off)
>  	return buf_address_pointer;
>  }
>
> +#if defined(linux) && defined(__GLIBC__)
>  void *mmap64(void *addr, size_t len, int prot, int flags, int fildes, o=
ff_t off)
>  {
>  	errno =3D 0;
> @@ -191,6 +194,7 @@ void *mmap64(void *addr, size_t len, int prot, int f=
lags, int fildes, off_t off)
>
>  	return buf_address_pointer;
>  }
> +#endif
>
>  int munmap(void *start, size_t length)
>  {


