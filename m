Return-Path: <linux-media+bounces-56495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAqLJJ0PvWlf6QIAu9opvQ
	(envelope-from <linux-media+bounces-56495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:13:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 307CC2D7D12
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 929953091C9E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E4637F733;
	Fri, 20 Mar 2026 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owSuaNZb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65D345CAF;
	Fri, 20 Mar 2026 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997840; cv=none; b=K5NhgPbGuK85yVmrlvB1rNQRXxFNqQ5yK3kKvELTSac/lWl7bVZF0m3PUqoVCC5d+sehtcq0HMqkvPPyQJ80494C0pV4jQpcr5OL72nwpBfBiSWWmZGLu5NQQ8jOwhfGXCx5EJFnBBW4asN2YzAcgMJyJMv55gndcnBV4/zT1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997840; c=relaxed/simple;
	bh=PNOisM2kgw/GdUFX85mllyLkoEQu+1U1Y0mPVUR9LaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2f1YkgRgyhtEQir+bOdnShTjYB7r8M2T5cEV3b8P42cfuY8whZ8d1jc8rdUXMpAZ8mZETG+RKUV8a9pSY0pl3kcJ2rhC830huu0ncCgailOWMY23jC6I62TOEeQhYZ7V6fBakJPitm07vhwVXOHZ/0o7OFB0gAj65nvLnotNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owSuaNZb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE86C2BC9E;
	Fri, 20 Mar 2026 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997840;
	bh=PNOisM2kgw/GdUFX85mllyLkoEQu+1U1Y0mPVUR9LaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owSuaNZbkxX3OpA0mUNk6Ac8jQumQtE4MEHFVJAZoryw3gQMB5oDuBM0nzSOrIv0N
	 W60EaG+2UfHiqT9ZHRu+rpGtwlPh8NA9cwb8vz1gGQvs7XoKJPBtAU9ZZcQz8b5FWl
	 HQXQhblqNmXz3d8VUmnugMUk15c+salGvt9kB8qJdoI6Fq9dLU2SjnSC3jUfM8iien
	 yEJbwps7wXns7B2ZROMCThEbZ9mewXizpf2bwVkiAqJhN60Jj3Xia/WDOlUhA3/aNL
	 B3wqKNkmamcT4089jQpY7ihM/orNfKaNSSJCsk8Mt6PbfRR0hiN0+w9Ifj3jbU2ETx
	 tSf0GuB3sOeew==
Date: Fri, 20 Mar 2026 10:10:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: Add
 X1P42100 compatible
Message-ID: <20260320-honored-kangaroo-of-merriment-fd03c4@quoll>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
 <20260319-enable_iris_on_purwa-v3-1-bf8f3e9a8c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260319-enable_iris_on_purwa-v3-1-bf8f3e9a8c9c@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56495-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 307CC2D7D12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:23:53PM +0800, Wangao Wang wrote:
> Document the new compatible string "qcom,x1p42100-iris".
> 
> The hardware shares the same IP block and binding as SM8550, but is
> described by a separate compatible string due to differences in the
> clock topology.

It would be described by a separate compatible even if clock topology
was identical, so false implication. Drop the incorrect part and just
describe the hardware.

> 
> In particular, x1p42100 adds an additional clock for the Bitstream
> Engine (BSE), which is not present on SM8550. This clock requires
> explicit enable/disable handling and frequency configuration, so it
> cannot fall back to sm8550.

So same IP block implies devices are compatible, but you say they are
not. How is the BSE clock handled in SM8550 in such case?


Best regards,
Krzysztof


