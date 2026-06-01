Return-Path: <linux-media+bounces-63312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAOZJsvFHWrgdwkAu9opvQ
	(envelope-from <linux-media+bounces-63312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 19:47:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614B62376C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 19:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3C9D3002E1D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 17:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C8D3E0C5C;
	Mon,  1 Jun 2026 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExUCI09Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DD3E025E;
	Mon,  1 Jun 2026 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335925; cv=none; b=niOGHQy4EBdI+2pm0hJChHkTALcPfhO4CNPE/xA0sbaWiHmvJMYrb6v4udKGKgjQm+JLQJSgTkuPAl/O7/mw7IXCGM1c1mQ7vHY731Ze/ijh9Uix94Ib9fu2mDm8+asqTjo9lHM1PtFmDDpnxgPKIeSP33PWSVwZq6b/SlaLnyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335925; c=relaxed/simple;
	bh=9rGSzvVmrUy3l8fA2KbwEhQHlrI3U6G48E7KCZFO06s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VVlaGfcQSIqG0K10QFvbaXa6P1YYOpfUVTMtqIGI99UswZIxyUImDd3viLf02z/1zzfc9hEeOJnc7pNPEWzzj1SMhabpx1zjCs6F8K/EX8ce+szkgOaCkNCjjO1e+EHevqS/B6G7kNVKUBxhkRGzH4Z4T7LjhInd6CMTFKg+vvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExUCI09Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7570F1F00893;
	Mon,  1 Jun 2026 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780335924;
	bh=QGg65dtps5OsZ9R2wzLue/4oCaMGv12xGoP4E9S3gs0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ExUCI09Z93u1IkI+k/jIpPjvzHgBBd/Zfet+MT9mGqcURiDhiyu673e8YS+E5Csa4
	 Kp6IQnc/7qZTX/DyED3kRjOhZmS1ceSWxMokQSnYLfjDbHv1nd4+3HrZxCXJX2ZgYC
	 QX9qzmgRCaiDLbSKxqxTdH1W9bAf41z/cRLGMIHfRXuPpWWjUGjq5tLtM7wHtDpEnV
	 fn5Pcr0QCvkfFbBKLf0hsSu1FtxNwaBsy4itZk4ERXDYLkiyvp0omvidp3nvOp+tlT
	 uZR8Nwl4ltg2pmHycaLKLDcPk3q5iG3zMJxG9L6jM6b0NZzKznxFkegWMdfaHYuzXj
	 muJf78ywaLbmQ==
Date: Mon, 01 Jun 2026 12:45:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Daniel J Blueman <daniel@quora.org>
In-Reply-To: <20260601041336.9497-1-daniel@quora.org>
References: <20260601041336.9497-1-daniel@quora.org>
Message-Id: <178033592233.3996692.3343005255061515852.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63312-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3614B62376C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 01 Jun 2026 12:13:33 +0800, Daniel J Blueman wrote:
> In addition to the firmware-loaded codec carveout, some Iris platforms
> need to declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from IOVA ranges that earlier
> firmware stages have already mapped through the SMMU.
> 
> Permit a second memory-region phandle for this purpose, and describe
> the meaning of each entry so the ordering is unambiguous.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml: properties:memory-region: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Firmware-loaded codec carveout'}, {'description': 'IOMMU IOVA reservation region'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260601041336.9497-1-daniel@quora.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


