Return-Path: <linux-media+bounces-40112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36711B29CEB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD4C7189C242
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0085D3074B0;
	Mon, 18 Aug 2025 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkZUQE5R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E2275AE2;
	Mon, 18 Aug 2025 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507382; cv=none; b=uJwCB0btLFvm/BkgLRn4cT8z4a2ptuNrALopKtlvdV7WILkqMt2oHH6X5wz87aPGfyktPWnZqR2N0Vw1stBwAxqnrtsSsEHLkvjFyO/UhOzxAvjvksuBqPmCWjmEhZ/MXAjSS2Ksi/Imbo6YDPCKjNKspqDanFsbz0MgpHdCWAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507382; c=relaxed/simple;
	bh=OL73hT3OhK99FPrkZtZUFj5a6fsQ+R9cHTctweIqbzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZ/DbBaXlpmo5YNQzSQM84X7+0qPF4ugBq/ywQOuMwK07/45qy2vn4stPBEpH4LEVTiPCVSHDeDEuv2TW9n2rjYkgrTPG//DWq3d4CAcItcFrd1fg5InbypBuOBOIj4l9GP+JLZ++aBEBkUGS4QdlFEMeQOcML9Lx0RIb1D9R8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkZUQE5R; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-244581cd020so4485745ad.2;
        Mon, 18 Aug 2025 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755507380; x=1756112180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLE/+OJq5D1tm8Ct611f+t2W20HfUpodMhEG1suL1rY=;
        b=QkZUQE5R6axn0qMdngaC6mKR4/jnJEEq196LaQg0cyd/VBvtZ1zDGhRUcAks2kWaMI
         CQ16xPB2CMlqAQo5m7uI86KP/jlHQPVUpHRCydNyvii15kFT5UC9hJsti/iZVEF3XOQ6
         7Z4aVfsRqnGGSsMyGSxowgjVY2WGkHP90XHR1lrAB3hFjD1oGQfaVUzFfNZa15ZDAKgH
         LG+NGYzQaGlE1Zr1piKIOxIjqUITt1Lq2jxtfXdTzql82WD7Ac4qfzM5Z0o4OeMT3Djk
         9fRlxg5EaT54vR7Z+hYwp8x7WqI/5hGntq3ss87y8BpqW49NloomKTzkQtYpC/5uVVQF
         sSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507380; x=1756112180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLE/+OJq5D1tm8Ct611f+t2W20HfUpodMhEG1suL1rY=;
        b=kcp+yZccQQvhhamqseONie2xSnUYRAeNxDpS+tPxHPitNE5fpH4oa+k+1U56vyv2kJ
         UXhel85MHXxXzDSHs9dvS5/oTrWYXrQswVyEfh9gvQ3xSnngksDlLFhR/CP7zvagf0mR
         R+DOF02/NO/ZTmr1EmJs1FrvDnUU6LIJuUITJgn5d0FCKgmeKILUEapMd++urWeSnGBz
         DahIXRLwFTGE6h1cTIcdAVAA7xm8RS2h9zh1TvxKaM0poqb9ld8pEOCSfIs8iZGyMsRV
         HE4Vircl7ywDFlYztn3hPR7qiFCgfJ8NxdH062a8BVaJz94PTDCfIh4prsuxhjgdAzIJ
         PGrw==
X-Forwarded-Encrypted: i=1; AJvYcCUA3cMlNACflyRhqFiA9KxlPGU3r94A4/EtBGyjNdlVKTfI/cJY6RNEmF3XJ+OYHEakHpW2xiKGaOG5DEI=@vger.kernel.org, AJvYcCVk28aW4Y0XWHgpocfhUKg+UlicV/mmWBt6iGMafq8tczpmOQYqDDnqNhiX5IiwhLAk+Y54xQO5kzWLF3Y=@vger.kernel.org, AJvYcCXX6t24ol5wi0Fca3Ztamgp0bLjAzPe5OPOvROwOxK71mdN42nWX+SdFurwX2CJWSqq3Hdkw/FmggFhC9VU1zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6QWziUkBsu0eayZ+RBhY8dPljaDEV52iz1s5whhLbBl9vvpa
	JTrcePQRdAib++3G8DIdHy7+OvxOP6467CK1oF/WJJGVD14tHiVqemTy2OxFEMb9PygeoWbdKdr
	ROx7t7+N84E3wPZKONUNDErJGDSCsIvU=
X-Gm-Gg: ASbGncurMSdLBWwnkO+sp12ZzqJ8432uSeMfYthM8ZqCCSBCzMq3Iu93rIynir2fKyv
	vg68MZLwhCp1NXy4rBrUZBgkgKYmeVzMfdbvU3+OADFnYxwWkPTENAkMz+y0F8H9h9macQ1+sAS
	dYFKRZdqo12VepmeHkN0KngLBAvRqo8d6L8l/dd16hZ4Kfkfwy0hsaQU8osWbJMspN2PVKmYilC
	K4Mga5Dy/+CquVMYcc=
X-Google-Smtp-Source: AGHT+IFnYq4DPCSrNjSV1bQaU/mo30fY9TxDpsI8Q97EthVdpqNPEah3SP/l+NrUPauakRSfT5X6gSl7cufAyXa+VXM=
X-Received: by 2002:a17:902:c94c:b0:240:4cf6:b07b with SMTP id
 d9443c01a7336-2446d948225mr80233615ad.9.1755507380351; Mon, 18 Aug 2025
 01:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com> <20250818-v4l2-v1-1-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-1-6887e772aac2@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Aug 2025 10:56:08 +0200
X-Gm-Features: Ac12FXwBBuluDOD_aLqqyhFrvJHlZY771s_SbG3fLmo_MmPXDyf6MPM071NFoCQ
Message-ID: <CANiq72nE4gfek82PyOJKWD7Pq4mUWU-E=MFX8hw4LAQtQpr8yg@mail.gmail.com>
Subject: Re: [PATCH 1/7] rust: media: add the media module
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:51=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>  MAINTAINERS              | 7 +++++++

I would suggest splitting this into its own patch, "MAINTAINERS: "
prefix, so that it is more visible. The other bits can be moved to the
first patch that adds the file -- it is what we usually do.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa45799dfe07de2f54de6d6a1ce0615..6fc5d57950e474d73d5d65271=
a0394efc5a8960b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15434,6 +15434,13 @@ F:     include/uapi/linux/uvcvideo.h
>  F:     include/uapi/linux/v4l2-*
>  F:     include/uapi/linux/videodev2.h
>
> +MEDIA RUST INFRASTRUCTURE

It may be good to match the parent entry/subsystem, e.g. with "
[RUST]" at the end or whatever is the convention for the subsystem (if
there is no convention, then " [RUST]" is what we have been normally
doing).

See e.g. "PCI SUBSYSTEM [RUST]".

> +S:     Supported

Very nice to see Collabora wants to support this!

> +F:     rust/media

rust/media/

i.e. a trailing slash here is mandatory to include all files and subdirecto=
ries.

> +// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.

SPDX-FileCopyrightText?

> +//! Reference: <https://www.kernel.org/doc/html/latest/driver-api/media/=
index.html>

docs.kernel.org are nicer links :)

    https://docs.kernel.org/driver-api/media/index.html

> \ No newline at end of file

Normally there would be one.

Thanks!

Cheers,
Miguel

