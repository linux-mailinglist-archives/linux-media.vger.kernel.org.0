Return-Path: <linux-media+bounces-51789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIHBJ+aYe2nOGAIAu9opvQ
	(envelope-from <linux-media+bounces-51789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 18:29:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28871B2E70
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 18:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC1CD304A64B
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 17:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D8634BA42;
	Thu, 29 Jan 2026 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rw6tQ/1j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97F82C21F6;
	Thu, 29 Jan 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707453; cv=none; b=pI1c3+ENjpRU9krG7XmU76sURnlJGVVwg1NWhZfunlljKX9x0TjrPQWRNM42KPLKqqhpSckmjTuLOKOURaXcMEwGHlYWgSxu9MM5bA0UVM6libOwqxOyEM7QnaUk09APFkNaoOBnkrBiQgi/hrMTYbGZ+sC1VZv/Pbuk/XqRcZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707453; c=relaxed/simple;
	bh=GwpyZ1XhwGvTuaJx2R/noCmHcGV2NRys+b4dwGgPMRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfNL28a5EVE16ljs54w3kPaosuGYlJA53S8Ow0jR5XPqYEqBrldhUmTecimJdhf6hXEZqLkuAMf89NIyIPqPmvPLCTuyYIJkTeiesImctUWPZS+sx1/YjVnn1l/3kWikc1BVOxN9xuxUmYFZFsSMWTvWQwfK/iPJ3QzPp5AuWhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rw6tQ/1j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12733C4CEF7;
	Thu, 29 Jan 2026 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769707453;
	bh=GwpyZ1XhwGvTuaJx2R/noCmHcGV2NRys+b4dwGgPMRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rw6tQ/1jebbzeNxeUd/uwC8v3wG9O5tVLwF2euGaO17C7SgFAnEj0LQIUhH7DjSwM
	 7Dm2ej3g9X3WBu8/fBJkC/jCb6p1/XbKyqe5M6nMCYZff2P2o6xOLy6+z/UxW0cZ9w
	 +WzjA8j3cjKOeAspg8ScQzaVSE7OZO/HeKgwADO8fBDm1LW6m4j7IE9azNZSNRIRtb
	 F1xZUup+O5edsuyRuAF5V8hRA82pe4SWffHrvfCJa7jfxRyXHQRYcGQ6Sb59MP0JDk
	 gUtjzxm4+UjaAHdZcKjgHj40Rj294kcwhOeToQDL5QIadAAfMBR6+yxE6gkjCM3HWg
	 djTkIYBYJpZdQ==
Date: Thu, 29 Jan 2026 11:24:12 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Message-ID: <20260129172412.GA1303752-robh@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51789-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 28871B2E70
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 05:32:58PM +0200, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> SC8280XP having just 2.
> 
> Document Iris2 cores found on these SoCs.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped dts video-encoder/video-decoder ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> [db: dropped status, dropped extra LLCC interconnect]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> new file mode 100644
> index 000000000000..d78bdc08d830
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8350 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +
> +description: |

Don't need '|'

> +  The Venus Iris2 IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc8280xp-venus
> +      - qcom,sm8350-venus
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: core
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mx
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  operating-points-v2: true

blank line

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +  opp-table:
> +    type: object

