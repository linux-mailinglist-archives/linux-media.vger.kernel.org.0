Return-Path: <linux-media+bounces-7736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4302088A349
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 14:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7385E1C39EA1
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 13:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412B2171E57;
	Mon, 25 Mar 2024 10:37:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEF613C3E3
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711359005; cv=none; b=VPOIXd8j3AWrEWtjq4yCyY1NCbfGBkPXLfAbWd956eA1ZZqoRZlAB0X8ViIHE5EHrqSUcWmzNnLiV2HrKHNbrs4L+neeiczUAyw/lpzRc94C0W84WLqOBqFcsMmgNB2vVx8KpSd6KdogzUCEPbmcP8K4osMNrARQV8/teMdd3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711359005; c=relaxed/simple;
	bh=OYVVDXc6ZsKplauAkWvsYh8VORqvuygAWH7qAOFe/4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Eyl6vAsodLsDdUqsFCkf8xt8r7VmwSVsTm1c9obQNoEcN/55LQyZXt0gusPO3z701srwB6tAziCktcKeAEYhSbeSfg6e30mvo4JgiBRQiTeBvJrvYzVBivqQSWfEbPlyBJOl3+UNfmn6si+ztqQmNyiY34d9BuWqtqGtRj4pjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C693C433C7;
	Mon, 25 Mar 2024 09:30:04 +0000 (UTC)
Message-ID: <172268d7-f259-4098-bb0d-c33b9ee4a4e1@xs4all.nl>
Date: Mon, 25 Mar 2024 10:30:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.9] Various Mediatek VCodec fixes
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org
References: <20240315132549.vbhui74yxjg2t36v@basti-XPS-13-9310>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240315132549.vbhui74yxjg2t36v@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Are these fixes for v6.9 or can these be merged for v6.10?

Not all of these patches have a 'Fixes' tag, perhaps they should have it?

Regards,

	Hans

On 15/03/2024 2:25 pm, Sebastian Fricke wrote:
> Hey Hans & Mauro,
> 
> this set contains 3 fixes for two kinds of Kernel panic, one fix to be
> able to access the last element of a list and one fix to be able to
> access the high bits of a register.
> 
> Please pull.
> 
> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
> 
>   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mediatek-various-fixes
> 
> for you to fetch changes up to 27821568df7da25b1f454cf5461ad4b428df536e:
> 
>   media: mediatek: vcodec: support 36 bits physical address (2024-03-15 14:14:08 +0100)
> 
> ----------------------------------------------------------------
> Various Fixes for Mediatek VCodec
> 
> ----------------------------------------------------------------
> Irui Wang (1):
>       media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-frames
> 
> Nicolas Dufresne (1):
>       media: mediatek: vcodec: Fix oops when HEVC init fails
> 
> Yunfei Dong (3):
>       media: mediatek: vcodec: adding lock to protect decoder context list
>       media: mediatek: vcodec: adding lock to protect encoder context list
>       media: mediatek: vcodec: support 36 bits physical address
> 
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c |  8 ++++----
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     |  5 +++++
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 ++
>  .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c     |  2 +-
>  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c |  2 +-
>  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c | 11 ++++++-----
>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        |  4 ++--
>  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c  |  2 ++
>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     |  5 +++++
>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 ++
>  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c  |  2 ++
>  11 files changed, 32 insertions(+), 13 deletions(-)
> 


