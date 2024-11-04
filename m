Return-Path: <linux-media+bounces-20790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9B9BB383
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BF2284033
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BE51B393B;
	Mon,  4 Nov 2024 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L3DiHJFm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D015B97D
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719979; cv=none; b=qCL+GuGF02cwTVNZUxGqITLOBM84EJciMA70vr7ESeXRv9Aq5zsn3wmsJQttiTu/xpPcvJTNbCpt2OLjejQagxpKRyvoIOk8kgPKWLRiFtGrjky9J/rH4lvLL672omkKHIPesVZROyPk6CVa7hqTnzEmrrSeT9rWl2WnFwpiW2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719979; c=relaxed/simple;
	bh=vLOzQS7ITy9bGCIg0fCVfOrShwgr2px8q0E9i+QjEhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NuIvlRKDQRlZ2LXNYCFAqGukaWqb5r3t/VL924XzSA3BD4czFkXHQWaB2L9kXesXBKUU5ttQBPCbJUscoLWjx2+5B+iMXxa3xfgdSoeqeLaNdLlNRbsB0+AnQ5fLZh1E9ZPfSPM26mUIWgfJo0W8LW5OzGu0lA9B5dyZWPrfLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L3DiHJFm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Nj8fU022012;
	Mon, 4 Nov 2024 11:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDvkglJ/UxHgF2ys2mqrmkZ0DrMPuUTfRGgmSXsWgHY=; b=L3DiHJFmJX5+dfQ9
	k2fWlAmESdEuWHIdme7dJMwKnHnrZsYC89bWmyzIWnapH/h1DuLCerRYbowTlF/n
	HIaUteiUOJpBMbpcoVRFmVVXHLQzrDpzBqAx+Agy9voFlXUj19EPUqbzcpU+wVEk
	nlr4Mwh9j3ky1axgl421Rwdud6hIGC5zj7t9ij+rSZ1qN/8LbBVcCo/rTMj/LSpM
	+gKN3wcbNEm1IXzdHoPeosSDCMrdCDjUS8gMYhzy6BkhIjM81HeyKnb8dWrBfJF8
	pZfNeKPQqkYAyhV+5x2DDEfoTAA070SXXofaxzBFup/7w/hV9zaEA/9WpaxOoNM3
	p942cw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxv0h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 11:32:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4BWpSG006076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 11:32:51 GMT
