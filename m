Return-Path: <linux-media+bounces-58583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MmYG0ox2mk5zAgAu9opvQ
	(envelope-from <linux-media+bounces-58583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:32:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A43DF7FF
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC861302D958
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EF033DED1;
	Sat, 11 Apr 2026 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FToo0iuA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FF2EEBB;
	Sat, 11 Apr 2026 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907095; cv=none; b=kOp32JP48JClDGXJ1ziAyZb0+pgeMyDHMJ1NGot03dlg9HluV0CwDljbk0QqbuqAnCD/Ol7rFjMwjhvTRvLMBbTuM01MeDyXwJjc9xZAuN0AdHcy9Xa5pM5rgL64YadWlStbDok0B8V2s+0Ti4Kv9AmNPOXuH40Ph1uKJwl8aqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907095; c=relaxed/simple;
	bh=CLQngFoPc5WczBmVgNUyoBFKp4HDj11GvfxFnyKuwCE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dAI/LiwcyNJFbtO+ROuMMidWiKZ3vm4WBEaQFL9OiV2h3U2nUfmYhWDaqlUpt2zyEiFEYyjA4mpyp0Hecem7d9sbQ9TPjn1JVM6/zBulWKn0lgZA8245rjUOhVFu5RgbLhjKXT3WicBKHRWneO1ThX+MquhJevlQVeSYN5vKVfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FToo0iuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554CAC4CEF7;
	Sat, 11 Apr 2026 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775907094;
	bh=CLQngFoPc5WczBmVgNUyoBFKp4HDj11GvfxFnyKuwCE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FToo0iuA9XNfETlAp6RoZuxEKVnLBRayR3KpSeVSvK2T/qGnrL6840eGsJR7Np91d
	 jhMooqNGMiu7QUiTAW+3XKJTwJBxSz3emyD2rFUBAefLQ1MUqK59sEhCEpAoleCBg7
	 Snn6V1JTGe9PV92v2gplO73fRXxkUEkkADpzc8xfEw79bI0QAPdFFhW+k0jyAA9xIn
	 as7ez3G/NhQrv5hNquDb/Eqqd7TFe7+CUVC6jw7wBaA/yLFjFtQBZaJZqYaMIPrWJ9
	 FuYJNfSg/rGXY5rZeNIiOdSZwftbPHI4fKymJSD771GrRY+jaOZ9a+8FUYXIQSkvhb
	 ETREcPD8YPvhQ==
Date: Sat, 11 Apr 2026 06:31:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, sakari.ailus@linux.intel.com, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Walter Werner Schneider <contact@schnwalter.eu>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, linux-media@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, 
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
 tarang.raval@siliconsignals.io, Svyatoslav Ryhel <clamor95@gmail.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260411094723.129738-2-elgin.perumbilly@siliconsignals.io>
References: <20260411094723.129738-1-elgin.perumbilly@siliconsignals.io>
 <20260411094723.129738-2-elgin.perumbilly@siliconsignals.io>
Message-Id: <177590709260.2607034.11396372289581626742.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add os02g10 sensor
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,oss.qualcomm.com,linaro.org,windriver.com,linux.intel.com,ideasonboard.com,schnwalter.eu,foss.st.com,vger.kernel.org,siliconsignals.io,gmail.com];
	TAGGED_FROM(0.00)[bounces-58583-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:email,devicetree.org:url]
X-Rspamd-Queue-Id: C45A43DF7FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 11 Apr 2026 15:17:04 +0530, Elgin Perumbilly wrote:
> Add bindings for Omnivision OS02G10 sensor.
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>  .../bindings/media/i2c/ovti,os02g10.yaml      | 96 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml:52:15: [warning] wrong indentation: expected 12 but found 14 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: ignoring, error in schema: properties: port: properties: endpoint: properties: data-lanes
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
Documentation/devicetree/bindings/media/i2c/ovti,os02g10.example.dtb: /example-0/i2c/camera-sensor@3c: failed to match any schema with compatible: ['ovti,os02g10']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260411094723.129738-2-elgin.perumbilly@siliconsignals.io

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


