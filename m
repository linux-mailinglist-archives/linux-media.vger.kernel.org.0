Return-Path: <linux-media+bounces-61601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFJlO3anBWrtZQIAu9opvQ
	(envelope-from <linux-media+bounces-61601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:44:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537F540897
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18F5930D3AFA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968FF38A722;
	Thu, 14 May 2026 10:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0Pmfz0q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006C7388361;
	Thu, 14 May 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755191; cv=none; b=fsgEEnqn8cOvvXMwsFhU7km8/ww/7Hbppfn87qEd1aNM9S9ZIHmWR8nL+3XKTHY59Vl9eyuQcj6kJxODAQRCLaTxboFaNiac8/VsYi0+Wg9Tgtbw1SO/RisUxp+EgrUuSYi9DddKnb2KwwXrjAe7sCp38sLiOTPODBfYKmEvkds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755191; c=relaxed/simple;
	bh=T7lwIY244ls241JRjU5PL7S/45pGTOiqKnD5Hc7PwHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWJlaa9DQ4FuNuSpvJ6QKZiXk/HcxRKjXd4TW4bwbewKFxZElwExjC/hT9FNpQkNqM1IARQVNvJBCGYkuQwSJrVeNazbs7R3ndoNJ1Z5+IOTunPn3BQkWiQObUlCQgH2sgPhjI/JQJo+jR61KjQfKAZ1CnSpEHTsBeM0LW+JehI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0Pmfz0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2447AC2BCB3;
	Thu, 14 May 2026 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755190;
	bh=T7lwIY244ls241JRjU5PL7S/45pGTOiqKnD5Hc7PwHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0Pmfz0q0dAEXV9TdN7OHb6FPNtcTt+cmkDlyL027dwNS/ybs1+3IOEAYx+7xRCB8
	 xnrnBgHV4H5VGOOdEKAx5t0gZQkJYU+6IkvpXE4OKnmT//zzC960mncyBXbTbLbVkd
	 Yby9YDHJ/DDxYdnFLsG0bDNyCAmLx3Sl3KebRaaNotIeiTftGBsrDwo3GyhIBG70mt
	 rMHOOUJcQ1eNoD5KYdeJpYDTSQ9yWqQ/Ktbg+N24fXFx04N+FQnqxMg9Kf5YDOxWPN
	 bRjGB4ylVG32lsrUgyefKkyS2w4d7bMQkiUdrExYcKn/mfODv4SvqTLz8igmJtYAap
	 72ZPNyNby1Ydg==
Date: Thu, 14 May 2026 12:39:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] media: dt-bindings: Add CAMSS device for SM8750
Message-ID: <20260514-eminent-teal-gorilla-4ac1aa@quoll>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
 <20260508-add-support-for-camss-on-sm8750-v3-1-fc6861a65c67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-1-fc6861a65c67@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6537F540897
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-61601-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 02:51:03AM -0700, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.
> 
> The SM8750 platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8750-camss.yaml          | 433 +++++++++++++++++++++
>  1 file changed, 433 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