Received: from [10.206.107.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 03:32:49 -0800
Message-ID: <77070a43-040f-b0d0-b843-a8fde3f7ca92@quicinc.com>
Date: Mon, 4 Nov 2024 17:02:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RFC: add min_num_buffers and clarify
 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov
	<svarbanov@suse.de>
References: <126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl>
 <20241028155244.GK24052@pendragon.ideasonboard.com>
 <e9ce9b42-ba66-4908-a528-b839272c2ab6@xs4all.nl>
 <b7b4bf34-ab4a-4676-a279-8c8a5cd3ff42@xs4all.nl>
 <3810bdb1-d678-4d49-a7f2-99ee59e39094@xs4all.nl>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <3810bdb1-d678-4d49-a7f2-99ee59e39094@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Nk1gJVbT9jpLq8zeGsPQYCXSxjJRx_8s
X-Proofpoint-GUID: Nk1gJVbT9jpLq8zeGsPQYCXSxjJRx_8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040102

Hi Hans,

On 10/31/2024 1:55 PM, Hans Verkuil wrote:
> On 29/10/2024 10:04, Hans Verkuil wrote:
>> On 29/10/2024 09:17, Hans Verkuil wrote:
>>> On 28/10/2024 16:52, Laurent Pinchart wrote:
>>>> Hi Hans,
>>>>
>>>> On Mon, Oct 28, 2024 at 12:10:22PM +0100, Hans Verkuil wrote:
>>>>> Hi all,
>>>>>
>>>>> This mail thread uncovered some corner cases around how many buffers should be allocated
>>>>> if VIDIOC_REQBUFS with count = 1 is called:
>>>>>
>>>>> https://lore.kernel.org/linux-media/20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com/T/#mc2210597d92b5a0f09fabdac2f7307128aaa9bd8
>>>>
>>>> I'll repeat below some comments I've made in that thread, as they're
>>>> better discussed in the context of this RFC.
>>>>
>>>>> When it comes to the minimum number of buffers there are a number of limitations:
>>>>>
>>>>> 1) The DMA engine needs at least N buffers to be queued before it can start. Typically
>>>>>    this is 0, 1 or 2, and a driver sets this via the vb2_queue min_queued_buffers field.
>>>>>    So if min_queued_buffers = 1, then the DMA engine needs one buffer at all times to
>>>>>    DMA to. Allocating just one buffer would mean the DMA engine can never return that
>>>>>    buffer to userspace (it would just keep recycling the same buffer over and over), so
>>>>>    the minimum must be min_queued_buffers + 1.
>>>>
>>>> I think you're mixing hardware and driver constraints here. Drivers can
>>>> use scratch buffers to relax the hardware requirements, and allow
>>>> userspace operation with less buffers than strictly required by the
>>>> hardware.
>>>>
>>>> The cost of allocating such scratch buffers vary depending on the
>>>> device. When an IOMMU is available, or when the device has a line stride
>>>> that can be set to 0 and supports race-free programming of the stride
>>>> and buffer addresses, the scratch buffer can be as small as a single
>>>> page or a single line. In other cases, a full-frame scratch buffer is
>>>> required, which is costly, and the decision on whether or not to
>>>> allocate such a scratch buffer should probably be taken with userspace
>>>> being involved.
>>>
>>> I honestly don't see why you would want to spend a lot of time on adding
>>> scratch buffer support just to save a bit of memory. Is the use-case of
>>> capturing just a single buffer so common? To me it seems that it only
>>> makes sense to spend effort on this if you only need to capture a single
>>> buffer and never need to stream more buffers.
>>>
>>> Can you describe the use-case of capturing just a single buffer? Is that
>>> just for testing libcamera? Or is it something that happens all the time
>>> during normal libcamera operation?
>>>
>>> Supporting scratch buffers is a lot of effort for something that is not
>>> needed for normal streaming.
>>>
>>>>
>>>> min_queued_buffers describes how the device operates from a userspace
>>>> point of view, so I don't think it should be considered or documented as
>>>> being a hardware requirement, but a driver requirement.
>>>
>>> It's a hardware and/or driver requirement. It is absolutely not a userspace
>>> requirement. Normal userspace applications that use VIDIOC_REQBUFS and just
>>> stream video will never notice this.
>>>
>>>>
>>>>> 2) Historically VIDIOC_REQBUFS is expected to increase the count value to a number that
>>>>>    ensures the application can smoothly process the video stream. Typically this will
>>>>>    be 3 or 4 (if min_queued_buffers == 2): min_queued_buffers are used by the DMA engine,
>>>>>    one buffer is queued up in vb2, ready to be used by the DMA engine as soon as it
>>>>>    returns a filled buffer to userspace, and one buffer is processed by userspace.
>>>>>
>>>>>    This is to support applications that call VIDIOC_REQBUFS with count = 1 and leave it
>>>>>    to the driver to increment it to a workable value.
>>>>
>>>> Do we know what those applications are ? I'm not disputing the fact that
>>>> this may need to be supported to avoid breaking old userspace, but I
>>>> also think this feature should be phased out for new drivers, especially
>>>> drivers that require a device-specific userspace and therefore won't
>>>> work out of the box with old applications.
>>>
>>> xawtv is one: it will call REQBUFS with count = 2 (so this would fail for
>>> any driver that sets min_queued_buffers to 2), and with count = 1 if it wants
>>> to capture just a single frame.
>>>
>>> 'git grep min_queued_buffers|grep -v videobuf|wc' gives me 83 places where it is
>>> set. Some of those are likely wrong (min_queued_buffers has been abused as a
>>> replacement for min_reqbufs_allocation), but still that's quite a lot.
>>>
>>> Mostly these are older drivers for hardware without an IOMMU and typically for
>>> SDTV capture. So memory is not a consideration for those drivers since a
>>> SDTV buffer is quite small.
>>>
>>>>
>>>>> 3) Stateful codecs in particular have additional requirements beyond the DMA engine
>>>>>    limits due to the fact that they have to keep track of reference buffers and other
>>>>>    codec limitations. As such more buffers are needed, and that number might also vary
>>>>>    based on the specific codec used. The V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>>>>>    controls are used to report that. Support for this is required by the stateful codec
>>>>>    API.
>>>>>
>>>>>    The documentation of these controls suggest that these are generic controls, but
>>>>>    as of today they are only used by stateful codec drivers.
>>>>>
>>>>> 4) Some corner cases (mainly/only SDR, I think) where you need more than the usual
>>>>>    3 or 4 buffers since the buffers arrive at a high frequency.
>>>>
>>>> High frame rates is an important feature, but it's also a can of worms.
>>>> V4L2 is lacking the ability to batch multiple frames, we will have to
>>>> address that. Hopefully it could be decoupled from this RFC.
>>>
>>> It's a separate issue indeed. I just mentioned it because I know SDR drivers
>>> use this. They are rarely used, though.
>>>
>>>>
>>>>> Rather than have drivers try to correct the count value (typically incorrectly), the
>>>>> vb2_queue min_reqbufs_allocation field was added to set the minimum number of
>>>>> buffers that VIDIOC_REQBUFS should allocate if count is less than that.
>>>>
>>>> Even if I dislike this feature, I agree it's better implemented through
>>>> min_reqbufs_allocation than by manual calculations in drivers.
>>>>
>>>>> VIDIOC_CREATE_BUFS is not affected by that: if you use CREATE_BUFS you take full control
>>>>> of how many buffers you want to create. It might create fewer buffers if you run out of
>>>>> memory, but never more than requested.
>>>>>
>>>>> But what is missing is that if you use CREATE_BUFS you need to know the value of
>>>>> min_queued_buffers + 1, and that is not exposed.
>>>>>
>>>>> I would propose to add a min_num_buffers field to struct v4l2_create_buffers
>>>>> and add a V4L2_BUF_CAP_SUPPORTS_MIN_NUM_BUFFERS flag to signal the presence of
>>>>> that field. And vb2 can set it to min_queued_buffers + 1.
>>>>
>>>> This would require allocating a buffer first to get the value. Wouldn't
>>>> a read-only control be better ?
>>>
>>> No. You can call CREATE_BUFS with count = 0: in that case it does nothing,
>>> except filling in all those capabilities. It was designed with that in mind
>>> so you have an ioctl that can return all that information.
>>>
>>>>
>>>> Furthermore, I would rather provide the min_queued_buffers value instead
>>>> of min_queued_buffers + 1. The V4L2 API should provide userspace with
>>>> information it needs to make informed decisions, but not make those
>>>> decisions in behalf of userspace. It's up to applications to add 1 or
>>>> more buffers depending on their use case.
>>>
>>> I would definitely want more opinions on this. What's the point of returning
>>> min_queued_buffers and then creating that many buffers and still not be able
>>> to stream?
>>>
>>> Can you think of a scenario (e.g. in libcamera or elsewhere) where that makes
>>> sense?
>>>
>>> Also, will the average V4L2 user have the knowledge to understand that? You
>>> have that knowledge, but I think for anyone else it would be really confusing.
>>>
>>>>
>>>> I think we also need to discuss policies regarding scratch buffer
>>>> allocation in the context of this RFC. When the hardware supports small
>>>> scratch buffers, I would like to make it mandatory for drivers to do so
>>>> and support min_queued_buffers = 0.
>>>
>>> I would first like to know the use-case (as I mentioned above).
>>>
>>> For the type of drivers I mostly work with (video receivers), it would just
>>> be a lot of work for no gain. But perhaps for camera pipelines it does make
>>> sense?
>>>
>>>> When scratch buffers are expensive, do we want to still support them in
>>>> the kernel, perhaps in a way controlled by userspace ? A userspace that
>>>> can guarantee it will always provide min_queued_buffers + 1 buffers
>>>> could indicate so and avoid scratch buffer allocation, while a userspace
>>>> that can't provide that guarantee would get scratch buffers from the
>>>> kernel.
>>>
>>> That is really the difference between using VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS.
>>> I.e., userspace can already choose this.
>>>
>>> Just to clarify the reason for this RFC: the current situation is messy. There
>>> is a lot of history and a lot of older drivers do not always do the right thing.
>>>
>>> With this RFC I would like to get a consensus of how it should work. After that
>>> I want to implement any missing bits and improve the documentation, and finally
>>> go through the drivers and at least try to make them behave consistently.
>>>
>>> Also I want to improve v4l2-compliance to test more corner cases, especially
>>> if you use CREATE_BUFS instead of REQBUFS (I already have a patch for that
>>> ready).
>>>
>>> The work Benjamin did on increasing the max number of supported buffers and the
>>> REMOVE_BUFS ioctl uncovered a lot of that messy history, and it is clear we need
>>> to try and clarify how it should work.
>>>
>>>>> The second proposal is to explicitly document that the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>>>>> are for stateful codec support only, at least for now.
>>>
>>> I just discovered that v4l2-compliance and v4l2-ctl do not honor these controls
>>> for stateful codecs. That's something that needs to be fixed.
>>>
>>> There is also one other item that I would like to discuss: the vb2 queue_setup
>>> callback is currently used for both REQBUFS and CREATE_BUFS, and it remains
>>> confusing for drivers how to use it exactly. I am inclined to redesign that
>>> part, most likely splitting it in two: either one callback for REQBUFS and one
>>> for CREATE_BUFS, or alternatively, one callback when allocating buffers for
>>> the first time (so REQBUFS and when CREATE_BUFS is called for the first time,
>>> i.e. when no buffers are allocated yet), and one callback when adding additional
>>> buffers. I would have to think about this, and probably experiment a bit.
>>
>> Actually, this really has to be addressed since this is broken: you can call
>> CREATE_BUFS as a replacement for REQBUFS, but it will act like REQBUFS and
>> the requested sizes are not honored.
> 
> After digging deeper into this I realized that it actually works correctly
> as long as the driver doesn't do anything weird in queue_setup.
> 
> E.g. I am not so sure the venus driver will do this right, see
> drivers/media/platform/qcom/venus/vdec.c
> 
> If *num_planes is non-zero (i.e. called from CREATE_BUFS), then it will use
> e.g. inst->input_buf_size, and that is only set if queue_setup is called with
> *num_planes set to zero (i.e. called from REQBUFS).
> 
inst->input_buf_size gets updated in S_FMT[1] so it will be available even
if REQBUF is not called. And in queue_setup (for CREATE_BUF) driver is
validating the size of buffers being allocated. Anything additional is
expected from driver here?
Also, in my understanding, the original concern of not having a way to
notify client about the minimum buffer requirement, in case of CREATE_BUFS
still exist.

[1]https://elixir.bootlin.com/linux/v6.12-rc5/source/drivers/media/platform/qcom/venus/vdec.c#L365

Thanks,
Dikshita
> So I suspect that calling CREATE_BUFS instead of REQBUFS will cause problems.
> 
> I'm CC-ing Stanimir and Dikshita (for the upcoming iris driver, which has the
> same issue).
> 
> It is rare that drivers do something like that in queue_setup, so most drivers
> should be fine. If a driver needs to do something like that, then they should
> first call vb2_get_num_buffers() and check if this is 0: that's when you can
> do the extra code that only should be done when the first buffer is allocated.
> 
> Regards,
> 
> 	Hans
> 
>>
>> I added tests for this to v4l2-compliance (locally only), and it fails on
>> everything.
>>
>> It should not be news to anyone that I hate the CREATE_BUFS ioctl API. I posted
>> an RFC for a VIDIOC_ADD_BUFS replacement earlier this year:
>>
>> https://lore.kernel.org/linux-media/243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl/
>>
>> I wonder if we should restrict CREATE_BUFS to only be used after calling
>> REQBUFS, and to a proper job for ADD_BUFS. Because given the vb2 design flaw
>> I am not sure if it can be worked around. Or if we even want that.
>>
>> What a mess.
>>
>> Looking at the kernel history, CREATE_BUFS was added back in 2011 and the first
>> very simple v4l2-compliance tests were added in 2012.
>>
>> Moral: whenever a new uAPI is added, make sure it you make really good compliance
>> tests as well.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>>>
>>>>> If this is in place, then min_reqbufs_allocation should be set to a sane number of
>>>>> buffers (i.e. typically 3 or 4), and if you want precise control, use VIDIOC_CREATE_BUFS.
>>>>
>>>
>>>
>>
>>
> 
> 

