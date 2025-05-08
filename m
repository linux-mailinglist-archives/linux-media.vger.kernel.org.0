Return-Path: <linux-media+bounces-32018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1030AAF5CB
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C43ADB21538
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 08:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98747261596;
	Thu,  8 May 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6GUlPSE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A95216386;
	Thu,  8 May 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693452; cv=none; b=eXI47s9SzgaH/Q4FdTCt9Ht8F7n3IJB7UYIIeTdV3AwE7Fi/eZwX60aLRRlW15/xMpIEJW5rvgBu+VwvYlXG9D0rLoLE9zDExG/Ip5Y121h9OhWAbx6VGnxIOEoAWrxPW4+ECiKePZU9yoBuaS0m67AIGvxFS7SoXqPmecnEXVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693452; c=relaxed/simple;
	bh=7dQP+Jvf9t5LMLKit8Xc4iV14+1km9Y870bkbSTRI4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zy3rSza/vlpslQ+AdadWcKE9pfPLbBtQyC2h3N7pVSFkr9Dm4vy2OtUq04lcf+5g1Ctuz2tk1h/lBbuyiniQ0pchiviU8C6A7bLr19mBpvF0b+8s2f6byB11tJ402WrpfPhmrOxTxEenMht7s5fn9afTjf8LEw8SYveH2vWKeSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6GUlPSE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb615228a4so359487666b.0;
        Thu, 08 May 2025 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693449; x=1747298249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dQP+Jvf9t5LMLKit8Xc4iV14+1km9Y870bkbSTRI4U=;
        b=l6GUlPSECnTaHoBKeqlse7UGtQHvCCJly+ZXFyuIIHRvGn+k0M8erBwnADpwTKHGX+
         EMAtV/cYv0bPQ2HFjgleM7NGk1q6Gemcg5Hp3eg1OAlUWpf0tF0o8KduDRyvGs1Bk/8E
         lxRBsm2tdL+m0UYa/30vAzk4FQtj0VDLKI2PBt22648FahNw/zl0ctX7H0KqQrNwuH+8
         LzmocLyQxaxs4r1LxXLSXlYqAcDgZJvj1KYFKKcCnuJQwWvvG9FEftC5Od0K7pnowx9Z
         N1gfar/hai8BhwJTXkrqUcioUMSigp9vs+zN8lJ2EUSGT/bJ0TEcWdt4Qktt90wafoTd
         jngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693449; x=1747298249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dQP+Jvf9t5LMLKit8Xc4iV14+1km9Y870bkbSTRI4U=;
        b=C2x4IARNn+CEUBoX7/BxvxQePRmnxLs9GCExXwWqPPIFwgwoiOiw5ukG5hDDb46X+p
         RaN+Qj1/jvG2fVwpckwOWl6I8MOMSLEEc+CTF3yQh1jKdmznKdSny63JseGF+Zhes7X4
         bPL8nuhIlOIxie/JmPq0L9mBRuePmhypXNcslN1BN+GXPZcxmoC0VR3aLASdD7dQDFcp
         EthCsRqycN2Y2FGYKC1KHMAn6UfX2TBBTKS8un2w0iH6E5DnO6B/CWFzZ5uwUR/dL7qC
         s/gnbn6Ilw618dgCtc318DcvW2Qsvtz0JzXYkm0iY3ceMsRecpc69VXTeewVf6Dattx5
         siMg==
X-Forwarded-Encrypted: i=1; AJvYcCUb2CQX//Idy65U+Jqq1ptvdo8pw77ewrRq9brFh1ep7rvwMkedgqyEMXIQUp5oV5Kphtwha4tyCiDPeA==@vger.kernel.org, AJvYcCUlOz5cwdch8eUTRAlM778LDrEUq4WMSo7IGyTqLv79kn3zqq7U/TIX3FHfhpIxxIRGP/L0/S55gewwfkoLSaA3CLGsKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5FyryifPlL82kyILAF4T7X/0ANLbsNz7+JGrXTWOrqI2Hs4G
	9gBCw9kJ60NTcd2brEbph6K4thONfCfsZh43wJNfIVhLsf4QdBkMntQQJQQe9qmUhbFh4v4xrTz
	A/vuIupetJyUK0rtAzf377lZ6Cq8=
X-Gm-Gg: ASbGncv62hvSkmDa87cYjQuwwd76osWc4kZ4oVjQNJ7dqEa2t5UOTTZ8tbaLag68Oqk
	bgcLqpG4YUWagduTNxQQFAUsjsPbp3pMSQJsScC6OnMin7pDoqWTIseIEkA693bd0DIPvxmGvqH
	wUBNX/8LMK3VrUZeguyiUJNQ==
X-Google-Smtp-Source: AGHT+IHp1CSHIpHxDY8gNgAOG/Ce7goUUDIKVoWAEswBpVlH0Z6TBbCa2vI02a48zmGb7MnI8O6qDy+SXjJoJjNpM2w=
X-Received: by 2002:a17:907:a4c3:b0:acb:aa43:e82d with SMTP id
 a640c23a62f3a-ad1fcb581e8mr297604366b.3.1746693448604; Thu, 08 May 2025
 01:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:36:51 +0300
X-Gm-Features: ATxdqUEcbG6dK6948mLkuyvGtqVmoKxzr2JJzZa-z3S-SBMUTLf0FVaZwT3s1Es
Message-ID: <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:

> This patch series does some small refactoring of the int3472 code to allo=
w
> re-using the sensor GPIO mapping code in the atomisp driver and then the
> final patch in the series moves the atomisp driver over.
>
> About merging this, maybe the int3472 patches can be merged in time for
> the 6.16 merge window and then the atomisp patch can be merged after
> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
> 5 patches will be necessary.

Overall I'm pretty much liking this series, but one comment against
the last patch (see there) and one question here. Can you isolate GPIO
mapping code in a separate file, please? This will help to generalise
this code outside of two mentioned drivers (I might need it in the
future for something else, not related to cameras at all).

--=20
With Best Regards,
Andy Shevchenko

