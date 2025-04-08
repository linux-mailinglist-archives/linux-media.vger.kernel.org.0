Return-Path: <linux-media+bounces-29604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CBBA7FC6E
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA0CD1895720
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7262686AA;
	Tue,  8 Apr 2025 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmPziao6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A30A267AF0;
	Tue,  8 Apr 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108598; cv=none; b=gf/L5v1G09z58Cy49F9vj9ZgRIwB+FWzoyUe2zjNOb5cvieRUDnMMrTAw02tzyIRQHvauz6jGVe5NENlVvHXVW4H6uShIzVqMhCeZYfMswg9amjA72NWdZRsHs8RKiQJ+K7RIFJX2s8+DDJY/wZnuxCBRmCWf1iz5thZVBSIXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108598; c=relaxed/simple;
	bh=/UphR4APFcK/PozCoAhhjfIcAkajuJZKr5WV2+8cQPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCWiZrwrGg3Dh3INCILuxfIApQdDtgX6CoFOhxl5wXU3Qpafv0dfrR7o0raL8yzmcsQ9lVqqQvPj7cKE/JFVBYmdi9gur5D3avodO460YdTrAFEJjLj5S8XHc8r+IxPFMD3EtKyAiaKaO7jXZVwL+JqsEPxf10cppi0Dqhg004Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmPziao6; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523f721bc63so5611863e0c.0;
        Tue, 08 Apr 2025 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744108595; x=1744713395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgmG0wqQuAR9ll3NJT03Os1B09ohhoP7nPRoSHR6bKo=;
        b=OmPziao6wFNS8qvNYI7EMNZG9Ih1bHKoMPQos8gV1JtViB01pBRmD+AFOOGIqOemsz
         qIy79u6sgNuUoP8ENcxQclcCXHaU4s19utH9kzdu8N6v08SMBq2TRT/VZCgFZr9tvLZL
         /NH/j4tgEkNRd7URdCy3iZkY+hyBHjaV0L8oZv6zhf69GHTvz+3VOJ/btQ2JLtuyyfyW
         ONWy0yx51KXuh5w6qlNjiSoNyqF/Kk6N3fT7cjxvLX4bBBI2Bz38Z77hgAAiqo4JN2Yc
         li5g8lnIuarYhKYhqEO/S+6NDtWxqf6XUe8vKi7vFdmYLNiveUZ2oypxLtkdNpllZWW0
         6NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108595; x=1744713395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgmG0wqQuAR9ll3NJT03Os1B09ohhoP7nPRoSHR6bKo=;
        b=PIlKiVCZDoV8otHO1MLelt+fZUK0x/mJubWOCH/P3FcADiUE+4IiesALH1IXZLx9AX
         tCozZ1K5GVLnJTcG8iPoba+l2ha8c5FRMziMX2M7IpFL4zOUdg6F0CItBH/itXOf8ETL
         XhYCg1k5hCc644QUfhpcCGuMZp3s0gHHhperZxN3yqk582qCyL4LkwvkeKFltG8X19rR
         5RIkvVZ1gBh5XZ9vyNyCYDEav+lhJygsWHAc0RcNe6h4TUK/yzsm7k+eSgviiA2m0Vvi
         AICnSyxRmQnlu3bXhYbr44xG38yWq7khOoeMTPsd+Ggeo9iD1pmLmNsTtr+mLIZ5cGN9
         T7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQOSTFXSXQbvs77ls8j1bm4ECaa4aAtU3bTYnHQcGFtq4HxUh7VPcdb2coRAkG+I/loUI6dibLoEoy@vger.kernel.org, AJvYcCUmNX1uKanDenIl0pp4Gxku2x/0Aexgg4wCUBtWUXodUVnXlEiavMbQ6u29VIHJMXdf/3Mr5kUlW1F9pLQR@vger.kernel.org, AJvYcCV8pnbZRpj1vF4oTEbynCTopve3416J3DfcobahdRllzrsvOeIfy027+BtTrYd4ebBcvinoww5cZ/ky@vger.kernel.org, AJvYcCVeSxDUksHXQHyEml1ojnATRGzjOIJjzp+oQEj+BNDCehNmoOd0Odw9PpRa3i+6+zIo6/F1CttbtbDgTq8=@vger.kernel.org, AJvYcCXkTsgIyFTV4X2LK0WMC8XpX/hcaDN8ndYhRXiw5PSXjxyywEAIDwFH1LPHXpXKQwl4sJk+zPALgQ4CjLCYtiWnRPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YykvkwR3kGIJtwXxBmdFs24lOputP351v4/MkIXgKjiYZXqdI1C
	ckD6MubN+dIsb9+wDlnqYv0l7UNvxpKVxgxYT4fZS0dWJj9Z5oXA5JSdt0Aaq1E0KvfHvkgSqKo
	Q6Q9ss3ic6V2w9VY9hhlBlILg8MQ=
X-Gm-Gg: ASbGncuR+/3BcGkKScHseBn8k4S8oFo+ouAFsfcWJgI5OYv/ESoelKWOOiqC5wzVd6z
	GEv4HInEHq9Dz91xPcgQIITmPacdxyl/SKl9sJQ0yrObN4LVhmafRCdJnxa3MRkmGpf1ljBz3Eo
	RIIT4EYvlFMJlqZ3Wa3pBLOC3eIfog9Olw38pklyaz7udy3J/sQKoRt7G2Fw==
X-Google-Smtp-Source: AGHT+IGMyNP2No7AuI19CdTtXFJE8koZoGDmQoARojlwrt1NccfGqz2JVp+QE7meuv23NLp5JcjsnmRCoc4VHK/gGxk=
X-Received: by 2002:a05:6122:894:b0:523:771e:8b81 with SMTP id
 71dfb90a1353d-5279acd553cmr1706106e0c.7.1744108595413; Tue, 08 Apr 2025
 03:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250331-magic-buzzard-from-valhalla-af88e3@krzk-bin>
In-Reply-To: <20250331-magic-buzzard-from-valhalla-af88e3@krzk-bin>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Apr 2025 11:36:09 +0100
X-Gm-Features: ATxdqUEzNQOXPjrLjLavlNGBXC7oKKUbhfJS_OUOhwmcc79SQzhslZo05twijCQ
Message-ID: <CA+V-a8tDfqH_utn7k0j=6s8HkjkLFrAanwZD8m8LpBxpWXO1QA@mail.gmail.com>
Subject: Re: [PATCH 05/17] dt-bindings: display: renesas,rzg2l-du: Add support
 for RZ/V2H(P) SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Mon, Mar 31, 2025 at 9:24=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Mar 30, 2025 at 10:07:01PM +0100, Prabhakar wrote:
> >  allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a07g044-du
>
> This goes probably after the if: block for renesas,r9a07g043u-du to keep
> sorting (if I get numbers correctly).
>
Agreed, I'll maintain the sort order here.

> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DSI
> > +            port@1:
> > +              description: DPI
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> >    - if:
> >        properties:
> >          compatible:
> > @@ -101,18 +119,20 @@ allOf:
> >
> >            required:
> >              - port@0
> > -    else:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g057-du
> > +    then:
> >        properties:
> >          ports:
> >            properties:
> >              port@0:
> >                description: DSI
>
> port@1: false
Agreed, more validation.

Cheers,
Prabhakar

