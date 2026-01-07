Return-Path: <linux-media+bounces-50145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 311DACFE4B0
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BDC53017ED4
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFA9339840;
	Wed,  7 Jan 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxpUqBSC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7333971D
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795211; cv=none; b=t4I3JAOBILEuVdXOOenGw0uc8BdI1OCE9d5nUVzubxspuucq0M9rJhJqzMRnfYeqVva1Wed/yUoNWgw2cZaDeN6zC6ZXBbt0tCftTgxejzMjqaaWeCVemmN20oW6dCeRYASYfWQM4N4qSw4QIqINM01Tbf2pJybzU/OEWD3owBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795211; c=relaxed/simple;
	bh=vPUhQO/bJfTutZapkC7lSFc2q9gKbGxYafUo+Xs/Plc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNH3giFgHrNUgly65CTRvp3qN/qYN1R4u6oPfbcTp2F777FV0809sNpuJxd93GEyJfbo6Fu0vwIBTYYoQrH+v+d2U4bdc1LX/t48V/+PgEw6C2sqkf1WENIN0+vkQeB0G+QU2MIh9PZH3hGxwirCiJa1tn6I4yNO8J5qBdPIxFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxpUqBSC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611C1C4CEF7
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795211;
	bh=vPUhQO/bJfTutZapkC7lSFc2q9gKbGxYafUo+Xs/Plc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxpUqBSCaEAFNHV6ZR13Wn3sVba/mylY/cSyRWIVNUjJyQ/RoL2O7Frk4XVnmTaI6
	 vpd/fm7mnx9aKY8DUWFStsaVx96N3/iN7XssR5fP01+onZCKHcsqc59yZblqX9pgV4
	 Xex8vwgsTKZ3+SE9L71+KngoiVZDI22HXt12ahm2rPXifUB8KukHkK5H2stkGnlQQz
	 +FyfSWpuD9PRg78RPTSKUxL8KPaFOEICqu1pGmm7sYCQbyJ/EfmiLFvmft1A4YMDzM
	 nO4jM4arQQtOSNxk9ykJ3we4r3oSkwD95uoSJNoq8dXTHJb+akI9ZpTQyCGGtUdjrF
	 7D7vZG0+yHHTQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-790647da8cbso23730947b3.1
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVVIqV2tFFdEUCgUQLyC1LyZc+isWdFFzK1CALtbbFu4vRnzhtHXfvpR7cB0Z5yTaUeg0VfvJFAzRk9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmCp6xec+3J0cJGRlFKrwaPmO+dTd+tEqsYaxgCWJ1SfgMLCc/
	F5XgpVRiB2TYM3952+PggpJBd0jrReiZF5UC9gvO61Nd2uhlqSLyIblOwcN/tgZLe/yyuv6A7Zz
	mM0vd9cXarxvJylhKlC0CMzTXz7C6b4E=
X-Google-Smtp-Source: AGHT+IFpGRYBSvGge8PYFsRHSqJMEhcXggZW3h16GPs6+Lt8GMfLw75OX8+1p8hq0kvPo80jSxwj1LTh08lAgBDlaLw=
X-Received: by 2002:a05:690e:1248:b0:645:581a:df8c with SMTP id
 956f58d0204a3-64716c4dfb6mr2253264d50.91.1767795210728; Wed, 07 Jan 2026
 06:13:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251225103616.3203473-1-wens@kernel.org> <20251225103616.3203473-3-wens@kernel.org>
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:13:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLku5_fyDXw+uJ8Gj_1nQxjq8egOh60X1ARGC5dmFAcV+g@mail.gmail.com>
X-Gm-Features: AQt7F2rAHH3lL_5LalTawPfcgjclmbR9cTZKvz98Rqt4039YJlca5QQ3lCXU-dQ
Message-ID: <CAD++jLku5_fyDXw+uJ8Gj_1nQxjq8egOh60X1ARGC5dmFAcV+g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern
 with leading numbers
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2025 at 11:36=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:

> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
>
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
>
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

This patch 2/4 applied to the pin control tree.

Yours,
Linus Walleij

