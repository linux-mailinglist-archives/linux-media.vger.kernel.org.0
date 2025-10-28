Return-Path: <linux-media+bounces-45758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 390BEC13891
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6B384F1C27
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DDB2D7D42;
	Tue, 28 Oct 2025 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGyAmb+J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521D124C068
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639933; cv=none; b=I9P/RIXy3kvfxO99HW0G2QdS2QKGpy06KWf/ZOoGj+MmvGxUv/RzSIGdx59327sjVYMqmC3iNCLiwXuqqBYV0xiGkvhyN4hP7fgCPCY+6+kgsLRJO5RnqyGcZw5viSnmKs0bJ1BbM0HrgSPALuPz1tyhJ9xXaMgrwfcyz8sHAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639933; c=relaxed/simple;
	bh=FFEInrUMaePu0fUKsZqyBiQiSIQ0iyJM6skPoIHq5tw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NXoofXLqcb1mcuGwGeZVmXKFWVXQMJJITffTGjK/hrrkAOJODifdge4gJ5oIgbaC45IV6ukZ2R+s7mRn27i583lvXWChec8Qs5t6usC34aRDtgWkZvQp7SoiiFb+2OAmLpDdtwBXyOdGF1DrHD3z+Pp+5yY2KFjmw/2z/qV4Hbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGyAmb+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A935C4CEFF;
	Tue, 28 Oct 2025 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761639932;
	bh=FFEInrUMaePu0fUKsZqyBiQiSIQ0iyJM6skPoIHq5tw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=lGyAmb+JJSlf0Ci2T29Fob32l+Pbx1Dyy38Cy4fy/gO1SZWqg5bPi1lT+k+12dmMR
	 acpevjdThDNke63lm6RkAXK2uifP0b1bt56mUhXg/2mCb4ufhhQ60nOzYs9CWpCC7i
	 HfEdQYxzKnfl5xfXoY2yqA0C09H/V0Yw2tWvWXBfzp5PE7RA3B9ke1jFYGKdBLmRBc
	 4RfBG1GiQHqcrulsAiRSSTnT2euPKcmjKUvwjCTgfpsJxgw4mJGbHL6DQVIX+Nc6iz
	 ca3azpsG17zKdoKxzAD8wxttgM/JHrnLpVO+GrgnhVowSfM0CJ9BIX0FwpZR5ASYOL
	 3v+OIo98mV1mQ==
Message-ID: <8bc5196e-9a40-44da-941b-f5f42608c74f@kernel.org>
Date: Tue, 28 Oct 2025 09:25:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv6 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
 <1495ec4ccdcdfab788fa9d02e11a6028a455e31b.1761571713.git.hverkuil+cisco@kernel.org>
 <aP_s8D35617s6JWU@gofer.mess.org>
Content-Language: en-US, nl
In-Reply-To: <aP_s8D35617s6JWU@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2025 23:06, Sean Young wrote:
> On Mon, Oct 27, 2025 at 02:28:31PM +0100, Hans Verkuil wrote:
>> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>
>> As the media subsystem will experiment with a multi-committers model,
>> update the Maintainer's entry profile to the new rules.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> 
> I've read it and I only have some tiny nits, looks great.

Thank you!

> 
> Reviewed-by: Sean Young <sean@mess.org>
> 

<snip>

>> +It could be wise to also copy the Media Maintainer(s). You should use
>> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
>> +Please always copy driver's authors and maintainers.
> 
> git config for using scripts/get_maintainers.pl is useful
I'm not sure I understand what you meant with this.

Regards,

	Hans

