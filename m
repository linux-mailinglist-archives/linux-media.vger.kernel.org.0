Return-Path: <linux-media+bounces-41715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD52B42480
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A27486E65
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CB231DDB9;
	Wed,  3 Sep 2025 15:09:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE221423C;
	Wed,  3 Sep 2025 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912186; cv=none; b=lr6DIyDqM7j5SuJ5AHbXD8f70uecF02yPoTax5CaDp+px1QuFJHJ7r8Cqp+Dwx+ZGYUXUMU86zhdPKPXzSW5mPnjSlZGJZoLwxEaX0H+KvyaiWoVPsEnXrbaJBpG/Bkf9jTM12KWJzzTZiTTH6N5zdbbMy3DheJTluXRNW/GYO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912186; c=relaxed/simple;
	bh=ikzhtY9rGgjgk/Rd7wHKRdyMV34Tvhe35O+3FsWsUrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNKim6QMRcwQqUi2Qu4/qB1QxwpYR6lXzlGFSV7nyCA2cO8EENW9cvHJ/69XWLrejR2XFLmwk2zmncLj+0QnaW60fUVdMqYDi8NHmxdzNrDb+RdJN9J32dEijCs2eOf7TkwUxe/B8RKGV1vkLLHXgIPMZZqw4nXcNbrMmP8IY9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-890190d9f89so3498107241.2;
        Wed, 03 Sep 2025 08:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912183; x=1757516983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVpdXnOxQkV6aoehfvXuxZwNBrwSUuUJUvgG7SPoeFc=;
        b=RpnR0lDHAMKkPMkzOA3h+xtRoyPGp3ru+sMXziaM3lE7tzm+E+I/0QiqDj99hYID+1
         dT2leNuVmkcPbcHWwjQiGaEqdMju4kQBBYn926742b5QRcwHUh2LhGdatFQHKj2ydt6r
         BxCoREdUA9xIftieQ17Y5oUeNLZBzgXgHVBeH8DGhjjOLqzSOI7K3DUDvGG5Z2fofc+q
         3WFdtZIgKMKQfDc7XOCowp8QwccJ0AOrnvVToUbkq7XEct6H7I4hQVCu4z18ZfYCDaxX
         EGEt8v8VV7GL3zvd0Bx10yCqh8a2G/9XqpJL42IBGgVgWGfDuMs4MIfAM7Pq01L0j/CX
         nN6w==
X-Forwarded-Encrypted: i=1; AJvYcCUJwiuWbneZwe95Wif1BUngCiqfqwSOJs4+dn3fXlov23wpotZSjYW/pDXcPS0H6pwT87dKlGlKr2FXSzO+wwXXGC4=@vger.kernel.org, AJvYcCUaVziI4cE12pSfyChGMWJbn1PmJ7p82N1/eZlc+ljd8Mj5Ik5eb8dRB98CDbs6yvIpQPt66EHBGyK2xOg=@vger.kernel.org, AJvYcCW75S7Mbt1adKoORZtX6iXtyhADdMsMfI1x65vgHZPFajdSlEkb/kcCQXpXk+nrhMmA3P7Gipet7WJbVMo=@vger.kernel.org, AJvYcCWDODODeDhdw0mENOCM+ruczt5k8w3GcVZXVXetKIAdMLvJE8gnsVLd1Yzcn41SzVXYN4K4fYKo@vger.kernel.org
X-Gm-Message-State: AOJu0YzXl1yKSCL1+or6muX9vEj7mFpN8PlaUY7X2ITNY3ynDMXGPYWM
	VOyXDBXz7dd6vZ+6Wr0iHKIvwdhzu/Jdw4xNpOdyq2R6D2iV8dA1VGe571kp9Jzd
