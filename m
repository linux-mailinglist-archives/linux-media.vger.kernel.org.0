Return-Path: <linux-media+bounces-25214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E38A1A770
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 16:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3B3169722
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 15:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A41215045;
	Thu, 23 Jan 2025 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVBSJ3AW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCF214802;
	Thu, 23 Jan 2025 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647871; cv=none; b=HIKisYigC2QgxQnM6u8dca2kg3Xku+f3M8TssHApaQ8s6SWHmCAUsIpG8AAZtGL/LtGb9QXM8WTtbMdN5+Cp32oQZhNH0ypfj4wMgBoNqpN4qc2ovNjvjsxgWhQUCORvjBJD4BdSXlt5fJhpt4Ixgx+Up0y4GXAyGbzTl9DDRdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647871; c=relaxed/simple;
	bh=QSO02dBzJkhUaBSBCa/mo1kBNImpUvDK0tahdaO4jBo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=I4z1u1a/Yt80L/Y1sjnRwWDYCIVagN/k87OwnYDeBrmpsshKn3u8DctrFoe3iRejaG9L+sIHDYAOH/mQ4ed78AJulzUZ7ZskmOkWBMdv8ZZeLPG6QDk+w1Lv8KOCevjwBHRFXgxs4RoGKT4xKNb5SfaZ5zHeYfR+F49LW0u5r+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVBSJ3AW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE00C4CED3;
	Thu, 23 Jan 2025 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647870;
	bh=QSO02dBzJkhUaBSBCa/mo1kBNImpUvDK0tahdaO4jBo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HVBSJ3AWtaOdYSpyccpeOaFNcoILX6mpQT7aLfzAvPrKXH4Md249+2GhgFrPr5uQT
	 aVSKfm7b7/Y5T6+K1IJgUDiJnkAOR5xBcNxv5pShtbTlUM/Ae6dMXwHp6kag0sJQVt
	 Z9Qnelrre73NlS5mWhsRcJbCwMFzsE+at1kxs1pTtyUQyT11gv65relIyBOICnZfz5
	 AsNHqP08lS1VQPNcMXLZjCtgIZyHoP8BNouyD/KikLXIRaqp1My83t0GmLhyttJe2r
	 cVHmW5FbF2CRvchnsp1cPzWP1YXAze+RpLhFz49sKDyuTGcuBrHAhGJxZfkHJRbsVx
	 Xu9eWVFcsFI3A==
Date: Thu, 23 Jan 2025 09:57:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Florian Sylvestre <fsylvestre@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Phi-Bang Nguyen <pnguyen@baylibre.com>, devicetree@vger.kernel.org, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
Message-Id: <173764775396.3793654.14266581007050031663.robh@kernel.org>
Subject: Re: [PATCH v8 0/5] Add Mediatek ISP3.0


