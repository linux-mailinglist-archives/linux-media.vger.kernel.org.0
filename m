Return-Path: <linux-media+bounces-7200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508DB87EA4A
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 14:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F57C1C21447
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 13:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A87482C7;
	Mon, 18 Mar 2024 13:43:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D0C249EB
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710769383; cv=none; b=bhAH4aES0FDyV+kXjQDOqfy1qqbVrtFGmhhoX/T2xgPqSppdZMY/eA0yqn03Y+k9DopdEs3oG/pEDj94jz/NSlIQrexwcShCgoe6PnRr7J1czsS5Mrp349nmyy7EKuWIKD529D/MfdPa7Gvcc/zrdExuKLPib9fWkwEB2sys4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710769383; c=relaxed/simple;
	bh=MPYIrWQo7f/oCpusVUqhbq5DupRNT50AgkJ6O13nREs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XywD9dnC1sfGcpzlp7jbDkVjGECteYCfVnsrqlW/mZULw8ghhU2EzHztL6Oittzindjk9X5EfdfKBWhshTbZh0/DA87oxMBOGTxfWXbMG/WuXgRHJ5RAnP0VztPsMFcvmjCu+Ey2cdPUrdoI46O2XJiDMY57qXye0zGYznCCxag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B229EC433C7;
	Mon, 18 Mar 2024 13:43:02 +0000 (UTC)
Message-ID: <a6652d2e-8fb7-4532-bb98-62c22aeec07c@xs4all.nl>
Date: Mon, 18 Mar 2024 14:43:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.9] Imagination E5010 JPEG encoder
Content-Language: en-US, nl
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org
References: <20240309151528.ayphvdpnj2crvycv@basti-XPS-13-9310>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240309151528.ayphvdpnj2crvycv@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/03/2024 4:15 pm, Sebastian Fricke wrote:
> Hey Hans & Mauro,
> 
> These patches add support for the Imagination E5010 JPEG encoder.
> 
> Please pull.
> 
> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
> 
>   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-e5010-jpeg-encoder
> 
> for you to fetch changes up to 146a5dc5f8baee4178a1cdfa483aa3c94273ce5e:
> 
>   media: imagination: Add E5010 JPEG Encoder driver (2024-03-09 16:10:43 +0100)
> 
> ----------------------------------------------------------------
> Adds support for the E5010-JPEG-encoder
> 
> ----------------------------------------------------------------
> Devarsh Thakkar (3):
>       media: dt-bindings: Add Imagination E5010 JPEG Encoder
>       media: jpeg: Add reference quantization and huffman tables

This should be added to v4l2-jpeg.c. There are also a few other
changes I'd like to see, see my reply to this patch.

The other two patches are OK, but since a v7 is needed anyway, I'll
add a few comments to patch 3/3 as well.

Regards,

	Hans

>       media: imagination: Add E5010 JPEG Encoder driver
> 
>  .../bindings/media/img,e5010-jpeg-enc.yaml         |   75 +
>  MAINTAINERS                                        |    7 +
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    1 +
>  drivers/media/platform/imagination/Kconfig         |   12 +
>  drivers/media/platform/imagination/Makefile        |    3 +
>  .../media/platform/imagination/e5010-core-regs.h   |  585 ++++++++
>  .../media/platform/imagination/e5010-jpeg-enc-hw.c |  267 ++++
>  .../media/platform/imagination/e5010-jpeg-enc-hw.h |   42 +
>  .../media/platform/imagination/e5010-jpeg-enc.c    | 1553 ++++++++++++++++++++
>  .../media/platform/imagination/e5010-jpeg-enc.h    |  169 +++
>  .../media/platform/imagination/e5010-mmu-regs.h    |  311 ++++
>  include/media/jpeg-enc-reftables.h                 |  112 ++
>  include/media/jpeg.h                               |    4 +
>  14 files changed, 3142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>  create mode 100644 drivers/media/platform/imagination/Kconfig
>  create mode 100644 drivers/media/platform/imagination/Makefile
>  create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
>  create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h
>  create mode 100644 include/media/jpeg-enc-reftables.h
> 


