Return-Path: <linux-media+bounces-59760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBBuEjFU8Gm2RwEAu9opvQ
	(envelope-from <linux-media+bounces-59760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:31:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3347E12F
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F8FB301C917
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FEE34D3B5;
	Tue, 28 Apr 2026 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4gAHyOz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF96175A72;
	Tue, 28 Apr 2026 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357867; cv=none; b=FrnbTtcyVUvdSTWblo5wSNlPTX9V2S9Ec5n7ObvZ+da0cg3hEWeFs+E04y7iyZhmemYaXMOOaLgaSCb/vs22rSFt8H9rIr92h50zn5uTlRSRl4V1vuI3DJlgeFshrg8XAp+E+iKwwARLV1PChmrQIA1zPJ7IhTA2vzrB4WwHLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357867; c=relaxed/simple;
	bh=U5IVN05soJ83Vg4XNyOOzGVtO4/MTt4s8SsWskmBq80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7Nzy37ue+/jzAYG4xdKRHuHnqZb63m2AosoJhj49hyeZ4tWhleR3TJuYWn8Rqo7y1O9EcIx5iWf/NQKZr3gq9bnV6tPt+3oZ+p5p4kujTZzBTFS5g/f5mqUHhWfJrv47VaWk00f5DKe5wRULBvRI2Ky8nIgA1C8H5lC6IxZjkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4gAHyOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64195C2BCAF;
	Tue, 28 Apr 2026 06:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777357867;
	bh=U5IVN05soJ83Vg4XNyOOzGVtO4/MTt4s8SsWskmBq80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4gAHyOzAAv5vm/OTSjxgojsjYKK2OZRVd2/oz2iA+9gvH5HTIFQokDS57f0D/pjY
	 ME7/VLU9HC8LWEM5ZgjZcMxWyOfO2CJ7Kaz6Dk17RvLuHnv2xSTg4M9ZyKd6pM58T9
	 nanA+QQ/rHPtehp2xErbKVbN/KdhWjD5dWMggqUkJtWTrCvyRJZCcH9s7+b2QoskGD
	 4+/lFWbkwKkUUGIurM99qQygQryf6Uwpp2c1xve7MzKMMwJAxcus5LxQ5wl/vg39HP
	 Y1XFSLMFPkzhV9Q55fG1g5lzmFAShqe2MuWnbu8li9T0UFtBnD3Nj/W36IDnMqpvvI
	 EZctDOxPbfnRA==
Date: Tue, 28 Apr 2026 08:31:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Message-ID: <20260428-merry-visionary-aardwolf-bec81f@quoll>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
X-Rspamd-Queue-Id: DFA3347E12F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59760-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 02:43:37PM +0200, Loic Poulain wrote:
> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> Offline Processing Engine (OPE) found on platforms such as Agatti.
> The OPE is a memory-to-memory image processing block which operates
> on frames read from and written back to system memory.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 131 +++++++++++++++++++++
>  1 file changed, 131 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


