Return-Path: <linux-media+bounces-41913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA17B476DA
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 21:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60EB4179F91
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 19:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48826288500;
	Sat,  6 Sep 2025 19:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRmMeziJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EA825B1C5;
	Sat,  6 Sep 2025 19:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757186268; cv=none; b=QLAZwZzc8XTNWwtB00FZAIBlcFA6ZFLOL3WKCo/u1yQz5sZUZUUVBM2rfSxJhr+fu9P8be/BhAjJPxSdSakI6U1UalJfhVBzDZUfDTHEzjaqjnYrDskIFq2gdPvDHjdEbZjmvnGg526heDwY46peQbe996zB9rULxAQ6p58J+eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757186268; c=relaxed/simple;
	bh=PKtVETpt3iAueUyOAHaFirlCACUUZHxID9Y/hmP47vQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kFtM5W8XU4lMmyp4ADCVVaQya+ze6TJWx7I4iWKdBe3G25i8CaYbLbcrK9thdfq6+3JiyDK276yj//aDJW7ZD40fCC3MwRFQOo2uz3spdnQZ0khgSQtqmaGEpEJ+YgAabWuFibbtBLWKms2dHFazVUZb0SkVEDcWzUoMTYjrrtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRmMeziJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C21C4CEE7;
	Sat,  6 Sep 2025 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757186268;
	bh=PKtVETpt3iAueUyOAHaFirlCACUUZHxID9Y/hmP47vQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PRmMeziJu1HlJ53s8cvAtqN3495uZxs/Jtw+3b/wl/tpByw8ltRq0GtkKT5oNdf+C
	 TAPPZz4RcsGIf/NRUAbhLQ1RSKhHGo5C/s6RGcWQE/PKHndd2wjq1zei3fsjuYZt5+
	 /FxHE04rv5z6gL73pOHTaHTdlXmCUpjihD9LfZFQMUecsAMq/3zSKISSdOJQxTCN3f
	 4Gw5xhCv7blWlgh30jQ+SKks6wMMmRv7JcZkwuBNy6dCHZBlWltomYuPA1N4Xy687k
	 lv4lhcd9mWTWgfRbJ0jk8MKkaJeRUwkodnUSY+8hO/LuGvKxnmLYLtAH8FJfzD1M7P
	 mYZfDluqIseqQ==
Date: Sat, 06 Sep 2025 14:17:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, 
 =?utf-8?q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>, 
 Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Osipenko <digetx@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250906135345.241229-5-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-5-clamor95@gmail.com>
Message-Id: <175718505408.1618397.11958757465445078243.robh@kernel.org>
Subject: Re: [PATCH v2 04/23] dt-bindings: display: tegra: document Tegra30
 VI and VIP


On Sat, 06 Sep 2025 16:53:25 +0300, Svyatoslav Ryhel wrote:
> Existing Parallel VI interface schema for Tegra20 is fully compatible with
> Tegra30; hence, lets reuse it by setting fallback for Tegra30.
> 
> Adjust existing VI schema to reflect that Tegra20 VI is compatible with
> Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
> an enum instead of list of const.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
>  .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml: properties:compatible: 'anyOf' conditional failed, one must be fixed:
	'one0f' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml: properties:compatible: Additional properties are not allowed ('one0f' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250906135345.241229-5-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


