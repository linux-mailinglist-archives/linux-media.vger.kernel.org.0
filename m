Return-Path: <linux-media+bounces-52806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO48LUk0kGl7XAEAu9opvQ
	(envelope-from <linux-media+bounces-52806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 09:37:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E213B6E2
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 09:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF373016D28
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 08:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DA23033E5;
	Sat, 14 Feb 2026 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtMP9Uvk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70D22FE0E;
	Sat, 14 Feb 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771058244; cv=none; b=hzRwISy0a9Ab9De8KIqu0Ds6Nv9N6LPHyaDe621CgOLEKYRAOvnizb0SfsHZW4C+ZZrPIUI5urZK4bWn4sEcRdgD6KfoImQcDDPAtbMcvAg/imwuNs0pCMV7pVFoSpC1CtUyBSpIPX/Ym72wWuz88eJwfGImwTOVWCWizIT0Lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771058244; c=relaxed/simple;
	bh=ZvoByBSJhxJg4Vq0450W0tfuhyGD15IX/W41DVzLdE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma2AbvCzSsyOg8ceUsayqN63Sj9onQMkoub9npKouRTJk9P9ygwIjcxFpzCogVIN6FOIdSej4fBId0mpkYUGGBO7eOtHu4qKCVyVFzvdCAgBbANSLEuB0LvsTz28KOtAO4Z6DzJzgAkVRE+iwq4D07ZiTZnHC9+CIoULk6q5JcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtMP9Uvk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99729C19421;
	Sat, 14 Feb 2026 08:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771058244;
	bh=ZvoByBSJhxJg4Vq0450W0tfuhyGD15IX/W41DVzLdE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtMP9Uvk+fOkNP75FZlchqm44WRbZAkw1rgF646ygednVSy24jV0grR7jccUddPUe
	 qvm7VOf0ov1/qeXVk+2yFeoU9kF4kW1TB/GYFR3E4Y3v5SNZq27n4PmiI5nlEyoe6v
	 gypmlHc3cUBtKXdbqacFtYtfuI+GlL51NUfO/oVRzn/cZCREHG33r7Y7kuPEqjJ+BH
	 fbSwjnkL/kpCqHU0+S7KcJ4GfmqlX+ZgArzPPMKZkt/+zquRwhEUMtwlhtWShG3qjL
	 Td1C8CKd3Sih+dCYbfsgUvD6ZTK4xFPuaIPL95i3twPMXCBieVq33cgFvOyh9hvLuv
	 ePWc+DEQhWUFg==
Date: Sat, 14 Feb 2026 09:37:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
Message-ID: <20260214-slick-ringtail-of-innovation-d8eecd@quoll>
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <20260213-sm6350-camss-v3-1-30a845b0b7cc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213-sm6350-camss-v3-1-30a845b0b7cc@fairphone.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52806-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,lists.sr.ht,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 243E213B6E2
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 02:15:01PM +0100, Luca Weiss wrote:
> +  power-domains:
> +    maxItems: 6
> +
> +  power-domain-names:
> +    items:
> +      - const: bps
> +      - const: ife0
> +      - const: ife1

ife0, ife1, ife2, top, bps, ipe like in sm6150 or sm8650.

> +      - const: ife2
> +      - const: ipe
> +      - const: top
> +
> +  vdd-csiphy0-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy0-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy1-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy1-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy2-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy2-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy3-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY3.
> +
> +  vdd-csiphy3-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY3.

I assume that we abandon the idea of separate CSI PHY devices. It was
discssed way too long time ago.

With domains changed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


