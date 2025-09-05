Return-Path: <linux-media+bounces-41820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B3B453E5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2ADF5A212E
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0171129BDAA;
	Fri,  5 Sep 2025 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ju7VL2t+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B096B29992B;
	Fri,  5 Sep 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066331; cv=none; b=gMEtvvgJ+uyMW95cahC345Eo+CtF7BM6/11e8TkddijNiAqPI8qG6cPJb+s4unvCcV8naMnnP8YnUV7oRXiELG15d7Hl9cd/0ZuKWqLyL/EpQhtuqt2iVh8jnRL+hqHaMCYJV690UtEqmpj2uMBlJfACfCOIHgMZE7GVIlq2QD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066331; c=relaxed/simple;
	bh=HwKAByuNhyttoGvFHgIccch/Uo155Ry0ykJWPvr1wMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1UbRWRqBy3e2gD8pe571xLzQfsCFLSHXz3sU8fhBvyXLDZEiIoHaW+OZuKFiEE/eiG5sF5PQeuZ21RvRjtZ56gcfQSv1mcYeWFXbOS/qX6+zjtkpBCwb66OOzgwVAguikuEVgEt6LAoyNXpfffb8QcQBYGuybFFxDbhEnBiVe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ju7VL2t+; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61d3d622a2bso3997247a12.0;
        Fri, 05 Sep 2025 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757066328; x=1757671128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Fbkrslrl/U4EHGtpNkUJapA11UFx/rFpQL4PlMt2+o=;
        b=Ju7VL2t+yE45YjZPcFLMqEBvgyXRKiYbvbgLNNZRphjEFwfpZcwS4fvmI0k6roSAKl
         /V6XDy/i9hptqFECLx3d+++AbyPKYLcWg1C6KrMmWbe303e2V2TIeu6RC7cRSFDD5TqY
         9/3efbb1buRTSFM2eBykAPR9NTexuFKI05DbcsG/jcwjvOk6BRfzphMT1JxTiHxpKom9
         1NOCh0pJp3aIHYCYHWmiorUBrTPQWMV2gP4QjIMb/K8xdbYUeAXweBhRKlDe/PtskEuK
         jUPckMfqTjt+0Xbwcda5QkOsmfADb3KbTOIb2zpD7k4/UflsmEKxQoFBuoESbYfbJkVB
         6K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066328; x=1757671128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Fbkrslrl/U4EHGtpNkUJapA11UFx/rFpQL4PlMt2+o=;
        b=XGUbKioqqbwv+k9M5etEzYqQKkhl7+1bA1N8c8Z3WWNA/y63VQ7g5aeIxIYuVV7Nxj
         X0V/Uy6MYk/BqKg5vetCr9L31qY3W8RdRPYuIGYm2b/TY67tHlCeJ9aVpOC27aWxOPHt
         qUwk64+QmF2gkMuvqPf+R4J0KK7hAnn0bgQB6Q08kwpGmgyKT+eFJ5XYhnIkC7/203oI
         YrJjFkfnzEBloQw3kqtPUreW++GL06LIimguitGjHE92IZ83gW0PT4VLCZtty2d8BwBx
         4xRUQANyKshe66+nBE97TdXaaQ6CVtojzadOs5depRc82105aPk8HrElwWufT+UVn/cw
         m2lw==
X-Forwarded-Encrypted: i=1; AJvYcCU5TusZsWvANO5QZpBXjLiJwxhew1dnrOoc7dllKEzE7eckRu1bUWFnp/aUR+pw4qmN0zxzuFTNAHOg6zQxjw==@vger.kernel.org, AJvYcCUlOK3CKTpXbnnS0tyubxPjZO5EQlCze+ekMjTFAbNtyNdkOYZoJXlPooKsIt0JJCEf/3ICocNdH1WOY9sg@vger.kernel.org, AJvYcCVbNTTXsf2TIF5N1c6KeavA8WNATQ28zP0HpKx5VywvKCwzd154IyQWj5wLFBPCeo1RKIFOl6Fhkx/LMA==@vger.kernel.org, AJvYcCWW7HOUcEp+pHWlBK60JShV2u18zwJkXwokE99xuW/X7r6Z3v9iXV8eAKUvh21Z2OJvs38dyvxHFHH5L6A=@vger.kernel.org, AJvYcCXa/d6LaBGz9hn5qX4R5J5PSkuieBTP6JVfqLyYmVxyJhzbJjuoysiG+Ls8FFyzZziMFrYktiiXQgaq@vger.kernel.org
X-Gm-Message-State: AOJu0YzH99YiwiSHCOuig6bKEw9pCBV3TAN2o8UKGuhXyjH3QTcfaRCo
	PDOHpMj3Em+8iisF5D829NanknmSzjkLnzo//XrCqZkUsn7YDNoM6AzW+2bY+kiRMmZ+yN7RrIe
	4lMMZd+QYh8yhp5N2DjzqXQPEJG+Cnl8=
X-Gm-Gg: ASbGncsRIz13No41OSggY9WfDCX/gggjUAAWmT5V1hd1MeitwwrcnLA/LfE2xz9mJB+
	FXvR37bk9B8WNk6r6t4jXHukU/JkEfN0eFdhmpGZURaiyGjUkQ3oz9q6Uw/QNv5cNkLDmezJnwC
	ICY434PloAlLr5BheBEvuDE7dTEN5gHq7CbFcUJo+SrD3rbVSzFMNzVszMqTjmYAMJBdabmgsPQ
	/pXAWoYYftoaKH2kP+r
X-Google-Smtp-Source: AGHT+IG+T0I2sVJ76wcpIaEPBSRBiZu3omKGiXauTUn6MdjpxAu1nCa0lZ8hdCy65HkLKv48pMVIExJVfsOtu7NoIlE=
X-Received: by 2002:a17:906:b24e:b0:afd:eb4f:d5d2 with SMTP id
 a640c23a62f3a-b04931b6715mr244720966b.31.1757066327695; Fri, 05 Sep 2025
 02:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com> <20250905-leds-v2-3-ed8f66f56da8@vinarskis.com>
In-Reply-To: <20250905-leds-v2-3-ed8f66f56da8@vinarskis.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Sep 2025 12:58:11 +0300
X-Gm-Features: Ac12FXxgVWw8at73QOgiZhDzD-M5RC_p2kCHNqId-Qnd1EcmDzHOPtVe7B7RZ5s
Message-ID: <CAHp75VfSoDHX-zy3Kdk0=oBA64mKddXqHh7v6RwfzRJo8Az_1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] leds: led-class: Add devicetree support to led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:00=E2=80=AFAM Aleksandrs Vinarskis <alex@vinarski=
s.com> wrote:

> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> devicetree by either name or index.
>
> And use this modified function to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
>
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.

...

> +       if (dev->of_node) {

This check is not needed.

Currently of_led_get() returns -ENOENT if the np is NULL or index is
invalid (negative value).
Same will be with the added index search as in case of error it will
hold a negative value.

> +               led_cdev =3D of_led_get(dev->of_node, -1, con_id);
> +               if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) !=3D -ENOENT)
> +                       return led_cdev;
> +       }

--=20
With Best Regards,
Andy Shevchenko

