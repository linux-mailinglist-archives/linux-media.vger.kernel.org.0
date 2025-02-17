Return-Path: <linux-media+bounces-26204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB16A37CD0
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 09:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85294170BC9
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 08:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4751A4F2D;
	Mon, 17 Feb 2025 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gdQct6sm"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045D519CC02;
	Mon, 17 Feb 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779690; cv=none; b=SUYUIYig7oR1uIPIBGfuAXgFFQciby0S18LfBfLxk4GOH+PUT/P/V269rjrJYkOaFrua7AOezY2XY0K1koEkbUDK7ACQcY24zuKr/zxtG1UUTvXmheU+173vNcafEWQtQfSI92BYExX31q/noltWFwVSbv7zd3anI0hnplGNBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779690; c=relaxed/simple;
	bh=8tZy2Iu7sEGvPFLhtx8V7z6Qhr9QGnK/JAwPC0LKJe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MUA/SGQ5vfD3is5ZYHRFCSlogIvgQ66IMxAQVZ+iAkYvjLI0Pl0h7KsEkHxZ8ebPYCOaJ/tqPaelYhewShvZMSlrk6xP5sWaJrFmjyDJQlgDiZmLPfd6GPVc73RRnB9Ct+/gRyxkGe7gQhykCxM7UGf4BJd6YkYqlgToaGMTJuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gdQct6sm; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51H87oak1437430
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Feb 2025 02:07:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739779670;
	bh=ht4HxGI5YrlOa/0b3MdILMdlQhV+uNgSi3wHLhbLMCE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gdQct6smd0wGwtXj3x52Qnl41sHKBJ0OjVIFRTE6Fqoe/nzHVMBrqVuH7I80e5G0F
	 dJQCmMx/NfAEHTP4MffziIjt+EAiHS+tFsw+ecVacqH+9CPUK/fmWsVUwrE/s7M0ji
	 aEKv3+zm6f8wP1/7446j8EPpTMly8bLiEO4emixk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51H87oTP010372;
	Mon, 17 Feb 2025 02:07:50 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 02:07:50 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 02:07:50 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51H87jGm115755;
	Mon, 17 Feb 2025 02:07:46 -0600
Message-ID: <e9ccecd2-6148-44fc-a4da-217219da9d3d@ti.com>
Date: Mon, 17 Feb 2025 13:37:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] media: ti: j721e-csi2rx: Add support for
 VIDIOC_LOG_STATUS
To: Jai Luthra <jai.luthra@linux.dev>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <mripard@kernel.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devarsht@ti.com>, <vaishnav.a@ti.com>,
        <r-donadkar@ti.com>, <u-kumar1@ti.com>
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
 <20250212131244.1397722-4-y-abhilashchandra@ti.com>
 <nvyplkcl74rpe7zl2vprfztaivlmwvrsrwyrqw7lbvbeij5ubt@4dehnb7j6ona>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <nvyplkcl74rpe7zl2vprfztaivlmwvrsrwyrqw7lbvbeij5ubt@4dehnb7j6ona>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,

Thank you for the review.

On 13/02/25 18:56, Jai Luthra wrote:
> Hi Abhilash,
> 
> On Wed, Feb 12, 2025 at 06:42:44PM +0530, Yemike Abhilash Chandra wrote:
>> The VIDIOC_LOG_STATUS ioctl outputs the current status of a device to the
>> kernel log. When this ioctl is called on a video device, the current
>> implementation queries the log status for all connected subdevices in the
>> media pipeline.
>>
> 
> What is the benefit of doing this for a video node? The user can directly
> check the status on the cdns-csi2rx subdev for CSI errors.
> 
> As far as I understand, the video node corresponds to a particular stream, but
> the cdns-csi2rx source pad is shared for all video nodes, so it will report
> the total errors seen for all video nodes in multi-camera scenarios.
> 
> This approach will also give you v4l2 control handler status from a few
> sensors (like OV5640) that implement the ioctl using
> v4l2_ctrl_subdev_log_status(), which is probably just noise for the case where
> a user wants to check for stream errors.

I understand that this change does not add any value and may introduce
unnecessary noise. Given that the user can directly check the status on the
cdns-csi2rx subdevice for stream errors, I will remove this change in v2.

Thanks and Regards,
Yemike Abhilash Chandra

> 
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 6412a00be8ea..946704458fee 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -377,6 +377,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
>>   	return 0;
>>   }
>>   
>> +static int ti_csi2rx_log_status(struct file *file, void *fh)
>> +{
>> +	struct ti_csi2rx_dev *csi = video_drvdata(file);
>> +
>> +	v4l2_device_call_all(&csi->v4l2_dev, 0, core, log_status);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct v4l2_ioctl_ops csi_ioctl_ops = {
>>   	.vidioc_querycap      = ti_csi2rx_querycap,
>>   	.vidioc_enum_fmt_vid_cap = ti_csi2rx_enum_fmt_vid_cap,
>> @@ -393,6 +402,7 @@ static const struct v4l2_ioctl_ops csi_ioctl_ops = {
>>   	.vidioc_expbuf        = vb2_ioctl_expbuf,
>>   	.vidioc_streamon      = vb2_ioctl_streamon,
>>   	.vidioc_streamoff     = vb2_ioctl_streamoff,
>> +	.vidioc_log_status	= ti_csi2rx_log_status,
>>   };
>>   
>>   static const struct v4l2_file_operations csi_fops = {
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> Jai

