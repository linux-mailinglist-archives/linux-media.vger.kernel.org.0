Return-Path: <linux-media+bounces-55836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDNYMRNot2mQQwEAu9opvQ
	(envelope-from <linux-media+bounces-55836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:16:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761A293DE4
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1DCC303204E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748AB30AD0C;
	Mon, 16 Mar 2026 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/IdOsT6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373F175A8E
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627162; cv=none; b=eNHoW7y0rm5/iVDE8n9054ANHC1iubAaXptnRIyVq9nbMP0+aS5pufsdu9xkNBuVXF4njAo/tq3ZJpyrrHyLHScf23ZKcZVs9edm7tVn+1beEVOt3dMJkRi0nGEhIyH2bqn4ZxFbWq7yi+HGeyjumvx+HoBK2j0yFV4LcLejHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627162; c=relaxed/simple;
	bh=BQcrnhOD+3qE8FiRPtfDJnFsWEWT/8bXthBG10EF93k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWAv3taCtWwTNywem5VrZbQ95V2PkkRLnKEux3KIFjQusXeT1fqb+UP1ZxBjHZpf4+cLudT2jkyy2n2mK6+Pr2bmVX+ZkLFprmUaUa5Bp9X/uCJzSPxkZw75E75dTbtG5lRy1JEeMMdmj6ldo4kT2ho6Hvzmg3m+fD0QbjhLqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/IdOsT6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a13591f163so589274e87.3
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773627159; x=1774231959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHkOl/Uu1nTEL4sNDJ/IClFdBsre4C93u65zu7fcy90=;
        b=m/IdOsT66HFGOx66Jg92b8WTr8EmskiFU0qpsgo7Xh6KSyKB96VfTjkBAolyAwRFr/
         TgRX7e6ChN+zZUi32vcOk3QQ1Py6Z8nMbiZKBZr7pDpNWUNr3CtNohde0p/sMnCxlUf1
         jEErf9c0yfNvUwVlK4N6Qwt89TqHaYF6VuF+SdbcAMAmrg4Eb1xrIG9c4vGuIMVvYa9N
         SdyQu+kldap3i5D+wIuwfwtQGOa1EakmBVS5RIZkvTxCTUEBiBCj6gH0LMp23SOcaeXm
         Gjq3wwFuLSJRV2A42U2Ke1XaMKQhm0cH2T6I9h+TyE3KSpAJCcYOwDbnJKVtOJf3CwVT
         klZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773627159; x=1774231959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHkOl/Uu1nTEL4sNDJ/IClFdBsre4C93u65zu7fcy90=;
        b=jo1shvXfCUAzwCxfj8fyJVy7kXLhJY3Pq6o6/nGiHIdsRZfQYP04Y/06ww25PIF8LF
         JUYMcqqc2bMVZ6ohkhFHPrxVCY1C/PAQ2axLKcZfAt5IruWrd+HqJ7m/Nirf8RUCV3Gj
         xKT0SdyN4ASsLEEnL9Wii7QoIKHmXIoq+Aq4EpGjCEiO36KY5jsb+QODZ8IE9t8FZoHQ
         qFbbDwsq8iESc4dXnLEQ5Tkp9frp6ehS7wZFnZKqy5z9YA87VqH5rQVb1OCEFCQ+HLpJ
         Z+JqCx94LJxwY8WTGgqWgxYsccrDVxoZU/JEbnJjFuD9rfUZi1EqJfY5VTPohWW0xOLW
         MS+A==
X-Forwarded-Encrypted: i=1; AJvYcCVzwOvMMNbC3tnXMcur3yVN+WWejI/75PW+GFn0deN9CI0WlMC784AFyBEamM7LaMqoTiDiNjyV4iyZZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyHe2sNJNV3ISzMaD5hZs021DpP5N2y1Sa9okuaDtouxQMp70
	32g9gT95Y/KR6UXpCdSi5q00dboT6jUVK754XIk04gIpxyfMUDsOw/itULn0ta/s9WY=
X-Gm-Gg: ATEYQzygSl/fdNRaF3y3hBd7Opb+OMlJhYgqJhuA+vMod0jKQSpkeQ/PRVexWkeYeCH
	Qgr46eUpzhiJdb+zwb+ue/iwt+Ax5XxoohPWrFzKj8vmY362tprrostH77nFmQyPzSU70pdyYG/
	qFtEjfNOOMTGn0AiRiBmJD5aXf0E8w0WEhAVAiIBXtITrTgIsn+/WLfijUm652Caxxx2xoBgHjF
	WcNiat5onNpdDxDg2i5vz6yMgj6MNUVITpG4lNKdP+apAPS6zZLD4naZtlawSkqZPRt48Gds9C2
	u8C8I2VAC9MqhZYNTOxnvhIfaYF52W4+YFr2u9/WcmE5zCjgy48Ttbp0vYbWjc7tiUJHFc9LMpY
	0H8CD9MF6cJxBmRDI+4fHtfEO6t4o0tlBjfNBc3nULeKnQVr7dNVWP0G40GE9Fqh9DEZCwYur0P
	z5W0okTY/H5mtCbhTdvDPnvSB3V8Lx381nFkpMvLET+8hnECGVuShTaG3EXaJzIZgPRq5TJnpYN
	EVP3Q==
X-Received: by 2002:a05:6512:61d2:10b0:5a1:1329:5ae5 with SMTP id 2adb3069b0e04-5a16271283dmr1318112e87.1.1773627159134;
        Sun, 15 Mar 2026 19:12:39 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636982fsm3108394e87.78.2026.03.15.19.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 19:12:37 -0700 (PDT)
Message-ID: <cca53190-ec16-40ee-ab4d-7bfbc1f082e8@linaro.org>
Date: Mon, 16 Mar 2026 04:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55836-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acb7000:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6761A293DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 03:02, Bryan O'Donoghue wrote:
> Add "simple-mfd" as a second compatible string to allow child nodes
> within the CAMSS block to probe as individual platform devices.

Why are there any child nodes representing platform devices?

There is no necessity of it, please use a layout similar to CAMSS CCI
modelling.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..b5654ef71bd89 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -14,7 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-camss
> +    oneOf:
> +      - const: qcom,x1e80100-camss
> +      - items:
> +          - const: qcom,x1e80100-camss
> +          - const: simple-mfd
>   
>     reg:
>       maxItems: 17
> @@ -191,7 +195,7 @@ examples:
>           #size-cells = <2>;
>   
>           camss: isp@acb7000 {
> -            compatible = "qcom,x1e80100-camss";
> +            compatible = "qcom,x1e80100-camss", "simple-mfd";
>   
>               reg = <0 0x0acb7000 0 0x2000>,
>                     <0 0x0acb9000 0 0x2000>,
> 

-- 
Best wishes,
Vladimir

