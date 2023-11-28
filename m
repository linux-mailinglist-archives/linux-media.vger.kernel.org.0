Return-Path: <linux-media+bounces-1263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED87FB7B7
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB42AB2306C
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB944EB5D;
	Tue, 28 Nov 2023 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fPSIAFQe"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6580F35AC;
	Tue, 28 Nov 2023 02:26:45 -0800 (PST)
Received: from [100.122.216.38] (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D0EF6607295;
	Tue, 28 Nov 2023 10:26:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701167204;
	bh=wnu068ECaNnR7zM2tCS6WGVU5g0Vyny4l5k0cqi5/Gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fPSIAFQe+6bLt14IZnT7Oq4e2qP9zCUUu1mEtQ5CevwcHsIFRBtsaLBWGMyrc8y90
	 evscUsbWNpKSG9kHvDOqeRl9iZUjmwzUgr9iKXjMG2EX0YcjrxnDZouGMEehWJe0Aa
	 61o7FxguyZkUx7b51F3pHeLokSiqjzszdNZrin3Abt2joXa4YXnuMFA5GJT0NKkNqH
	 IZ8T6bEuS6RlUSmFer/Jqkr6Pnv4f66UiMYWNj5Q9r+T3pn4abktqtXVXAgtmb798l
	 5VbFKYCLbmeyOioDfpKiiYgsKC8QrpP75gwPYKYjqts7Eu39fSJQAtwESJQtClZpxT
	 riuckDGEZN1qg==
Message-ID: <995eb6c2-cc7f-4217-bc37-4ab1a32f36ee@collabora.com>
Date: Tue, 28 Nov 2023 11:26:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/55] media: imx8-isi: Stop abusing of min_buffers_needed
 field
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil@xs4all.nl,
 mchehab@kernel.org, m.szyprowski@samsung.com, matt.ranostay@konsulko.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-8-benjamin.gaignard@collabora.com>
 <20231127170700.GC31314@pendragon.ideasonboard.com>
 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
 <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 28/11/2023 à 10:35, Tomasz Figa a écrit :
> On Tue, Nov 28, 2023 at 6:31 PM Benjamin Gaignard
> <benjamin.gaignard@collabora.com> wrote:
>>
>> Le 27/11/2023 à 18:07, Laurent Pinchart a écrit :
>>> Hi Benjamin,
>>>
>>> Thank you for the patch.
>>>
>>> On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
>>>> 'min_buffers_needed' is suppose to be used to indicate the number
>>>> of buffers needed by DMA engine to start streaming.
>>>> imx8-isi driver doesn't use DMA engine and just want to specify
>>> What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
>>> engines :-)
>> I have done assumption on drivers given if they use or dma_* functions.
> I suspect the use of vb2_dma_sg_plane_desc() and
> vb2_dma_contig_plane_dma_addr() may be more correlated to whether
> there is a DMA involved or not. Usually V4L2 drivers don't really have
> to deal with the DMA API explicitly, because the vb2 framework handles
> most of the work.

Unfortunately isn't not true either, for example verisilicon driver use
these function but doesn't need DMA engine.
I haven't found yet a 100% criteria to decide if driver use or not DMA engine
so I plan to fix case by case given maintainers remarks.

Regards,
Benjamin

>
> Best regards,
> Tomasz
>
>> I have considers that all PCI drivers are using DMA engine and
>> I don't know the design for each drivers so I hope to get this information
>> from maintainers and fix that in v2.
>> If imx8-isi driver needs a minimum number of buffers before start streaming
>> I will do a v2 and use min_dma_buffers_needed instead.
>>
>> Regards,
>> Benjamin
>>
>>>> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
>>>> That 'min_reqbufs_allocation' field purpose so use it.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>> CC: Shawn Guo <shawnguo@kernel.org>
>>>> CC: Sascha Hauer <s.hauer@pengutronix.de>
>>>> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>> CC: Fabio Estevam <festevam@gmail.com>
>>>> CC: NXP Linux Team <linux-imx@nxp.com>
>>>> ---
>>>>    drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
>>>> index 49bca2b01cc6..81673ff9084b 100644
>>>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
>>>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
>>>> @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>>>>       q->mem_ops = &vb2_dma_contig_memops;
>>>>       q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>>>>       q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>>> -    q->min_buffers_needed = 2;
>>>> +    q->min_reqbufs_allocation = 2;
>>>>       q->lock = &video->lock;
>>>>       q->dev = pipe->isi->dev;
>>>>

