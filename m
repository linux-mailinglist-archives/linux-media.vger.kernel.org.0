Return-Path: <linux-media+bounces-44992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF5BEFC75
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC21D3ABD72
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2512E8B8A;
	Mon, 20 Oct 2025 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIHtvVS8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FB1E5714;
	Mon, 20 Oct 2025 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947231; cv=none; b=QeSjt5x9KZOFYJsGk2vrK7G64FSsJqOBaZ0Md+jF99uAmLfEgyJiyKzT0LH+puCre+x2PF1JkA98wxWH1BffDS80bHYNJPSqJq5jya8Jxai08n8g+WDp4bKWYB4UqxPKm3oWZxXq7US6q4Ik7xBNVCRYihsD+TsFlvq4j6To7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947231; c=relaxed/simple;
	bh=oxTsEZNcCRM2MbquX858byUNBfGllkNwCkvH7uNCp3w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fO1OE5niP8X94XAXxcP2IetpxnYFh4zmvroMkbMX9Y1Qp1yGWiUjrQb77jxaMz0fwpF4RpJxWL/KrTY5USZ2S//FXvF/kAAMgvwg/WcOXTapxjDrDhHa0DznjpujutRRKGfw1KFQC+i166RofoC4J7Fftv9GYn5iYjeq6+SbXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIHtvVS8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84C4C4CEF9;
	Mon, 20 Oct 2025 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760947231;
	bh=oxTsEZNcCRM2MbquX858byUNBfGllkNwCkvH7uNCp3w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=JIHtvVS8M7hWiiY8UyP0/X00PetcC91dKxdzBI9/Yc8KhId0baP4Df5++aDhWrKmG
	 4cyLXcombWW5up84IfVG5dzxM4OcKXv08txPJacGUraTaXsB+e+vNulHFkCMsZ2Xc6
	 T9rwbcBJ8MvFcowZ1E4G+9oXc9skJC9yEndzBsXdKjRmNEbVih0VWMKrZB0Q42L7fP
	 S7ROf/hX4xKTi35HfVl98O/x5zswFP4PQcQWrF/H57MBRnZBD1fy444n7vubHTOiV8
	 rRqDVutVmSPWvPjOuK6IkJ1nlsabQRRFv+9zW23PPHK3N0Y20rO3KO/aolkLY9BBe3
	 OIdd85y0SNo+g==
Message-ID: <89f7760b-aee5-4e34-861f-1aa6869130bd@kernel.org>
Date: Mon, 20 Oct 2025 10:00:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: renesas: fdp1: Use %pe format specifier
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251020-ptr_err-leftover-v1-1-150b0f8b46b9@chromium.org>
 <176094702701.935713.13430509417971695210@ping.linuxembedded.co.uk>
Content-Language: en-US, nl
In-Reply-To: <176094702701.935713.13430509417971695210@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2025 09:57, Kieran Bingham wrote:
> Quoting Ricardo Ribalda (2025-10-20 08:53:41)
>> The %pe format specifier is designed to print error pointers. It prints
>> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
>> omitting PTR_ERR()
>>
>> This patch fixes this cocci report:
>> ./platform/renesas/rcar_fdp1.c:2303:4-11: WARNING: Consider using %pe to print PTR_ERR()
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Thanks, same as the others:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I'll try to fast-track this patch today. It's good to get this all in.

Regards,

	Hans

> 
>> ---
>> It seems that we missed this file from the original patchset.
>> https://lore.kernel.org/linux-media/20251013-ptr_err-v1-0-2c5efbd82952@chromium.org/
>> ---
>>  drivers/media/platform/renesas/rcar_fdp1.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
>> index 3515601030eccefe3d979303893c93c85ab0a9b2..672869815f636de25ce08261bf327f156b617a37 100644
>> --- a/drivers/media/platform/renesas/rcar_fdp1.c
>> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
>> @@ -2299,8 +2299,7 @@ static int fdp1_probe(struct platform_device *pdev)
>>                 fdp1->fcp = rcar_fcp_get(fcp_node);
>>                 of_node_put(fcp_node);
>>                 if (IS_ERR(fdp1->fcp)) {
>> -                       dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
>> -                               PTR_ERR(fdp1->fcp));
>> +                       dev_dbg(&pdev->dev, "FCP not found (%pe)\n", fdp1->fcp);
>>                         return PTR_ERR(fdp1->fcp);
>>                 }
>>         }
>>
>> ---
>> base-commit: 8652359fc004cbadbf0e95692c1472caac6260c2
>> change-id: 20251020-ptr_err-leftover-1997b3a6e06e
>>
>> Best regards,
>> -- 
>> Ricardo Ribalda <ribalda@chromium.org>
>>
> 


