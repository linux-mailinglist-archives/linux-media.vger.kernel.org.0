Return-Path: <linux-media+bounces-51729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH0BNbDueWm41AEAu9opvQ
	(envelope-from <linux-media+bounces-51729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:10:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F200FA0183
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5947300683D
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 11:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF78933BBDF;
	Wed, 28 Jan 2026 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E96TTmuU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA229C321;
	Wed, 28 Jan 2026 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598634; cv=none; b=fxjzkdLq7578626XxEZroyGRZNQqN/4JreG75sOIruOeZG0s4kLmbsc+jJAPnw6og+KHgoVcNp5fgMdtxGMXG2wPKsds1BdyOLi0eiKzsvPDU9D43mBmjoDHWH+d3DhKbHS/WsGNIRqSGDydV2paVmYfK9+Wha+ZW1A0stz94ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598634; c=relaxed/simple;
	bh=j3M0FPMqph7/BNU23Lx+x4vu0DnjXqyNO4kxrYZ/Eps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psnHyiCXNF5FXnRTtcYgq6M8Mpzn3NKE47UgnNvLvDNizgPnV6diNsZTvGlZo0inEFp8AZFu4/6gu3K2vEe6LkNdrbU9oRtKQH+BZHjALw2NIjM30YuhlEFjskooreAgdXDQS31dY3qU1xUOEgQn+Fv2KpYEHevO1CkboJfYgI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E96TTmuU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE71C4CEF1;
	Wed, 28 Jan 2026 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598634;
	bh=j3M0FPMqph7/BNU23Lx+x4vu0DnjXqyNO4kxrYZ/Eps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E96TTmuULe9PIdwibia0L5j/kfgAgTd7qQ5nEEljBpASDk4LHxz4JAhXSnf4G28zb
	 V7ue5d7E7JT9ZG17Olg27SC4/Zv4/Ms1DJFPsIyHIurdVYGpaHz7tdLRVqzhkmd1mb
	 96UBu5m5J4vSIpdyI+9l+JeC1k2lOZmHZadFR3AalOxHpX1gUe7NrMXLQSJ/DR/pRq
	 NPeR9G18rX4lMXTxMULPS9MMang2Ok1fBT2pYYqzNbxdXlFLasv/Y0kThQTCeRFcB8
	 pJUKCcsl2Hy+8KJcznfcJqfP9b4zhr0YCyDE/BW7eL+/2bKm/iWKBvuwIxp1oyNh6V
	 NR0zZthQPJsJA==
Date: Wed, 28 Jan 2026 12:10:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Message-ID: <20260128-gifted-ferret-of-pleasure-ebde67@quoll>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51729-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F200FA0183
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 02:23:02PM +0200, Dmitry Baryshkov wrote:
> As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
> uses the video-firmware subnode, move its definition from the common
> schema to the SC7180-specific one.
> 
> These properties do not accurately describe the hardware.  Future
> platforms that are going to support non-TZ setup will use different
> semantics and different DT ABI (using the iommu-map property).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
>  .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
>  2 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


