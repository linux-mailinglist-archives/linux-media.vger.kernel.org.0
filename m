Return-Path: <linux-media+bounces-41635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2803BB416E9
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3D6D563ECB
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 07:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DBD2DE70D;
	Wed,  3 Sep 2025 07:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="BUY7TGzc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC52D73B2
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885155; cv=none; b=XskahBz+VnkoiS+nUqLMjaQp1CwdDXVmmauMoYD+plJIQWpRhSM0AlJVbJ4+wb87MjwRVq3BbHRAjAjqwI27AzspL/4OhHsUfrm1J8lcgDgCh6B7FD5ixyBL6GkPXuZmK0hFXTCnsdo2HQ1S2ieW+zbUXBqM04RsIF977RsthRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885155; c=relaxed/simple;
	bh=1Oc0Sp3Mx7FR/p2BZFbZfwf5PRZHut2haSGWT0WEc8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKmuGmnymlgvoQh/IvkmTafb7yJNxCT+AuMMrALu7gqOZiPOqRMSXdhsZw5CIHYT2vIiGY+H4A3eGcGD8s7khpvrbw4PT8polABqZFainKg7gH86YDsx+0Q9AVk3N9INRWuvggFjHn+UZYtfTRKSbXLJocCbESB33OHCcJH8ovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=BUY7TGzc; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1756885151;
 bh=auDnTh/G9z3Y/t2W15bb+vq1E6EQIAIJTktRaItnI50=;
 b=BUY7TGzciFQ9/qPcSITc41HWklDtvWHn1Io9WA26Iy0MyO16eDXyBQfnr+J07PhMsMIkeulLB
 OFnDwzQKRzOX6z80vlne5NXux+AO/PqmdVbsdo5VAy+5QcJTAr91bItE/hQNTq2mGvc34WWzwhe
 mHE7VUrntlp/P8keO8sPJCYWuA1FW1fpnlkBKDmgMX/3p/PAwtGYEz7iGqPV684tN6sqFrWCT/J
 CZPLmKuENVjmH5d8zT3IHvnFqJpX+uFvKP+1WFa9e0NmfmpG+WvzHMI5Wj21l5v9f0vdckhomAf
 nhN3zKof5bZWQOidPUDybM2sl0UcWUKlzWAZd34Q9hQQ==
X-Forward-Email-ID: 68b7ee2f3a2f2af95f29221d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.11
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <8394c12a-1e1e-44fc-9bb5-92a464dfe410@kwiboo.se>
Date: Wed, 3 Sep 2025 09:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-2-jonas@kwiboo.se>
 <432ab63698b27ca5bce3a7a30d630685aff782b6.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <432ab63698b27ca5bce3a7a30d630685aff782b6.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On 8/29/2025 10:22 PM, Nicolas Dufresne wrote:
> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>> The Rockchip VDEC supports the HEVC codec with the Main and Main10
>> Profile up to Level 5.1 High tier: 4096x2304@60 fps.
>>
>> Add the backend for HEVC format to the decoder.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Re-reading myself, most of my comments were off or really "nitty". So let's move
> forward and spare you the v3. Detlev is happy to rebase and work on top of your
> series, so let's help everyone getting better RK codec support.
> 
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Just to be transparent, during testing, it was notice that some concurrent
> decoding resulted into failures. I tested Detlev port to structure registers,
> and it didn't change anything (so probably not a stalled state, or one that we
> control). This could easily be a HW issue with older chip. Since you have used
> this for years without major issue reported, I happy to move on.

Thanks, I found some minor changes compared to the LibreELEC version
that I am running some new tests on, plan to send out a v3 as soon as
testing completes later today.

In LibreELEC version we enable some error detection,

	// sw_cabac_error_e - cabac error enable
	writel(0xfdfffffd, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
	// slice end error enable = BIT(28)
	// frame end error enable = BIT(29)
	writel(0x30000000, rkvdec->regs + RKVDEC_REG_H264_ERR_E);

and in this series it was fully disabled to closer match H264/VP9:

	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);

There is also an extra memset(0, ...) in rkvdec_hevc_start:

	memset(priv_tbl, 0, sizeof(*priv_tbl));

This should not really be needed and was removed in this series.

Still unclear if any of these will result in a changed behavior. Enable
of cabac/slice end/frame end error could possible activate some more
states when block issue a self-reset, but I am only guessing.

One thing to note for the flaky tests is that when they fail, they
typically just end up with a different consistent checksum. I have not
done any visual inspection of those frames, but will extract each frame
and compare them both bitwise and visually.

Regards,
Jonas

> 
> regards,
> Nicolas
> 
>> ---
>> Changes in v2:
>> - Use new_value in transpose_and_flatten_matrices()
>> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
>> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
>> ---
>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  817 ++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    2 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   76 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>  6 files changed, 2745 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c

[snip]

