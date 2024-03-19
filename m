Return-Path: <linux-media+bounces-7307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088D87FDE9
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 13:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B4941F22833
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 12:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9389D405FC;
	Tue, 19 Mar 2024 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Z3OFpBnA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5613D988
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710853116; cv=none; b=DbZV1bBNFaWnUA3gDHtFQDzqcxDlcvcdJghwPfKbmYZ4HDbHh2TIqDmgmPUy7mM8jE6XoJDQyOIT1yvCnVswPi2vFrD8s+gqVHGyO/KolKNRtQgMFU+xS0rFsudADr3h0Jdp/lhliZTwp2fw5GdtFFjQtugQZv+iY0NplNSrYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710853116; c=relaxed/simple;
	bh=BU86mkt/Ka5CMfIKuRWwdKPasrg+HQf2iS085pqvClQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArSxE3Z523sXhk4SZ7zmTXM1AolhXcs0mcdJioZd+5nQHftS1wj1SNc8JViqUFjpiHV0FKXiUbYEwcI9H7oqtyqTxzTPJvyRhQ5OcOl7F9PaL9mkyMQZ2MNJGN207+XXbNif1Wu83zCPZtNBZtUsYqoPRKomEe5Lpd9Y6QRrXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Z3OFpBnA; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60a0599f647so50228427b3.1
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1710853113; x=1711457913; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JBD2QIEr5rKcJqehTbPK3gKFjK6RT89LdsFIyo3OZSo=;
        b=Z3OFpBnAavwZPNt+ZEPSTWdWwZyRpXuG3N8RY/FkG4IlnRedB4iZoChMKaftZzRz01
         qt0nCyqaJhOvJNWuG4tx8D+W9Coooj5joMv+UUdG/dFqdm/2qYx9G8/5xYB8ghrZvlw5
         Isji4Pysc81Dle0DvWvGoR11gqBSpcsc6FbEX7R0uqW/NH2ThjO6INqD+LhmUEEB6r0q
         I1efuJonc7m7LRD1G8OSQtn5Hj0kQGwHp/O/NIrUWewtZEhvXngiiavYfh/VBb8AKcOF
         hml4NmuCg1R4x/w3Xvda5YwENS3BKUsEcRaayA2AGnZIZ85VSspbgz19mCts0+b/Kxzt
         a7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710853113; x=1711457913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBD2QIEr5rKcJqehTbPK3gKFjK6RT89LdsFIyo3OZSo=;
        b=m3l83BuwXnX8/YIGcb3NXo2A2PR5smOnf3/HJr6/Rg3LSxmzGiYNIp+5yJsaaxzF9d
         TVdnkkmPgnoNaWzCLsgtAR1h9zXDZ3FMqOf3qgSo0R8af5Z3LllANcKoe5iH33p/ew5D
         L6iKigSmfcnQOoK9VBBy6rDx6M8Bbs2ad/a1UtNHxBx5IQw3aEe1hjqughdY0AjVHj7w
         TLYnUUi57ul+7WgcICNx8ZkkYyoL8CYnwETmU4KYFDFp8gFpww+Rb+2eWADMbW0CzSvI
         25h7g9aZYRF/GCDa0a3GSEbKQqgEXULY82fm+AXDx0AoGbDIJXuzwq33yLUVz+NVhxib
         Ce6A==
X-Forwarded-Encrypted: i=1; AJvYcCUUlIRWuf790AbCtYqTRH7T+3KJ7M3qBbxHwH7zSlcvDNIW68bks32xWWbnJDvODmzkXTI2Y2NIJQGqtQ5JXtCqPKhLQHvUeWvCLSU=
X-Gm-Message-State: AOJu0YyChspuX3rp7Uo0xK28y/3c4K3KvcAHuhoC4/JCks70keqbgVX1
	tZRww8FPzDI32tQZrPQO3qFP7vou7qB8eD/YnDg4Fu9P/vjkMQfYeBU3Z46qYKbxvep7e1no/JK
	IgBNHXdKvBhMEd7pn/hjR9YMvfEPMYRLiEV5K/Q==
