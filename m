Return-Path: <linux-media+bounces-54605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOLNL2FWqWkh5wAAu9opvQ
	(envelope-from <linux-media+bounces-54605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:09:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7988F20F706
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF3B6305A96E
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D20D37FF4F;
	Thu,  5 Mar 2026 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cD4UFgoA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F537F00F
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704943; cv=none; b=eZ5U3iVK3ELAZw3KCykjyYzKuJmi6Bdvas9xKx7zaJ10GOJAjM81YIvSZAu/gCCsUR4/bYNsldnLs1VyJXXRzcKXTUtpfbVXa6jFmNGjYakF5CavQkIn+hm+wWK4EVbx7Tj8tL/oZFkOSCDECa4/faZvt/KOlsCg7YHNnMKwjrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704943; c=relaxed/simple;
	bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qs8DZSKl9AcGifDwFOiz37rcfRsuTiwc6x4typyGeYD3fNXwgUNA8wgkcd9oy3p0dyhu86Kb1SBra6s7gKImeyzScnmyRoC0NT4R0cEQK71ijQE7h55tkKojESVyuG5d9wcdY0kq5B7a1yGiTElFssjq+VRm5y/7ebFR/He0kuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cD4UFgoA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48371119eacso93559665e9.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772704940; x=1773309740; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=cD4UFgoAocJuZT5S6/FT4tLvo8eHic6win/PVVlM7THi42GfYkSi1TmQKp9oFjEvC9
         4DuAmh8ioVJ3l0t9cfDz1F4uH57IMEgeY61EKqf0J4hgzotd10bzAWeqkIY3qxwq+gtt
         KyD/BEhAcZymLIC+jEV+iqZhfRlSpIO7G5fxOWyrn6ZeoxUBzXJNaGNiXGXdwAwygc++
         SJ3ShMbEL/2wC0WJ/VhDdOAftX90PfAz60BcupIG8OAGaPrCOCMIA27aaK++isLH44Iv
         ENO8y4ePFW102JPN00G4qmjO8l3H2KXaQyAiU4DD52kTRmizIQUzeyakkq8kcPe749lH
         0MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704940; x=1773309740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=RM/tCgjT71Y3X1WD1O4IQi2ODtgcDK8joxAp9K87vqVB5RlSaQpA71G7Jxx+eW1LTh
         HbGMh0LLCwDb7qhB7QnyaR5SVHvR6VD81WF7XsxCQq6rzpPP3/wn8vhAOuKaQkQQXg0j
         Pxa2x3q2AkBQz1WwpCfrVCS4mbLjFNyohREQntkcM818tc8k3T252HyyNFlcFVO7SRhu
         HenltlFU4t2hrvCnYm13sch/xt5LZJ2UdKlyBllJsCtDSDmTjPpn1cZr2ajEkpVbXbRx
         0J4199IyZxBNZ4IqnYQFI06siUt+/oXWF2N9sRHtE0bjkP7S0qdeVlFvynpeADeEdEDH
         bm3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9VfUM9P7hkhv5A7kcJmsJIJ0rZPiePu3OYxbX7L4419gVpiGRaQz6TwvEu8IRnqpv0d8ViocbjKbGGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKrUrzoTxEcBISydMeNVhC4BARz0XYZM+fBFZtTVLw50Se4Ym
	fxP+cTnEHNNa/vFkiQP1EJbc+VYWot4Cq9bFNkuEMuzwe/KkNupLpY097prAkimwUsA=
X-Gm-Gg: ATEYQzzT/IQ3sL8XuwcP0jP3NJ6F+mKLmki/IBnCj3uY5BpElKPYl3fQsvbHnFijkab
	hiTjxDrGf6SQrcsYojy80ZC46uH+4Agnum5CrLcpbei9JF3OfwRhUYDaYRxtXO/5D2YtGiUFUyb
	QOgoBHXZH+Qo+BDRKgezddNlLWeOq6Adi0IKICjznvs4ciwlqdgfMCvz3mcmYkJAD0YQKNln6uZ
	qmVcnaVkyhRIw2OfWXLiNj8yxU1AQ8AuNSZcsMcSnpmQyGvfgWx4lzA+6bTjy14EjCqapQEwjyG
	71T6tjnCZuPFbNXRX3aIpCRFl4olRWwp35P/UN0nLQLE9sJdU7uFsYDdPpgQi7W/IXwELDwYjcd
	d7bEC9aVsB5eoFQgPmoTxcZXwhWZqYQqvMDKwb3fXanjN9EZRP83fI470Wx+PJ5ywZlbmb1OwRP
	oXv07QdevyCn9dLq9vDRlax4o0zbyK
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4851988f31dmr86977045e9.23.1772704939633;
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Received: from salami.lan ([212.129.84.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fade9fdsm59453655e9.4.2026.03.05.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Message-ID: <030737fd255a49288349f06e8c1217a126ea9081.camel@linaro.org>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where
 missing
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>
Date: Thu, 05 Mar 2026 10:02:16 +0000
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 7988F20F706
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-54605-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On Wed, 2026-03-04 at 19:57 +0200, Vladimir Oltean wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>=20
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

> =C2=A0drivers/phy/phy-google-usb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +

For Google:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

