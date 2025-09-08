Return-Path: <linux-media+bounces-42022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E60B490FB
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 16:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A2D93BA8C2
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B6830BBA5;
	Mon,  8 Sep 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIZiuZDG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E84A18D656;
	Mon,  8 Sep 2025 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757340925; cv=none; b=ReHblXhBZxb/gwvqaMsaRxTS5zShtr/BdtCZ4EAPofkTXBEAMXl3xzazHKq78ej28JzG3pqf9daBRozJl+vHr3rWnVE11cJeQnwo0nja9Ad38Nh2QuoElBqc4Ug6u/X1sDYeoIv72mvHzsRucJd/g5VgIsstHHqzv1IU5UmSfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757340925; c=relaxed/simple;
	bh=QgIpB2jfHW0N/3Ci98KVnbv9d6yCAvYXaqlVmdKTBHk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pco04TEnFsOR56iCAIVUDNGAHXN8J/gMgp5x7FgJ5PydnlOf5kG6OCBd31lgB3/SS7shujcYHeiKQIU07qhE6uieFTDsGllnX8DkF8kzSHzVOPCY5za0rpL6hI4jjDmue65EPmgX7sqAp8jQOKM3ZgfXUIZQi2jDozNoacOi10M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIZiuZDG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF55BC4CEF1;
	Mon,  8 Sep 2025 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757340924;
	bh=QgIpB2jfHW0N/3Ci98KVnbv9d6yCAvYXaqlVmdKTBHk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DIZiuZDGYoJHcsR2Jifa2jIRwnPxYLGVcFW5UIdYOBBalGNeqiNi+/WOnau7DGh58
	 7zzHk1P6OoRJGgwLntsdRvDkDIeddkVlChPBWXay2fCwBOA+JEbe+no6FVwIec1Fps
	 ihmEFdwfYQUaiTX4fb371HwP4Q2ZLQD8QLRCGyaWZYCjJYFh5NRCD/OZN0lsgXjST8
	 JujregcFKLVtyQx38ammLCqL6HnquKDvHLQ1quE8VifSndlN/OoO0wEkErbxkckliw
	 HIaAvfaEr8qeXaj+unWhN0l52yFr9C8oAhzPhIPgs27HeVAsv3JolSq6DGNrtqtJbc
	 7z+hQfRAzGPuA==
Date: Mon, 08 Sep 2025 09:15:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Jacopo Mondi <jacopo@jmondi.org>, Hans de Goede <hansg@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 dri-devel@lists.freedesktop.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-leds@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Daniel Thompson <danielt@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
In-Reply-To: <20250908-leds-v3-1-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
Message-Id: <175734087835.1809005.14330068317471966084.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation


On Mon, 08 Sep 2025 01:18:03 +0200, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated properties are not allowed ('led-names', 'leds' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250908-leds-v3-1-5944dc400668@vinarskis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


