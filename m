Return-Path: <linux-media+bounces-1756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860380706D
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 13:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F382C1F21612
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 12:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8403715D;
	Wed,  6 Dec 2023 12:59:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E936B16;
	Wed,  6 Dec 2023 12:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CF5C433C7;
	Wed,  6 Dec 2023 12:59:21 +0000 (UTC)
Message-ID: <d00fa740-bcf8-47af-b70a-cabbb7237d99@xs4all.nl>
Date: Wed, 6 Dec 2023 13:59:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v5 00/11] Add MFC V12 support
Content-Language: en-US, nl
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 linux-samsung-soc@vger.kernel.org, andi@etezian.org, gost.dev@samsung.com,
 alim.akhtar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 ajaykumar.rs@samsung.com
References: <CGME20231206063105epcas5p3034f89af2be6922ab04771de099a124a@epcas5p3.samsung.com>
 <20231206063045.97234-1-aakarsh.jain@samsung.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231206063045.97234-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2023 07:30, Aakarsh Jain wrote:
> This patch series adds MFC v12 support. MFC v12 is used in Tesla FSD SoC.
> 
> This adds support for following:
> 
> -Add support for YV12 and I420 format (3-plane)
> -Add support for Rate Control, UHD and DMABUF for encoder
> -Add support for DPB buffers allocation based on MFC requirement

I'm getting one smatch warning:

drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c:2453 s5p_mfc_queue_setup() error: we previously assumed 'ctx->src_fmt' could be null (see line 2441)

And a few kerneldoc warnings:

drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:729: warning: Function parameter or member 'chroma_size_1' not described in 's5p_mfc_ctx'
drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:729: warning: Function parameter or member 'is_10bit' not described in 's5p_mfc_ctx'
drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:729: warning: Function parameter or member 'is_422' not described in 's5p_mfc_ctx'
drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:729: warning: Function parameter or member 'stride' not described in 's5p_mfc_ctx'

Something for v6.

Regards,

	Hans

> 
> Changes since v4:
> -Addressed review comments by Krzysztof Kozlowski.
> As per discussion included iommus property in dt-schema.
> -Addressed review comments by Hans Verkuil.
> Fixed checkpatch warnings with --strict flag enabled.
> Upstreamed s5p-mfc-v12.fw to linux-firmware.
> Added comment in the patch 9 regarding loading mfc firmware v12 
> sequentially.
> -Addressed review comments by Nicolas Dufresne
> Made use of v4l2-common library to get number of planes needed for
> particular format in patch 4.
> v4 link:https://patchwork.kernel.org/project/linux-media/patch/20231025102216.50480-2-aakarsh.jain@samsung.com/
> 
> Changes since v3:
> -Removed vp9 codec support for now and just keeping MFC v12 base
> patches with necessary hardware controls, decoder, encoder and
> structural changes. Also covers luma dbp, chroma dpb and mv sizes
> for each codec as per the UM for MFCv12, along with appropriate
> alignment.
> v3 link: https://patchwork.kernel.org/project/linux-media/cover/20221011122516.32135-1-aakarsh.jain@samsung.com/
> 
> Changes since v2:
> -Addressed review comments by Rob Herring.
> This was regarding the errors found by Rob bot in yaml file. File
> 'samsung,s5p-mfc.yaml' is already converted into json schema and is
> merged.
> 
> -Addressed review comments by Krzysztof Kozlowski.
> This was regarding depricated properties mentioned in s5p-mfc.txt file.
> Review comment was addressed and 'samsung,s5p-mfc.yaml' is already
> merged now.
> 
> -Addressed review comments by Andi Shyti.
> This was regarding addition of 'MFC_V10PLUS_BITS' macro in
> 's5p_mfc_common.h file.
> v2 link: https://patchwork.kernel.org/project/linux-media/cover/20220907064715.55778-1-smitha.t@samsung.com/
> 
> Changes since v1:
> -Addressed review comments by Krzysztof Kozlowski.
> Separated bug fixes patches, resent again with fix tag
> and those are merged now.
> -Added SoC based compatible string.
> 
> -Addressed review comments by Andrzej Hajda
> Assigned width64 and height32 variable with ALIGN(ctx->img_..)
> used in the code in 's5p_mfc_opr_v6.c' file.
> v1 link: https://patchwork.kernel.org/project/linux-media/patch/20220517125548.14746-2-smitha.t@samsung.com/
> 
> Aakarsh Jain (11):
>   dt-bindings: media: s5p-mfc: Add mfcv12 variant
>   media: s5p-mfc: Rename IS_MFCV10 macro
>   media: s5p-mfc: Add initial support for MFCv12
>   media: s5p-mfc: Add YV12 and I420 multiplanar format support
>   media: s5p-mfc: Add support for rate controls in MFCv12
>   media: s5p-mfc: Add support for UHD encoding.
>   media: s5p-mfc: Add support for DMABUF for encoder
>   media: s5p-mfc: Set context for valid case before calling try_run
>   media: s5p-mfc: Load firmware for each run in MFCv12.
>   media: s5p-mfc: DPB Count Independent of VIDIOC_REQBUF
>   arm64: dts: fsd: Add MFC related DT enteries
> 
>  .../bindings/media/samsung,s5p-mfc.yaml       |  18 ++
>  arch/arm64/boot/dts/tesla/fsd.dtsi            |  21 ++
>  .../platform/samsung/s5p-mfc/regs-mfc-v12.h   |  52 +++
>  .../platform/samsung/s5p-mfc/regs-mfc-v7.h    |   1 +
>  .../platform/samsung/s5p-mfc/regs-mfc-v8.h    |   3 +
>  .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |  36 ++-
>  .../platform/samsung/s5p-mfc/s5p_mfc_common.h |  29 +-
>  .../platform/samsung/s5p-mfc/s5p_mfc_ctrl.c   |  10 +-
>  .../platform/samsung/s5p-mfc/s5p_mfc_dec.c    |  60 +++-
>  .../platform/samsung/s5p-mfc/s5p_mfc_enc.c    | 149 ++++++---
>  .../platform/samsung/s5p-mfc/s5p_mfc_opr.h    |  14 +-
>  .../platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c |  12 +-
>  .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 300 ++++++++++++++----
>  .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h |   7 +-
>  14 files changed, 563 insertions(+), 149 deletions(-)
>  create mode 100644 drivers/media/platform/samsung/s5p-mfc/regs-mfc-v12.h
> 


