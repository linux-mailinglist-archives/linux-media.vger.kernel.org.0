Return-Path: <linux-media+bounces-41035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8070B3451D
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 17:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 286F65E631E
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 15:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA112FABE8;
	Mon, 25 Aug 2025 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVCgiQI/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2E4F5E0;
	Mon, 25 Aug 2025 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134221; cv=none; b=do5M5oY+P6n3AdzsQ9hAeds02WyrhJS/z2gEkDJP30XA1o+TbUU+ccIqKtVRQp1hiFbVUC5Zd1GOoCPZVFfARFQYsZ9sqTsCtEIGUpaxxmLoQUaXHYjMrupTJH+9oa4kEm7KK3AM2BRSSMEKvHfOIOo5vo/klw7XSRmMW2WTCCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134221; c=relaxed/simple;
	bh=/6434cGRG6xhVaYAodzJAow67yHRlc+kJh1IrmSZiyk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XkXSwWJ98qiu1IB0yB9BdhsatNP4hkJcFZ1LbBvZXlc3/EcUDq7aVLcao6+8vsj2hF2WJwswc0HEvgYtB6Q401lVnx++NyqXpNmgA6H3axSABxhm0dj2lc1/qwRHLEdceUBOoDHajOMAIEDBi9qHGbIZohb2DbrQut+pjku3ZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVCgiQI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C28EC4CEF4;
	Mon, 25 Aug 2025 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756134220;
	bh=/6434cGRG6xhVaYAodzJAow67yHRlc+kJh1IrmSZiyk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=AVCgiQI/yD5h9exkXhAVT3F8qQUsOBEAdT+ChMza5jpW+bouNHFNrvjmjZtLa3xmz
	 jxUYGochN37VnQ0G6MIbbUQXchbyxKEq7xTEDTNCjCSnQhY/wcqyGadZvPoDO1tocc
	 giQd3vT9mnWiSO4x+RqueIwiVvAt0FBchi4zpjprdW3h5sLr3egKq6zi0lVuOkO1s2
	 hE72QmDCs14TzI9vZQK3TuzKylpolsildB/JSTQ8YZE1GD/WbO7trKJPgNkHFm0cWm
	 yp5EqObPu+ybTmC6BRu47/i9lBV7/WAjZ69wryakEV4LznfTrxs6KZnV9LmLbhGfI4
	 q8Vnk5rXdkeIw==
Message-ID: <7ce56415-77d9-4952-bf7a-a8610d393ded@kernel.org>
Date: Mon, 25 Aug 2025 17:03:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: pci: mgb4: Fix timings comparison in
 VIDIOC_S_DV_TIMINGS
To: tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20250804092032.1639-1-tumic@gpxsee.org>
Content-Language: en-US, nl
In-Reply-To: <20250804092032.1639-1-tumic@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/08/2025 11:20, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> Compare the whole v4l2_bt_timings struct, not just the width/height when
> setting new timings. Timings with the same resolution and different
> pixelclock can now be properly set.
> 
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---
>  drivers/media/pci/mgb4/mgb4_vin.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
> index 989e93f67f75..15182549d108 100644
> --- a/drivers/media/pci/mgb4/mgb4_vin.c
> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
> @@ -610,8 +610,8 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
>  	    timings->bt.height < video_timings_cap.bt.min_height ||
>  	    timings->bt.height > video_timings_cap.bt.max_height)
>  		return -EINVAL;
> -	if (timings->bt.width == vindev->timings.bt.width &&
> -	    timings->bt.height == vindev->timings.bt.height)
> +	if (!memcmp(&timings->bt, &vindev->timings.bt,
> +		    sizeof(struct v4l2_bt_timings)))

I would recommend calling v4l2_match_dv_timings() instead.
Otherwise you would also match on the reserved fields and 'standards'
and 'flags' fields.

Regards,

	Hans

>  		return 0;
>  	if (vb2_is_busy(&vindev->queue))
>  		return -EBUSY;
> 
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8


