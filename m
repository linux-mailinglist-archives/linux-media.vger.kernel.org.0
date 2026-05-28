Return-Path: <linux-media+bounces-62980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHPVNP69GGoumwgAu9opvQ
	(envelope-from <linux-media+bounces-62980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:13:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD135FAD48
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BDEE30599C4
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 22:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431A8368957;
	Thu, 28 May 2026 22:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJu+KLmh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB919260580;
	Thu, 28 May 2026 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006143; cv=none; b=n6u+oI9RWZo5wjn56jgYkgFCoBvhCzgfWiVaGAvAgLnZ+jT0NRiIHDC98+6or4xUSwtm+oN451iZDSvdYbwHwxk/YD+cLMR1TLZF7S4e1yAcwlHTzLXa7tgXZEAg9wR+NR/6Mq6yLBbUN6Iunjrfq39yWPPC7RYJptkmMn8S9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006143; c=relaxed/simple;
	bh=F1eaxcvD7uA18QinLGLVPQXbeBjKb3fky0zy7KMPuuI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Fl5+/5EtxWQXijgIDO7wPOXKxaSn5U7ttO6ZNIELqYGBVP0bACuanhavXiZIzhXwGxhmKW4EsHrlb/nKCFar5FdVp6cpb6ZJIa98ONw11j24ytUkmkYvYhu0dO++W5qANl24PxIJRF0G8ippLSMu1TMeQbJEb3iJIHjBTRZ4t5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJu+KLmh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2CD1F000E9;
	Thu, 28 May 2026 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006142;
	bh=jJhHDmxLhgZYNTjpWb4+8eqAjhfnb3Kl6RH8rMjYoCE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SJu+KLmh1pUFi2KSYJFnTLU6VVdagMEfRkiULnzSwF/FuOVe7WJNRRb4tthFZiqQp
	 D2/JrPEtkh7Q1NkKV1eWlPS55kUuyrt6EOJKz0idK748tmBmSGW+glLF3SWQQV3vQ6
	 P02762ppSco84Yp4PZZTNOdRdkNy7RllS+AEkJNGCeeEDhnbN3hrlh+Z8QYYtNmDD6
	 a/F75pLP68Jb8NQC6Q3dVC/Ogh06uYaIxEV292fL9Pv9G4JLsNr2M42MvIUB9530jp
	 HAMGCdk1mK7BQFhee5fbt3KY296UM8cD+AE/s6h2N5mbPpT/eZRNGXirtYus83t/JB
	 lcD/uUkDkYA1Q==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS
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
In-Reply-To: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:08:52 +0100
Message-Id: <178000613283.4557.13678881798499721082.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=bod@kernel.org;
 h=from:subject:message-id; bh=F1eaxcvD7uA18QinLGLVPQXbeBjKb3fky0zy7KMPuuI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGLz3nZSWaVsF8eeq73xKqQ7S8O6ilhGBVDAdf
 N0AFLdxdVuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi89wAKCRAicTuzoY3I
 OnilD/0VvN7QiGhRSN9fjcoHbubBHuShxHDOuwn29WlVCrfFCswj6z7u2AuNOBE5E1hYbfN/UtY
 YBrFWpC16ILLjohfxspa0iQhfiDC5qp8bLSzEawXRugok1P8NwHDXfJDW4jTbYSQcc2dHvTiXvI
 W7aOD8ykJchl/9O1R9iHM1eN84o8Ayb6xWmeRDgErCz9tE9caA+njm4jCcejvkWz8rR8+By1aXh
 9iDDHT4r18hkkM9nWYYGtFM67+B36Ket5pr/mRQEq6jGpSZDT9kvlih+1jfELL5+9svIjD55ESm
 cotzRA2E6GaoJr0lpX5tzKAt5DOJSgKHmyonr49W9lfFSo82i3uHEe9IZ8z7ipUBiqa6sRX+oyy
 XUTeAkSp4GuDZ6SMt/Qz2BnCQrEmhwRiPvC96Vfzd54VT90oLvtlgSjXBV91iuE797KOXpsRzmr
 1+/903UQdO7VX0Mx/naL8YIo8p0FjJh3NJMHEm0FdTFrcVeyu8SGYI2Cc9rHatXgSSSZEgpOpJr
 jx4arkCInxKF7R7YGgZNdKlI6QgdE6uksgXCVB9cXDIyTXbjtz5ohuM7nfI+9kJX1DDBa2lSeP6
 TXaa0F2u1slXqkJruvgyfgmOUu+2EuNAwkozHJnqke8A+QKy6fIW1YXi5Ek40/8Atup3JNv6+5A
 JuINw11ToJXDjgg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62980-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6DD135FAD48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> Shikra uses the same CAMSS IP as QCM2290. Extend the existing
> qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
> string.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@oss.qualcomm.com>
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>  
>  description:
>    The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss
> +    enum:
> +      - qcom,qcm2290-camss
> +      - qcom,shikra-camss
>  
>    reg:
>      maxItems: 9
> @@ -76,6 +79,7 @@ properties:
>        - const: sf_mnoc
>  
>    iommus:
> +    minItems: 1
>      maxItems: 4

If it uses the same binding then why does it need minItems:1 ?

Does Shikra have only the one iommus entry - if so why ?

If not then adding minItems: 1 is nothing to do with adding another
compatible string.

Either way this patch isn't right.

---
bod


