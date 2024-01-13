Return-Path: <linux-media+bounces-3666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262182C931
	for <lists+linux-media@lfdr.de>; Sat, 13 Jan 2024 04:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E1F9B2363F
	for <lists+linux-media@lfdr.de>; Sat, 13 Jan 2024 03:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BBE8F5A;
	Sat, 13 Jan 2024 03:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bNhnIYCT"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248163A0
	for <linux-media@vger.kernel.org>; Sat, 13 Jan 2024 03:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 652DC869F7;
	Sat, 13 Jan 2024 04:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1705115120;
	bh=7hS/sZQEzqKVZ5F6rUVJbKiIqs3Qz4mZBjgiYql4CjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bNhnIYCTqradW35UqONDmybB4ZkKC4rQWKa8BJwxuaRRBdesnB4lmJVuqVOipS3Tk
	 YrZX7QDh5PirBgj6O4wCxygaNwUKJhfMWtSN22NBzRioZUG7OH3bsyjuitGOYfRshy
	 IxDCs3t3q/Df8byAyUuDfh+bL9agmFf4vm5loSWCAxT/PMNKP17V23DknB3YJMU05H
	 AZcKB+S8wC7NHeJ4X82j5rhZzsgSkYgf9VQT5ObYldIDuF/4g9RBhKyYpekFIn2YlC
	 NrfbTFiVSpDIluZmY0I+SQrI9gC7vX4peIXNHKshBgm88xF8W5fQCuIsd8qBCfNbvg
	 Dh6lFCvjzJtnw==
Message-ID: <02d09c57-92d8-47df-9412-d8ceef34478b@denx.de>
Date: Sat, 13 Jan 2024 04:05:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: nxp: isi: Check whether pad is non-NULL before
 access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20231201150614.63300-1-marex@denx.de>
 <20231203165959.GA22111@pendragon.ideasonboard.com>
 <170499538140.3227220.17574476088989803181@ping.linuxembedded.co.uk>
 <20240111175231.GC6806@pendragon.ideasonboard.com>
 <20240113000359.GA5439@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240113000359.GA5439@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 1/13/24 01:03, Laurent Pinchart wrote:
> On Thu, Jan 11, 2024 at 07:52:33PM +0200, Laurent Pinchart wrote:
>> On Thu, Jan 11, 2024 at 05:49:41PM +0000, Kieran Bingham wrote:
>>> Quoting Laurent Pinchart (2023-12-03 16:59:59)
>>>> Hi Marek,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Fri, Dec 01, 2023 at 04:06:04PM +0100, Marek Vasut wrote:
>>>>> The pad can be NULL if media controller routing is not set up correctly.
>>>>> Check whether the pad is NULL before using it, otherwise it is possible
>>>>> to achieve NULL pointer dereference.
>>>>
>>>> Could you share more information about how to misconfigure the routing ?
>>>
>>> You simply do 'nothing'.
>>
>> The default configuration should be working one. I think that should
>> then be fixed too (in a separate patch).
> 
> I managed to reproduce the issue (I had to heavily hack libcamera, by
> default it would reject incorrect configurations before triggering the
> kernel bug). The default configuration of the crossbar switch is fine,
> this patch is the right fix.
> 
> I'd like to expand the commit message with a clearer description of the
> erronous configuration. Marek, are you fine with the following commit
> message ?
> 
> --------
> When translating source to sink streams in the crossbar subdev, the
> driver tries to locate the remote subdev connected to the sink pad. The
> remote pad may be NULL, if userspace tries to enable a stream that ends
> at an unconnected crossbar sink. When that occurs, the driver
> dereferences the NULL pad, leading to a crash.
> 
> Prevent the crash by checking if the pad is NULL before using it, and
> return an error if it is.
> --------
> 
> If so I'll update it locally, no need for a new version.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sure, go for it.

