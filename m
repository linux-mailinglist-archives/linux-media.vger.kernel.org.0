Return-Path: <linux-media+bounces-51574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDtNNURwd2m8gAEAu9opvQ
	(envelope-from <linux-media+bounces-51574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:46:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB7890EE
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6774F3006121
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0A32F6565;
	Mon, 26 Jan 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aX173eYY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0D33A70D;
	Mon, 26 Jan 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435188; cv=none; b=u1FOAvzTHwrodWZabBvUL0EtSgHWUKdioAnuDrD+QMMCTFxJNhyFtepUM2OGZa/eE6UOWRQ7yezaHMe0MHoDIiV+4QFBhBoxHItSm8Fl7RurfoQdA0j4oB0MAICKB9qCjhPSkRypsYu2O9/id2Wg3cC4rVFypdkGHNiym0FXo+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435188; c=relaxed/simple;
	bh=6mSL/I/UrTqJREyXIxPZztaQ6z+SxMufwe/f4oVzBjg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MlQezDTw/CJNeev734GIpPOJYxeQcev0gN3tjSRceAJK2g+uoGbGo1IRq/eFfqDB+NBS89LQGVk01pPdtA/MQzmH4tCk+h4qgRjg8O4muKo7H2OQ71x+Fo+JsrP39G9lVf7GWlqT4YGf1cjwLiEj9NbUYavpCJtpi5I7JYUkeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aX173eYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D726CC116C6;
	Mon, 26 Jan 2026 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435188;
	bh=6mSL/I/UrTqJREyXIxPZztaQ6z+SxMufwe/f4oVzBjg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aX173eYYFbUexgKDvWCA6f0iMAR+pe9wwWWiryRqIvwLiEORYLryG3IVPC0idBojW
	 7cx3FSwgBulq+RNRnwz9qAsEMFK3SfdHuF0xtMsbNJ2RDLm6uyxLvX+Yk89jWeJqpa
	 p/YvSLXQB7LeBwPRAJKVKsfoV+H9Bukv39DKZePVdYkdwtJb4jDB5Sm0pbJe/VRN0f
	 xoHOeDHnwHbiIJXUd4/cLD7DakZLkmq3yniJf2IAIOWkirlHBOTgu6nzlJbW7d5Czj
	 row8I0I/zPfDl0OzSiYR/3lnN9lSB6GMB6M4jP5k99SIpNQnOJWhZ4S7VoiNEpjb54
	 BRxYRSAFMCJkQ==
Date: Mon, 26 Jan 2026 07:46:26 -0600
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
 Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Saravana Kannan <saravanak@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, iommu@lists.linux.dev, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
Message-Id: <176943518688.2039372.7415236577494171468.robh@kernel.org>
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51574-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 77FB7890EE
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 17:55:44 +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> iommu-map include all the different stream-ids which can be possibly
> generated by vpu4 hardware.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>  1 file changed, 234 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:2:3: 4294967295 is greater than the maximum of 65536
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:4:0: 4294967295 is greater than the maximum of 65535
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:7:3: 4294967295 is greater than the maximum of 65536
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:9:0: 4294967295 is greater than the maximum of 65535
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:11: [1] is too short
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


