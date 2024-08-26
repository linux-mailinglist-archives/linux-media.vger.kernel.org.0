Return-Path: <linux-media+bounces-16774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12D95EDD0
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5E2284EE7
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2D61465A5;
	Mon, 26 Aug 2024 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jumwgkCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEB9146593
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666231; cv=none; b=mTjvraAR0DDkLeDpqrEBHINQaOYUmZlk0sTbGehbebej9tdhhXM3RPNVbgtBWg4rnGghiK61uIvBvVcw+Lq5BqJQwp6bJlRB+dBCdQvB30iN1DGTLK4dT8N/XvRhN04zf5+bHrfPnjaKmsJzvbi2a9wo8MglBVXfvjrHneodB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666231; c=relaxed/simple;
	bh=OYpxpgb622Sk8y2cctzid0f3cfRYMXOKgD4JabmPp3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYhZZz5cJg+kFTpM68J2PyRfZpAaLY5wR//gES98IrQwuyHu24cyn09Qn+YMNP4L3poNO1NltPiyH2QzibcbgQSPhVM4rS2Vp9pLqqfPsbbI2B3Uf84ZPJybNTexqEzYGS9gHI+NBl6FouviRrQln7X08i5y5Uu/U563UP4TqyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jumwgkCQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343eeb4973so3052484e87.2
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724666226; x=1725271026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uIL5oAzFHfOobIzGR8jVXAbOsDn/MOFmDN7pgL7te3Y=;
        b=jumwgkCQcNVcKcO0QYMbhmv3GE/ESGDOfQiSRGZYv9dZtt5fSJjk/urMV9vF1U0RWa
         YTxcrTqfVDFrkQjgi8oCmb4QR050LCuSZKm/cZOA6SD5QZvnh33O47BdLWFxQOoz/m66
         +p+ro0Q4GT6Y9bNKbSQS2dwX17NlXzVBLmnPHuq0SIU1HHfS322TChAsFVpTiNWEm22a
         98jTG7mC2khXznvYakosNsL086eIBaHLK0p/UbDoy4IXvdKsHB1cRr1wv7RnaYh+fFRY
         qg43F0kyu+JqCUA52Lg4Znw46ktQPu9zb0oyuqaqE+MI2qqol95PYqhAU/8PlXvoeCHi
         IHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666226; x=1725271026;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIL5oAzFHfOobIzGR8jVXAbOsDn/MOFmDN7pgL7te3Y=;
        b=LykS+y0SELpsfJZJbdqeflQMiw8b4o8ADlSU/kqQXNdlzJBo+RNK4g3ukR+rTiQD87
         D7+ba2EIaMxKsdwjb5m8wPK1z2sDZEKhmLZ9V0iGHG5rrT+/EYX4dFmCSh/kCGUNrDym
         VxyGIE25wVTgfqVlXRWj/S9Me5twJeqybI46l3q2a/Jy7+YlBAHqTDzrc7Kv3a8xm3ei
         ifS8A61d5rLeUnP3+kmNf/DfjqCLwbF2Fnbl1n3azoOnk1F/c5geOANVuiBUlnu4eRK9
         e5DQSIg050X3nu78f+wPo7o+6Dl6rKOMHaquMz+01KQFwOEXNUUTchJ1OCEr+VCr52x7
         GPew==
X-Forwarded-Encrypted: i=1; AJvYcCX2Vu10xXJXn9dhyXJr0V24D6JSEoaKl1b1G0KDbhz+TXPmMgQmpkD+uCGRDacNK0qKybpyGw2MPGc6oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2QBw+W49quUKItlEOeuYYQVqojpdxREP1HYPa5OPzKwSKEkf
	2dAFV/5TY9tzkiTQ9Z4T6ZrIlbAVmHSujugFWhwsryNTDtAnrNfAFgs1ha18FEU=
X-Google-Smtp-Source: AGHT+IGZZXV5lkafZrCu5LL2F7FhiqQExbkToThDKXq32WRAq+FEAjQfan6PItK1pXZ3kLnblRQ9Bg==
X-Received: by 2002:a05:6512:318c:b0:533:4656:d4d6 with SMTP id 2adb3069b0e04-5343883d608mr7894535e87.5.1724666225889;
        Mon, 26 Aug 2024 02:57:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f436cb9sm640180966b.121.2024.08.26.02.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:57:05 -0700 (PDT)
