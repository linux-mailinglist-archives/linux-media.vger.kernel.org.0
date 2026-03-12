Return-Path: <linux-media+bounces-55514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAGxKTHqsmljQwAAu9opvQ
	(envelope-from <linux-media+bounces-55514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:30:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB12759B2
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02A523013964
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6652F3F9F5F;
	Thu, 12 Mar 2026 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5eO1S28"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E83EF0C4;
	Thu, 12 Mar 2026 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333035; cv=none; b=n7IlRKtQ4GoLJaHsWxmWcPGpk6yUJ4aWHBUluL1do/hvo6ak2xnPSu3j8jQ4PmAPGl6prW47244ladOLxpr78xSdAAdTj2SEH9cXp2izBpnlCt1XKp4VT7eUuwEEQJXOT3s5bXZnWtz7SYe3J+6FYii+r/rObO71DjMdKHxNGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333035; c=relaxed/simple;
	bh=/8dl5d+rK7fW4VwaKsZFEBOvFY30/g9P83dM4eYvnoU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VblgHbQUq2qH/W3Lr/Ng4+NhNpGrnEPoxI1wKTUOZV8iWSColtO5JCXIlHRuFh1eDnMBvc+O1VrU0pA2qZQTQ9uuD3Yh3ETi+KZBpUtTSoDgGppYPvuZLITgey9fGPYTsV5hYPnmF1JRyGxkwVO8mqP5yeay5V5vxIg/nDUHVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5eO1S28; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9168C4CEF7;
	Thu, 12 Mar 2026 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773333035;
	bh=/8dl5d+rK7fW4VwaKsZFEBOvFY30/g9P83dM4eYvnoU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H5eO1S28gqwRRcnBjwWnEwx5alKXA/Ys2Awjtq5paI8O8QtZojdy+hqxQzuEXn+HA
	 sgkpriH7Jc7uR8r1fERY3865nXxp3GN4vKm/QKmqO8VKDxWtemdOLITMZNLOHNBd5e
	 JJ7K8WO9MXxc4eRK3NhGmCw6bXwOEHEcVeFh7fZVmruMFBMbNr5KOll95VD+tCyPxk
	 jSw5U86RFABfjRqvUjR5/h3DhiM1nbxkMC036Oi8XHc1tYSS6z47OoVApGS/t8hhLb
	 ZomzCIFQoso1rd9rTm/7kQp/CEuBjva/IUamtvI79jpr0YL3eMciHEhW/izZmFKNNu
	 Xyj9aWqc2/Ncg==
Date: Thu, 12 Mar 2026 11:30:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-media@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
In-Reply-To: <20260312150437.1091195-2-eagle.alexander923@gmail.com>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-2-eagle.alexander923@gmail.com>
Message-Id: <177333303408.3475085.938537535374470457.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add Sony IMX662 sensor
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
	TAGGED_FROM(0.00)[bounces-55514-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 94AB12759B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 18:04:36 +0300, Alexander Shiyan wrote:
> Add device tree binding documentation for the Sony IMX662 CMOS image
> sensor. The sensor features a native pixel array of 1936x1100
> (effective 1920x1080) and supports MIPI CSI-2 output with 2 or 4 data
> lanes, RAW10/RAW12 formats, and both colour and monochrome variants.
> The link-frequencies property accepts up to eight values corresponding
> to the allowed MIPI data rates.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx662.yaml       | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml: ignoring, error in schema: properties: port: properties: endpoint: properties: data-lanes: description
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx662.yaml: properties:port:properties:endpoint:properties:data-lanes:description: {'Number of MIPI CSI-2 data lanes. Supported values': '2, 4.'} is not of type 'string'
Documentation/devicetree/bindings/media/i2c/sony,imx662.example.dtb: /example-0/i2c/camera@1a: failed to match any schema with compatible: ['sony,imx662']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260312150437.1091195-2-eagle.alexander923@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


