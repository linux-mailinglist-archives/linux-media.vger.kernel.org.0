Return-Path: <linux-media+bounces-33484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BFAC5909
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 19:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861301BA360E
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 17:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B014280314;
	Tue, 27 May 2025 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="U9AzbCJA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8462566
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368315; cv=none; b=YkHisBYVlo5dnagVi+z54VG4EFsrJN8Bfe1rcY5BdY8mCoQrhwopA2C5iiUqsm5xgLc+XbFhOOO9dolzDqxonZWHZmn+45035ZkpePJ8xeMEydCJ2yG0tPjx0n4FyDMKcHwaQ7JTq0fT4YCJA4ajDnix8eP4krVY5HWIvBv4WrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368315; c=relaxed/simple;
	bh=ir+58+LRW1q60psMCkCd3a0Qj6GN01bFJMeXsTypjRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOABw0XsHEsDfaR51QoGUqXHJirylgr+NEe8Y7ujDovzGxUPHCF0xIWM6r5r3c2KY7p44JhVoxDgzfSZxJtPPVYNEncJL0j/ogvll0SXY9BPBHLtunTGvAFMPEGck8cjw6y0Sl1JgT4jzR2Ze4PYxTSB7yiAA/dNonGOk4mcnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=U9AzbCJA; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1748368305;
 bh=NxuLAslpzoOd596xivdPI/5y/Es3Nx0sBx/hh0IoOiQ=;
 b=U9AzbCJABG0cp4H9+u4Xts1SjnJZeGQ4o0+n+r+HJgVEDIlk9eGWpuhO2BZzlGDYE8NpfL/8w
 /jYCHGRLp/njaM3B9fS9q9SJWnJykXwHLuyCclPcSlrM0SEQSRHw05ejcUDkTsMecaDJzb/8R6n
 BPyvfOckCMV04aScZr5pSA82w6n//Ln1L+fcj/0RkB9oVkMS+AKP+NaHuY6N72/VabHxZTauI8k
 zPvnyAh/2O1wJ3sat0C0kLYPAgfV0KONPdHQswMrWFgcFltdlhfh3DU5IJZ1DaxBNHF7a6/Wp98
 JvfzqcQqfvtj3eoMDNG7ksfDlTNfMmjTr8xhXIfnNofg==
X-Forward-Email-ID: 6835fba8127b2e865ab3d1d9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a787e6e0-d4ce-45e3-8263-2489585d3ec0@kwiboo.se>
Date: Tue, 27 May 2025 19:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: Switch to using structs instead of writel
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250527150043.174415-1-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250527150043.174415-1-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 2025-05-27 17:00, Detlev Casanova wrote:
> In an effort to merge the rkvdec2 driver [1] with this one, switch from
> writel() calls to using structs to represent the register mappings.

Please wait with this until HEVC support has landed, now that H264
4:2:2/Hi10 finally have been merged I was hoping to be able to send a v2
of the old HEVC series [3]. I was waiting on v6.16-rc1 before sending
the series but can send it sooner if needed, [4] has current state of v2.

H264 4:2:2/Hi10 and HEVC have been in the works for a few years now,
would be nice to have it fully land before refactoring starts ;-)

[3] https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kwiboo.se
[4] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-hevc-v2b/

> This is done in order to have all supported decoders use the same format
> in the future and ease reading of the code.

Do you have any work-in-progress patches for this?

> Using structs also improves stability as the hardware is tested and
> validated downstream using a similar method.
> It was noticed, on decoders, that:
>  - Some registers require to be writen in increasing order [2]
>  - Some registers, even if unrelated, need to be written to their reset
>    values (it was the case here for axi_ddr_[rw]data).
> 
> Using structs can also help improving performance later when, e.g.
> multicore support is added on RK3588.

Are your referring to the linked-list feature (also present in e.g.
RK3328) or just for multi-core purpose?

Regards,
Jonas

> Performance seems to be slightly improved, but at least, not made worse.
> Running fluster's JVT-AVC_V1 test suite with GStreamer on the Radxa ROCK
> PI 4 SE gives the following times:
> 
> Before this patch:
> 
> - --jobs 1: Ran 129/135 tests successfully               in 77.167 secs
> - --jobs 6: Ran 129/135 tests successfully               in 23.046 secs
> 
> With this patch:
> - --jobs 1: Ran 129/135 tests successfully               in 70.698 secs
> - --jobs 6: Ran 129/135 tests successfully               in 22.917 secs
> 
> This also shows that the fluster score hasn't changed.
> 
> [1]: https://lore.kernel.org/all/20250325213303.826925-1-detlev.casanova@collabora.com/
> [2]: https://lore.kernel.org/all/20200127143009.15677-5-andrzej.p@collabora.com/
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 168 +++---
>  drivers/staging/media/rkvdec/rkvdec-regs.h | 567 ++++++++++++++-------
>  drivers/staging/media/rkvdec/rkvdec-vp9.c  | 239 ++++-----
>  drivers/staging/media/rkvdec/rkvdec.c      |   1 -
>  4 files changed, 559 insertions(+), 416 deletions(-)

[snip]

