Return-Path: <linux-media+bounces-26447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0CCA3D7A7
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 296DD3AF45F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 11:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF6C1DA10C;
	Thu, 20 Feb 2025 11:01:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B642862BD
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740049292; cv=none; b=eNdML3YuTevyXxzXX0P4re2Sdp4x6gV9kBaOq4MxKmd3IaVTwHNiAMSk0beJKMGuzmd02NTs+d3nNkK9GOhGTh0Q0GZHQiTks/LB5axErDBZV5sGj810b5NE6+xDdwY9yHun8Eb6+z0u6EhdTPF6+VqJzArbTxufKGjXJmxR5E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740049292; c=relaxed/simple;
	bh=0gmfakdTtXszXzZg2nEVd3zo3OoQ3H+9cuUz5NyngfI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=V6T3QZjpeVBi09qsrR5ffpcI7wBM3v3k476Ra6ZlSwTspckXFQBz/AARpDUYl47FZVkoBNTDiDwxJl/T6VTkputULJ3QdJrEGrYsF38G1YdrMocCUE8JBRxF2oOwUCfo4XRPGP+MmcZOzBUACvANVtzNbX2ht3zrynSXKUupKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE314C4CED1;
	Thu, 20 Feb 2025 11:01:30 +0000 (UTC)
Message-ID: <2108d667-243b-4d0f-bf78-5a90e9a8efb1@xs4all.nl>
Date: Thu, 20 Feb 2025 12:01:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.13] FIXES: Vcodec fixes
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-media@vger.kernel.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241213151415.7opofgiz25lpmn5m@basti-XPS-13-9310>
 <88b4fb25-64a2-462d-b40e-eae675ea83f3@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <88b4fb25-64a2-462d-b40e-eae675ea83f3@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2025 11:15, Hans Verkuil wrote:
> Hi Sebastian, Arnd,
> 
> While cleaning up patchwork I stumbled on this PR.
> 
> The odd thing is that the second patch (noinline) is committed, but not the first (avoid warning).
> 
> Is it still needed? I'm not sure what happened here.
> 
> The patch is still marked as 'New' in patchwork:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20241018152127.3958436-1-arnd@kernel.org/

Apparently this just got lost somehow. I'll delegate this patch to me and queue it up
for v6.15. I don't think this needs to go to v6.14 since I understand it just kills
a warning.

Regards,

	Hans

> 
> The already committed patch was also still marked as 'New', I've changed the state to 'Accepted'.
> 
> Regards,
> 
> 	Hans
> 
> On 13/12/2024 16:14, Sebastian Fricke wrote:
>> Hey Mauro & Hans,
>>
>> this is my first time doing a pull request for the fixes branch, so
>> sorry in advance if I did something incorrectly. These are two small
>> fixes, which I would like to see landing in 6.13 if that is still
>> possible.
>>
>> ---
>>
>> The following changes since commit 2dd59fe0e19e1ab955259978082b62e5751924c7:
>>
>>    media: dvb-frontends: dib3000mb: fix uninit-value in dib3000_write_reg (2024-12-11 17:54:19 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.13-vcodec-fixes
>>
>> for you to fetch changes up to 531a8089b1f45cccd6e9a959bfbd20ecccdb56d4:
>>
>>    media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline (2024-12-13 16:10:18 +0100)
>>
>> ----------------------------------------------------------------
>> Two small fixes for VCodec
>>
>> ----------------------------------------------------------------
>> Arnd Bergmann (2):
>>        media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
>>        media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline
>>
>>   .../platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 3 ++-
>>   drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c  | 6 +++++-
>>   2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> Regards,
>> Sebastian
>>
> 
> 


