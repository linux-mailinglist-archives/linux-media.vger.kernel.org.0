Return-Path: <linux-media+bounces-25933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BAEA2F280
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D8BD7A259E
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 16:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E578D2475FA;
	Mon, 10 Feb 2025 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GXIIXz5c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m9tBeQXb"
X-Original-To: linux-media@vger.kernel.org
Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6467C2441AD;
	Mon, 10 Feb 2025 16:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203501; cv=none; b=RzjvmgDGpFcS2RsavP5Ur6+grM31AUMw45nZ+xEHsymcJaXaHLE4Tn2GeDfWNOYNbpduDVEq1zcO5t2wZ4dOiUHFfSdZZUHbGb+PancYW8I0FXXf2M/p12WYmbVJB77v40UtwAygQrTcWKqzCvRZa/8rnl0HM7fjOGc/hoRQqZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203501; c=relaxed/simple;
	bh=cK3odLC0MCztbkfIE1C1AYvnC4RLplpka+AsEEoIFoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6ZA/yvrT2AV1q2beYHLW4nGqF2N9yw6AoshNY6RuQaf1UmZmCg6JNujuJJOdSBLcAcavjXSdEc+wI4xJ0RCY7T3pOsl0OnTdGnT2SbDpmy4O4ekomdpK6wj5puaR3LXUL87NxS+puNXyXVqqrChuCOqXBguz20lT448FcMFEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GXIIXz5c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m9tBeQXb; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id 38054200E27;
	Mon, 10 Feb 2025 11:04:56 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 10 Feb 2025 11:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739203496;
	 x=1739210696; bh=YNeJadkWRVGgukUkuDzsFJCjGYV/G32zn9RD7X0nWNg=; b=
	GXIIXz5ciV/micb486OBxpB5U+4fRAKFrC+RgoOp/gxz0BmkccL1ePls3x39Y0fU
	OADiY5Br7e7YA+Cu4wt8d6lNBzRSMyKv1+sPpRsX9cml7PlKzFVlhhBXNV0XOl91
	dMs6Hj0e4iULgNkvw8SxJw05PtY/dDAwbWVU6VCe//He60487ODyZIbMkUmpp2kJ
	cfdDodE0nEvWs6dB1s93RhWGc89kUcDPztb78+xdgF4f5OSjapCCB1j0E64bNpWJ
	7mfJUeRgMBh7nEqwmDZHCxtCg/GnWWmMkl/qny+ewrxK9oMDDXAHOflJvivqOgtX
	NETJybsowFnbjqhiPoKjDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739203496; x=
	1739210696; bh=YNeJadkWRVGgukUkuDzsFJCjGYV/G32zn9RD7X0nWNg=; b=m
	9tBeQXbGcP8ipu0IcWYGvDXlHxB/2pNM2cTWhIt/KOteJ75QVYYH6XrhaJQzd+W9
	QI5Z7JkidVvNEnZk3/oV3TG/29nW3b7jfoblCQ64PcXzHpQ1stJevsXjWE+HvOEd
	h9rZEkJuDJIw9hMviFGmqIa3WVP9pisoyh5I7/A04SiH1fjP+A+/3gZPP+5NInUe
	il1dL6NqjWB1lkPzQKsm6lhHfSYz02kHvRw8xbW+0ml57M9z7ZxXAbF8ubXdId+k
	5wZbef4NolPQEkqaKU+l26cg4ANROMP6+edvnK0inixxaPiJO+tuPEc0eYkC20Qe
	ldQNiHVafvSUCzawqhNjA==
X-ME-Sender: <xms:pSOqZ_Pa0itnI6kG321XQ0BfIamcX6bQtT-rfgQ6mH2ItXIb1Q-1kQ>
    <xme:pSOqZ5-nd_MTqh3bPmxq_QYd2dqPVnl-fkKB0_BeY4RriV5dCn5uqIUQFoR6JaN0x
    XqxxOLNf7blYkRtEMk>
X-ME-Received: <xmr:pSOqZ-SQf4pGdvAPsuoCKuJmlbqBe9Ik91Hi_vJQ2MwgqzwVbtkQNYWKOGhjxLSLMbz7K2uvGXzwmIX--G6Y5eL3Iak4dxrhag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepgeei
    hfegveekteelteeugedtgfelveejtdekjeejteejleekkeekiefhjeetfeffnecuffhomh
    grihhnpeguvghvihgtvghtrhgvvgdrohhrghdprghnrghlohhgrdgtohhmpdhlihhnuhig
    thhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgs
    pghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvih
    gusehigihithdrtgiipdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepphgrvhgvlhesuhgtfidrtgiipdhrtghpthhtohepsh
    grkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohep
    lhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthhopehkihgvrhgrnhdrsghinhhghh
    grmhesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:pSOqZzv1kCNjJ3kmdf4XuZtptXhCPmTOmhJz-tjkGGT5m-0r8y_7hw>
    <xmx:pSOqZ3cws9k7qirlXcPzQLfDuYU9k85MpktwqBatpO8iVf5yPUyjuA>
    <xmx:pSOqZ_0ocQ8lk20M2n6lug_nYU5p1vKtve6UKTu2CWDkEtaJJJid7Q>
    <xmx:pSOqZz9T29-tp7luvlLuGQwfQ_5Pcn4PfPXaIBGC2WskHnF9ox6Eeg>
    <xmx:qCOqZwu1lBQOBfNs8aWdpqnHKz4_ryIEIak8ALsDIADb-oDHxn1SVLbo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 11:04:52 -0500 (EST)
