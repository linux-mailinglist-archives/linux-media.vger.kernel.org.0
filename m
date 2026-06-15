Return-Path: <linux-media+bounces-64872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VxZoK2+VL2p3CwUAu9opvQ
	(envelope-from <linux-media+bounces-64872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:02:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A25683A1E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:02:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FWRWXahb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64872-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64872-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2247830115B9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 06:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA56385D69;
	Mon, 15 Jun 2026 06:01:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0521C1EF39E;
	Mon, 15 Jun 2026 06:01:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503318; cv=none; b=Y3WakZ3pZxOYgS0+3i4BtH73kt0FHsq1f/M0l5wh2bk2No04HaPo5XSxqo3NyZLKyOecosEnp6fJyqBGd0vfBB1Xw19wZx6KQiBDyl/M7NfstM0W3sE4JeNAt8HXL6iK+rDhDyKZhhWL0cRIDnrNpOyRKwV+fw/Kc4PL1WjO1QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503318; c=relaxed/simple;
	bh=K3S/o5+3HAZtlOghGAkYz3SEwKaNJo3soPBjf3FLC8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+CCIw9o1FiDJ3QvS9yu2SWapkrsC+hzoZdOqhvBWgdIZh1Y22ZF964Iu1VkaLbPZAB+VIYGeE+fLFnUloNvY3c3WSGB06Uz9b2PGimRkk02dfgbKtzHKixxOqEPXzYUbzejBz6sAiB9ujpCXg48Z20iinC2qtdxHlKPjZ3QJ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWRWXahb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65061F000E9;
	Mon, 15 Jun 2026 06:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781503317;
	bh=Z4mQuAeDa3x65OGYjnjrERBHQho7AziCHYq10wuT1DM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FWRWXahb5P0sO+kXkhOyj1JCe+dR/vqRNdVb+hHuEPyRQerFltAovN7trOXNuMtps
	 htzKI4zkttQ80vRN/f/7I/M5JthrYIr6mPZysbJqNze3GM0mxiclYp85GsUaoR5a5Y
	 kcMF/xoK8NETY/dQ+ZjN402IvokWs4ICpWNyle/bCY/q8yRKNX+0Wq3HgxB+xzrLjl
	 kZoWiIuuFFeRFJ3Xd4roSDXOHivlILiFbpTTwnR0D/+K4svDKUIchKMkZRTO+zpmhP
	 RKz87S+n1EFGGVK181ip8M/hhy7sRSjzzqvtv9YFxD53wMEv/eNixRTz8LrZIE74WE
	 0U4Yo7S4xUF9A==
Date: Mon, 15 Jun 2026 08:01:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Message-ID: <20260615-new-peridot-vicugna-cbcb61@quoll>
References: <20260614145113.84243-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260614145113.84243-1-daniel@quora.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:stephan.gerhold@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64872-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,quora.org:email,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1A25683A1E

On Sun, Jun 14, 2026 at 10:51:11PM +0800, Daniel J Blueman wrote:
> In addition to the firmware-loaded codec carveout, some Iris platforms
> need to declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from IOVA ranges that earlier
> firmware stages have already mapped through the SMMU.
> 
> Permit a second memory-region phandle for this purpose, and describe
> the meaning of each entry so the ordering is unambiguous.
> 
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