Message-ID: <4937e7d4-bb05-452d-ace9-429b4cd43005@tuxon.dev>
Date: Mon, 26 Aug 2024 12:57:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
 <6f16a3f7-99bb-47c4-9034-c1f0ccd59546@tuxon.dev>
 <TY3PR01MB11346F3C71013AD71C1556BA1868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240826094311.GA27596@pendragon.ideasonboard.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240826094311.GA27596@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26.08.2024 12:43, Laurent Pinchart wrote:
> On Mon, Aug 26, 2024 at 08:08:33AM +0000, Biju Das wrote:
>> On Monday, August 26, 2024 8:27 AM, claudiu beznea wrote:
>>> On 24.08.2024 21:21, Biju Das wrote:
>>>> Move request_irq() to probe(), in order to avoid requesting IRQ during
>>>> device start which happens frequently. As this function is in probe(),
>>>> it is better to replace it with its devm variant for managing the
>>>> resource efficiently.
>>>>
>>>> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>> ---
>>>> v2->v3:
>>>>  * Dropped wrapper function rzg2l_cru_process_irq() and made
>>>>    rzg2l_cru_irq() global.
>>>>  * Added Rb tag from Laurent.
>>>> v1->v2:
>>>>  * Updated commit header and description.
>>>>  * Moved rzg2l_cru_irq from rzg2l-video.c->rzg2l-core.c and introduced
>>>>    rzg2l_cru_process_irq() in video.c to process irq.
>>>>  * Dropped image_conv_irq from struct rzg2l_cru_dev
>>>>  * Replaced request_irq with its devm variant.
>>>> ---
>>>>  .../media/platform/renesas/rzg2l-cru/rzg2l-core.c | 13 +++++++++----
>>>> .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h  |  6 ++----
>>>>  .../platform/renesas/rzg2l-cru/rzg2l-video.c      | 15 ++-------------
>>>>  3 files changed, 13 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
>>>> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
>>>> index 280efd2a8185..2a2907beb722 100644
>>>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
>>>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
>>>> @@ -242,7 +242,7 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>>>>  static int rzg2l_cru_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct rzg2l_cru_dev *cru;
>>>> -	int ret;
>>>> +	int irq, ret;
>>>>
>>>>  	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
>>>>  	if (!cru)
>>>> @@ -270,9 +270,14 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>>>>  	cru->dev = &pdev->dev;
>>>>  	cru->info = of_device_get_match_data(&pdev->dev);
>>>>
>>>> -	cru->image_conv_irq = platform_get_irq(pdev, 0);
>>>> -	if (cru->image_conv_irq < 0)
>>>> -		return cru->image_conv_irq;
>>>> +	irq = platform_get_irq(pdev, 0);
>>>> +	if (irq < 0)
>>>> +		return irq;
>>>> +
>>>> +	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, IRQF_SHARED,
>>>> +			       KBUILD_MODNAME, cru);
>>>
>>> Because this is requested w/ IRQF_SHARED the free_irq() ->
>>> __free_irq() [1] will call the IRQ handler to simulate an IRQ SHARE
>>> scenario where other device generate an interrupt.
> 
> Good point, I had missed that.
> 
>> Currently CSI driver is not registered any interrupts and CRU is the single user.
> 
> Regardless, the fact that the IRQ is requested with IRQF_SHARED means
> that the IRQ handler needs to be prepared to be called at any time from
> the point of registration to the point the IRQ is freed. This is tested
> by CONFIG_DEBUG_SHIRQ=y, which you should enable for testing.
> 
> If you don't need to share the interrupt with any other device, you can
> drop the IRQF_SHARED. Otherwise, you will need to fix the issue
> properly. You can probably wrap the interrupt handling with
> pm_runtime_get_if_in_use() and pm_runtime_put() (hoping those functions
> can be called from interrupt context).

As of my current investigation on this, pm_runtime_suspended() check is
enough in interrupt handler (but... see below how this works).

> 
> On a side note, I also I wonder if this issue precludesusage of
> devm_request_irq() for shared interrupts, requiring calling free_irq()
> manually at remove time to control the sequence of cleanup operations.

