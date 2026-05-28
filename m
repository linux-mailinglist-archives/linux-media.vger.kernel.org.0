Return-Path: <linux-media+bounces-62981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEKVD1S9GGoumwgAu9opvQ
	(envelope-from <linux-media+bounces-62981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:10:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E292D5FACC6
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C631D303D55B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 22:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02FE368D5A;
	Thu, 28 May 2026 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3eNxy62"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D52430F92E;
	Thu, 28 May 2026 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006214; cv=none; b=a8Garq3PzYFMVdy5I23beQv1NVY6Z2pMcQZztWOjtw7ymOR11kPw8kBYRdnARAn/3vHn/yH8sGtq9DTDbijRnkqLRhamkWEFHvdZSvSx3SkRYjL4gAl7F5phzsQDmcm9bxVV8y8oeYbG2mehs1CvgKfZQD+DywG7Cqv3SqPmLOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006214; c=relaxed/simple;
	bh=J5scpgrWEV8v3ZkZukcBHbuLGOM5+s7yXvHrVZukmLU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=m76qhyJR+5Obj9nHjFDeFCj5WVFtG0uSaqboKtQ6Q4E0CFSvvnYsyghSmTy4Ich6r2n0mhEZl3BdRNHcZkudYqRklm4UhQ3++n7WWXRSEpt0TPyzOfICbJCF9bNQ4hdfxxcTsbeyRz/PdNy/s9rANSuretZvsZFG2in+qN5TmU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3eNxy62; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6522F1F000E9;
	Thu, 28 May 2026 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006212;
	bh=05Fjs2DL+9vxiV5y/LCBbl1ALfZ8hCsRr0lZ9oL+5W4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=X3eNxy622KawA+UMRK25fKZXbeYjRpt2wycO5udJnsrB+JQQ+84/D40OFZ4JSRd6N
	 XdCxfdEjF4ri5uwYdyq1qYg86lFFFvnYmI1PpuJ+sEKrNFRHEqa5cy7oZINQRBizes
	 vwncmphA6KLc8WPE6zn6OyI+nP1YPOsJ2/+cUMxh4LZdjutuLDJmYTsmyA80G8IS7w
	 PSoUJPChrcFruCakIvA5jc3NhlPoGb62OQ6U29gZhBWPuyRnu7ePnavVi9ahmIQ4Kc
	 UR04QTUN7hU4U3LjnVrxamfXGIiSFxWK+lic16PXndEHiHBmmw2rIYWLDbMDf37jax
	 ya0ovTtFw8FlQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:10:05 +0100
Message-Id: <178000620521.4557.16545657820275121091.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=bod@kernel.org;
 h=from:subject:message-id; bh=J5scpgrWEV8v3ZkZukcBHbuLGOM5+s7yXvHrVZukmLU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGL0+7oHZF3maEgTkIpDvTVT7jL4hCCk8OPpdp
 NxPVN+4COaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi9PgAKCRAicTuzoY3I
 Ok1+D/40P4KYWUOoSIL6eJT58LVSpLsDoH1gHcxsqYWXaSQK9wXhZA9iyq8M7NtY859aBaQvtYr
 fP/amMA7/K9wXho6R9Gz+hrdvANoUOokQWMsgY6TfvZ3tvgjSH0mAqtwptG9b4WvS4KrIIeW8XW
 k/+JLibvrJi1jDIM1YxTCbcUHNRKel7xRMTurZAMnndH5vDAwG7BK2UorZoe5wRqLHNblXC/drY
 qYA+OC0q+xz6qvSq3H6wnWL85i0sCqj1ocvaSiL4KOUpEj028bTs6JD0kzvfrkMeJ8xElspyGB1
 EsFUvN1SUfIloGiyEDWQNnHDB4PQ0FV8PAHaeRfvQVSw7u1m33xVlxLj0na47TFUIS7qhmr/EXu
 y6bxlEqbhiRSwZARRFohLUVtkBktAlP5UScmBDKSSlnxXG7lL+GoCWScbItldMDJRVXexzGCUbB
 IhwxfUHaSMK5P6pF1hBzHDYfEBxaQbV8dt0kbWRNY4pVhF35mbwF8YS0Q6+0E0ydM/fD6Ltue4C
 2PP66P6ttvMQfUrmmtmPKphvX3mGSnS+H8y+f0ay3UbzX3kDku+Q5SqYXkaTaQkfKBN1AihHchN
 0SuUnByg3bRL0VSBr2Og1BC9wJc4E7ahU0DOL+UGhjTNOQ8YeIIitxGNuJ+8ehJ10RcPYX8dITT
 a1PYg6eGbVfSDww==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62981-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: E292D5FACC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -35,6 +35,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,shikra-cci
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> @@ -137,6 +138,7 @@ allOf:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
> +              - qcom,shikra-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
> 
> -- 
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


