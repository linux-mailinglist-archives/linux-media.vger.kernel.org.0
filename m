Return-Path: <linux-media+bounces-19343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFD9998699
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FDC51C238D1
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 12:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD221C6F4B;
	Thu, 10 Oct 2024 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oz1mEWob"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C61C3F26;
	Thu, 10 Oct 2024 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564564; cv=none; b=ZrChTgdTpoyK4cyRI779H4WHx5fHLdQjGTrForGKI1seiKgXckz8yqmp6qJ9f/p81hpjOquQVEvV4k7ZCjREAx2V90yPIt2wBbx6VYpNaeiD8WPTZMpNWXPCAs0JzJR7ivFFx2LpNHxDO67d0+8KP3U+RsIhxaCOtqapr28KehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564564; c=relaxed/simple;
	bh=peJCajT9JrXEyFW7QG0r6H6LQ1MBhLze2K+6buEL3xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+o58NTSaWiK1A7PbQyB97jHcOMIOvRo30IUQ/tNrNmSmSq1EMSokXnfGocKpxk5czt9tbKcBdP4WQlItOfz9gXMCGVViYdQXC439nramoLAdE5hWiF3GEXlDuUolqpjV/MCNML4wdSk6DcneKbXXTSfwd9cmXcC9GoXCLoFRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oz1mEWob; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728564560;
	bh=peJCajT9JrXEyFW7QG0r6H6LQ1MBhLze2K+6buEL3xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oz1mEWob0bLo3tFj/UZ1xluxr6hYvEq4h1UspMdA6+l+A/m1HNWUQmfOSVlR6ttGy
	 J3KCM9lroR2SFR+3TRZIFhBXmr9xEU+BNp7FZCwQQcI+dsB5AlPRSzna/Ke6ZrOZGT
	 N1nSislJSTMtsj0d9UjBkvkWaaIdXhgSzWfQ2UGfmuWe6TWU0cmeJ3w7PI9K6JoOEh
	 AqYzvkgywv4D4j1thdPHBA2OL8UlI1H0iXXsZGdhNxdxGuA2wGqRJL/l+Eaw4uCGTe
	 U05rr0cvsUZk/TUARKVnMyn4W8DqOOwQ72WkeMgJ7KGAmAf3YVDlU3Yv37WOjhKHF9
	 mN+/9pAZy5EFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C6F217E35EA;
	Thu, 10 Oct 2024 14:49:19 +0200 (CEST)
Message-ID: <93234ce4-e831-41aa-9485-53997b5cacaf@collabora.com>
Date: Thu, 10 Oct 2024 14:49:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org,
 shun-yi.wang@mediatek.com
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/10/24 13:15, Shu-hsiang Yang ha scritto:
> Introduces the ISP pipeline driver for the MediaTek ISP raw and yuv
> modules. Key functionalities include data processing, V4L2 integration,
> resource management, debug support, and various control operations.
> Additionally, IRQ handling, platform device management, and MediaTek
> ISP DMA format support are also included.
> 
> Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> ---
>   .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
>   .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
>   .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
>   .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
>   .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
>   5 files changed, 6191 insertions(+)
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
> 
> diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
> new file mode 100644
> index 000000000000..c025f53c952d
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
> @@ -0,0 +1,5359 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <linux/videodev2.h>
> +#include <linux/suspend.h>
> +#include <linux/rtc.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include <soc/mediatek/smi.h>
> +
> +#include "mtk_cam.h"
> +#include "mtk_cam-feature.h"
> +#include "mtk_cam-raw.h"
> +
> +#include "mtk_cam-regs-mt8188.h"
> +
> +#include "mtk_cam-video.h"
> +#include "mtk_cam-seninf-if.h"
> +#include "mtk_camera-v4l2-controls.h"
> +
> +#include "mtk_cam-dmadbg.h"
> +#include "mtk_cam-raw_debug.h"
> +
> +static unsigned int debug_raw;
> +module_param(debug_raw, uint, 0644);
> +MODULE_PARM_DESC(debug_raw, "activates debug info");
> +
> +static int debug_raw_num = -1;
> +module_param(debug_raw_num, int, 0644);
> +MODULE_PARM_DESC(debug_raw_num, "debug: num of used raw devices");
> +
> +static int debug_pixel_mode = -1;
> +module_param(debug_pixel_mode, int, 0644);
> +MODULE_PARM_DESC(debug_pixel_mode, "debug: pixel mode");
> +
> +static int debug_clk_idx = -1;
> +module_param(debug_clk_idx, int, 0644);
> +MODULE_PARM_DESC(debug_clk_idx, "debug: clk idx");
> +
> +static int debug_dump_fbc;
> +module_param(debug_dump_fbc, int, 0644);
> +MODULE_PARM_DESC(debug_dump_fbc, "debug: dump fbc");
> +
In addition to the first review that I gave you on patch [02/10]: please drop
all those module parameters. If you want debug switches, use debugfs instead.

Regards,
Angelo