for pm_runtime_suspended() to work in interrupt handler (and to cover the
CONFIG_DEBUG_SHIRQ=y) one need to:

1/ either devm_pm_runtime_enable() in probe before devm_request_irq()
2/ or use pm_runtime_enable() + request_irq() in probe and
   pm_runtime_disable() + free_irq() in remove

Because pm_runtime_suspended() checks also for !dev->power.disable_depth.

Thank you,
Claudiu Benea


> 
>>>> +	if (ret)
>>>> +		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
>>>>
>>>>  	platform_set_drvdata(pdev, cru);
>>>>
>>>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
>>>> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
>>>> index a5a99b004322..174760239548 100644
>>>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
>>>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
>>>> @@ -8,6 +8,7 @@
>>>>  #ifndef __RZG2L_CRU__
>>>>  #define __RZG2L_CRU__
>>>>
>>>> +#include <linux/irqreturn.h>
>>>>  #include <linux/reset.h>
>>>>
>>>>  #include <media/v4l2-async.h>
>>>> @@ -68,8 +69,6 @@ struct rzg2l_cru_ip {
>>>>   *
>>>>   * @vclk:		CRU Main clock
>>>>   *
>>>> - * @image_conv_irq:	Holds image conversion interrupt number
>>>> - *
>>>>   * @vdev:		V4L2 video device associated with CRU
>>>>   * @v4l2_dev:		V4L2 device
>>>>   * @num_buf:		Holds the current number of buffers enabled
>>>> @@ -105,8 +104,6 @@ struct rzg2l_cru_dev {
>>>>
>>>>  	struct clk *vclk;
>>>>
>>>> -	int image_conv_irq;
>>>> -
>>>>  	struct video_device vdev;
>>>>  	struct v4l2_device v4l2_dev;
>>>>  	u8 num_buf;
>>>> @@ -141,6 +138,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
>>>>
>>>>  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
>>>>  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
>>>> +irqreturn_t rzg2l_cru_irq(int irq, void *data);
>>>>
>>>>  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
>>>>
>>>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>>>> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>>>> index b16b8af6e8f8..e80bfb9fc1af 100644
>>>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>>>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>>>> @@ -527,7 +527,7 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>>>>  	rzg2l_cru_set_stream(cru, 0);
>>>>  }
>>>>
>>>> -static irqreturn_t rzg2l_cru_irq(int irq, void *data)
>>>> +irqreturn_t rzg2l_cru_irq(int irq, void *data)
>>>>  {
>>>>  	struct rzg2l_cru_dev *cru = data;
>>>>  	unsigned int handled = 0;
>>>> @@ -637,13 +637,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>>>>  		goto assert_aresetn;
>>>>  	}
>>>>
>>>> -	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
>>>> -			  IRQF_SHARED, KBUILD_MODNAME, cru);
>>>> -	if (ret) {
>>>> -		dev_err(cru->dev, "failed to request irq\n");
>>>> -		goto assert_presetn;
>>>> -	}
>>>> -
>>>>  	/* Allocate scratch buffer. */
>>>>  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>>>>  					  &cru->scratch_phys, GFP_KERNEL); @@ -651,7 +644,7 @@ static
>>>> int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>>>>  		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
>>>>  		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
>>>>  		ret = -ENOMEM;
>>>> -		goto free_image_conv_irq;
>>>> +		goto assert_presetn;
>>>>  	}
>>>>
>>>>  	cru->sequence = 0;
>>>> @@ -670,9 +663,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>>>>  	if (ret)
>>>>  		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
>>>>  				  cru->scratch_phys);
>>>> -free_image_conv_irq:
>>>> -	free_irq(cru->image_conv_irq, cru);
>>>> -
>>>>  assert_presetn:
>>>>  	reset_control_assert(cru->presetn);
>>>>
>>>> @@ -698,7 +688,6 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>>>>  	dma_free_coherent(cru->dev, cru->format.sizeimage,
>>>>  			  cru->scratch, cru->scratch_phys);
>>>>
>>>> -	free_irq(cru->image_conv_irq, cru);
>>>>  	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
>>>>
>>>>  	reset_control_assert(cru->presetn);
> 

