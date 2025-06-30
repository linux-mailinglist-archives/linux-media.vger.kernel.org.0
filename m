Return-Path: <linux-media+bounces-36286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31420AEDE83
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E15B51698E9
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9C028B4FE;
	Mon, 30 Jun 2025 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d71zoHgN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53C26CE0A;
	Mon, 30 Jun 2025 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288791; cv=none; b=PFk7b0bbwvk9mCS2HcyxIXBPW9N0Q0r+b+5KSdChQI7hqH1w4P0da4EW66VoNqvMiNHDf3tmLrW7QOzlTI5aMwqVBsdt9i3SgIk3J7y5EGHCBjS0WWXS9qIYLSfH+KXSxu9pCjHm8kndBNsWbZN1qdacXuBQ8uE2tZZfqziAamc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288791; c=relaxed/simple;
	bh=+lcYT3Qsyi5zoHaSuGNHweYKALQqdJG5Jboo6FTA39A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmJ/AEmHR3MPZs25iAy7nm1iZLNHa+gvTCKWJD+qYnMo6twa9vb97yYXyod9t9SZHBE7BeXn03Qdnv09wK6+QA+T0cic5T6vW1H/kPLslzk3T9VyitXgJfJ8P0bXOH2u5g4eLJeDKEexPJzKNvl1HdV8Mec22UMLYon1o6okC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d71zoHgN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8DBC4CEE3;
	Mon, 30 Jun 2025 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751288790;
	bh=+lcYT3Qsyi5zoHaSuGNHweYKALQqdJG5Jboo6FTA39A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d71zoHgNy/pl9vjL0hhHZWmHnTsNmwLJuVF7hIncktBn+EtUCY+of2fUtbdLlnmpe
	 kWGaplFqYlQBjDkMJX2VH2wyg9vde8Kpmh47s3MbvVOCb+v8LHNzSjUJ8EYfWZzcRp
	 w9GZytrkbnhLzTkacvEepDpeB0e9oyW52xKXLicLHXFDYHdVGZQadRlHSfFoNZgmIc
	 cms9p8RFQ5Jh71f7A8vrkabwcPMxSTdv9OSjJCS16D4RzLFwEj5m527TB6L8OcGTMp
	 /AxOJ0Qbsu2VZvBuJKddT8giO3Hz9AOVLuM3dxEnMpkhx84815P+z+O5e5ZCSJmQl1
	 Y8IMnXUBJ5vQw==
Message-ID: <128433cb-b8c0-47cb-8cc8-0c625d3984f8@kernel.org>
Date: Mon, 30 Jun 2025 15:06:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: core: export v4l2_compat_translate_cmd()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
 <20250602-uvc-grannular-invert-v2-8-c871934ad880@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-8-c871934ad880@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 2-Jun-25 3:06 PM, Ricardo Ribalda wrote:
> v4l2_compat_translate_cmd() can be useful for drivers to convert between
> the VIDIOC_*32 and VIDIOC_ defines.
> 
> The VIDIOC_*32 defines are not accessible by the drivers, they live in
> v4l2-compat-ioctl32.c.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Hans Verkuil with newer versions of patches 1-4 now merged
through other patch-series patches 5-9 are now ready for
merging.

This will require merging this core patch through the UVC
tree, may I please have your ack for this?

Regards,

Hans



> ---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 8c07400bd280dea5d2e66e2759658c423bcd3866..ced4892b42597d605887b7c6a14373e3922f7bc6 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -929,6 +929,7 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
>  	}
>  	return cmd;
>  }
> +EXPORT_SYMBOL_GPL(v4l2_compat_translate_cmd);
>  
>  int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
>  {
> 