Date: Mon, 10 Feb 2025 17:04:50 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ramesh Shanmugasundaram <rashanmu@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,	"Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: media: i2c: align filenames format
 with standard
Message-ID: <20250210160450.GA1658528@ragnatech.se>
References: <20250209195517.148700-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250209195517.148700-1-david@ixit.cz>

Hi David,

Thanks for your work.

On 2025-02-09 20:53:43 +0100, David Heidelberg wrote:
> Append missing vendor and align with other sony definitions.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/i2c/{ad5820.txt => adi,ad5820.txt}  |  0
>  .../i2c/{adp1653.txt => adi,adp1653.txt}      |  0
>  .../i2c/{adv7180.yaml => adi,adv7180.yaml}    |  2 +-
>  .../i2c/{adv7343.txt => adi,adv7343.txt}      |  0
>  .../i2c/{adv748x.yaml => adi,adv748x.yaml}    |  2 +-
>  .../i2c/{adv7604.yaml => adi,adv7604.yaml}    |  2 +-
>  .../i2c/{mt9v032.txt => aptina,mt9v032.txt}   |  0
>  .../i2c/{max2175.txt => maxim,max2175.txt}    |  0
>  .../i2c/{mt9m111.txt => micron,mt9m111.txt}   |  0
>  .../i2c/{tda1997x.txt => nxp,tda1997x.txt}    |  0
>  .../i2c/{mt9m001.txt => onnn,mt9m001.txt}     |  0
>  .../media/i2c/{ov2640.txt => ovti,ov2640.txt} |  0
>  .../media/i2c/{ov2659.txt => ovti,ov2659.txt} |  0
>  .../media/i2c/{ov7670.txt => ovti,ov7670.txt} |  0
>  .../media/i2c/{ov7740.txt => ovti,ov7740.txt} |  0
>  .../media/i2c/{ov9650.txt => ovti,ov9650.txt} |  0
>  .../i2c/{imx219.yaml => sony,imx219.yaml}     |  2 +-
>  .../media/i2c/{ths8200.txt => ti,ths8200.txt} |  0
>  .../media/i2c/{tvp514x.txt => ti,tvp514x.txt} |  0
>  .../media/i2c/{tvp5150.txt => ti,tvp5150.txt} |  0
>  .../media/i2c/{tvp7002.txt => ti,tvp7002.txt} |  0
>  .../{tc358743.txt => toshiba,tc358743.txt}    |  0
>  MAINTAINERS                                   | 22 +++++++++++--------
>  23 files changed, 17 insertions(+), 13 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{ad5820.txt => adi,ad5820.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{adp1653.txt => adi,adp1653.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{adv7180.yaml => adi,adv7180.yaml} (98%)
>  rename Documentation/devicetree/bindings/media/i2c/{adv7343.txt => adi,adv7343.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{adv748x.yaml => adi,adv748x.yaml} (98%)
>  rename Documentation/devicetree/bindings/media/i2c/{adv7604.yaml => adi,adv7604.yaml} (98%)
>  rename Documentation/devicetree/bindings/media/i2c/{mt9v032.txt => aptina,mt9v032.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{max2175.txt => maxim,max2175.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{mt9m111.txt => micron,mt9m111.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{tda1997x.txt => nxp,tda1997x.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{mt9m001.txt => onnn,mt9m001.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{ov2640.txt => ovti,ov2640.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{ov2659.txt => ovti,ov2659.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{ov7670.txt => ovti,ov7670.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{ov7740.txt => ovti,ov7740.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{ov9650.txt => ovti,ov9650.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)
>  rename Documentation/devicetree/bindings/media/i2c/{ths8200.txt => ti,ths8200.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{tvp514x.txt => ti,tvp514x.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{tvp5150.txt => ti,tvp5150.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{tvp7002.txt => ti,tvp7002.txt} (100%)
>  rename Documentation/devicetree/bindings/media/i2c/{tc358743.txt => toshiba,tc358743.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ad5820.txt
> rename to Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/adp1653.txt b/Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/adp1653.txt
> rename to Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> similarity index 98%
> rename from Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> rename to Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> index 4371a0ef27617..4636ad601c3ee 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/adv7180.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/adi,adv7180.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Analog Devices ADV7180 analog video decoder family
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7343.txt b/Documentation/devicetree/bindings/media/i2c/adi,adv7343.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/adv7343.txt
> rename to Documentation/devicetree/bindings/media/i2c/adi,adv7343.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
> similarity index 98%
> rename from Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> rename to Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
> index d6353081402be..254987350321b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/adv748x.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/adi,adv748x.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Analog Devices ADV748X video decoder with HDMI receiver
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
> similarity index 98%
> rename from Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> rename to Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
> index 7589d377c6864..6c403003cdda1 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/adv7604.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/adi,adv7604.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Analog Devices ADV7604/10/11/12 video decoder with HDMI receiver
> diff --git a/Documentation/devicetree/bindings/media/i2c/mt9v032.txt b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/mt9v032.txt
> rename to Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/max2175.txt b/Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/max2175.txt
> rename to Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m111.txt b/Documentation/devicetree/bindings/media/i2c/micron,mt9m111.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/mt9m111.txt
> rename to Documentation/devicetree/bindings/media/i2c/micron,mt9m111.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/tda1997x.txt b/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/tda1997x.txt
> rename to Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m001.txt b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m001.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/mt9m001.txt
> rename to Documentation/devicetree/bindings/media/i2c/onnn,mt9m001.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2640.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2640.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ov2640.txt
> rename to Documentation/devicetree/bindings/media/i2c/ovti,ov2640.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ov2659.txt
> rename to Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov7670.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ov7670.txt
> rename to Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov7740.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ov7740.txt
> rename to Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov9650.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ov9650.txt
> rename to Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> similarity index 97%
> rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
> rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> index 07d088cf66e0b..8b23e5fc6a24f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx219.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> diff --git a/Documentation/devicetree/bindings/media/i2c/ths8200.txt b/Documentation/devicetree/bindings/media/i2c/ti,ths8200.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ths8200.txt
> rename to Documentation/devicetree/bindings/media/i2c/ti,ths8200.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp514x.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/tvp514x.txt
> rename to Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> rename to Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp7002.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp7002.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/tvp7002.txt
> rename to Documentation/devicetree/bindings/media/i2c/ti,tvp7002.txt
> diff --git a/Documentation/devicetree/bindings/media/i2c/tc358743.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/tc358743.txt
> rename to Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df1ecd2c7c3d3..9951eddae74b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -527,6 +527,7 @@ ADP1653 FLASH CONTROLLER DRIVER
>  M:	Sakari Ailus <sakari.ailus@iki.fi>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
>  F:	drivers/media/i2c/adp1653.c
>  F:	include/media/i2c/adp1653.h
>  
> @@ -1545,14 +1546,14 @@ M:	Lars-Peter Clausen <lars@metafoo.de>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://ez.analog.com/linux-software-drivers
> -F:	Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> +F:	Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
>  F:	drivers/media/i2c/adv7180.c
>  
>  ANALOG DEVICES INC ADV748X DRIVER
>  M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> +F:	Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
>  F:	drivers/media/i2c/adv748x/*
>  
>  ANALOG DEVICES INC ADV7511 DRIVER
> @@ -1565,7 +1566,7 @@ ANALOG DEVICES INC ADV7604 DRIVER
>  M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> +F:	Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
>  F:	drivers/media/i2c/adv7604*
>  
>  ANALOG DEVICES INC ADV7842 DRIVER
> @@ -14158,7 +14159,7 @@ M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> -F:	Documentation/devicetree/bindings/media/i2c/max2175.txt
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
>  F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
> @@ -16160,7 +16161,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> -F:	Documentation/devicetree/bindings/media/i2c/mt9v032.txt
> +F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
>  F:	drivers/media/i2c/mt9v032.c
>  F:	include/media/i2c/mt9v032.h
>  
> @@ -16790,6 +16791,7 @@ M:	Pavel Machek <pavel@ucw.cz>
>  M:	Sakari Ailus <sakari.ailus@iki.fi>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
>  F:	drivers/media/i2c/ad5820.c
>  F:	drivers/media/i2c/et8ek8
>  
> @@ -17525,7 +17527,7 @@ OMNIVISION OV7740 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
>  T:	git git://linuxtv.org/media.git
> -F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
>  F:	drivers/media/i2c/ov7740.c
>  
>  OMNIVISION OV8856 SENSOR DRIVER
> @@ -17566,7 +17568,7 @@ R:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> -F:	Documentation/devicetree/bindings/media/i2c/ov9650.txt
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
>  F:	drivers/media/i2c/ov9650.c
>  
>  OMNIVISION OV9734 SENSOR DRIVER
> @@ -17768,6 +17770,7 @@ S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  T:	git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
>  F:	drivers/media/i2c/ov2659.c
>  F:	include/media/i2c/ov2659.h
>  
> @@ -21992,7 +21995,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> -F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
>  F:	drivers/media/i2c/imx219.c
>  
>  SONY IMX258 SENSOR DRIVER
> @@ -23131,6 +23134,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> +F:	Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
>  F:	drivers/media/i2c/tda1997x.*
>  
>  TDA827x MEDIA DRIVER
> @@ -23967,7 +23971,7 @@ TOSHIBA TC358743 DRIVER
>  M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
> +F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> -- 
> 2.47.2
> 

-- 
Kind Regards,
Niklas Söderlund

