Return-Path: <linux-media+bounces-34853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 170ECADA8C7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B411892233
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 07:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CAD1EB5C2;
	Mon, 16 Jun 2025 07:02:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ACA17BCE;
	Mon, 16 Jun 2025 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057349; cv=none; b=L7wTVCnpod2nrtReaK4FVoOyMgxOW+ULXdGerhLU76LPx0p5QvKyNVqsxDZ6/h66yeNiZtZBDpVd4IVD/2RIxlp5se7UKDUSVgFaErINFUs77EBa6YWSVNjEyUD5VSHC6LCrnT16s2y+iclj29MvRdb/gvdK8cInbcT7F6FnG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057349; c=relaxed/simple;
	bh=y2zwx8wrxjsoYZOJCM8KBecAPPwDzhWK0TEKPCVeKAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bALDbhG49i1E9awaLCamJlho9nM4mmVKQHMVyK/btEhroW21ijT0nOqNf3p7V0umRyRIEUDNRsEQOKVi01QXkmUUvK3pceJvOwElMA6lFELrzSg+MD79TDKUrgGlN594PWpsJEkPlZtPKsBkw986Xl0pHg4M1Cda6UB27JPQAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-53164bd0df3so141499e0c.0;
        Mon, 16 Jun 2025 00:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057346; x=1750662146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6qJGrts1k8wK/issuCyiIJGXwrSCMwYoyxafIhTBy8=;
        b=srDx5Y7yf5E4Ljs8DZrJg3E59JJzPohTbVG7y7SXUNt0JupEq/U1irjN6K0VX0SaSE
         96ClNxqhd9bE1yEWTMXDNyI41cepTx7EKOYHsd1ieqFKNgOmaL97uARh+omVHENqgGj9
         j/zdhZ3pl3gO4l6wNvAk/IDOHf46XEBVhfc6S9prDMB7aJopCPsbmn8ZEZ9WVDL3HCvh
         UPPjWw6qxGchdxyMIrMXfSgfNzWFV9kUuokxL84vU/x9w2LcbLQ4RJXEPg0RkEUB1Z8A
         QjJZEB5VdOCelvoXdwy9w2mh9JK0eh8cSmLqEjBFFldyUu8msQTiAFKycqEAqVkApmqS
         3MvA==
X-Forwarded-Encrypted: i=1; AJvYcCW6TGr4qGsa5QyLvV/36D8eA+OpxHxZeaRd2xJIwfIwNGZfMNFySsR7d+o8aBQIeN/u+NuSJ4osHbJ2sJI=@vger.kernel.org, AJvYcCWI6c2IEROkImEX9i21rHgGWEOUikJuICyvo+FJpBONSNbL36Hf98/gkWf7CSVpKP62nUFK19WsLo58LXzmboXoAmY=@vger.kernel.org, AJvYcCX0YPCJEwDlx0fxtiDmErcx/v4PVwktzHM0+q+iWjUV5mmwSEmK/qbpyILQkYyPtJz2rblUFtlF+MqnV90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5sC6fXNBbJcBKtxvGCC5uzGTIDpu5a/fm59Y+4hJcbLRORsV/
	eAL4+OwUQYPKqdwwyHVhziDv1goyEk4OqdYb96VJztjl5CVjJpSsrpZqk5HTEYnX
X-Gm-Gg: ASbGnct0pv/jsRAzM2SgZFXjIexz3Jtx+f9RtLmpT6ncEasWJ3kU19NEfShTC2CfdqB
	KcfblYpuSybfCpSBVl8QL8HwoPSXJX8iZNhZBB4OCpDlFTjtEVXiB9yCm7D8qETHSamb8yB8zOQ
	X/EvmJU7ecM3koW7rdf70qmNUV8S6WOw0Rqk62rRIJSA6N6X/c71ywjAtptStfZHf80hL6Uefev
	MNQFb7MCI151uP+Z8sZiTYSNdt1T6csCVjxAqAK5DLeBGnZVbuBoBibsatZIU/pJmfvoqSTeh3p
	UqIuyld7u4awUqfFJQwwLBmK7Vs19Z06rT4Gu2rMpGljDOM2XkLB9UHs2rgAy0ed3DdzXd6nPBZ
	6Ibl8Ymmv8nrppGCVF/I9eKSs
X-Google-Smtp-Source: AGHT+IHiBvP1BdyXpqWiaYub++dXeXURwLkKZYB46PON2HjGYb5rLWyI/vhhIV9TTsfaAc2DbqRJrA==
X-Received: by 2002:a05:6122:547:b0:531:4041:c4c5 with SMTP id 71dfb90a1353d-53149b60c74mr5067781e0c.7.1750057346382;
        Mon, 16 Jun 2025 00:02:26 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313ddd6327sm1145465e0c.11.2025.06.16.00.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 00:02:26 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f2e02c62aso174676241.2;
        Mon, 16 Jun 2025 00:02:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQbE1OWrdEwgVU3QjaF6pc8nAsa7Q7TRHBenlMgb3hOSDfJBQWXyFbz11GP1K4xWObAEO+tQ33k9Ze6FI=@vger.kernel.org, AJvYcCX405bFofuAI4QLN4b/DC7geNzWfX0hKmtK6MfQGpBH1Kn1Z8TqM/XBTjTu/r7tdJgLlqL5kzSXMK6s6iMyw5jnhQU=@vger.kernel.org, AJvYcCXpQnZ7b8Ih0nLCuCy8vhDAVqfoDeJR4bEpT+3+hz9ECIrGGXHewHHRNIqrhLMSznH5F8SDA5cUXHENFOE=@vger.kernel.org
X-Received: by 2002:a05:6102:2b99:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4e7f62d771bmr5205598137.9.1750057345822; Mon, 16 Jun 2025
 00:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se> <20250614141545.2860860-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250614141545.2860860-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jun 2025 09:02:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXptFAonh99oJcXRzuWvnS7h-GM72MW5JY7YRVHD30MsQ@mail.gmail.com>
X-Gm-Features: AX0GCFvcNd1vNd3-ReYreHHNw75G5DxHJKAoiatW0sTkjHy-nwSo4LHt9r0VnkI
Message-ID: <CAMuHMdXptFAonh99oJcXRzuWvnS7h-GM72MW5JY7YRVHD30MsQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: rcar-vin: Fold interrupt helpers into only callers
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Sat, 14 Jun 2025 at 16:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The call sites using the interrupt helper functions have all been
> reworked to only one for each. Fold echo of them into the only call

s/echo/each/?

> sites left.
>
> While at it rename the variable holding the current interrupt status to
> make the code easier to read.
>
> There is no functional change.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

