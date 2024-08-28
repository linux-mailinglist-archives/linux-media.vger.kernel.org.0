Return-Path: <linux-media+bounces-16989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B83962177
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA294281412
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69D415CD79;
	Wed, 28 Aug 2024 07:39:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011D15B104;
	Wed, 28 Aug 2024 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830786; cv=none; b=nPEzAcILT0Vhgf6o2+CWtJqqktuZNOv0jQyf9eADk9aYIKgUAbObyXVjkglVFciTLezNB6TM3lgHEccdbbLgFne5FQvf4y0RqgfE5UAz9GNPLN03fIhrI9cPsDGn3XdNt7/gbKufHDeiW7r719wJbEYmr820GmdoX4jATAdiwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830786; c=relaxed/simple;
	bh=WQb9pmgsYj2JxtKlUr+2D/BE71RtA3zZOSClcitg2KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBjAxm92N2KZpiBkMINPoBjA9qEPgkghOjVk5UtEvcc4aZfKRYMq2bCzemxe8ckupNZyfqaqZvrFqeykE8PD02kWFyaLp+cVlWa46Au9feKA3CYssvjqPITvRG49mx8kkPQ3oby4X+ctR6dgzN6mX/uKn0hIfXk+o0jJbIY/ycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b0c5b1adfaso57763087b3.0;
        Wed, 28 Aug 2024 00:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724830783; x=1725435583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpT4Vo+BBX/b7tU3wTgvZ+J8YgUiIENgiUCOLDCBVj4=;
        b=u7QESY24ymmd17aqH0CijWn9H/OYKzXs/lERbkVyMeKeVO5MEKYCheRhRqzLetB90V
         ewpZ/CfnWi/YTdXIEDzhmTZ1f8L6p8YHjL6hBxA3xRhPvFTzBWPod7oXL/KKKbEVCpHv
         QF+86ygG8vPUJEI3D8stJtzw13wr848XFtLOUrrcd/e4HtU/TmqCQn96MS/niFQaN0yW
         VzKc+LebP0wXvrTtCYJruZ9kFULATgGFhCeNt/mH4YehbaASmUaDXTVftuwhlYiD2sEi
         QZ7V6PhqA6pl/pGQE3a2IAGOax+wAokg8pqAukN7ohgOW6QDYoXsStqbEGGdXh3iyAms
         B7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUstI7FY4CgwGyp2PxSw2AkTCAkktgCn9r3RBFHl1dnsgbwuqhskWVh6nOyO/Qlb/qq5L/GDnlFVpdh9Rz7Axwopt0=@vger.kernel.org, AJvYcCVflSVxUc9TX6jsUwNldA8PTbudzIWJYh0Ar9VM0wLyDms1VWjlpLG+g335CpJ9OFOZwoxf4VLLvcsy@vger.kernel.org, AJvYcCXvRVfixDZ/E1K/9LSBPoOUn7ceUkpggTl+L9ae0g6/aPqK1RO2eR1ZdqonPV3/0avKsS/8fSeUaiMtNdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XEb3u1UguTQxFLrLckoQ173x+oPBpE7u1PASxW2XfMeDSUwJ
	8QHG6dSsIukpdoxLri/90QkFgxfUfVlLzztbiQKjcmJil08BKcAVkh0///ur
X-Google-Smtp-Source: AGHT+IFDsKIZUbFcG+6CyebuBkAAEywcLW3vCTAOvHlwV4CfY9paYp7+B88oVAiVy9AYY18cVBOD7A==
X-Received: by 2002:a05:690c:6603:b0:63b:aaf1:b8c1 with SMTP id 00721157ae682-6c629beb6d5mr188157117b3.37.1724830783539;
        Wed, 28 Aug 2024 00:39:43 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb4ffbsm23069287b3.13.2024.08.28.00.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:39:42 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b0c5b1adfaso57762927b3.0;
        Wed, 28 Aug 2024 00:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYjlUsR4C4zZLef02Fr4jgz5E5COa3vHUM7/pvFxVZnqzfgQ5zrTzy8MEu30S/bn3V4sfecFgQAb8iHvE=@vger.kernel.org, AJvYcCUkPxjrXO3iRggcPd6YZ7ilBlrJ2EReHzDW/s3kC/LtMcLzdyqVFXtqviIG896pSHL7zsINFV0bPgfp@vger.kernel.org, AJvYcCWbzPdEAzf+jeOg+kBWiOxzujF7Crhug8fyQz/hs8VkRY33rXA2s/C+XOQMosJPiqeBlPd6IUPu7zxtrMAlaMb3DXQ=@vger.kernel.org
X-Received: by 2002:a05:690c:290d:b0:6ad:b725:4418 with SMTP id
 00721157ae682-6c629beb9d3mr144082347b3.41.1724830782492; Wed, 28 Aug 2024
 00:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se> <20240826144352.3026980-6-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240826144352.3026980-6-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:39:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWx9BZ6AA1tsNSb0HBa3Bg8Y18Pt9q5JCfdxeMBxXpiCA@mail.gmail.com>
Message-ID: <CAMuHMdWx9BZ6AA1tsNSb0HBa3Bg8Y18Pt9q5JCfdxeMBxXpiCA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: media: renesas,isp: Add binding for V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 4:44=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
> This device is compatible with the CSISP module on the other Gen4 SoCs.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Add to commit message that V4M is compatible with other Gen4 SoCs.

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