X-Gm-Gg: ASbGncuoLL25rOJ1YGYHa7ZyDUgFtOWYiIuzJp7QMo0pX5+UinIGDvM51P+aNuZITAk
	KRmrmHKt+V241s81iCz+XzR+aY52Ebdn9r6v1MDV32f2MMEdmKVXkQcEWPZVe5kR6Pwzvj2Kqdw
	5o+H0ZNxxMIzGAQn9VWaRXMiwXA8iVM1MxTA7FcQT4oEzEW/3Z4dnC/0fX1ZgrnL4Sf5vpcoDYX
	3hZlbzM92RN9oCFFv0td4ny+XYSd9uBdPqSDAW9Osv7gX5rzg0UIml1T0IlM4atQHhc6MyX0o+u
	nHCwgV1gJ7Fu0vVJqFpubt6+OU5LhDuywqFn9MxkIlyY8Yj9wtys11viADitRpiWzat+eCsV15p
	2lILmxRwKlLfn05R+Zc+rbKqGDKoiXdLDYLteb7EDuE8e6wZu5mC4/U/iCiQ8MKdEgEx3hWU=
X-Google-Smtp-Source: AGHT+IG5UiojQRSjQbp+tq8D2M4cfxB/tpyscIhxY8mjPHCycsbAyr5kgMreKJC64xDyyY/swSVSZA==
X-Received: by 2002:a05:6102:6a8c:b0:51e:92cc:6e64 with SMTP id ada2fe7eead31-52b1bd1590cmr5999160137.29.1756912182664;
        Wed, 03 Sep 2025 08:09:42 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-899a902b2cesm1580116241.14.2025.09.03.08.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:09:42 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso3022054241.3;
        Wed, 03 Sep 2025 08:09:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCe5xqGotqOOiambyefUEVdw73yB4jtc7WIa+xCsM45X/3oUs8284jyswBGgbYoOtD95jqRu+xv4hLENc=@vger.kernel.org, AJvYcCWA9lGubaYXUNcuy897KR/+OLzVf/1FY6XTYEAycB+/JAyqiK1wu7Sjb1Ns2SQyVZlw/YjjmMNfcvCIWjw=@vger.kernel.org, AJvYcCWM0PFJE3fhaN0FBI0I45Pi5lZ54VNjU2/V6kVgb3347MJ8q34o90QdjXuG8Jr+Fr1JH3iY+lnV@vger.kernel.org, AJvYcCWoAAr09VrMTRKBAcvSsEp0NhGDuzODsPe8vjnlCW1l6vnsUhcPwn6DyfhfQvDqmXW95ca4AMB43NueNbLDPBnnTrI=@vger.kernel.org
X-Received: by 2002:a05:6102:4412:b0:4f9:6a91:cc96 with SMTP id
 ada2fe7eead31-52b1bb25608mr4990360137.26.1756912182120; Wed, 03 Sep 2025
 08:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903133729.2523130-1-linmq006@gmail.com>
In-Reply-To: <20250903133729.2523130-1-linmq006@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 17:09:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBXv+vKqBXOWeFqsy0R8-3__oBFWnm4rUx1kqSq5ZUgQ@mail.gmail.com>
X-Gm-Features: Ac12FXyAQ8jdtIgL3wkXHy-xS6MnuKfYQ1i_Sq3qEQPyIA5MCrJ91AMJ_d788Ug
Message-ID: <CAMuHMdWBXv+vKqBXOWeFqsy0R8-3__oBFWnm4rUx1kqSq5ZUgQ@mail.gmail.com>
Subject: Re: [PATCH] media: renesas: rcar_drif: fix device node reference leak
 in rcar_drif_bond_enabled
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Sept 2025 at 15:37, Miaoqian Lin <linmq006@gmail.com> wrote:
> The function calls of_parse_phandle() which returns
> a device node with an incremented reference count. When the bonded device
> is not available, the function
> returns NULL without releasing the reference, causing a reference leak.
>
> Add of_node_put(np) to release the device node reference.
> The of_node_put function handles NULL pointers.
>
> Found through static analysis by reviewing the doc of of_parse_phandle()
> and cross-checking its usage patterns across the codebase.
>
> Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this is a duplicate of "[PATCH] media: rcar_drif: Fix an OF
node leak in rcar_drif_bond_enabled()", which was never applied.

[1] https://lore.kernel.org/20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

