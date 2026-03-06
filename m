Return-Path: <linux-media+bounces-54676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEb6EpsoqmmQMQEAu9opvQ
	(envelope-from <linux-media+bounces-54676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 02:06:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CF821A1A2
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 02:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EDC830677BF
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 01:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4152F745E;
	Fri,  6 Mar 2026 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J38lCU0a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA26248176;
	Fri,  6 Mar 2026 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759166; cv=none; b=XGLpOXndCn95EJJWdaP7JrrT5fS0ZNUM+GV8AMPYW0ckpQejXiIN+xBRNw6INU+/L/dVXUffDMfWVr6pMeVayheoaV67V4o5RbXv6PVxHCNLNScWeV2/I6+AprXHJnyEVOK9X//k2bhZ3jhVfUe808vnj749wDf8WVCIMjKE594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759166; c=relaxed/simple;
	bh=TXhsUtQ1T1eFHHTBTR54dHAz6m+/NdLJN2sBSGnqWdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqyJLLf2AdexTXz30nBK94gHOvRxipgL/IAK67NH7oaBU+3fXqNSPVeXTsm4us3qEroU2PFL+NdEXXUZx4nwS6ezSY8RG74VOhjaYzx1qKI/tkPImsrOOHJz9m+NJfn4Nx9GSjhHyOTTPpZ8Teju4nyYE89FSq+PUUb3Vj0+lPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J38lCU0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2ACC116C6;
	Fri,  6 Mar 2026 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759166;
	bh=TXhsUtQ1T1eFHHTBTR54dHAz6m+/NdLJN2sBSGnqWdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J38lCU0aKRQiDELTdbhsaaGpPT3Jx448LT6fqF7qFCS5hxROoC6tSb/44TyFit4nn
	 O4fAapca7bHIFm19JgksNJm6q6HY+lYMonqjOix2bPg7m1L7mbWYZmYRCni6lCR5dC
	 0bzq/M0gEt0YYEWo+1NT8gnTdkx+Ql2K9yBFYGyJU2MUiaG7BFoZunekJHTldDpq+9
	 O4b65fu/u/Q/zndvSF7WMo37k0YPpMuOCzcUEKpcn/SzXoAVrgKmYIWNROJZw3K57v
	 CysiPIxs+sqBKV3hPD4qeyOGRlIAd+dsmS5tXsncmGm4EgyShbLnsAcw+pRTO3U8F7
	 Wtv7Yrrc+WXOw==
Date: Thu, 5 Mar 2026 19:06:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: media: ti,ds90ub953: Add new range
 for remote GPIO data
Message-ID: <177275916426.903680.16610695491601049297.robh@kernel.org>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
 <20260228-ds90ub953-v5-1-056cf07cc8f1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228-ds90ub953-v5-1-056cf07cc8f1@nxp.com>
X-Rspamd-Queue-Id: A4CF821A1A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54676-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Sat, 28 Feb 2026 14:18:19 +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
> output, it can be programed to output local data or remote data coming
> from the remote compatible deserializer.
> 
> Make a different GPIO range for remote ones.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v5:
> - Improve the description for "#gpio-cells" as commented by Conor.
> 
> Changes in v4:
> - Use folder block instead of literal block for #gpio-cell property description.
> 
> Changes in v3:
> - Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
>   compatible deserializer suggested by Rob instead of adding third
>   cell for GPIO controller.
> 
> Changes in v2:
> - Remove new property ti,gpio-data
> - Add third cell for GPIO controller to select GPIO output source.
> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


