Return-Path: <linux-media+bounces-26991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01DA45252
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 02:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5DC7188DFC7
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 01:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F0B19CD13;
	Wed, 26 Feb 2025 01:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b="srnATKxU"
X-Original-To: linux-media@vger.kernel.org
Received: from omr014.pc5.atmailcloud.com (omr014.pc5.atmailcloud.com [103.150.252.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF29D199254
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740534024; cv=none; b=o9UhSqJi5q55zX0wcHmlGmJyXDIxNycfT+7LChRQ8Ryy8omV2c17GQODXe/g3SfeaCq8mjTsVPq9dvLeyV8Kxa48pszE0kOfNx2JL5kZmas4PP7gqklXjomz/ClHoldQr8tNfvTn8Ct2BfIywZImdm9+t0ptH3FyJ5ZJdzs7oEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740534024; c=relaxed/simple;
	bh=JVuP801vMkezFlsUj8BBvmKFYZm9mX/FurgVA+L2E/g=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=tARer34YR8zXsDdY5n9xCxd2VW9LlpqMa0AYlvPQCLioDyzGIXuRRN4MthMZjMuUSvNkuPCVgGc5uCijJH+atQ72D7lajs7o08oInTWIudn6KClm6e4hnle2cF+ykKY18sKfOrpTstug1r1vNRmGV29QrdfOM9zUFvMKFZV3CNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net; spf=pass smtp.mailfrom=internode.on.net; dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b=srnATKxU; arc=none smtp.client-ip=103.150.252.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=internode.on.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=internode.on.net; s=202309; h=Content-Type:From:To:Subject:MIME-Version:
	Date:Message-ID; bh=spEmLQQdxNGuLgnkq31tAx1hn5th85E+Ura7swFVOkY=; b=srnATKxUI
	1Av3A8DAOYedVv/bbQNDtjz+2VTaOQXpgD2kdDkuCXZuuu8kiLOydZ2JfZQuy73kI4C4wJzxZKgd6
	K75r6QE7ALqM1kxzMsQjWiw8O4MiswaVn+9SHUnnU1N2dGK0GW6IhmskiMr4GzL0JOy2Szep815SA
	9wuQAYsuGpOosJLAVi9/+x77H+SjpSwVQxlzSKIrxmP5MNWkX58HEb6uIKTLB1lBrr2vYbrtn5xj3
	2wkT3ssElLGI3xFp3kzxkypfdq+HzE10YXohRIGKfEPKQ12qTHzjupbDnKnaMc7/YKAV3HFprmRGn
	7DBTV3Z9d0B6T4nueJ25g9kcQ==;
Received: from cmr-kakadu01.internal.pc5.atmailcloud.com (cmr-kakadu01.internal.pc5.atmailcloud.com [192.168.1.3]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu01.i-054290e11a01c2f86) with ESMTPS
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1tn6PL-000000007tD-0zO6 
	for <linux-media@vger.kernel.org>;
	Wed, 26 Feb 2025 01:40:19 +0000
Received: from  ([10.1.1.121] [14.2.113.215]) 
	by cmr-kakadu01.internal.pc5.atmailcloud.com (Exim/[10.1.1.121]) with ESMTPA
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1tn6PK-000000002Ah-3oLq 
	for <linux-media@vger.kernel.org>;
	Wed, 26 Feb 2025 01:40:19 +0000
Message-ID: <43421671-1593-4eab-ad7c-9a9aeaa2a425@internode.on.net>
Date: Wed, 26 Feb 2025 12:10:09 +1030
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH for v6.14] media: rtl2832_sdr: assign vb2 lock before
 vb2_queue_init
Content-Language: en-AU, en-GB
References: <4ff366a2-a840-4adb-a8a1-01d631566f33@internode.on.net>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Arthur Marsh <arthur.marsh@internode.on.net>
In-Reply-To: <4ff366a2-a840-4adb-a8a1-01d631566f33@internode.on.net>
X-Forwarded-Message-Id: <4ff366a2-a840-4adb-a8a1-01d631566f33@internode.on.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=EL8A0UZC c=1 sm=1 tr=0 ts=67be7103 a=Wf/tQxuurhLsNL74MDa1ZA==:117 a=Wf/tQxuurhLsNL74MDa1ZA==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=x7bEGLp0ZPQA:10 a=Npn9PEg5AAAA:8 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=u8iaW1JCWXyPlJQa3BcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Cm-Envelope: MS4xfAEUoxpKVoq2+Z5YOHzqgUuu1Ir7/eQ1MjyS7xvFKZcvmJm94o2hmGBLTgx+JvHaEqtNkka8RPHAaUV1TrsgJbBTGEzYcfFrMuJqk0EmJzc1xLtj9kCg 4r7SjuBJa+CDd1S3DyRJCk7JX3xiR6D4vNF/ww/YctyFxK/x2qz+qp1T8Zzzjrsze81OxEEhYK47oq8Dl8Fa+GQrZ5IWhnJMqPs=
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
> Reported-by: Arthur Marsh<arthur.marsh@internode.on.net>
> Fixes: 8fcd2795d22a ("media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish")
> Cc:stable@vger.kernel.org
> Signed-off-by: Hans Verkuil<hverkuil@xs4all.nl>
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

Hi and thanks, I applied the above patch to kernel 6.14.0-rc4, built and 
rebooted into the patched kernel, and ran:


dmesg|egrep '(rtl|2832)'
[  396.972457] usb 2-3: dvb_usb_v2: found a 'Realtek RTL2832U reference 
design'
in warm state
[  397.004068] dvbdev: DVB: registering new adapter (Realtek RTL2832U 
reference
design)
[  397.194478] rtl2832 5-0010: Realtek RTL2832 successfully attached
[  397.194497] usb 2-3: DVB: registering adapter 0 frontend 0 (Realtek 
RTL2832 (
DVB-T))...
[  397.194505] dvbdev: dvb_create_media_entity: media entity 'Realtek 
RTL2832 (D
VB-T)' registered.
[  397.822338] rtl2832_sdr rtl2832_sdr.1.auto: Registered as swradio0
[  397.822342] rtl2832_sdr rtl2832_sdr.1.auto: Realtek RTL2832 SDR attached
[  397.822343] rtl2832_sdr rtl2832_sdr.1.auto: SDR API is still slightly 
experim
ental and functionality changes may follow
[  397.838919] usb 2-3: dvb_usb_v2: 'Realtek RTL2832U reference design' 
successf
ully initialized and connected
[  397.840353] usbcore: registered new interface driver dvb_usb_rtl28xxu

I haven't used the Software Defined Radio functionality, but was able to 
successfully view and listen to a DVB-T stream from the RTL2832.

Regards,


Arthur.



