Return-Path: <linux-media+bounces-55849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKDdJ22xt2m9UQEAu9opvQ
	(envelope-from <linux-media+bounces-55849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:29:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55F2959CB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 106A8301E233
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8400634F48A;
	Mon, 16 Mar 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2fXAAEj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACB34750D;
	Mon, 16 Mar 2026 07:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646172; cv=none; b=fkCWO7D+NweZGH20QL5LQ9yeM1iv8w6BCp3mdvS/sLkcAntuWPVSDi1G+ke/5wIGcivFnKZX2qEGYQKVfQV7ec8GBCbslTHbEybCGm6cae0rF1AQDKXwiq+dTmlTqvyqMf5PEiqgL0VWZcxWnpDZgIuEN7jgmMs8Jvo9qyGcYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646172; c=relaxed/simple;
	bh=hBLYS00I4uBZkR08kxezWOH3/0u7seK+o8BwunEZzpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOulIUNUmMRTBnu6oGvmudHQTbnWPzhn88PGXa5a+gtQ9x+AS+WR0QxDmTqBvS+8bm0/ApV2OVTYVHyP2hqVEfKfe+VNifxbRFlIIEib42cwmxXhMEWkr1aS0P/apSNrtn1uGKk2oKS9LhhlCDnD1ThoAdp6y08XRvHf/OaKfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2fXAAEj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B72C19421;
	Mon, 16 Mar 2026 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773646171;
	bh=hBLYS00I4uBZkR08kxezWOH3/0u7seK+o8BwunEZzpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2fXAAEjgj7ieI9kcQIYjroPDrN4eAxH1IJaxpe0pUqRYR1Z+KhSwXEUYmkubzRDC
	 mZY4f+xi7EizbCWgBsAoSS3spm6QmwSXmUpMBN2gN13ukPhuk3X48JGwxXKmqGhTQT
	 1LSG6PwZqAw3N0xsFMOy4t/KuRzWo5QvRgZ/0Qfsmhhp51rHnAgRRu6I6Vtpt2ESaO
	 HoXNN+/J8DXUwhQar8uhpg4wC44R6T+j6kuZKogBuxYXJKM0ncLJGWdg2ISq29UZrH
	 wP61VeKQ/ivGwWTLn87kF1M7xW11R/VlMUS4eLzVm6FrknFjnRxpqt8wmWXCyp2lll
	 A6y6xfPf5R49Q==
Date: Mon, 16 Mar 2026 08:29:28 +0100
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
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
Message-ID: <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55849-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,acb7000:email]
X-Rspamd-Queue-Id: 1C55F2959CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:02:01AM +0000, Bryan O'Donoghue wrote:
> Add "simple-mfd" as a second compatible string to allow child nodes
> within the CAMSS block to probe as individual platform devices.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..b5654ef71bd89 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -14,7 +14,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,x1e80100-camss
> +    oneOf:
> +      - const: qcom,x1e80100-camss
> +      - items:
> +          - const: qcom,x1e80100-camss
> +          - const: simple-mfd
>  
>    reg:
>      maxItems: 17
> @@ -191,7 +195,7 @@ examples:
>          #size-cells = <2>;
>  
>          camss: isp@acb7000 {
> -            compatible = "qcom,x1e80100-camss";
> +            compatible = "qcom,x1e80100-camss", "simple-mfd";

You do not have any children here. And if you checked the DTS, you
would see this does not work.

Please post complete example and bindings.

I suspect that after posting complete picture we will see this is not a
simple-mfd device (child depends on parent).

Best regards,
Krzysztof


