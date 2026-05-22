Return-Path: <linux-media+bounces-62652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FaRHLXMEGrydwYAu9opvQ
	(envelope-from <linux-media+bounces-62652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:37:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 455125BA8A8
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8EB73011782
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6063238D3E3;
	Fri, 22 May 2026 21:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfU8jLI2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC29025A359;
	Fri, 22 May 2026 21:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485869; cv=none; b=YEvNYGAW0HmLdcHPQxIKQgVHjztrDxOcZUdmWFgvt3ZGttbPQvb3zRg13SnLaFZi3CWsr5YrhAPJHgsJsQ8aHEXoYc1OYSWbIx+G8D1bOadPLi/pLm+4F4bbIgqg9DHtv4Gvws1JvyTkY5nningKiV5M7nqqgRtkvGJXJTSCStk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485869; c=relaxed/simple;
	bh=Irdpboga0e94lwhHZfmTpX7EMC+HzUaMewhmh6K9zP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAjghX2zOec8cm7H9C+YXKVfFHEB1Ms535YJuKrI1Ju/FJ9+hgA70wqRBvyB2tf2gn/sRYi8hnl2HsxnSsyANGfRPJ5biVNlsKDEIpj1mFNRYJrY95aeHdbZUQdUhNvtNZeKET61AshRQ5TL4IWO3CsaJeOjrr2FcnBocp0LGTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfU8jLI2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D4D1F000E9;
	Fri, 22 May 2026 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779485868;
	bh=rKySuRH7zxmKCkRj+vsH6WLK86VeQbARbGCmHU+Y/HI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bfU8jLI2yGgJ3S8yrF4rdgC5styfISFtbqUQutRoKEdI6SnhOTpvbwhLfdrndcTsa
	 +bfIF8AAU0aOQ4Pk7SAfasWZTu0J//QGjMm+0Mw0YB8p+UO2PdO/mFGahGimEqKJx7
	 Z19tzRTKvAefScpofcsg1goggwxVwonn1DOpcfBm403OGjEXxzigt7hy09yItg4y48
	 5grJVQcaY3fJpC6I4rsmmJvQbAlGt1Uklz7Fetg1MQaBskuPcKc8A7PcW7oPRBM1me
	 bGrkadhxfZ3g74ZO1eRP4pDSPL0UVo+Kxr6iwZlwoHdZU8lWjEELBA1iIEi+M+to9C
	 jiIjbyCsEraBw==
Message-ID: <b5dc7f51-b71c-46b1-823b-76f02d325acb@kernel.org>
Date: Fri, 22 May 2026 22:37:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org>
 <20260522-x1e-csi2-phy-v7-1-79cb1280fad6@linaro.org>
 <svzHygggdG4PSd3qFMz0chRKqXNkhZwTvHoC3_oynq8e5HYOEn-_EHLnXm1w959nIDz9GaLZG9MgXqAJPNhWSA==@protonmail.internalid>
 <177946855028.3571140.11988520251406266072.robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <177946855028.3571140.11988520251406266072.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62652-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ace4000:email,0.0.0.1:email,devicetree.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email,linaro.org:email]
X-Rspamd-Queue-Id: 455125BA8A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/05/2026 17:49, Rob Herring (Arm) wrote:
> 
> On Fri, 22 May 2026 15:45:09 +0100, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>
>> The schema here defines three ports:
>>
>> port@0:
>>      The first input port where a sensor is always required.
>>
>> port@1:
>>      A second optional input port which if present implies DPHY split-mode.
>>
>> port@2:
>>      A third always required output port which connects to the controller.
>>
>> The CSIPHY devices have their own pinouts on the SoC as well as their own
>> individual voltage rails.
>>
>> The need to model voltage rails on a per-PHY basis leads us to define
>> CSIPHY devices as individual nodes.
>>
>> Two nice outcomes in terms of schema and DT arise from this change.
>>
>> 1. The ability to define on a per-PHY basis voltage rails.
>> 2. The ability to require those voltage.
>>
>> We have had a complete bodge upstream for this where a single set of
>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>
>> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 208 +++++++++++++++++++++
>>   1 file changed, 208 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@0: Missing additionalProperties/unevaluatedProperties constraint
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@1: Missing additionalProperties/unevaluatedProperties constraint
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@2: Missing additionalProperties/unevaluatedProperties constraint
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.example.dtb: csiphy@ace4000 (qcom,x1e80100-csi2-phy): ports:port@2:endpoint: Unevaluated properties are not allowed ('clock-lanes', 'data-lanes' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml
Frustratingly

dtbs_do_check2 phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml 
qcom/x1e80100-crd.dtb

dtbs_do_check2 () {

echo "checking " $1 " and " $2
make dtbs_check ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE O=$BUILDDIR 
DT_DOC_CHECKER=$DT_DOC_CHECKER DT_EXTRACT_EX=$DT_EXTRACT_EX 
DT_MK_SCHEMA=$DT_MK_SCHEMA DT_SCHEMA_FILES=$1 CHECK_DTBS=y $2
make dt_binding_check O=$BUILDDIR DT_CHECKER_FLAGS=-m 
DT_DOC_CHECKER=$DT_DOC_CHECKER DT_EXTRACT_EX=$DT_EXTRACT_EX 
DT_MK_SCHEMA=$DT_MK_SCHEMA DT_SCHEMA_FILES=$1 CHECK_DTBS=y $2

}

Neither my script nor the Makefile throw an error when the yaml name 
doesn't exist i.e. when it changes.

I really did run the checker - just for a file that doesn't exist.

Feels like a bug I should blame on AI enslopification but, it was me..

meh

---
bod
phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml

