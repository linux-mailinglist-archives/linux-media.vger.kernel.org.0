Return-Path: <linux-media+bounces-16732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616895E23A
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 08:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83B871F21C16
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 06:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6C5383A5;
	Sun, 25 Aug 2024 06:29:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172EE4A05
	for <linux-media@vger.kernel.org>; Sun, 25 Aug 2024 06:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724567399; cv=none; b=M6PbfVA3/EUBmqIIN6K+b/lVn25/fBKMiS7GlQ/Xf5vJ3085HblONSiUVr5L37n3TV8zw9fgH/b8lSfm5GEqBilRggEZfUemRO0fSQWJU1V5iCm/9tJlKg6RFl0TlWzk7P7Yp6bOHc0EKMqAYZNu6GvFyuWVht5kF51+I85nLvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724567399; c=relaxed/simple;
	bh=yLnVozuKG1BHRUy+lCPVzsVmaFnwHGT9jlZcYcAU/mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eJKmdr8PQmfVDiv2i/5AunjBOJBjV5SCQZr2oLk2jAkJ/bfaqed/dnRGZGo9XPk29vNk29ZoooEjI4A7DdKEkEXkUhZNkJhth6ZV7nbRXN9/M2pgSsKpz1bp97/Nh6W0ujZhGBsvnJXq6vQITmWL/Ogru7g6oW9Qlixzdvbh5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BD3C32782;
	Sun, 25 Aug 2024 06:29:57 +0000 (UTC)
Message-ID: <a300dda0-71db-473e-a566-0e25969c75cf@xs4all.nl>
Date: Sun, 25 Aug 2024 08:29:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR v6.12] Venus updates
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-media@vger.kernel.org
References: <20240823090438.130446-1-stanimir.k.varbanov@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240823090438.130446-1-stanimir.k.varbanov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stan,

On 23/08/2024 11:04, Stanimir Varbanov wrote:
> Hi Hans, Mauro,
> 
> The pull request includes:
>  - cocci warning/errors (Ricardo Ribalda).

Any reason why the first patch of this cocci series is missing in the PR?

https://patchwork.linuxtv.org/project/linux-media/patch/20240814-cocci-flexarray-v7-1-8a1cc09ae6c4@chromium.org/

If it is just a mistake, then I can add it.

Regards,

	Hans

>  - Constify structs (Christophe JAILLET).
>  - A fix for use-after-free when removing venus core module.
>  - Use iommu_paging_domain_alloc() when loading firmware through IOMMU.
>  - Change min iommu items in dt-binding for SC7280.
> 
> Please, pull.
> 
> regards,
> ~Stan
> 
> The following changes since commit 31aaa7d95e09892c81df0d7c49ae85640fa4e202:
> 
>   media: cec: cec-adap.c: improve CEC_MSG_FL_REPLY_VENDOR_ID check (2024-08-08 15:24:03 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.12
> 
> for you to fetch changes up to 5c6fd86dd3b3d6f37b0d07175ce24945134856fd:
> 
>   media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry (2024-08-23 10:46:31 +0300)
> 
> ----------------------------------------------------------------
> Venus updates for v6.12
> 
> ----------------------------------------------------------------
> Christophe JAILLET (1):
>       media: venus: Constify struct dec_bufsize_ops and enc_bufsize_ops
> 
> Lu Baolu (1):
>       media: venus: firmware: Use iommu_paging_domain_alloc()
> 
> Luca Weiss (1):
>       media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry
> 
> Ricardo Ribalda (9):
>       media: venus: Refactor struct hfi_uncompressed_plane_info
>       media: venus: Refactor struct hfi_session_get_property_pkt
>       media: venus: Refactor struct hfi_uncompressed_format_supported
>       media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
>       media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
>       media: venus: Refactor hfi_sys_get_property_pkt
>       media: venus: Refactor hfi_session_fill_buffer_pkt
>       media: venus: Refactor hfi_buffer_alloc_mode_supported
>       media: venus: Convert one-element-arrays to flex-arrays
> 
> Zheng Wang (1):
>       media: venus: fix use after free bug in venus_remove due to race condition
> 
>  .../devicetree/bindings/media/qcom,sc7280-venus.yaml |  1 +
>  drivers/media/platform/qcom/venus/core.c             |  1 +
>  drivers/media/platform/qcom/venus/firmware.c         |  6 +++---
>  drivers/media/platform/qcom/venus/hfi_cmds.c         |  8 ++++----
>  drivers/media/platform/qcom/venus/hfi_cmds.h         | 16 ++++++++--------
>  drivers/media/platform/qcom/venus/hfi_helper.h       | 20 ++++++++++----------
>  drivers/media/platform/qcom/venus/hfi_parser.c       |  2 +-
>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 20 ++++++++++----------
>  8 files changed, 38 insertions(+), 36 deletions(-)
> 


