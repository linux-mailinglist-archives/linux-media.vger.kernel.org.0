Return-Path: <linux-media+bounces-60056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCMMAo4k82kkxgEAu9opvQ
	(envelope-from <linux-media+bounces-60056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 11:44:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA14A0115
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 11:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77A32301C1B4
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 09:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434B530B51E;
	Thu, 30 Apr 2026 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOVeVjT2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6E3346B4;
	Thu, 30 Apr 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541827; cv=none; b=eezHce5ckITPWiNzW1lII1QrWDHKEW5M2IvCx0fiPkSG+gKcGvOg7WQ1+sMkZCUkCc0wZlUVJTS0kZZ1+0ZtdD6lAjJFMz30vYYymvXdDgQZzpMeu0tKnyq1YJq13LGxNEUfVQNqGn90kPtTd9NQIaQhInZ2fTDHUIzVBPNf3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541827; c=relaxed/simple;
	bh=JdRBy9JTXepiQJIQLVB6n+J++dpMx0UKFXt7j+zymeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rH48Sn31eXT7UvVBYK1dVi5XkeCB9iJngcHbPjnT5j8PdqBNCuaVytmh7loZrgtQqxwI+pgfbhjVaMX4ZGQSxPDrAxrRT+aBe+g8Q/hYKp7z94ouun9Kw8oXLxjbGHW2Epg/MMBf7cL+5GInlCrGv0yNz9LKcRdsrbVgXhiWpbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOVeVjT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC137C2BCB4;
	Thu, 30 Apr 2026 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541827;
	bh=JdRBy9JTXepiQJIQLVB6n+J++dpMx0UKFXt7j+zymeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOVeVjT2XBR1WWAVMUafKp0bnBh6/6aLcqK4h1bV6W6HQo5JmmHlq7cThtJTj1WU6
	 jOhEcT6BWrEkSFuUzjbW2xgA066fhY67XumLgOrom3UeSZHDAa8YZ0BAAAcNW9rqRg
	 8X+4faLiuJJo8Wk0Zoa7RQt++fvNsJ0TVIxoiL/pCLduAnmXWE3z07BVfTCMXUlS8i
	 QV5ksvJ4I77QwdI7Xs3BLF59iEsXC8SHA4hBdl5OT2rXMMb8/E1BvoARqE+sv9iS9x
	 XcpuY0hL5UtzKyNaThIh6PJ8Acv8r85sDHJLcZk//1BJacJpsl5kF/h8RlxbMUxmBP
	 1SqTovAiHpuIw==
Date: Thu, 30 Apr 2026 11:37:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] media: dt-bindings: vd55g1: Add vd55g4 compatible
Message-ID: <20260430-friendly-athletic-lemur-0ce874@quoll>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-5-4f745a83b87e@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-vd55g4_and_fixes-v1-5-4f745a83b87e@foss.st.com>
X-Rspamd-Queue-Id: 2BEA14A0115
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60056-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,st.com:email]

On Tue, Apr 28, 2026 at 10:40:59AM +0200, Benjamin Mugnier wrote:
> Define it as a new monochrome variant of vd65g4.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


