Return-Path: <linux-media+bounces-53663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACr4FNpHoWkirwQAu9opvQ
	(envelope-from <linux-media+bounces-53663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:29:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A81B3E71
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3551F30F9CDB
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ED536BCD7;
	Fri, 27 Feb 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+Mseb1b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62771163;
	Fri, 27 Feb 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177234; cv=none; b=hvRSyF+NemZPcfWJNmv16UOCmMsiYzz1WragjN9CTIjcgzMjdTwJuxVP2lmHvWsnif6XZg1MpLTQiuXGndd9jSlfAM2wJAcpLR4jodikgoe3y9BeuxUOlRuL3zMANWGfDPY4INjD7ZHod+3gwggM1pHBH89OQ6pcC8UF4VKlGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177234; c=relaxed/simple;
	bh=i7UkDkxnWjX3dknY5FQXUVwokF/oAjS8YbaaeDCzCE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iN15dkP7cRKCeqKX378XJmR4QVIHPv2abwvPAyei4V00jQeTw3VkR8Iu0GJ32gJDip3Q3TZRET1CwYt5IhubobX+FCyeY16aFM1F/Mrwx/ihND9BKqJgzX+lm+t4NhEgn2LyNhSnDL9LQoDRO4o2G3w8d6osrLqZktgvJSgh7Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+Mseb1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7143CC116C6;
	Fri, 27 Feb 2026 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772177234;
	bh=i7UkDkxnWjX3dknY5FQXUVwokF/oAjS8YbaaeDCzCE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+Mseb1b4IHGe9c3YH/mhLpSkbwklyVH+kUO9hhZF4Gh36Z518pdkpz3r0otfA+4Y
	 Sq4GYUAJsySUjUejqHuZBBywn4G6adlQ9ntxvC4SX6+tJ50SvbWD4GyDiNVfkF+7Bm
	 Q14462QMHfUqM3T1T3HrxZq9fOm0aFgCLkRkkZLD8GwC/GyznQtpOGSMVkY9H6/1Lf
	 zg0FscdUSHHnAadQZ1soeXMYLg4Jk63F3TX5qyD5QAPSiA9n1LvS1wcRd4VGT38g+K
	 jnfgI8FtP5ef11+ahjpAoCG1xnoSjWrrZ7wQkVsHlTBgii5PxlBsWbFy2TYZBGwIMF
	 jwxmJGnnsC4sw==
Date: Fri, 27 Feb 2026 08:27:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 3/7] dt-bindings: media: qcom,x1e80100-camss: Add
 iommus minItems: 5
Message-ID: <20260227-electric-singing-tanuki-fd290f@quoll>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-53663-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF3A81B3E71
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:28:44PM +0000, Bryan O'Donoghue wrote:
> Specify a minimum number of iommus entries. Currently the schema

Why? Your commit msg must explain that.

> requires exactly eight. Add minItems to allow fewer entries while
> retaining the existing maximum.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 8dbaab16b11d4..f406cf6f8f9c1 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -104,6 +104,7 @@ properties:
>        - const: sf_icp_mnoc
>  
>    iommus:
> +    minItems: 5
>      maxItems: 8

Same review given to two other such tries from Qualcomm - you need to
list the items. You know differentiate them, so the items in the list
have strict order and meaning.

Best regards,
Krzysztof


