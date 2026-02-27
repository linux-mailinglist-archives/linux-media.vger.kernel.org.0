Return-Path: <linux-media+bounces-53667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C0kLuxLoWkKsAQAu9opvQ
	(envelope-from <linux-media+bounces-53667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:46:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFAB1B413B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CE213042693
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D627355F51;
	Fri, 27 Feb 2026 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNkXZAf7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2926ED59;
	Fri, 27 Feb 2026 07:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178402; cv=none; b=O6t7mdMbyS2eAtpJsaor1ZCRIn7pHLznyRID1Lgl+wSUWpQ7tIRNWRIRqoXEdSHmDPoP6H709GoDUOzbGrz5tUpPyl9Uhvm+RP2c3qx5Y9CB9j9NNudqSuvINdd4Hfg32pxoQQs2fu1kgHhT/XDap+MmI7Oslugr9oAdPongBTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178402; c=relaxed/simple;
	bh=jePfAZhJyfMoZjEKH9U8utkwSsvmWHCAddqvO5sQK+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLOl232eg4oC1+X/I13IgRU3l+LECAkKpyZ3LmvzAM0PTEj7UzlZHcHP6+Ow4jnjgXDqcj8vh4xms1wgdMuv/cBtmdI/f3LrrilZ1ksx3K5VmLMBdkdJW58TyqzTRniZXNgS7Xr3BmQ94z9iP90MlWsd0lydPDcAZTd2bu9S1vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNkXZAf7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB4CC116C6;
	Fri, 27 Feb 2026 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772178401;
	bh=jePfAZhJyfMoZjEKH9U8utkwSsvmWHCAddqvO5sQK+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNkXZAf7isLJPsVVJPU1ghtKuO6pCphbm0h5j3k1z1wQI0aOh1YUavMjLn7xPJTbA
	 HG5UNeISiQ34BS1I5r/FhhmFbOalvX+z5xBf1K/F9mRG1/EYA8rKZIkXld6uCSjg02
	 QQ1nXE2fCtZQgtq2TJV9EmL4GMM/+ouoW1nxM/tdr6SottErhKNKixbujyhjnS3QhN
	 LdMQ3j2RG52ApgVzbQ/mjUDs7YSReft7UFXb6W66Ti5/Rtt4Py+dUlX/QWYAk0WKGG
	 9k82Ttq/FyJ8JGJLHFY97WSXZcOeGnE6GPgCiiqX01Mzv1j6IqXrKo+m3YuC7Lz3na
	 4R0B18byR9olA==
Date: Fri, 27 Feb 2026 08:46:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260227-observant-roaring-ara-ef7eb0@quoll>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53667-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECFAB1B413B
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
> register blocks have been provided for the video decoder unit.
> 
> However, the binding does not properly describe the new hardware layout,

As you shown me last time with excerpt of address spaces from
datasheet/manual, the binding correctly describes the hardware and above
sentence is not true.

> as it breaks the convention expecting the unit address to indicate the
> start of the first register range, i.e. 'function' block is listed

Imprecise wording. "start of the main or primary register range"

(if you have 0x1000 with one reg and 0x20000000 with everything, the
unit address will be 0x20000000).

> before 'link' instead of the opposite.
> 
> Since the binding changes have been already released and a fix would
> bring up an ABI break, mark the current 'reg-names' ordering as
> deprecated and introduce an alternative 'link,function,cache' listing
> which follows the address-based ordering according to the TRM.
> 
> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.

This is fine for me.

Best regards,
Krzysztof


