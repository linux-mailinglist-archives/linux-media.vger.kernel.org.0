Return-Path: <linux-media+bounces-42217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89E1B51829
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B0A3A9202
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB63A31E0FC;
	Wed, 10 Sep 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ir12cP0g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2707A1F03C9
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511819; cv=none; b=H3QtRSkzaqkJ/6DRrqHDVPhdjl72TEA5tVUlvXTO6rc6uuWCZozRP3Ss+pHv8BtQrHn9E7/mAZRJuBKGHb+6K0sZbKh/rK3GjPSoC3zmMSvl/zc3Le6Mc1hxcik0DHXuzmLyGrrfj9cnILTi8W7kklnK2UddddmueOSnUf8d7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511819; c=relaxed/simple;
	bh=tGSng5ZtiVl2CWAwXIVoFRRk83UYx4H6V+IPAtAC4mg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bYhPt7EYtxyiqQOkoQUT+TL83swbeu6pzLzPgWqNtoxcr9IW5zUBe9/Qn4eGOpeHSVHLeKvRnRFpHme3XdzHinFFQb+Hyn8B0+p7WazWfCqXyHH8KgSu9kiYZzmLdTjdH0JfArUnxj6V7CKgr52Djn2MN4Q9HojVRtoqyPuZX2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ir12cP0g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3FCC4CEF0;
	Wed, 10 Sep 2025 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757511818;
	bh=tGSng5ZtiVl2CWAwXIVoFRRk83UYx4H6V+IPAtAC4mg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Ir12cP0gAv4hlH9RCuU8h8/iLfwUbyaUHf96+C2fVfFESrD59JZVvs9AOVkgKCeDQ
	 iYZZsX58UxDCXRNEnnXUvwmWj68ddYFEor1ed+n94B+6ewHvQIgBqZlX9veWccMCWu
	 q+Og1kFKFj9i2Mx78paib+FOdidm/QFBIg94uzpSDCeiu9bRQn8dJpIHAUN7INt0E5
	 IeElTBWbr3ewsVzetNwPqmcFW5PNxxNHLbHzZVk/woM/5/1HahKS7PuXFw7YSdGx38
	 +wI8+9kM0/xNXQKyMi5+Wx73C4g1lqYokWK/VX4ltjal6FoH8TW0BI1gQJtjJmjjSd
	 5T4wIOE4efp9Q==
Message-ID: <662fdd61-2bca-4ff9-88d1-c1cd9bab2a9b@kernel.org>
Date: Wed, 10 Sep 2025 15:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils] fix meson target directories
To: Yarny <Yarny@public-files.de>
Cc: linux-media@vger.kernel.org
References: <867c4d2e-7871-4280-8c89-d4b654597f32@public-files.de>
 <ef93df83-9eaa-4cf8-8449-f41ce9a23d79@kernel.org>
 <6e715f4f-4eea-467a-9584-af4fc58c6e1d@public-files.de>
Content-Language: en-US, nl
In-Reply-To: <6e715f4f-4eea-467a-9584-af4fc58c6e1d@public-files.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2025 15:42, Yarny wrote:
> Dear Hans,
> 
> Signed-off-by: Yarny <Yarny@public-files.de>
> 
> just like that?

Yes, that's all I need.

	Hans

> 
> Thanks -- Yarny
> 
> 
> 
> Am Mi 10 Sep 2025 um 10:38:11 schrieb Hans Verkuil:
>> Hi Yarny,
>>
>> In order for me to take these two patches I need your Signed-off-by line.
>>
>> Just reply to this email with that line and I'll add it.
>>
>> Regards,
>>
>> 	Hans
>>
>> On 22/06/2025 17:35, Yarny wrote:
>>> Hi linux-media,
>>>
>>> please find attached two patches for current v4l-utils
>>> master branch that fix packaging errors with meson.
>>> I stumbled over those bugs while I tried to package
>>> v4l-utils within the NixOS linux distribution.
>>>
>>> Thanks and best regards -- Yarny
>>
> 