On Wed, 22 Jan 2025 14:59:09 +0100, Julien Stephan wrote:
> This series adds the support of the Mediatek ISP3.0 found on some
> Mediatek SoCs such as the mt8365. The driver is divided into 2 parts:
> 
> * SENINF: the sensor interface
> * CAMSV: this driver provides a path to bypass the SoC ISP so that image
>   data coming from the SENINF can go directly into memory without any
>   image processing. This allows the use of an external ISP or camera
>   sensor directly.
> 
> The SENINF driver is based on previous work done by Louis Kuo available
> as an RFC here: https://lore.kernel.org/all/20200708104023.3225-1-louis.kuo@mediatek.com/
> 
> Changes in v8:
> For the whole series:
> - rebase  on v6.13-rc1 --> drop iommu_present and use device_iommu_mapped instead
> - apply new trailers
> - fix several coding style issues reported by Laurent and CK
> - fix warnings and errors reported by media-ci:
>   https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/66966282/artifacts/report.htm
> 
> Camsv bindings:
> - sort header alphabetically
> 
> Seninf driver:
> - remove test pattern generator, as it was legacy untested code
> - use v4l2_subdev_enable_streams/v4l2_subdev_disable_streams instead of
>   v4l2_subdev_call(s_stream)
> - simplify mtk_seninf_v4l2_register: correctly split the media device
>   and seninf subdev initialization. Create an seninf_subdev_init
> function and drop mtk_seninf_media_init which was confusing
> - Fix several style issues
> 
> Camsv driver:
> - remove the "30" suffix: renaming camsv30 to camsv (file name and
>   function name)
> - add comment to properly describe the fbc mechanism
> - reduce spin_lock region in isp_irq_camsv function
> - remove pm operation from mtk_camsv_fbc_inc
> - call mtk_camsv_fbc_inc at the beginning of streaming or only when
>   streaming: buf_queue touch the hw only if streaming
> - remove op_lock and rely on the video device lock
> - implement .link_validate() and drop mtk_cam_verify_format
> - use video_device_pipeline_start instead of media_pipeline_start
> - remove useless stream_count counter
> - add various defines for constants
> - merge content of mtk_camsv.c into mtk_camsv_video.c as suggested by CK
> - merge mtk_cam_mbus_formats and mtk_cam_format_info intpo a single
>   struct, and extend it with fields to remove the fmt_to_sparams() function.
> 
> - Link to v7: https://lore.kernel.org/r/20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com
> 
> Changes in v7:
> - fix several comments from Laurent Pinchart and CK about style issues,
>   such as: sort Kconfig and Makefile alphabetically, remove unneeded headers,
>   use 80 char limits ...
> - add back I/O accessors around readl/writel
> - use enable_streams/disable_streams instead of s_stream
> - use v4l2_subdev_init_finalize and don't store active format
> - remove mtk_camsv30_regs.h file to merge it inside mtk_camsv30_hw.c
> - adding reviewed-by tag from robh and angelo
> - implement .has_pad_interdep callback to fix multistream error
> - fix mtk_seninf_get_clk_divider to give the correct pad number. This
>   caused an issue for multi camera
> - use hardware FBC (framce buffer control) instead of dummy buffer to
>   deal with underrruns
> - simplify directory architecture and remove isp_30, camsv and seninf
>   directories
> 
> - Link to v6: https://lore.kernel.org/r/20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com
> 
> Changes in v6:
> - remove unneeded "link" tag from commits
> 
> bindings:
> - remove labels from example node
> - remove complexity for phy and phy-name properties
> 
> driver:
> - fix some comments from CK :
>   - remove unneeded variables
>   - rename irqlock to buf_list_lock for clarity
>   - remove unneeded lock/unlock around hw_enable/hw_disable
> 
> - Link to v5: https://lore.kernel.org/r/20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com
> 
> Changes on v5:
> drivers:
> - rebase on 6.10-rc1
> - fix various comments from all reviews (mostly style issues and minor
>   code refactor)
> - add a function to calculate the clock divider for the master sensor
>   clock: NOTE: setting this register seems to have no effect at all,
>   currently checking with mediatek apps engineer (OOO until 17/04)
> 
> bindings:
> - camsv: update description
> - seninf: fix phy definition and example indentation
> - use generic name for node example
> 
> dts:
> - sort nodes by addresses
> - use lower case for hexadecimal
> 
> Changes in v4:
> - fix suspend/resume deadlock
> - fix various locking issues reported by Laurent Pinchart on v3
> - run LOCKDEP
> - add missing include reported by kernel-test-robot for non mediatek arch and COMPILE_TEST=y
> - use atomic poll inside mtk_camsv30_setup
> - drop second lane support as it was not used
> - remove useless members in structs
> - fix media entity initialization
> - initialize correct pad for camsv video device
> - add isp support in mt8365.dtsi
> - rebase on 6.7
> 
> Changes in v3:
> - fix a lot of formatting issues/coding style issues found in camsv/seninf reported by Angelo on v2
> - fix camsv/seninf binding file error reported by Rob
> 
> Changes in v2:
> - renamed clock `cam_seninf` to `camsys`
> - renamed clock `top_mux_seninf` to `top_mux`
> - moved phy properties from port nodes to top level
> - remove patternProperties
> - specify power management dependency in the cover letter description to fix
>   missing include in dt-binding example
> - change '$ref' properties on some endpoint nodes from
>   '$ref: video-interfaces.yaml#' to '$ref: /schemas/graph.yaml#/$defs/endpoint-base'
>  where applicable
> 
> Best
> Julien Stephan
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> Julien Stephan (1):
>       arm64: dts: mediatek: mt8365: Add support for camera
> 
> Louis Kuo (2):
>       dt-bindings: media: add mediatek ISP3.0 sensor interface
>       media: platform: mediatek: isp: add mediatek ISP3.0 sensor interface
> 
> Phi-bang Nguyen (2):
>       dt-bindings: media: add mediatek ISP3.0 camsv
>       media: platform: mediatek: isp: add mediatek ISP3.0 camsv
> 
>  .../bindings/media/mediatek,mt8365-camsv.yaml      |  109 ++
>  .../bindings/media/mediatek,mt8365-seninf.yaml     |  259 ++++
>  MAINTAINERS                                        |    9 +
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi           |  125 ++
>  drivers/media/platform/mediatek/Kconfig            |    1 +
>  drivers/media/platform/mediatek/Makefile           |    1 +
>  drivers/media/platform/mediatek/isp/Kconfig        |   36 +
>  drivers/media/platform/mediatek/isp/Makefile       |    8 +
>  drivers/media/platform/mediatek/isp/mtk_camsv.h    |  152 ++
>  drivers/media/platform/mediatek/isp/mtk_camsv_hw.c |  440 ++++++
>  drivers/media/platform/mediatek/isp/mtk_camsv_hw.h |   19 +
>  .../media/platform/mediatek/isp/mtk_camsv_reg.h    |   90 ++
>  .../media/platform/mediatek/isp/mtk_camsv_video.c  | 1017 ++++++++++++++
>  drivers/media/platform/mediatek/isp/mtk_seninf.c   | 1454 ++++++++++++++++++++
>  .../media/platform/mediatek/isp/mtk_seninf_reg.h   |  114 ++
>  15 files changed, 3834 insertions(+)
> ---
> base-commit: 414788dae5ac03f80234629c6d140a38fb1fbf9d
> change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36
> 
> Best regards,
> --
> Julien Stephan <jstephan@baylibre.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com:

arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: camsv@15050000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: camsv@15050800: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#






