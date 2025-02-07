Return-Path: <linux-media+bounces-25790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF6A2BF36
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 10:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DFA516A771
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1098E1DDC15;
	Fri,  7 Feb 2025 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoDA4+SM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478A1DC992;
	Fri,  7 Feb 2025 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920327; cv=none; b=ZN82sksFD6yqgo0bIMs9eB9P4ZRdNcYgjU2RVhkbLamni3MPKy5eKwhBAPXj7pDVR+UdkVwpn1TRnwkFOMhHscq1gUlzI3w0xInaQLyapmoD1ErAcyqaXNgbLgiujRbgVTJxpDvJ96Pa9MjbmR+RdgUSnuZDnYQwbvFSZkA3ZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920327; c=relaxed/simple;
	bh=kF7bqOfEPUr/1NjhgrCLEjkTuw9hFLco2ae4W2t7H38=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hDmekiPxPiBRAHSx+GHoIoAY4MSUA665L72M35LVh1DZOQObmtstZyoHc3lWV+RuTfk3tcJGb1BDWZ8KYis/dGqDANWOQ0MS3yEzzDYq3cLAp64gFnKh9NH5KZrH0WMwxO8ObAsD7duxMftvXN1SrjPnc2O2EpsPZH+OkxkYRjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoDA4+SM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF92C4CED1;
	Fri,  7 Feb 2025 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738920327;
	bh=kF7bqOfEPUr/1NjhgrCLEjkTuw9hFLco2ae4W2t7H38=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FoDA4+SMwU8LqI5xPUcyA5YFPx2OWZI08q3Zegddu0PgzHiWdxO7CWWhvxNWYlxfO
	 dxkAoFvD3RWtPpsGuE01QUligb3BkydtmaoZ9r1m5GRHlXSAJnM1aGUM14/0YtftKv
	 YJFXuGPrXlqL1jF+R4A2SGhThekSSY8+H3DM6AGpVU1h45nmQBol/xtwKLYmpy3MMa
	 2rkC6jrFEvTH+QIqLb0TYStvohRDuUiYMwg+IrXXdCfeK5ehqdwQvzUndv4t1wpGwO
	 ocRFK/Zdt2lU4sEVLCsY7bAd8mMJc7XDY973225MKpI4xz01Cpu/vxcuqwWCuwqdCp
	 jl/ifOtnDArsQ==
Date: Fri, 07 Feb 2025 03:25:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, eajames@linux.ibm.com, 
 mchehab@kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
 linux-arm-kernel@lists.infradead.org
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20250207082351.1298990-1-jammy_huang@aspeedtech.com>
References: <20250207082351.1298990-1-jammy_huang@aspeedtech.com>
Message-Id: <173892032595.3714424.13095199531321692299.robh@kernel.org>
Subject: Re: [PATCH v3] media: dt-bindings: aspeed,video-engine: Convert to
 json schema


On Fri, 07 Feb 2025 16:23:51 +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Additional changes:
> - Two phandle properties, 'aspeed,scu' and 'aspeed,gfx', are added for
>   video engine to capture video from sources other than VGA.
> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v3:
>   - Add Additional changes into comments.
>   - Remove | after phandle description
> 
>  v2:
>   - Update patch subject
>   - Add NOTE for false positive warning
> ---
>  .../bindings/media/aspeed,video-engine.yaml   | 84 +++++++++++++++++++
>  .../bindings/media/aspeed-video.txt           | 33 --------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: mapping values are not allowed in this context
make[2]: *** Deleting file 'Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts'
Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: mapping values are not allowed in this context
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207082351.1298990-1-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


