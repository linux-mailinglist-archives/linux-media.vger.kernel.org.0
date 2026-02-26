Return-Path: <linux-media+bounces-53453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKtoFNsToGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:35:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112E1A37E5
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB333311EFFB
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1AD3A4F5D;
	Thu, 26 Feb 2026 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmaGFQe8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2E33A0B35;
	Thu, 26 Feb 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098049; cv=none; b=vGX/tCyDXs8u8Agq8L5K9ZYEQwkir6x4nLe8p16rWzNiwYICQ9+Iw4cu92Iv74SboCJ35QO7NOA6r655+CDdwNvKH9zkUBXQAaTcj3cS5mSE+mR8rN7iB8cnGoNCy2XaHISP9y5I1WcbSIVCBl0wjgKyrv/nSrr7WKPFKc0/Eeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098049; c=relaxed/simple;
	bh=7i4N6GwK+gKpINnfz8mGZNz9tpvC6ConNrLB1s63wcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVMl68cpagtb6lFJHTEhO8GAbyHMpYJsA5qQ/ibxSrBVYUd1sr2nvBDxSwJ865s4W7wbGm+KxlLdy3Z98CXZFObb1B3tvRg7d5eRlzUsktGDsyCIyGdoyAdi9q4mT8dpxsbz7xNVG5Rj0RG120fLuzqnBfp4PKMKuu6p+4WTJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmaGFQe8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95FCC19422;
	Thu, 26 Feb 2026 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098046;
	bh=7i4N6GwK+gKpINnfz8mGZNz9tpvC6ConNrLB1s63wcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MmaGFQe8vpElv9HoR376BJRpwDcm1LyjX9TSndN7v3RDNrfKfCdGlzCQUFf4IND24
	 NNvTPFG9INq/eB6Nq+T/ULGFJ30iEqTbZh494atYWwzmlXzlTnJNdQjhv3AydVX45X
	 RdeJqWPVZ7RrcJ63tSoXIkX1h4t+lDe3xd7RKlImysoxKAB+2QjK0132YuRXqim2XR
	 SRGTcpwL4GMO6u5sa+JefWALt5gtefHKd78eqoZB2FaUwMBQdFsFCTt+MxswA+gRaW
	 kvnSRfEw1GRK6Jyv2rY2SM9JOgCliPUP1Scd+H75G1Tq22gc2cv5LCapa7pnuiF3Gr
	 6GLH70WCAKLRQ==
Message-ID: <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
Date: Thu, 26 Feb 2026 09:27:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
 <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260226-fluffy-complex-malamute-7ecec6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53453-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1112E1A37E5
X-Rspamd-Action: no action

On 26/02/2026 07:07, Krzysztof Kozlowski wrote:
> No, it does not allow that. You cannto change the ABI.
> 
> That's why I reminded multiple times before reviewing new CAMSS bindings
> for Milos and something more. Because once it gets accepted, you cannot
> change it anymore without valid reason. And there is no valid reason
> here provided. I kept these patches in staging/waiting for long
> enough...

I thought your policy was - a dtsi had to have it, which we don't yet have.

---
bod

