Return-Path: <linux-media+bounces-33227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E090FAC1CC9
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0415EA202AB
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 06:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7B2226CF6;
	Fri, 23 May 2025 06:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7ytvcw1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AC9223327;
	Fri, 23 May 2025 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747980601; cv=none; b=qH0QDugo5wBH7JZogVfVW0JEYZDLLwAvWhTpiBj9QRTcbEoQXAQsGfQiP5HMrBRAH1GN+8d04FmiLazEvHOMqGCpTK9ZncymS3VDoI1wnF3wM8Gy16YVbwPNK6MlUnVcXg7GWu6//VD7/GljbvcT9/tWg851PI6tvJBapmf/REI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747980601; c=relaxed/simple;
	bh=l7mVZhnA7UeGTT1CfpwQ38MXJvJ4doRi138QCVonhl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwExLS3Cy2i7yk3kOczHe4fyTolI4fjA6Xk0TkYI0WNSvp1I1HJC+MVdXJwv0nE+s3/EHLVpd2GE4lf5R3RKEPx98CWndgXsvgh96MpgKJKgVmTL0NHxCDciQ9iDvG8WJQ/lmw7BPqkL9S0gL9aZ0ihAzm66lSSixw07YyuQqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7ytvcw1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af6a315b491so7261033a12.1;
        Thu, 22 May 2025 23:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747980599; x=1748585399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BLfWe8r/ZmGQSjoYBeqTxESsSaQlqdTgkljmUOXlCFw=;
        b=Z7ytvcw1vN2Da5bihyf2vxAd2/NbvMu9qVL1+GicQj9+TduOw/vsJp9e+MOFrMssy/
         7o9wm66OflLdF5dT+Lq6GM/hLtcBWzOSSXOQmhVPTvesmmTlablo2vghGQBJUWuAM2ki
         BnpMGIu0iBKFklGt/0QUvwy/kPXojFWseB8jjg+Q5Vn4B4gvGp/rS1mtJ1VFjTIxB/BB
         Ge2hE62q9OUYO6zgH9cj69s19Z/1Z8NQSBf7MFgtsTz7FG+FonslfMSFmL70x517/bNr
         Dr8udZjAaVFUP2VFTcAeBiOdOjLRWVtHB0EwXW3Nqgk0BO0nZ4ILIRSb7ZCbqKJIxph1
         3j8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747980599; x=1748585399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLfWe8r/ZmGQSjoYBeqTxESsSaQlqdTgkljmUOXlCFw=;
        b=ih5284jZt2XZfic3+xL4Ir0ufnJFPgstxGzs2j8e1TZ7L892GyPHZ8/m0FIIJiuNr7
         kKHj6YNSgPd1p0kscwWX4nXL9752pxV3dfQjVWaUh71dZ8p3X4u5mDACk1Ik/etsUFvY
         emGPtKgNUnBP5iOq+N2mwWYRBY1aBuh4HsHRBSS02Nza/UzkqiI2Mlbi+1LZTjBVMoZj
         F3EyooGY3qVGRuY//v3pbNmDcebrtyDh60XG07fyqEl3xKjkgMsC5xeICgVQEesed9ig
         plLPNvv8M3SOyPgg6JyAfmVQydeFa6qpwAk2QE9MHkiPwvM4DEeweXgc0fxnmLAKyLv4
         T9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU0IM6NqH/iUdDYRZK7xzLOYkJcQZOKiv754AUYnfrpqqi0zyiB/58VfdNRy4Lmgr+WtT4VxxGa4HxspyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsZAWNhY6nd66Loud96a8Z2BShPdHtcCuo90bPJy67uM0+25v
	hGaCICZzuFfM9cmOHe6HsyIde+QlQ7PmS32+sgcIIbytdZK5yNZJUdcc
X-Gm-Gg: ASbGncv0de0ddv+M8ZfXPQGBsAZZzIzESZW/1gu2y8TE7vAX1/vZu8rtfiwwTbxoK9O
	5psM3d6OSfRErcqNiKHg5oO724456+6FCzfJ0YaHErL5Mr25HO5uw9ntA/5DUT9iOlkbeORQ/iy
	mVbDN9ZKBebvQLXMVtWJwv4cxBVAeoDJFLAWmOPNXz+9La+VYhtWdF91EOpygYhOt8ooHiBnAhU
	3fEuzhVzyp3d6WQOkYqXMK47dJZ3KcD5LfEba1V3aFnskgDP2UZ4iMeiZHgTKjYKDPO3UombqYj
	tZYVeGHe8xLMx6ahpbWlaQR8aNpROsLvqsIExCYkIo3Mqepuh5I=
X-Google-Smtp-Source: AGHT+IHwPwZKNBQOk7/x+z4DLM8bexBIdQhHmlpxJeY0yh3X8U/K+6tMe60rYS3xWYSakT8L9M18eg==
X-Received: by 2002:a17:903:228d:b0:224:191d:8a79 with SMTP id d9443c01a7336-231de36c2b8mr339006365ad.27.1747980598644;
        Thu, 22 May 2025 23:09:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4aca130sm116700565ad.18.2025.05.22.23.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 23:09:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DF82442439C3; Fri, 23 May 2025 13:09:55 +0700 (WIB)
Date: Fri, 23 May 2025 13:09:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, hljunggr@cisco.com,
	dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
Message-ID: <aDARM0De6eTuAVL1@archie.me>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-3-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WVbEkApi40HYAEEw"
Content-Disposition: inline
In-Reply-To: <20250522115255.137450-3-hannelotta@gmail.com>