X-Google-Smtp-Source: AGHT+IFvOcuO4OJJA1ZvGKt3d4wULBOkk2d61EBXmybZlxtEuOaN4dke+s6TRNw/Gpy3hehkpZ0dwMeQ4BRR8a5tdfM=
X-Received: by 2002:a0d:efc3:0:b0:60d:547:bc38 with SMTP id
 y186-20020a0defc3000000b0060d0547bc38mr12960286ywe.0.1710853113341; Tue, 19
 Mar 2024 05:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-rp1-cfe-v1-0-ac6d960ff22d@ideasonboard.com>
 <20240318-rp1-cfe-v1-2-ac6d960ff22d@ideasonboard.com> <eb854c43-1e92-4c19-bfd3-1bde94924319@linaro.org>
 <f97faeb9-8a6b-47c6-9317-daca88257802@ideasonboard.com> <30430e0e-70de-4831-97ad-974e350a2e54@ideasonboard.com>
 <5ca1d005-1beb-47ec-943a-9358ae3c6704@linaro.org> <CAEmqJPp7uGYe993L+ujth2mfRy66s8-S9FNxPY7vwkrboDq9yg@mail.gmail.com>
 <89d459dd-cc8c-4780-a56a-809e24343e69@linaro.org>
In-Reply-To: <89d459dd-cc8c-4780-a56a-809e24343e69@linaro.org>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 19 Mar 2024 12:57:57 +0000
Message-ID: <CAEmqJPrLP3j37Kcj0mX23x00p=gWuxZPNSUTRGNkcEqsUJ2MjQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 12:21, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/03/2024 13:06, Naushir Patuck wrote:
> > Hi,
> >
> > On Tue, 19 Mar 2024 at 09:32, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 19/03/2024 08:00, Tomi Valkeinen wrote:
> >>> On 19/03/2024 08:48, Tomi Valkeinen wrote:
> >>>> On 19/03/2024 08:23, Krzysztof Kozlowski wrote:
> >>>>> On 18/03/2024 16:49, Tomi Valkeinen wrote:
> >>>>>> Add DT bindings for raspberrypi,rp1-cfe.
> >>>>>>
> >>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>>> ---
> >>>>>>   .../bindings/media/raspberrypi,rp1-cfe.yaml        | 103
> >>>>>> +++++++++++++++++++++
> >>>>>>   1 file changed, 103 insertions(+)
> >>>>>>
> >>>>>> diff --git
> >>>>>> a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> >>>>>> b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..7b2beeaaab0e
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> >>>>>> @@ -0,0 +1,103 @@
> >>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>> +%YAML 1.2
> >>>>>> +---
> >>>>>> +$id: http://devicetree.org/schemas/media/raspberrypi,rp1-cfe.yaml#
> >>>>>
> >>>>> Use compatible as filename.
> >>>>
> >>>> Ah, indeed. I changed the compatible quite late, adding the "rpi5" as
> >>>> versioning, and missed changing the file name.
> >>>>
> >>>> I'll rename.
> >>>
> >>> Actually, maybe it's better to have two compatibles,
> >>> "raspberrypi,rp1-cfe" as the generic one, and "raspberrypi,rpi5-rp1-cfe"
> >>> (or something similar) for RaspberryPi 5.
> >>>
> >>> And I'm not sure if the "rp1" part is relevant there, would
> >>> "raspberrypi,cfe" be just as fine? Naush?
> >>
> >> See writing bindings. Compatibles should be SoC specific. In some cases
> >> generic fallbacks make sense, in some note. But don't just choose
> >> "generic fallback" because you want. Provide rationale.
> >
> > If the compatible is SoC specific, I suppose "raspberrypi,rp1-cfe"
> > would be the correct string.
>
> Sure, but then please think what if rp1 is on Rpi6, called exactly the
> same (rp1), with some minor differences? Could it be?

Yes, this is definitely possible.  In such cases, I would expect the
hardware to have a version register that would be queried by the
driver to adjust for minor differences, and the compatible string
remains the same.  Does that seem reasonable?

