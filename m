Return-Path: <linux-media+bounces-20072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 293EA9ABF6F
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 08:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A32E51F24A8F
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 06:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814DC14C5BD;
	Wed, 23 Oct 2024 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsy/4TzI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933FB22318;
	Wed, 23 Oct 2024 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729666635; cv=none; b=IVcueVnDzAAQi2HOm0P8v73DXh0iAeNYgwoVUPOUXFeMRFXLHfMLkRcNn/GUBZMu05R/fEOkTUMUIVW5rF9k9qGdCLVdJhoNFAB9SMdItPs6Nz5KxGg1GwkLLiPjjHLqW+lZLrIeB0VIDV/HLZEnFsypY2lJl/S5yAr1pC5+5eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729666635; c=relaxed/simple;
	bh=VmCtvk6V8OmkJ5K/HWEg0c66PD8WlfznLpqAXnbKgG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx5E5oQxmC/UcKP8Zmjx0XFC3BS4OQU0bzLl723LDFU19U9vqQ7ZoeIwjbOlwXDMjAC5KKSL6lls0M7o4g9zycK4SLDmOzZACTMDgNBkkogb3IsaBekBL9uNxFoVMS2OzjN6FV7WffdBiLlBjDKli4z7KS9mjVROZUvT/wA1Tc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsy/4TzI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e93d551a3so4595678b3a.1;
        Tue, 22 Oct 2024 23:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729666634; x=1730271434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OTIVgmSCTxAjeufxAhXv87pU0k2+WfMQxkIbDxZyExg=;
        b=lsy/4TzIqO0IUO/PEKWBsOcfKKEwQn+sZpiCh8NsOKfCalkMLsHbRVXT2zZ2IL2kEG
         9B7kwquTuado61+lJHdb4JqG30njsLVx8EdJbCkeno1JhVZ2m5hzIHfZ39jYDCLmclZj
         vMpNTzKhbxHalEq/ALfyQrkFPkO8bHlNgqYH+nJosfTsnopo33kOnRmF5YnYfSVWkcWL
         KiGorZtuY2UpnuCvJBFTOQfNcRnaOwjMp2ZFpqKXE+VxJ82ctrzw05tXwW3tV8qAeedB
         rP64sVFoCCbSXCFw25UYrFSObu4ZkUbW3oMaTBXFDRQdsILQoUZTk9i48nYrhpuQo1Dy
         ZAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729666634; x=1730271434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTIVgmSCTxAjeufxAhXv87pU0k2+WfMQxkIbDxZyExg=;
        b=V/GP2MQirUajNjQVQm0O3TnoH6Po0DRzrjioj1D9TmIPrYXSEDb312mj9eCk+swKZT
         MbL2O/uaGAtM3t7uPNnkPLjF43WaLEhPUU7J/M9DhzH0KtZwh+w8kwodd9PJzz3rioPj
         KoOkyi/uZwyGC+PGLtAObmPD11UoIgLJBD29jhOSvKSrhxldQvnGvHIoKfgPmrj29FIF
         1zJ+aPX3Tshfl45r0CX4DYlW3p71y/2uc0ab8Ofu1T+aCNMYw4GXXlTyXYJN1VajG8qf
         OATSl6cvidOqCNuSWmAJJzEZqyUu77XA+sxwVwnH4kfkBGJ4Lf3120tmtB5XfbprtOgX
         K+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0aTZagB/w/AFktKjn2536sQBMG/Q+jUOFMtfrNRdrb5pIqdycEI/nOzBbSk/z8Chj2/CKBt1FlAsrUxk=@vger.kernel.org, AJvYcCWa+lZVwLB2UdQL//O+syUjLkd6J44IEL8hQurXAXdCS6ImjRDCPQV417RkDKVdHa9oFzMr5rIub90WCOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEDMkfalsum0IW5fF4eN4KAYzqm4IkO6NmBmhObcR2Qqmv5tQ
	Fym7a4i0MNTk3iKeF2x7Z6HBbTZqF/Y8Ef1Rp0GXL+pSRrZ1AWjY
X-Google-Smtp-Source: AGHT+IFIDWh7p+QxP4vOovIpqinmoWSh3kYTxqjFxl6iJptJMHcOZpQbK6c8z/jqu8AvDF6b6nI6/g==
X-Received: by 2002:a05:6a21:10a:b0:1d9:13ba:3eef with SMTP id adf61e73a8af0-1d978b3dd0fmr2004330637.26.1729666633734;
        Tue, 22 Oct 2024 23:57:13 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13ea279sm5683088b3a.168.2024.10.22.23.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 23:57:12 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E58F64396281; Wed, 23 Oct 2024 13:57:08 +0700 (WIB)
Date: Wed, 23 Oct 2024 13:57:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com,
	kernel@collabora.com, bob.beckett@collabora.com,
	nicolas.dufresne@collabora.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 0/3] Documentation: Debugging guide
Message-ID: <ZxieRCN8rFfgZGS8@archie.me>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
 <20241022152316.yr6jpjtcwidxytpe@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M6STrdpKMW46XULc"
Content-Disposition: inline
In-Reply-To: <20241022152316.yr6jpjtcwidxytpe@basti-XPS-13-9310>


--M6STrdpKMW46XULc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 05:23:16PM +0200, Sebastian Fricke wrote:
> On 24.09.2024 10:45, Sebastian Fricke wrote:
> > The RFC contains:
> > - a general debugging guide split into debugging for driver developers =
and
> >  debugging from userspace
> > - a new summary page for all media related documentation. This is inspi=
red by
> >  other subsystems, which first of all allows a user to find the subsyst=
em
> >  under the subsystems page and secondly eases general navigation throug=
h the
> >  documentation that is sprinkled onto multiple places.
> > - a guide on how to debug code in the media subsystem, which points to =
the
> >  parts of the general documentation and adds own routines.
>=20
> I wanted to give this a little push, so far I have received a lot of
> good feedback but none from the core and documentation folks. What do
> you think about this?

Address all reviews then reroll (maybe as non-RFC series).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--M6STrdpKMW46XULc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZxiePQAKCRD2uYlJVVFO
o3JqAQDJhBM5el/ZJxxkzFRi3Wb1thDGSpEp9V1vfmhkehIdbAD+K3avvP1asWGs
zGg0qt5pEq8BYK0c0l3mpm2F3E3lkAA=
=W4Be
-----END PGP SIGNATURE-----

--M6STrdpKMW46XULc--

