Return-Path: <linux-media+bounces-35642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD6EAE417B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 233957AA44B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0669242D65;
	Mon, 23 Jun 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="R06swby5"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4601EF38E
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683723; cv=none; b=j5F4PpRhIv9Dv/1HJTHlG7kcVg45OAB5YFf9YUosl+DYfDcbbSgl4bwJQR0sDPszG4sGfgS3saIjRRBP0DQ7sr1lymYrcH7Ir8xF6VJTX4H0SXwE5/8JUv3qrCLh19g8ixe/nEbApF1ynKxbH3tD6CiIl72dgV5q2gOeVS4il04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683723; c=relaxed/simple;
	bh=9IXDvKUMHpJAPFMtTRaMzjXP6z/VFX90uD5R42vu/Gg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HF6rmoSJzk140/d+UbDV2EDtFhjviy8sgAD2HHCZFe1+ysP1M3hZZjvO24mnFDPKWopYVfpsxoD8X9VzkUaxXpmzKt5kqqR8XXspOCfi6b2R5iaHj5z4e5V4ToAfQRd+gECsVq9UG6QHNMr8xaD4zGDcazzuObbgLIOF9HeLJww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=R06swby5; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: f7ebf1b7-5032-11f0-beb8-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id f7ebf1b7-5032-11f0-beb8-005056992ed3;
	Mon, 23 Jun 2025 15:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:to:subject:from:mime-version:date:message-id;
	bh=21e9H+vtr+HKRRJNQzUbItDG60FtmkHHKs/nMR837OQ=;
	b=R06swby5WQ40/UeA0L9WBr3LXq4DzCqkDGUbDmo2J1F0YdsxHrY2kKeJxpel/91v/nqDMCAS61x+K
	 Eq7yEGSqOaoMWse5cPvLqxzL1mQ9TXoNKfcHp9t6ZD6Yw5iAJVIIHkZ+8FvAgbzCy6Adf1twzuq6Kn
	 eTQGbChy58UKT+cvBE+Jcpjmsxp0VQBu0QpP2uI1JRGqLvFAQqPaivZpwtBHXtI6YrNQg4kWDm09Sd
	 PNGYwC6w+InrRoWLlj/B1SRN1e4XCFCYywDhQ8le0l+i49Lmw3NbDyWzmilN9x2zWDfAmptsGAOmiI
	 ej6aFsz1EnPJZH1oX7D2FI/nCMSQ1GQ==
X-KPN-MID: 33|ZB1JdXEIUPDOWbDUDXP8gyIaiYGYxHnkJoCDdsnrGAr2Qqy1ZDLVSeriSI8uOIK
 ex73Aqiyq6nzQKqc+maHmLjFLE4IQs1tc8KxJmPBJvnQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|mDdcII72o/dYdq3+hkHld3d6MWmlVJyUaLvw8J8BJRwrL0twsHd64GVFfBAdXRI
 MEheuqm1eSUnUvCzkHadYiw==
Received: from [192.168.2.10] (unknown [178.74.16.2])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 154015d2-5032-11f0-afec-005056998788;
	Mon, 23 Jun 2025 15:00:48 +0200 (CEST)
Message-ID: <837d10df-a547-4f7c-8a8e-07d14616d052@xs4all.nl>
Date: Mon, 23 Jun 2025 15:00:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v4 3/3] media: Documentation: Document new
 v4l2_ctrl_handler_free() behaviour
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
 <20250623122314.2346635-4-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250623122314.2346635-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2025 14:23, Sakari Ailus wrote:
> v4l2_ctrl_handler_free() no longer resets the handler's error code.
> Document it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> ---
>  Documentation/driver-api/media/v4l2-controls.rst | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
> index b2e91804829b..fc04907589ab 100644
> --- a/Documentation/driver-api/media/v4l2-controls.rst
> +++ b/Documentation/driver-api/media/v4l2-controls.rst
> @@ -110,6 +110,7 @@ For sub-device drivers:
>  
>  	v4l2_ctrl_handler_free(&foo->ctrl_handler);
>  
> +:c:func:`v4l2_ctrl_handler_free` does not touch the handler's ``error`` field.
>  
>  2) Add controls:
>  
> @@ -191,12 +192,8 @@ These functions are typically called right after the
>  			V4L2_CID_TEST_PATTERN, ARRAY_SIZE(test_pattern) - 1, 0,
>  			0, test_pattern);
>  	...
> -	if (foo->ctrl_handler.error) {
> -		int err = foo->ctrl_handler.error;
> -
> -		v4l2_ctrl_handler_free(&foo->ctrl_handler);
> -		return err;
> -	}
> +	if (foo->ctrl_handler.error)
> +		return v4l2_ctrl_handler_free(&foo->ctrl_handler);
>  
>  The :c:func:`v4l2_ctrl_new_std` function returns the v4l2_ctrl pointer to
>  the new control, but if you do not need to access the pointer outside the


