Return-Path: <linux-media+bounces-57919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPMiGewWzmmnkgYAu9opvQ
	(envelope-from <linux-media+bounces-57919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:12:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EE384F5A
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CCC63068F6B
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFBE38642A;
	Thu,  2 Apr 2026 07:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqHXca5H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9730735DA6C;
	Thu,  2 Apr 2026 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113539; cv=none; b=EhaxhsO7KioXzH0QU0C6lRWvKAk0kVE5adkeunbGscObxHp1ST7j/9pAofdbCwH5bLoFvWkoFIG2HETzL0KjX3zZqOm5BpFDag3OGfhZ8gv/2h8vP/dLjgaiCaj8HccCH+wrsLBaXhILxKbwm6XBpA5Ml6lduOniCXKfKTv39gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113539; c=relaxed/simple;
	bh=zbQVM/QaAzMLFrY3ff0BecsAVOw+9rIm5FYIh2z46Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/J/n5cdmseAjVXALj1DRLZFzrquVhhr0Wpn2iMwwsH0R+y3jZiqVxy/L86zuIFQ5Q7Uy3adZ699DhlsB9Xhb8Lt1gNup3ttPQFM7csTXrkooosANXjQfflzwTJK7PHVgvkccpMEXlpz9DcmAgJjZv7NW9G2NX1WbZ69I19jp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqHXca5H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E021C19423;
	Thu,  2 Apr 2026 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775113539;
	bh=zbQVM/QaAzMLFrY3ff0BecsAVOw+9rIm5FYIh2z46Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqHXca5HQqls5UJ82ogCUHifL8aqohENtWiLsZiLI/EiYSDp/UA8IyVxTsLv2O/bU
	 bXHKwnEewRWkc+l2bKgIugAY3ZdxXGoNRjHO3qyFX5yEOclRgzwmu5ULcJ27kwoMFD
	 Fnq+Li5jBsMYqtFl74Sk+uTOJafaSkUSYQ0eN4wNp+n1Cm2GCz7+J03XuxrVHRmcYV
	 hL/JdBNiaLyP3WkvrXpd0mluiVg7dNeETVhMmh6rQsCd2a1Qif7TZ/Uj5QHpBZJpWv
	 qXu/Kxkm3o5HHrkRo319hKx8rdME/YDjbVzRCm6+cImTvDniUFxrr2+SjZNJ3YEmO7
	 +Wx5qPYTU/grw==
Date: Thu, 2 Apr 2026 09:05:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: Add
 X1P42100 compatible
Message-ID: <20260402-visionary-spirited-shrimp-6caba4@quoll>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-1-ca784552a3e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-enable_iris_on_purwa-v4-1-ca784552a3e9@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57919-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C4EE384F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:24:38PM +0800, Wangao Wang wrote:
> Document the new compatible string "qcom,x1p42100-iris".
> 
> The x1p42100 SoC integrates the same IRIS video hardware block as SM8550,
> but represents a distinct hardware instance.

Full stop, as I asked last time.

> and therefore uses its own
> compatible string.

Drop, redundant. X1P42100 is not the same soc as SM8550, thus you cannot
have the same compatible. This is explicitly written in bindings. Each
different device needs own compatible string.

Adding obvious explanation from documentation to commit msg is
redundant.

Explain why devices are not compatible.

> 
> The x1p42100 variant includes an additional Bitstream Engine (BSE) clock
> that is not present on SM8550.

Presence of additional clock does not indicate that devices are
compatible. Look at other qcom bindings - many are compatible even
though they have different clocks.

So say that you need to do something with that clock differently.

> This clock is described explicitly in the
> binding.

Last sentence - again, redundant. Write concise but informative
messages.

Best regards,
Krzysztof


