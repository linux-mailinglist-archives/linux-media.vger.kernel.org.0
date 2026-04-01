Return-Path: <linux-media+bounces-57857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAX6Npz5zGnRYgYAu9opvQ
	(envelope-from <linux-media+bounces-57857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:55:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51286378DB8
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2501E30C5914
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54E33F23AA;
	Wed,  1 Apr 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYrJthPS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2F33F8D9;
	Wed,  1 Apr 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040490; cv=none; b=Ll3xg/Ili3zDPMIWsVzXNamYS7BBaxOzXaZct7v1sC6KnGEjYwqKL6x9fVPDOWNI2b72KljaeZokYciraEGvb6/dk63BznEBtIo5CrG0GjY1hq6D4k6u/4CZcRpT8ophcmGN7636pjF+iku9eow7ElnJoBB4vU2uxhiCNY0zktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040490; c=relaxed/simple;
	bh=mnHcB8T/h3Z6Qng8OHgNXbYYJ4HYCTXuKbPHiMcAc2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fD4cXgCBxDmwhTLYwbLiRiEVhnvVTY5z3JflmXP/738ScT/01c9RWV9olmxClCqmQGTm9Ou7iqaOU0DiZ6+qmHuo95iNBw7TsM5SPies1XsQfo/0/Gczm3bxCaqPycV8j5+1XVWW0SuIXeP/ixiNhSjbZ1oFnME7TDYekR/jDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYrJthPS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000FBC4CEF7;
	Wed,  1 Apr 2026 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775040489;
	bh=mnHcB8T/h3Z6Qng8OHgNXbYYJ4HYCTXuKbPHiMcAc2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uYrJthPSLPtm9G1gvnbDjbBRIor04n0iTZXJIxLIQA067lKLbev0EdOaSMp4lwndn
	 OPMtKJkhIeWbwN9WbUTTZRPSftjG1iXYd2UeaAQbgTxpGaKMZ1k5s4kV0kUhB05mH1
	 BSARe3ZyAF7qvWDoy/dw8Jah7jHjfpMR5Pbs23LyOVCoACkFryWW1L9IeU36XASUZb
	 j/zoUlk9/s431yGSmp6c7cAH0PqGL0w8/j43HlDuMpgps21WypHxMQ/3d6nU45Sbzk
	 vyhYadP57VMbdwrCUanfrqYh8Wpksh6D8X+HVS+ObjtA72fKRThBOyLzzC2qVC4c+1
	 iw9MJ6R2iDFiw==
Message-ID: <75a209ac-fe39-4cdb-8ec4-8fd7df084961@kernel.org>
Date: Wed, 1 Apr 2026 11:48:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <6OckVU3hd6y26L7_bo-xp_g4Ui-ITPHCA08Pw-mkIzbJJRSl2AhDPdx04GptJrYGvbyGbOYH-dzzTICFD1Rdig==@protonmail.internalid>
 <20260401-enable_iris_on_purwa-v4-1-ca784552a3e9@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260401-enable_iris_on_purwa-v4-1-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57857-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51286378DB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 11:24, Wangao Wang wrote:
> Document the new compatible string "qcom,x1p42100-iris".
> 
> The x1p42100 SoC integrates the same IRIS video hardware block as SM8550,
> but represents a distinct hardware instance and therefore uses its own
> compatible string.
> 
> The x1p42100 variant includes an additional Bitstream Engine (BSE) clock
> that is not present on SM8550. This clock is described explicitly in the
> binding.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -26,6 +26,7 @@ properties:
>             - qcom,qcs8300-iris
>             - qcom,sm8550-iris
>             - qcom,sm8650-iris
> +          - qcom,x1p42100-iris
> 
>     reg:
>       maxItems: 1
> @@ -41,13 +42,16 @@ properties:
>         - const: mmcx
> 
>     clocks:
> -    maxItems: 3
> +    minItems: 3
> +    maxItems: 4
> 
>     clock-names:
> +    minItems: 3
>       items:
>         - const: iface
>         - const: core
>         - const: vcodec0_core
> +      - const: vcodec0_bse
> 
>     firmware-name:
>       maxItems: 1
> @@ -115,6 +119,23 @@ allOf:
>             maxItems: 1
>           reset-names:
>             maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,x1p42100-iris
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> 
>   unevaluatedProperties: false
> 
> 
> --
> 2.43.0
> 

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

