Return-Path: <linux-media+bounces-27007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21DA45A0E
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5597D3AC84F
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583D2238144;
	Wed, 26 Feb 2025 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EmrMlq3K"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E7226CFB;
	Wed, 26 Feb 2025 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561922; cv=pass; b=sBla+b1bx0T5DRThkfARBstX0nK6hABjLYYrZfRfivmqUMoAlqa/AUyToUD8raOzvUAZNf6pAmS4Zfkt2Rzm5Ec+YlmphIReCZLtYqUbADdi2RvFTwOvjkVfSHouC4ek7T+gtVUYjnh2zrcyg7tYhlCEAdyNJSXzbaaC1VLkHHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561922; c=relaxed/simple;
	bh=WNv+lu+hR1XlcD/qx99I9Ql/CMRaRW/I22E1Xqr33kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3nHgSINywojLtMvucooKcHiGren2msn7oc7DPFhM8rT1sPat3uf3u87Q46wTmpwakSub/i32FtFve5mrRLipgK5ln+r1MrNdllLCplfAop5XKTT4WuOQJPQRC6cplFTvsJaAp54uYbpzDDJdG8DlybyBnIMEVTHHrsBvreW8fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=EmrMlq3K; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740561875; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SKsCSGL9x8CSYxgxmG1GppeR9EuiHm1uaNCy97VAS2cRpg7zpVqCafaexEklZMTnWkBN+lgApQfewJBaLkJ9Ojf5DQcdjvTmFkV9VuQItOZImruICada8y3uESFPp/+/Hx2unLyTUgGFo628Y77TO+hrV51eCEAgQy0fyTt/np8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740561875; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ERJZihbDHoNUGZrF+m03YExRY3rYkWVkBHV4qVjg41w=; 
	b=blnL47vJpWAi9i8DyYKodzwfj57AL890jTEROaaozltW4YsaOTV398tItEBtAvGsUlGZwih7oqAWxG/zc7Ps6pcF4DUJjx2NrUoyNvd3CgvFd2vyUWaJYlldy4eXj7D7Nn0hjj48qYmQQSd+AG6gCFyAxdzhDMwS9DjtH2zjdto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740561875;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ERJZihbDHoNUGZrF+m03YExRY3rYkWVkBHV4qVjg41w=;
	b=EmrMlq3K/xTXHOBxduKmtr1jCm/uF0tAW7Gx1mC+HgUbF3ZHqWNV4Xzh/rm7bnra
	QEpmkViK//0NlyUEi38b4j3u10S3nHfXRMAxrsjtYeh9Inrk9zM8r6jYLuWxO1qzLXH
	m0cCPpBYe2WtaqyXxbMfEGczCmtEYtYufD644Jt4=
Received: by mx.zohomail.com with SMTPS id 1740561873228674.1763866303972;
	Wed, 26 Feb 2025 01:24:33 -0800 (PST)
Message-ID: <cf4c855b-6b1f-4a91-b292-5635ee4f7d2e@collabora.com>
Date: Wed, 26 Feb 2025 12:24:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
 <20250225183058.607047-4-dmitry.osipenko@collabora.com>
 <4236518a-6ed6-4e01-9bf2-d41f0a194c26@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <4236518a-6ed6-4e01-9bf2-d41f0a194c26@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/26/25 11:47, Hans Verkuil wrote:
...
>> +static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
>> +			       struct platform_device *pdev)
>> +{
>> +	struct device *dev = hdmirx_dev->dev;
>> +	struct hdmirx_cec_data cec_data;
>> +	int irq;
>> +
>> +	irq = platform_get_irq_byname(pdev, "cec");
>> +	if (irq < 0) {
>> +		dev_err_probe(dev, irq, "failed to get cec irq\n");
>> +		return irq;
>> +	}
>> +
>> +	hdmirx_dev->cec_notifier = cec_notifier_conn_register(dev, NULL, NULL);
> 
> I never really paid attention to this, but you don't need to use the cec-notifier
> API. The notifier API is needed if an independent CEC device has to be associated
> with an independent HDMI interface, and needs to be notified whenever the
> physical address changes.
> 
> This is a single IP combining both HDMI and CEC, so the HDMI part calls
> cec_s_phys_addr_from_edid()/cec_phys_addr_invalidate() directly whenever the EDID
> changes.
> 
> So just drop the include of cec-notifier.h and anything related to this.

Ack

...
>> +	hdmirx_dev->infoframes = v4l2_debugfs_if_alloc(hdmirx_dev->debugfs_dir,
>> +						       V4L2_DEBUGFS_IF_AVI, hdmirx_dev,
>> +						       hdmirx_debugfs_if_read);
>> +
>> +	return 0;
>> +
>> +err_unreg_video_dev:
>> +	video_unregister_device(&hdmirx_dev->stream.vdev);
> 
> Replace this with vb2_video_unregister_device(). Sorry, I missed this in my previous reviews.
> 
>> +err_unreg_v4l2_dev:
>> +	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
>> +err_hdl:
>> +	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
>> +err_pm:
>> +	hdmirx_disable(dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void hdmirx_remove(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
>> +
>> +	v4l2_debugfs_if_free(hdmirx_dev->infoframes);
>> +	debugfs_remove_recursive(hdmirx_dev->debugfs_dir);
>> +
>> +	snps_hdmirx_cec_unregister(hdmirx_dev->cec);
>> +	cec_notifier_conn_unregister(hdmirx_dev->cec_notifier);
>> +
>> +	hdmirx_disable_irq(dev);
>> +
>> +	video_unregister_device(&hdmirx_dev->stream.vdev);
> 
> vb2_video_unregister_device().
> 
> This function ensures that, if streaming was in progress and the driver was forcibly
> removed, streaming is stopped gracefully and safely.

Ack

-- 
Best regards,
Dmitry

