Return-Path: <linux-media+bounces-64394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z/kVC70tKWokSAMAu9opvQ
	(envelope-from <linux-media+bounces-64394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:26:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B58667D31
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:26:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nXEwanwW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64394-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64394-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F859312B960
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6722DEA86;
	Wed, 10 Jun 2026 09:17:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB002D5937;
	Wed, 10 Jun 2026 09:17:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083062; cv=none; b=tTw8tqrBbTQWcemc27U5jcG8nLMvbEg5SkeP7TSKNi2wtO0dOhh0yTXvNqGehGtrEn4az2CN7T8wh4VsY+LhR0HwFADDi2DdXT9w0BEyLvU+V4zuIZ4Yflp1WpUCpMp2Bw3E/9nGXMWGaew6wAg15nINo2aZQnCL0uib6jghRgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083062; c=relaxed/simple;
	bh=s3BGg5H4qOtIBSP4loSijk7jTVwRZIwC9k8zTxvGI6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvWCe7f4VobiyMXbTqisYoJNb9jOfjN3ApOWkgkt8V6crF9+qbkJ04ASJsdiVzrWNEbfMhSsI3XElOShNLw/kjJQULHVGo78R9gVhsuMPKVWsYo2kMQaalfhRHP3En1UAXTxG8OS+r0y/kmcoX1UucBhay5k1u7KHd2he9iYiJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXEwanwW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112B81F00893;
	Wed, 10 Jun 2026 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781083059;
	bh=7aJdhg+QdjogYbSMMYhotm9atH+QTdiuJQlrdUEJBv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nXEwanwW217/vGyCgv6G4WuevKw8w3n78LRHtXi6XioxXnrT13KoMX+loJJeXibRw
	 irpiAV5TDktSo6mFEQiGA/uDOh/gZLSzRWyuCMP953Z7/8AUQk13babSTNSyabqKmM
	 vwsIqystFeZCEQhcsAe7YxEzffpCD39y2q5swKl+ctnfceN/uigiPUkhVjWvuDe476
	 XfmzazZ8MCxxIk7ihaYlPBnYXs1X46irQ48ms8nJen7MWEp6sYTraO9rVqXhw01/RM
	 MTTNQxPujjoReXqpIZXa1NmBEcZ7ETJ8TVoP3DcymPv8XciwDDo1vQHFZuueeYt1QD
	 SblFsa50UGLYA==
Date: Wed, 10 Jun 2026 11:17:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <20260610-flexible-badger-of-dignity-bbaea0@quoll>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64394-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,quoll:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95B58667D31

On Tue, Jun 09, 2026 at 09:45:40PM +0530, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
>=20
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290=E2=80=99s SID=
 layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.
> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
>=20
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++++++=
++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.y=
aml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e=
3f805c8e72ff0df 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -15,12 +15,27 @@ description:
> =20
>  allOf:
>    - $ref: qcom,venus-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-iris
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +    else:
> +      properties:
> +        iommus:
> +          maxItems: 2

allOf goes to the end, after required: block. See example-schema.


> =20
>  properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: qcom,sm6115-venus
> +          - enum:
> +              - qcom,sm6115-venus
> +              - qcom,shikra-iris

Messed order.

>            - const: qcom,qcm2290-venus
>        - const: qcom,qcm2290-venus

Best regards,
Krzysztof


