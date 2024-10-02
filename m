Return-Path: <linux-media+bounces-18962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98098CE27
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6C281F22936
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 07:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C0C194152;
	Wed,  2 Oct 2024 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qtost9Ro"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5595D517
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855584; cv=none; b=dH9R7NZebPoiRx/yWXEbhkfsvnjvxnMCGJ6G9sO/zPZcCyW/4VQd6ee+oCHoU5n4Nz8hqR9b9t6pXug88MUV1BOn3+4n9Pu536jbiBA5LNesMuG9ODetIPcKCCwj0C1nUtSznqJLX4ionYrSr9jOCFPPt66jkc2SKPCa99SQ9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855584; c=relaxed/simple;
	bh=Bw3cp1SAl+31gU6SsjGyrlUSSXbxvPTzMqQ05ikXuTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyryhTG6yu1CD4xzb//C7I+tPzXGHZ7QrbwqApLJY4Un2p7PVBtBkaMHQPywXJmz05r7NWgJiq8z671q9w3aekf3Td3xlw9uQMDrE9rPD7lmOY//x9PrI5QmN/urlNOW/rEND9TGkcXTjFiBOzZPye1FE6f0GqshN5kpP9u6z10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qtost9Ro; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548115A5;
	Wed,  2 Oct 2024 09:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727855488;
	bh=Bw3cp1SAl+31gU6SsjGyrlUSSXbxvPTzMqQ05ikXuTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qtost9RowexhLOTKIQTTGJ9TOapQwl5S6UWUYHjsALBA6HMpaTie6qxhFIy4IzR2Q
	 paa94Jfd7q1Pk7maXxEF3reKhf+W3WYgExctiZKAjA3+N5xS51HDbrJooIJ/2/w5OT
	 esMzydyIjXmbfvOYvrtz8uyh4ofWhZ+hrr36LoG8=
Message-ID: <f9fc1487-506b-42c9-8efd-21a25ee221ef@ideasonboard.com>
Date: Wed, 2 Oct 2024 08:52:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-2-dan.scally@ideasonboard.com>
 <OSZPR01MB701948643B700433EB24EDBFAA772@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <OSZPR01MB701948643B700433EB24EDBFAA772@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Prabhakar

On 01/10/2024 21:07, Prabhakar Mahadev Lad wrote:
> Hi Dan,
>
>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>
>> The Renesas Camera Receiver Unit in the RZ/G2L and RZ/V2H SoCs can output
>> RAW data captured from an image sensor without conversion to an RGB/YUV
>> format. In that case the data are packed into 64-bit blocks, with a
>> variable amount of padding in the most significant bits depending on the
>> bitdepth of the data. Add new V4L2 pixel format codes for the new formats,
>> along with documentation to describe them.
>>
>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>> ---
>>   .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
>>   .../media/v4l/pixfmt-srggbnn-cru.rst          | 143 ++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-common.c         |  12 ++
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |  12 ++
>>   include/uapi/linux/videodev2.h                |  16 ++
>>   5 files changed, 184 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-
>> cru.rst
>>
> When trying to build the htmldocs I get the below warnings, is this expected?


Oops - no, sorry, not sure how I missed those! When you've posted your next version I'll rebase this 
series on top, and I'll fix these warnings then.


Thanks

Dan

>
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sbggr10
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sgbrg10
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sgrbg10
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-srggb10
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sbggr12
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sgbrg12
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sgrbg12
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-srggb12
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sbggr14
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sgbrg14
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-sgrbg14
> linux/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-cru-srggb14
>
> Cheers,
> Prabhakar

