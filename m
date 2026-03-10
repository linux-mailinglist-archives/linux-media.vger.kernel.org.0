Return-Path: <linux-media+bounces-55071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAe9G8bhr2nkdAIAu9opvQ
	(envelope-from <linux-media+bounces-55071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 10:17:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A12482A3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 10:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F3E93061456
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEC443D517;
	Tue, 10 Mar 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGzE+AkP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB843CEFC
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133905; cv=none; b=gnJvmrJFFzI45k318QxxZrEhlLoBKHnCHRMdfVTkzwpDXMPCR2KYLXDTe8b72AYJjBPA7soDDgd1+X6m3g5G8n9o3Ph/2JCoYBEG1wSUQPnRf/JUla8UpEwNhTdT3IXJOgQsiLAfTjCInMksKybRiZE6vLaNIlC5Fyx6JTmZoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133905; c=relaxed/simple;
	bh=k2F848Zif0ENv+dioxwCTNyt1oN71pv8VacY1VvtFtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhqb2MXuZEy8iD0TyGxCt0ShB3I5MjrNH+fz7M26PoUM2htA/ZMfWF04GZAnYsGUGP5SVPnnFmGeHoglPFh0yLNBZCRhlynNn8BG449wwrBNTs6+3ZJjxEjWMih0Su092Ywvg3Uw5kqB+SIYnlWi6nMHSfpDcNwQBCcxjbH3Dms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGzE+AkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC52C2BC87
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133905;
	bh=k2F848Zif0ENv+dioxwCTNyt1oN71pv8VacY1VvtFtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KGzE+AkPTbDePLOfxxSTz0NJMri0EekeriaoMph7b9Jbqih5Ia32kL2tB0bpRXAaZ
	 Xd6EgwIO3zW8wsj5KPHnW557mQOlYLsZmYMSs3/zPmDxiTQ1jEJyWWcLDAgaOVZ26j
	 8FNpzsqFjoQvFDl4B1/w6djudKuYNee9wTmWamLyhMa75x3wa/pvdJZWCYDV6nWoc9
	 f2cKKUD8Pm9nT3qQuRFerXNryMwk6751oxzDK5gkcVrGPVN+HdpSxKhW+p/6F3f2aq
	 TBbzKVwfBxOwsnrEtZL5vhU6EQaU8FtIppabfHdyf8tNXzvPe1lMPdjxpy8rJPAK6p
	 E1LbYo0/ajrAw==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so12343638d50.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 02:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOgvobtOcS/c82H6mPzIjK0oXxycCoytPIykyL4e8SbWvIi1ChYHq+AvFRFfuBnT+Yst7GK6qcmPmV9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyby8+/payb0ucNxGzmvSsww6e9qzpx7SUq/+XjmSNaNgQ//cWb
	xgdZL2HdFSb0MnmgjYP4ZLR46x7qZMMa17HpCSmo01nmRxnEFXIXuthKfe5QsG/0n8VNeDbtlUR
	iJWtBD6gezMo3biMAlF6GGq7sePmZidE=
X-Received: by 2002:a05:690e:b8c:b0:64c:905:6f2c with SMTP id
 956f58d0204a3-64d1411d8b4mr13101525d50.20.1773133904182; Tue, 10 Mar 2026
 02:11:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com> <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:11:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
X-Gm-Features: AaiRm53Xu9gGfY3MrM83r361-dKQ36aGj99vP6wgofH18qCwDYgWNRZvm6MhVmA
Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
Subject: Re: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1C0A12482A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55071-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 10:03=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied to the pinctrl tree!

Yours,
Linus Walleij

