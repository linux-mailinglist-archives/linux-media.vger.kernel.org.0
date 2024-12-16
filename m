Return-Path: <linux-media+bounces-23483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF99F3617
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 17:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62550188B81A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 16:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E812066D8;
	Mon, 16 Dec 2024 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdW6tXA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BBE176ADE
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366532; cv=none; b=NP2BsobkgUVSmmlzeVLCsg2Pl7Uwe6o37z9wV/9NPDEwoDPQ+fRh2Vje2HpwIhzZ3pbqbVl8gNNBFlMM22Zl7ax79HE9VaPwNOy9oC7KN/Z04sRRigqgSJbxPTLjkQ+ePXrfabzc9PGSDbFOnVMuwN8eEIQ51H8RNUNjzHONOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366532; c=relaxed/simple;
	bh=z//NLJouRZr+tjrdrPKGljV1gzLChCM3Mfk7r2TZzaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5OgBwWn6LnG0613BeA4RgRWKZuYYjqpOkk1fos7r4W0AGX7lcyFrDcr83MRa9qtqVb4G04XmoWJQCVdwglrKQY0UVPzk/t4i+NAi2pCCZsdpW8Z1qg7+a5CG/MzbP/fxYmElz2xRwpHxVNiprHWe8vcQB7AfWItA90f97lWRX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdW6tXA4; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso776215241.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734366529; x=1734971329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0NZsq+4BO1gtVbtY0R0/nqikKh3m9402xniBYTaFlI=;
        b=YdW6tXA4sk8rvqqKrzXx9cTA0CopVYOd9kcHYKIwKjerHyXtRVJMZnZwzHePiu/Ppv
         SfuUTBoUqcK0ka4ecS3DtIJ45/vN9xFnb2zDRQbMNc2dXp07NozYHm4ru5vnHeFB7e69
         r1cjqXkBncP9h2PrSFxVp/LO+G0VFnYrAVUDd2KpLHvj48Is2Q+GjTghbhy8TdUkYqbP
         xvE+mRJwxXliS13uqK1T6edQipbW1WQ00//NCgXjjDdDyeUxoFLiHaWD+sAUIEpjyU+/
         M4Nx5sf2cRzeGyWteS99ijdttSPCx6z4tGPHq+Ln+osFuQS8a+lSnJt88axQfAk/Kbii
         UVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366529; x=1734971329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0NZsq+4BO1gtVbtY0R0/nqikKh3m9402xniBYTaFlI=;
        b=EyioFllMqHdyDYmJHkovJKCGH/ErM0R7F87VCT4VzogoPgVqPOgfFqQppYOsrBtoGL
         vhek/VXMMc2MX9UvzAL5P5nQwu4nwsTqjz3+DkrBqaaJ0AOb+LOKkzKmWI9+nJROCPoz
         B6M8a99hevotiBNjYRVC6fRaV20GSPhoQpy9MM/d6w4YKDyrAQt+hFg+CaRe/7WRfNrt
         s3536xzlib1U4HGRbFEiJfVBqDckTvE9b8+cW0UA5RsmLzrDMp/iN3mf9CD/+cgQyasw
         1/CivllFnyhyoj3oBQBlU6mdDnQy3ObjIho0f7/Frqg8V4uSIV5MaSunqhPOC0ijOVhG
         RrTA==
X-Gm-Message-State: AOJu0YzY9yTuFJOeb/m4t+nVO9PLOaBMevu1oSveTwgLv7RZrSDACcpK
	6La6xDthee9T0SbgKJdEdrOw5H+z5SdFnTtkf9ya6XmgJUCPAZUIPJitFJe3bct/looG/67CW5I
	zODdTmH7QUa1NH8BHJt+7PZHchoMvqyK1
X-Gm-Gg: ASbGncsOcpt+YQWQqHo51YmNKSb8/Zo/pVxaiJkqrywVZ3LeAZtdS/WZnN7ysB5xrAa
	89ABzFBumSrR4A/ExPar+y+cp/YvYUbXSymD3
X-Google-Smtp-Source: AGHT+IHLHs0z8mJ/KIMoEMq1mZyl4s9f78ihSfkJ7xiLkb0RRopJoFMqZ4YGHGNGzxb1wv8HPk3nyoh1qpWBaaY7aBY=
X-Received: by 2002:a05:6122:3d11:b0:518:859e:87c3 with SMTP id
 71dfb90a1353d-518ca30a71bmr11119490e0c.7.1734366529199; Mon, 16 Dec 2024
 08:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216154216.2352121-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20241216154216.2352121-1-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 16 Dec 2024 17:28:32 +0100
Message-ID: <CAPybu_1BSeEjxFm0qpfLE+h_yfaR9BUOQJaf2+eFdi8KNz-KXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: Documentation: ipu3: Remove unused and
 obsolete references
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 4:46=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Remove unused reference #f5 and obsolete reference f3.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  Documentation/admin-guide/media/ipu3.rst | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/adm=
in-guide/media/ipu3.rst
> index 83b3cd03b35c..9c190942932e 100644
> --- a/Documentation/admin-guide/media/ipu3.rst
> +++ b/Documentation/admin-guide/media/ipu3.rst
> @@ -98,7 +98,7 @@ frames in packed raw Bayer format to IPU3 CSI2 receiver=
.
>      # and that ov5670 sensor is connected to i2c bus 10 with address 0x3=
6
>      export SDEV=3D$(media-ctl -d $MDEV -e "ov5670 10-0036")
>
> -    # Establish the link for the media devices using media-ctl [#f3]_
> +    # Establish the link for the media devices using media-ctl
>      media-ctl -d $MDEV -l "ov5670:0 -> ipu3-csi2 0:0[1]"
>
>      # Set the format for the media devices
> @@ -589,12 +589,8 @@ preserved.
>  References
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -.. [#f5] drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> -
>  .. [#f1] https://github.com/intel/nvt
>
>  .. [#f2] http://git.ideasonboard.org/yavta.git
>
> -.. [#f3] http://git.ideasonboard.org/?p=3Dmedia-ctl.git;a=3Dsummary
> -
>  .. [#f4] ImgU limitation requires an additional 16x16 for all input reso=
lutions
> --
> 2.39.5
>
>


--=20
Ricardo Ribalda

