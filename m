Return-Path: <linux-media+bounces-17106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD5963E49
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8984B23BC2
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A5F18C038;
	Thu, 29 Aug 2024 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfxGg7nx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A818C025;
	Thu, 29 Aug 2024 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919824; cv=none; b=pklxZvGfTDp6hDBDrZeTLpZpg9zZ89AqOddl47ZLygBPXpEclayswlX0sT6QwRpBESh4y68gHcx5al++BrBnvWEbbdok4Vun7eTrekNfDb8rKrMAVGqRdwEI598poCw3qafBidl4VXCGeE3v+naJ2pmzbdfkQiD+FA0uNkoTvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919824; c=relaxed/simple;
	bh=ZYaSGp+fnpZ/q2d742FCiD1B5Vwp233d4XIjEq3SxmI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=VWDNXxnWA/k30fKz2VXqJpbf6zeR0e07QTScMsLy7k1s7nY4vnQFJnH4opuUxf8fdKULIZ/ucnfcY+0mmAKplW6/nSt3pDk4BCHHFdoTu+o6+iM4WT9fpjY7tX21f8zPDsO9vOA4vxwdp5kWwrSlXY5ufIMfWfsNmNyEWtrKvow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfxGg7nx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678AAC4CEC1;
	Thu, 29 Aug 2024 08:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724919823;
	bh=ZYaSGp+fnpZ/q2d742FCiD1B5Vwp233d4XIjEq3SxmI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LfxGg7nxC/5pTw/pl4SPD3eMgN3WOG2lJTTMvpwQujpq7RUcrhezJRMpG6N/oVe11
	 oG44QXMWpDJ4pzQlAFFUn3uPYjMXTNErlElOrv2xbum2lE3syzFYUuQY92OZf4hMHe
	 kZUzsstPPpndi65VdFlfenzrkGUS2hhFH7B9kyUpkZNEUyLRTrYCfT55CDKfFnxKob
	 d0iaO3mzp/3DguWkbICbwsuR6GYGZcg3oixLlC+jA0QXCdf0oxtOqLYLJ2uvxA3P4y
	 74liAa0d+SclnZHStNHPjWN1/kjOh2dS3Gw4vm7qJLe0AECKs8kKo2Dmjjz35xleYf
	 INrXQOo4/NVXw==
Date: Thu, 29 Aug 2024 03:23:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: pmenzel@molgen.mpg.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
 mchehab@kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org, hverkuil@xs4all.nl
In-Reply-To: <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
References: <20240829064508.3706672-1-jammy_huang@aspeedtech.com>
 <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
Message-Id: <172491982164.2766568.9027879446207472741.robh@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema


On Thu, 29 Aug 2024 14:45:07 +0800, Jammy Huang wrote:
> Convert the ASPEED SoCs video txt bindings to dt-schema.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../bindings/media/aspeed,video-engine.yaml   | 78 +++++++++++++++++++
>  .../bindings/media/aspeed-video.txt           | 33 --------
>  2 files changed, 78 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts:27.29-30 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:442: Documentation/devicetree/bindings/media/aspeed,video-engine.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/aspeed-video.txt
MAINTAINERS: Documentation/devicetree/bindings/media/aspeed-video.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240829064508.3706672-2-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


