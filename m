Return-Path: <linux-media+bounces-11637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DA8C9A3F
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 11:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911F61F21882
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 09:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026991CA9E;
	Mon, 20 May 2024 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6eIga6Ok"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0303134B2;
	Mon, 20 May 2024 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716196868; cv=none; b=SA3L69sirbafnK33NbjRaEAcyizf4jerakSRzHnhxy0N8xR5CHhVFBYc6kIH8P7L1WTmShpOgpnNDeOzlHQPrvt66j8ZhTjtx68xtNTrH35Yt75KlawxheBbDmtjrI4FaUC0oZhuFI1YDGRLs6LhrTvIHzjIipNC+/ZjfkuB8QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716196868; c=relaxed/simple;
	bh=j4c7zoLAnYNxtHCPteAdUK0C9SL0pMlyMbJkDlqjIXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jzCX/qxeDLXoLmD7cZZMhOUMjDRinq0OGx2cOj+9DwBfM5cIAPTP90sjGfyQSmFjVtCsVI6HEvMf93sPhRkvKvdRCO0SPGGDUmfL554GmAZ9CWluzK4yw51hroAkrP/e6joqtqytQSajLVX/lwnJbWHn5ySrblKC62i8BtFR39g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6eIga6Ok; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K82FKW026847;
	Mon, 20 May 2024 11:20:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=2Kbi0KIRjA/taZJ7NgP1Vk2ndp0QZAWJS6cVSNCQBAc=; b=6e
	Iga6OkMD7hTRH8fM7tzlvwdKuNrq/jujbCDI6jCQcn7zSzdCzQpIIcuXTTEyRg4O
	75BUOSiHYP0r8U+YYD1G4rzr+cYOStUbch8gbReHIJq739/CaCBL1V4gZcswVhu2
	o55Kkt3/1ufMpCpfmmEi+oW4UvxS/EVXOj4UCS2+C47Zf8RulYi6/HWvA/SP/Scw
	otPhphgsNpGgerZclNmwhemkxCTf0fioD0onqqHsTS+AwGwpV9zYCy1cFdV0cCZ+
	0ZNOFnDmeX7cZi3Awi+658hgBiP2G97e16ALWzJUA9K5LHok8k5QeVMQyoNZa3Sx
	FnXMrosZR08xW9V8zvAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n2fehja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 11:20:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CE6940045;
	Mon, 20 May 2024 11:20:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCD1A214D1F;
	Mon, 20 May 2024 11:19:40 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 11:19:40 +0200
Message-ID: <c717987e-a5cd-4dae-bec7-9b946ee10b1e@foss.st.com>
Date: Mon, 20 May 2024 11:19:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] media: uapi: ctrls: Add camera trigger controls
To: Volodymyr Kharuk <vkh@melexis.com>, <linux-media@vger.kernel.org>
CC: Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        <devicetree@vger.kernel.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>
References: <cover.1715871189.git.vkh@melexis.com>
 <de44db636f0e3f5bea2357aa6a34531fe0c34f08.1715871189.git.vkh@melexis.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <de44db636f0e3f5bea2357aa6a34531fe0c34f08.1715871189.git.vkh@melexis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_05,2024-05-17_03,2023-05-22_02

Hi Volodymyr,

Thank you for your patch.

On 5/16/24 18:41, Volodymyr Kharuk wrote:
> Add V4L2_CID_CAMERA_TRIGGER_MODE as a menu item control to set
> trigger mode. Also proposed some standard modes.
> Another item is V4L2_CID_CAMERA_TRIGGER as a button to send
> trigger in V4L2_TRIGGER_MODE_INTERNAL mode.
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>

This is very interesting.

As I understand this control allows to change what triggers sensor
acquisition.
May I ask what the different modes do ?

We had a discussion previously with Laurent, Sakari and Dave (adding him
as cc btw) about a "slave mode" control [1] for the vgxy61, is it
something similar to the trigger mode ?

[1]
https://lore.kernel.org/linux-media/c610a2c9-31b1-1950-00fa-a6b3fd3517a1@foss.st.com/

> ---
>  include/uapi/linux/v4l2-controls.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 99c3f5e99da7..7901f40a1bd8 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1087,6 +1087,14 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
>  
> +#define V4L2_CID_CAMERA_TRIGGER			(V4L2_CID_CAMERA_CLASS_BASE + 37)
> +#define V4L2_CID_CAMERA_TRIGGER_MODE		(V4L2_CID_CAMERA_CLASS_BASE + 38)
> +enum v4l2_trigger_mode {
> +	V4L2_TRIGGER_MODE_CONTINUOUS		= 0,
> +	V4L2_TRIGGER_MODE_INTERNAL		= 1,
> +	V4L2_TRIGGER_MODE_EXTERNAL		= 2,
> +};
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
Regards,

Benjamin

