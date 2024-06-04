Return-Path: <linux-media+bounces-12501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE218FAC16
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 09:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A151F22142
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D399143C6B;
	Tue,  4 Jun 2024 07:29:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1708E1420A9;
	Tue,  4 Jun 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486184; cv=none; b=p9udJyN5gEk+TJjmRXP30IDatzgTqjflPUSOUIzuZPCDzDKHWItS67hevlsNFczPK/yzZRWdP2ykvxFSI2BkF5ylF52PQ0lDovJKczhRqTvdM1qK+tScu5TaVwkpKGcvuN8UtzSTBZOUDmnneICoNqfLqv5Udt9wX4EUa4UOq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486184; c=relaxed/simple;
	bh=L2ef4ikBLUExpwxVj8ejG78+FAX/tyzxxZk0OjjBtp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbTd5R3FJCSec8DC76npVfijzBOrfH4ObgJ8d1wJAZkG59Xjsgf/sipQY0B9vToFGRDB8ABWr7Vd6R1oUfAYy7gKHheN8wKMyU9EVZ1v7tYQPgRBDn1PWPSd2iS1F2tAdwRc/JRKx4l/sZ/jVw8K5iDRaMxciHUuRcL90EHeJqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-627efad69b4so40236047b3.3;
        Tue, 04 Jun 2024 00:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717486181; x=1718090981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iRhLEa+24trXeoO/jrPuZGCt2Kxtvn5FwJN2M8BSH0=;
        b=XWy3AUNchqeCERsWs/c5IQoW5J63GY1D6sdg6wwMFkY2ZRZQ2RFz/Q36h1+Pji1ouG
         Ha7nQXsYEGwS7J4WkMANY3iiv3u/1qEZCkkbE6f91bsIMNe1wsjfvMC+xxDEZabVhI2t
         LYPbazp0IGvSsOs2Wpa3gzA53cDjRAGEbuJOgJmzewa1IXASoYWTSweOCCUWzyPIXL9b
         woZrAPSaS3gQdbDfbuEALBWnOsqrHsCTEMc/1VlG6ejzsBcudSes6Y6XA5pHrrKvYGFg
         P2dcgg6lnWXO8qoAtZpgoDRArKjOaYOVFc5Ay6wnhCluBndT5C0K5l6T/zaCuC3oQpuY
         3PEw==
X-Forwarded-Encrypted: i=1; AJvYcCU76S4tVOlkokQw2eUJSP9ZMF03Kd5xFENo/nG3Tf8xrLDCRaDQbjeGX41XRq9w/SlWUsLuPY5z4hVWTOnNeM4AYyhwWHzV5E2kxqHFCvv2B+SNIbgXGF0Xv8XF+QT6faDlSf+SlHYXUVhq+zoU81CTNkfn5wOvDtds5CJU2ixkiooEsnQEtsoFl8s=
X-Gm-Message-State: AOJu0Yykwommz2JpXBaa83RG9hxV+UQqQAX5/C8hKyZThvU7zsBtk+1Y
	UsYiv24kRq6JIeegAAiW/Ygh6/V1P1ediR2KqYO3lA/Sl1z3dQz2LE9wdM0N
X-Google-Smtp-Source: AGHT+IEXuH9l1UvL41KI76eqN3sjv10ssgOhCvPSyUJyXk11uzsSl6bRKnSsiUEarGNkdVG/L9X+UA==
X-Received: by 2002:a81:af0d:0:b0:627:d0e8:1775 with SMTP id 00721157ae682-62c797d50ddmr117429317b3.39.1717486181343;
        Tue, 04 Jun 2024 00:29:41 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c76602a3bsm17435707b3.59.2024.06.04.00.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:29:40 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfa7faffa3aso3638648276.0;
        Tue, 04 Jun 2024 00:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfwcokW5TFbJU0L/UDyYXHJCuMKoiyOMA/IbluqcHeQ4dGIgtcY4vrf9JIXbX9ql5pS7p6NTqUzbRUpCa9/obLXUal7OYSXE2GLg0VzxzxgAxCuX4HHBYUBqvhRy4O/oB/Z8Q+Gccs6CvnvirTzJaPuIEvVq2yqssf/uCR5iqOcsq7mQucc9AGijg=
X-Received: by 2002:a25:3c42:0:b0:de5:4f12:7ea0 with SMTP id
 3f1490d57ef6-dfa73be4a33mr11236897276.8.1717486180337; Tue, 04 Jun 2024
 00:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527132046.1680595-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527132046.1680595-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 09:29:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=SUwSgSU58LeATh31c9kPBUi=AhOiA1xOxFhZ2_bvWw@mail.gmail.com>
Message-ID: <CAMuHMdU=SUwSgSU58LeATh31c9kPBUi=AhOiA1xOxFhZ2_bvWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: renesas,csi2: Add binding for V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:21=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the CSI-2 module in the Renesas V4M (r8a779h0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

