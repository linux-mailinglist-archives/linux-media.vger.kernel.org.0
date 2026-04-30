Return-Path: <linux-media+bounces-60046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN7ROCAH82lBwwEAu9opvQ
	(envelope-from <linux-media+bounces-60046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 09:39:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4149EBD2
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 09:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B68F2300C3BD
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 07:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB7E3DEAC0;
	Thu, 30 Apr 2026 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUH+csbX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CC3E5ED7;
	Thu, 30 Apr 2026 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534716; cv=none; b=QYZcIeDCBsnm+SDC0I82rp2iJbTPuzrDjm4M5+a/YjkH829R+y+d8hTkqUWAZn7CmlZJ10D2AmMwlOg0xRoU2e0R4AeATcDdZwUF+xnluXL/6aWiwqQTkUwSIEfRdu+mqX95KWIzXs+evh2LJGJLufDigOJNr7U26AIb9oMpa1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534716; c=relaxed/simple;
	bh=THhtyy3vdoiWMHAFw13ejbZ5kqrHPckFCfrQ6cYMglU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejn5lWvMjF9Zik+qtELHf06CWS/MtRSDd6utp7pIL1jz1C2Z2N9tXuNNcR7E+SaAw7Pmu+c7Ca4aNs/WU8/ZYnZx1/lrCF3xKE38v9CYV3A4rw7eLWMKKmFklwmZzJECxOTdAJlWwTVGJ6T73oVX3NHMNj3fXxSN4h1woGEe7l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUH+csbX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE93C2BCB3;
	Thu, 30 Apr 2026 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777534714;
	bh=THhtyy3vdoiWMHAFw13ejbZ5kqrHPckFCfrQ6cYMglU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUH+csbXFWDyeEqB6QEYalbyahS9UA/5jETIJ/D2gvCC0GkIxpacHD83btJPCrM2l
	 GgHALGSWrJGWVTqzZYjc5w4kdy2ryH8BrwEelsESRUbBsKQf23aBq8odOjckz86rqu
	 SCgqgnRAOStW15MRjPhfWInaAUKZf0gss/dZbp0phpKYjVeaGpND8PsujNYDo3QAxV
	 jnU+3fmLy2EpI+xqx2JfkAOark/IzKvRWHcOs5TKuKC3/SdiHoF24fcfyPAeoXa5lf
	 6zQajCUtbq5gGCQWbqVNKJemcGQHhzkBifbAlcyJVDKzamPOS2ufobXlYkCokzuo7e
	 6XTLo11HRkasA==
Date: Thu, 30 Apr 2026 09:38:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: media: qcom,sm8550-iris: Add
 X1P42100 compatible
Message-ID: <20260430-small-fine-spoonbill-e8b9ca@quoll>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
 <20260429-enable_iris_on_purwa-v5-1-438fa96da248@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429-enable_iris_on_purwa-v5-1-438fa96da248@oss.qualcomm.com>
X-Rspamd-Queue-Id: 21F4149EBD2
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-60046-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 03:43:52PM +0800, Wangao Wang wrote:
> Document the new compatible string "qcom,x1p42100-iris".
> 
> Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
> via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
> that requires explicit enable/disable and frequency configuration.
> The SM8550 driver has no knowledge of this clock and therefore cannot
> operate x1p42100 hardware correctly.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


