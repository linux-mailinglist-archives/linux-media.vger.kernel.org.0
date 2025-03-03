Return-Path: <linux-media+bounces-27310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA321A4B5D9
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 02:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E288E16ABC4
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 01:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4327F81AC8;
	Mon,  3 Mar 2025 01:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b="tcMNMSKy"
X-Original-To: linux-media@vger.kernel.org
Received: from omr011.pc5.atmailcloud.com (omr011.pc5.atmailcloud.com [103.150.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D92C181
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 01:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740966482; cv=none; b=B2G9eWZ4DJSaoD2zOWy7uHKkvmFHCZSd/1bFRaiHn7cYimFdy817fe08cer+1iGQ7abgDIfGTx9WucqsjME65sJQeeMhZJgUFP2cSvMmf/De+mY7c6V6frG9BOG0zt04tHDkfA8am26U80O3YtI1gg8t3YJTurNZK+WKbVyzssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740966482; c=relaxed/simple;
	bh=AjJQPDMTIWH9VsuoPcd4DZoS/DZaLbyXdqNmFXlC9Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VEf/3YnhzLpWW0j05VkY7a53m70EUTW1XdDfjHHkAaSdlSff1ZEv6TuR8WjIFnXMwFRylapBiA3aQIkFiDvPlOHs5VF+XAsqtRrppmzjBx4fch9pn+t8HT7KK8jgkxiEk7N7ILxKqnTa2AHxzfjorJ4MlkU7xVeWb+AfbWNd4bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net; spf=pass smtp.mailfrom=internode.on.net; dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b=tcMNMSKy; arc=none smtp.client-ip=103.150.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=internode.on.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=internode.on.net; s=202309; h=Content-Type:From:To:Subject:MIME-Version:
	Date:Message-ID; bh=UR0qvSDR7j+Oc2g07oaSfNCuZHMQW2Bu2tZLA1bRWb4=; b=tcMNMSKym
	jfhJKi0Y+TNi+Z6rD3TTwWeJCHr4VehO0XJFF0G+J9fEfVuU9gAnFYEZnzomvME2yJxWS+OwQBo28
	ll6z9l2gAjZwIoq8sCVnuqLCb36dEaGZucnbvJn4AwKs1WzKT1bjI//r8Hse3JLCnM+g2M2MyM4XU
	2P8L8FKrxHgdLC2ogXPQY58u3OD9bviTfRg7F4s/bUls4PAUOMOtoffU5JeToWc5f9ATHbbM0pLh5
	T6BdMajFIRJwtAcKUm+UV5Vra8HPfzHHchBzfw3bcO6fmagU35QgWgt3SlEfU6pA8/kqkaTPsuGtL
	Y7Nmkgs5I+gkExsvCJdCUZdkw==;
Received: from cmr-kakadu01.internal.pc5.atmailcloud.com (cmr-kakadu01.internal.pc5.atmailcloud.com [192.168.1.3]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu01.i-0ea7125b3bce8496e) with ESMTPS
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1touKJ-000000007vz-48UJ ;
	Mon, 03 Mar 2025 01:10:35 +0000
Received: from  ([10.1.1.121] [14.2.113.215]) 
	by cmr-kakadu01.internal.pc5.atmailcloud.com (Exim/[10.1.1.121]) with ESMTPA
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1touKJ-000000004og-2x3u ;
	Mon, 03 Mar 2025 01:10:35 +0000
Message-ID: <b08c4962-e224-443e-b0f1-3262c850643f@internode.on.net>
Date: Mon, 3 Mar 2025 11:40:26 +1030
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for v6.14] media: rtl2832_sdr: assign vb2 lock before
 vb2_queue_init
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <51010d80-56a6-4803-82bb-6632ca7f1ae2@xs4all.nl>
Content-Language: en-AU, en-GB
From: Arthur Marsh <arthur.marsh@internode.on.net>
In-Reply-To: <51010d80-56a6-4803-82bb-6632ca7f1ae2@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=fO8/34ae c=1 sm=1 tr=0 ts=67c5018b a=Wf/tQxuurhLsNL74MDa1ZA==:117 a=Wf/tQxuurhLsNL74MDa1ZA==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=x7bEGLp0ZPQA:10 a=Npn9PEg5AAAA:8 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=NuCSll06hTjKIn19EKAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Cm-Envelope: MS4xfNl/4UJlu4YcDYiTxvhOtsHI5MXzTuh3uoMQNU96cfRjhUVYZBwsJ4lQ7fqM8VLsNluRR0LX+yyqZgfV5shkljhv9BlZ/WNM0Jv6WJiJ+bp23dEx5hn5 P9kgRPc7Y8Pt7t/VIeYudsLcYOcHliNtMw4WHfLTb5q6QVlJSVg1DXktBwUJE300165fdMsusnRHuA==
X-atmailcloud-route: unknown


On 25/2/25 01:10, Hans Verkuil wrote:
> Commit c780d01cf1a6 ("media: vb2: vb2_core_queue_init(): sanity check lock and
> wait_prepare/finish") added a sanity check to ensure that if there are no
> wait_prepare/finish callbacks set by the driver, then the vb2_queue lock must
> be set, since otherwise the vb2 core cannot do correct locking.
>
> The rtl2832_sdr.c triggered this warning: it turns out that while the driver
> does set this lock, it sets it too late. So move it up to before the
> vb2_queue_init() call.
>
> Reported-by: Arthur Marsh <arthur.marsh@internode.on.net>
> Fixes: 8fcd2795d22a ("media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
> Arthur, it would be great if you can test this patch!
>
> Regards,
>
> 	Hans
> ---
> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 05254d8717db..0357624968f1 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -1363,6 +1363,7 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
>   	dev->vb_queue.ops = &rtl2832_sdr_vb2_ops;
>   	dev->vb_queue.mem_ops = &vb2_vmalloc_memops;
>   	dev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	dev->vb_queue.lock = &dev->vb_queue_lock;
>   	ret = vb2_queue_init(&dev->vb_queue);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Could not initialize vb2 queue\n");
> @@ -1421,7 +1422,6 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
>   	/* Init video_device structure */
>   	dev->vdev = rtl2832_sdr_template;
>   	dev->vdev.queue = &dev->vb_queue;
> -	dev->vdev.queue->lock = &dev->vb_queue_lock;
>   	video_set_drvdata(&dev->vdev, dev);
>
>   	/* Register the v4l2_device structure */

I was able to successfully test this patch with DVB-T functionality but 
haven't tested it with SDR functionality:

[   15.946588] usb 1-6: dvb_usb_v2: found a 'Realtek RTL2832U reference 
design' in warm state
[   16.016516] dvbdev: DVB: registering new adapter (Realtek RTL2832U 
reference design)
[   16.122916] rtl2832 3-0010: Realtek RTL2832 successfully attached
[   16.122931] usb 1-6: DVB: registering adapter 0 frontend 0 (Realtek 
RTL2832 (DVB-T))...
[   16.122938] dvbdev: dvb_create_media_entity: media entity 'Realtek 
RTL2832 (DVB-T)' registered.
[   16.417228] rtl2832_sdr rtl2832_sdr.1.auto: Registered as swradio0
[   16.417231] rtl2832_sdr rtl2832_sdr.1.auto: Realtek RTL2832 SDR attached
[   16.417232] rtl2832_sdr rtl2832_sdr.1.auto: SDR API is still slightly 
experimental and functionality changes may follow
[   16.453096] usb 1-6: dvb_usb_v2: 'Realtek RTL2832U reference design' 
successfully initialized and connected

Regards,

Arthur.



