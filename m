Return-Path: <linux-media+bounces-53452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP1HCrgUoGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:39:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2961A3904
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8807B30AA014
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E373A0E85;
	Thu, 26 Feb 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Avc3pviw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4D399036;
	Thu, 26 Feb 2026 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097950; cv=none; b=PnxCLuB6qOyqRNErSuIH3Yq7o270n7EIXtAy3Wi7Z9xlUQxjvVKBZsFXVagB/pTinnnECvev/RKus3ozBy/ZgRvOrtYJNfpJykaS1RB4q+HkBvC7wqzM+5Gz9sfr4op07LPEsTMzy9d/ghNftlnfg/UPiEqpd+0poo4Q1jblIFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097950; c=relaxed/simple;
	bh=QNbalC266aa8zhKG+18yelYxw3suFeRx4igL70BUZbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwEBePwG+2XHXaVrewqfmNp368/rFO7jylApVojfoYBsRRh2l/4zp0QvE26U19Il0h21z+bROzhDYB0fhGuUotwc0D3kyodlCxJXOoYe8Tji63ZPMLYW2kMSOHHTBtiCwjZUURGK+nY1aX1ZPJwWwq+RzyzXPcdTC5ma3fEj+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Avc3pviw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275C6C19422;
	Thu, 26 Feb 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772097950;
	bh=QNbalC266aa8zhKG+18yelYxw3suFeRx4igL70BUZbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Avc3pviwiCc4YBmJ04MVpXzsO0XTIcE1GwbO/yRK2r1Rkxbk3E3tJDzJmhTrUyz+M
	 +TuuKbc5xdaQZJ/VUC/qUZbm9Pk40soDNnldHPU2XZGgPvw84Eik3WnvpxZzwGtf/x
	 Def1JwUFqsyS8O1f1BE+0BABooLmLd40kvw88an2Tk9N7VJpDSkHWHl/vDAmr+zlJ8
	 iKjC6G7AYPhh2v/h9bDCSzkTwz5zb6w1hGB5A0zv2us/Xpfl5BS/3MC9D5VFAjsTQ2
	 7ml+Yl8+lT1D6MGx0JXqv+FzYICfHt3YmbiVSGffPxkYeuTiKJ7blvmCeMJOxDnUvw
	 yvgXtVLyE41bg==
Message-ID: <13853dc8-1a54-4cfd-b801-f23d88be4a88@kernel.org>
Date: Thu, 26 Feb 2026 09:25:44 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
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
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
 <6JLP5a_yJmhmmwSmtFoMmzlT3Gh5yhHVpVSRTqDb93I2_KFB6-p_6mKmGKaqtStt2bbVPqQ16j0Sfp2Z-LvhlQ==@protonmail.internalid>
 <20260226-resourceful-pelican-of-defense-437c7e@quoll>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260226-resourceful-pelican-of-defense-437c7e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53452-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: BC2961A3904
X-Rspamd-Action: no action

On 26/02/2026 07:04, Krzysztof Kozlowski wrote:
> No, that's ABI break for no real reason. This ABI was shipped and there
> is upstream (and maybe other) user of it. You cannot change it.

We don't have an upstream user. The dtsi for CAMSS hasn't been committed.

So this is changeable right ?

---
bod

