Return-Path: <linux-media+bounces-57375-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WChgAQ0Bx2lIRQUAu9opvQ
	(envelope-from <linux-media+bounces-57375-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:13:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5134BEA0
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B807B3075D5D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D06039DBDF;
	Fri, 27 Mar 2026 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QskGPRmD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6301A08BC;
	Fri, 27 Mar 2026 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649487; cv=none; b=JqLrREL7+fUPEedJ1yY9WpsXXguXv6wU4YvbUQWKXgNQpZZIwU5jSTN0MahzsmgxydRPrjB1L+DcvOlMSjBcrAQMdDd9csp1p6l++AaaTusm39ZG5daaebkrRqFy16IgI9S/wY5zDu+9+KeHiV2nW3KhNK7lgPnponfjl+cxOa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649487; c=relaxed/simple;
	bh=vWYAZh7Adzo7TC7luTIEYOTCpRuJPAjp6xiHK7UViFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mx3oQi3AJgA4wJQtNm9zUbyEjAD30Y6C0+uQlCjaRgFOZjy7XrPYuKLtYjMC270uGLUcsf5VBFR8kMvbHPC2LJSvYk/OXF2/FLiY40XXl7Q2KemUQEKWN2zl0JHlmPw+Nru5N+c9b/TsxPXiSd+tZxanSaMwGip5x8hwU2nUK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QskGPRmD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1839DC19423;
	Fri, 27 Mar 2026 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774649487;
	bh=vWYAZh7Adzo7TC7luTIEYOTCpRuJPAjp6xiHK7UViFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QskGPRmDJo1BFOXewlwxC6DKTnU022Vl7r4nAnJMQ3s+seqm6HC60pl2+8YtOgI92
	 boDND430EqgYskA+kGlTvTTPZ22ywIwDEu63uO+gOGT9GS94daeDSF8fmCQE1IMTJ9
	 Xit2up9dWq2BMVj623O3MVBQbSzrEZ7mvAx1OzwDLuqaqpdPzXhIJ7tPGJstBazKYq
	 WXekvbB8TIQ0LxMKTSVvpOQoIc+CJ5g+h1cBGpprKu/gmxkFWxD+HLaW1TOTPTjHAZ
	 0q3x0Bs4xKrbnmZ6HitsTxAXibkTg39VEbqLi+SLMpbzKoZaV/IV2+fo4uaIthpU4y
	 I8QPel4T6Z/Fg==
Message-ID: <6c52f934-1b08-4e93-a753-d4c90e827f1f@kernel.org>
Date: Fri, 27 Mar 2026 22:11:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
 <aEe0uBeOge5s3CG521FGdJhY-snL7v7U2KXbg1IAqMn9oy6mslb2GJ9JfYCJ3RRE0L-Qr5opUYFUyBJp3qEraw==@protonmail.internalid>
 <62zcubxembr6iat4d7n3o7aecqtx3ne2a42ilxfoap65oaefhh@mecahghgrwrf>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <62zcubxembr6iat4d7n3o7aecqtx3ne2a42ilxfoap65oaefhh@mecahghgrwrf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57375-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CE5134BEA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 20:54, Dmitry Baryshkov wrote:
> I think, I've left similar feedback already. Please rework a single
> structure-less table into generic and per-lane configuration. It doesn't
> make sense to repeat the same configuration N times, just with the
> different offset.

If you remember you also said that was fine for a follow-on series after 
merging, and you asked for a commit log to that effect.

i.e.

"The register init sequence table is imported verbatim from the existing
CAMSS csiphy driver. A follow-up series will rework the table to extract
the repetitive per-lane pattern into a loop."

---
bod

