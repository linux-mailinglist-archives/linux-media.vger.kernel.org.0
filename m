Return-Path: <linux-media+bounces-15163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15331937DBF
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 00:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E19CB217CC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 22:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EF12F34;
	Fri, 19 Jul 2024 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCefEhJx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4ED148832;
	Fri, 19 Jul 2024 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721427027; cv=none; b=qKxxRldtJ6S2uvx3PkVqXTKfzjjqBfbCZtzd1VmUYs6jKeMid7N20ZZ6tjk73m87Lqmv/jhsxY49iAWWqrtFJav46U6PO+XseYJ5bE7kdXz8aSySpzvG/5s6UkSjtyBD1U2xT1fVBcobBpvulE1nRue434ZwHUqWsv22x+0NhBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721427027; c=relaxed/simple;
	bh=V0c7nQInZQHViP4y2EWyTjZ7257Z/OpHVNmbSCyY7ZY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ep6D2Fh/Uop9YwfUQNDbrWIlLOBdbf/wjF8SXnBLFQujvNL/NAHvZgpcq/sYEHQjWR/71gMyJleSW4FEZ9spCKgsTEmbFqhRJ75CTGP8fICHkBYNSqzgKnK3X/cbQRnIbDSDUNtbmhfFN4zNmHZrLO7a9Dw336NRKpVfNsvUtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCefEhJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971E3C32782;
	Fri, 19 Jul 2024 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721427027;
	bh=V0c7nQInZQHViP4y2EWyTjZ7257Z/OpHVNmbSCyY7ZY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZCefEhJxD0kJDQF5aFMBqtXgHQF4iEAJ4Q/a4iQMbM9zpxDeZ82frT8KnDMfOuBD/
	 SLj8mUvaW4Mi0+vR7N4k/ogzdRkfpgGMy7D7MSadkG5tbin2bGmh3bT7+ZvAi3f8gW
	 S090FuPqtelLDtxuycYBSSa97nF9akGChXYyAX5wC/zhvYvFpQuwXxAqjxnpQkEPgV
	 rkXd/2P43VWn+/3GcfXHhP9l/UUZaojZbrB0QyX1b82s9jkONpc5ercshIM+3uqUz5
	 snTa2//H9sHznlbEjrPODobZwxTSlb5s8LNGP7hct7cOwJYQqin5ZKKWBcchGFfndO
	 OfdLGACRqzP+w==
Date: Fri, 19 Jul 2024 16:10:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: kernel@collabora.com, mchehab@kernel.org, conor+dt@kernel.org, 
 linux-media@vger.kernel.org, nelson.costa@synopsys.com, 
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de, 
 mturquette@baylibre.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl, 
 linux-rockchip@lists.infradead.org, shawn.wen@rock-chips.com, 
 sboyd@kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, nicolas.dufresne@collabora.com
In-Reply-To: <20240719124032.26852-3-shreeya.patel@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com>
Message-Id: <172142702137.153951.8294803513682327237.robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI
 RX Controller


On Fri, 19 Jul 2024 18:10:30 +0530, Shreeya Patel wrote:
> Document bindings for the Synopsys DesignWare HDMI RX Controller.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
> 
> Changes in v4 :-
>   - No change
> 
> Changes in v3 :-
>   - Rename hdmirx_cma to hdmi_receiver_cma
>   - Add a Reviewed-by tag
> 
> Changes in v2 :-
>   - Add a description for the hardware
>   - Rename resets, vo1 grf and HPD properties
>   - Add a proper description for grf and vo1-grf phandles
>   - Rename the HDMI Input node name to hdmi-receiver
>   - Improve the subject line
>   - Include gpio header file in example to fix dt_binding_check failure
> 
>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.example.dts:53.38-39 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240719124032.26852-3-shreeya.patel@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