--WVbEkApi40HYAEEw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 02:52:54PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/=
userspace-api/fwctl/fwctl.rst
> index fdcfe418a83f..a74eab8d14c6 100644
> --- a/Documentation/userspace-api/fwctl/fwctl.rst
> +++ b/Documentation/userspace-api/fwctl/fwctl.rst
> @@ -54,7 +54,7 @@ operated by the block layer but also comes with a set o=
f RPCs to administer the
>  construction of drives within the HW RAID.
> =20
>  In the past when devices were more single function, individual subsystem=
s would
> -grow different approaches to solving some of these common problems. For =
instance
> +grow different approaches to solving some of these common problems. For =
instance,
>  monitoring device health, manipulating its FLASH, debugging the FW,
>  provisioning, all have various unique interfaces across the kernel.
> =20
> @@ -87,7 +87,7 @@ device today may broadly have several function-level sc=
opes:
>   3. Multiple VM functions tightly scoped within the VM
> =20
>  The device may create a logical parent/child relationship between these =
scopes.
> -For instance a child VM's FW may be within the scope of the hypervisor F=
W. It is
> +For instance, a child VM's FW may be within the scope of the hypervisor =
FW. It is
>  quite common in the VFIO world that the hypervisor environment has a com=
plex
>  provisioning/profiling/configuration responsibility for the function VFIO
>  assigns to the VM.
> @@ -105,19 +105,19 @@ some general scopes of action (see enum fwctl_rpc_s=
cope):
> =20
>   3. Write access to function & child debug information strictly compatib=
le with
>      the principles of kernel lockdown and kernel integrity protection. T=
riggers
> -    a kernel Taint.
> +    a kernel taint.
> =20
> - 4. Full debug device access. Triggers a kernel Taint, requires CAP_SYS_=
RAWIO.
> + 4. Full debug device access. Triggers a kernel taint, requires CAP_SYS_=
RAWIO.
> =20
>  User space will provide a scope label on each RPC and the kernel must en=
force the
>  above CAPs and taints based on that scope. A combination of kernel and F=
W can
>  enforce that RPCs are placed in the correct scope by user space.
> =20
> -Denied behavior
> ----------------
> +Disallowed behavior
> +-------------------
> =20
>  There are many things this interface must not allow user space to do (wi=
thout a
> -Taint or CAP), broadly derived from the principles of kernel lockdown. S=
ome
> +taint or CAP), broadly derived from the principles of kernel lockdown. S=
ome
>  examples:
> =20
>   1. DMA to/from arbitrary memory, hang the system, compromise FW integri=
ty with
> @@ -138,8 +138,8 @@ examples:
>  fwctl is not a replacement for device direct access subsystems like uacc=
e or
>  VFIO.
> =20
> -Operations exposed through fwctl's non-taining interfaces should be fully
> -sharable with other users of the device. For instance exposing a RPC thr=
ough
> +Operations exposed through fwctl's non-tainting interfaces should be ful=
ly
> +sharable with other users of the device. For instance, exposing a RPC th=
rough
>  fwctl should never prevent a kernel subsystem from also concurrently usi=
ng that
>  same RPC or hardware unit down the road. In such cases fwctl will be less
>  important than proper kernel subsystems that eventually emerge. Mistakes=
 in this
> @@ -225,12 +225,12 @@ subsystems.
> =20
>  Each device type must be mindful of Linux's philosophy for stable ABI. T=
he FW
>  RPC interface does not have to meet a strictly stable ABI, but it does n=
eed to
> -meet an expectation that userspace tools that are deployed and in signif=
icant
> +meet an expectation that user space tools that are deployed and in signi=
ficant
>  use don't needlessly break. FW upgrade and kernel upgrade should keep wi=
dely
>  deployed tooling working.
> =20
>  Development and debugging focused RPCs under more permissive scopes can =
have
> -less stabilitiy if the tools using them are only run under exceptional
> +less stability if the tools using them are only run under exceptional
>  circumstances and not for every day use of the device. Debugging tools m=
ay even
>  require exact version matching as they may require something similar to =
DWARF
>  debug information from the FW binary.
> @@ -261,7 +261,7 @@ Some examples:
>   - HW RAID controllers. This includes RPCs to do things like compose dri=
ves into
>     a RAID volume, configure RAID parameters, monitor the HW and more.
> =20
> - - Baseboard managers. RPCs for configuring settings in the device and m=
ore
> + - Baseboard managers. RPCs for configuring settings in the device and m=
ore.
> =20
>   - NVMe vendor command capsules. nvme-cli provides access to some monito=
ring
>     functions that different products have defined, but more exist.
> @@ -269,15 +269,15 @@ Some examples:
>   - CXL also has a NVMe-like vendor command system.
> =20
>   - DRM allows user space drivers to send commands to the device via kern=
el
> -   mediation
> +   mediation.
> =20
>   - RDMA allows user space drivers to directly push commands to the device
> -   without kernel involvement
> +   without kernel involvement.
> =20
>   - Various =E2=80=9Craw=E2=80=9D APIs, raw HID (SDL2), raw USB, NVMe Gen=
eric Interface, etc.
> =20
>  The first 4 are examples of areas that fwctl intends to cover. The latte=
r three
> -are examples of denied behavior as they fully overlap with the primary p=
urpose
> +are examples of disallowed behavior as they fully overlap with the prima=
ry purpose
>  of a kernel subsystem.
> =20
>  Some key lessons learned from these past efforts are the importance of h=
aving a

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--WVbEkApi40HYAEEw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDARMwAKCRD2uYlJVVFO
o/I+AQCdeNPV/DNKktOuarD+Q/RnQgG7OQyKLqB3pl41foJoQwD/ajuK15t0YAp5
zo141GejI3iaTlLsbImfpoDWWw5MDA8=
=/VPk
-----END PGP SIGNATURE-----

--WVbEkApi40HYAEEw--

