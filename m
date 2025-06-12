Return-Path: <linux-media+bounces-34593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC655AD6C13
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782DC17B322
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3680E229B12;
	Thu, 12 Jun 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQBfT+S1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE671DDC1B;
	Thu, 12 Jun 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720182; cv=none; b=CspgGclOfFW4hyT0w0BhvB5QOvqBslUyNH+nTFslU2uSjCABoOvb9Y9QjTfLwACs+t0zcV+Xtm44onJYq8+l1kk14TpJejLEbXAmBgJx2nYEOZLN5iiIH/nByHXBy2HJjZoKsGHjIEB9mwjbppYbH/6BCZafd3sYP+UdaSUzUNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720182; c=relaxed/simple;
	bh=zeg/dU7FiDhs7+/OZ5I67Et2f/BehIbxhW8n8WqrQNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CO64t/1ZSX4VPxrwl2+aUYb/Pdl9v4i/obirZha+6wajxwYGToBp1E6Sm2rbGFFl2IbWoV42s12SRKzpDz7xCbdaULKqru3E/tf+8JvFPC8BV6I/QVv6tpJrDmbBto4YpwPwTAM2HM4ALdlV5CYmHrKh/PA22nUenMZqrvhFWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQBfT+S1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E34EC4CEEA;
	Thu, 12 Jun 2025 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749720182;
	bh=zeg/dU7FiDhs7+/OZ5I67Et2f/BehIbxhW8n8WqrQNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gQBfT+S1DvJ5azG9W6bKPMVhQ0EhUmaBOkKJsA+lRJQAbYPcexWeO2G3EzHwMgPht
	 +CRAzjSP9QwcaRVCaGyk+UJNthMCTYmS/hmKe/hMwcRGowzDLh7xN28/DzGxgBa7zV
	 37/yWDSzjlu5yeyRDGhyue6bjs2x7/s1pyOmbEc7tU6KTSSjltLLEXpj0EKBY3BOt8
	 ZlzQdUn+f3FlAj1ejCuHh1rVk8J9IH8R0z6ZaybRHX/1E3i/c54RuJ3+vjC1SvyPG1
	 o2caoG8MMj14eoIDrKSdL1EDgsRgDSXyM9EWliJiXXIhiMrHIyyoROSnSLgQe+KIqH
	 I1ovs2UVztBUQ==
Message-ID: <52f863d6-0c07-4290-a959-7725b9889344@kernel.org>
Date: Thu, 12 Jun 2025 10:22:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] media: Fix coccinelle warning/errors
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kosta Stefanov <costa.stephanoff@gmail.com>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2025 09:55, Ricardo Ribalda wrote:
> These is the last set of patches to fix all the relevant patchwork
> warnings (TM).
> 
> --
> 
> ---
> Changes in v6:
> - Improve comments for tda10048, thanks Kosta.
> - Link to v5: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org
> 
> Changes in v5:
> - venus: Ignore fps > 240
> - venus: Clamp invalid fps instead of -EINVAL
> - Link to v4: https://lore.kernel.org/r/20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org
> 
> Changes in v4:
> - Remove all merged patches
> - Improve commit messages.
> - media: Remove timeperframe from inst
> - Ignore 0 fps (Thanks Hans)
> - Link to v3: https://lore.kernel.org/r/20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org
> 
> Changes in v3: Thanks Bryan, Dan, Markus, Sakary and Hans
> - Improve commit messages.
> - Use div64_u64 when possible
> - Link to v2: https://lore.kernel.org/r/20240419-fix-cocci-v2-0-2119e692309c@chromium.org
> 
> Changes in v2:
> - Remove all the min() retval, and send a patch for cocci:  https://lore.kernel.org/lkml/20240415-minimax-v1-1-5feb20d66a79@chromium.org/T/#u
> - platform_get_irq() cannot return 0, fix that (Thanks Dan).
> - Fix stb0800 patch. chip_id can be 0 (Thanks Dan).
> - Use runtime (IS_ENABLED), code looks nicer. (Thanks Dan).
> - Do not replace do_div for venus (Thanks Dan).
> - Do not replace do_div for tda10048 (Thanks Dan).
> - Link to v1: https://lore.kernel.org/r/20240415-fix-cocci-v1-0-477afb23728b@chromium.org
> 
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> To: Vikash Garodia <quic_vgarodia@quicinc.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
> Ricardo Ribalda (6):
>        media: dvb-frontends: tda10048: Make the range of z explicit.
>        media: venus: vdec: Clamp parm smaller than 1fps and bigger than 240.
>        media: venus: venc: Clamp parm smaller than 1fps and bigger than 240
>        media: venus: Remove timeperframe from inst
>        media: venus: venc: Make the range of us_per_frame explicit
>        media: venus: vdec: Make the range of us_per_frame explicit
> 
>   drivers/media/dvb-frontends/tda10048.c   |  8 +++++++-
>   drivers/media/platform/qcom/venus/core.h |  4 ++--
>   drivers/media/platform/qcom/venus/vdec.c | 23 +++++++++++------------
>   drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++-------------
>   4 files changed, 31 insertions(+), 28 deletions(-)
> ---
> base-commit: 4db312bbce420e3f874302549db072211e03c569
> change-id: 20240415-fix-cocci-2df3ef22a6f7
> 
> Best regards,

@Vikash || @Dikshita

Are you happy enough with these changes for venus ?

---
bod

