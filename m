Return-Path: <linux-media+bounces-46224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E3C2D1C5
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 17:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6731189044B
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 16:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D132302CB2;
	Mon,  3 Nov 2025 16:25:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E83164D9;
	Mon,  3 Nov 2025 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187106; cv=none; b=N+HJipXy/78UzHDQf0xElA2CO5SvpOtWKe3Ed4rEkpuX2YEzE0iU+bqicfpHc7O4VSyfV1C234n/kO8/8qBc9eZlypvhAuswYk0Nsvnt2vatL//8Hff5UmCsud/wUSRtevUO5KI+OqMvNI1aVfOA8VM2NAkRg1YfIS0NlswUY5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187106; c=relaxed/simple;
	bh=ttAPdy4/JmO4ihisprisHBEG2ZNFvg/ddXNogR5EIO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awL8JLuc8xyfzeW99S2dg0hC3TecYGsCMfoyqsfwDwO+xYHJTFJvQ7wwr/7Zjq2NI3phM0uGxjdP/Ef9JWqehHDmmkrZWWyYYGzkyd8qZalyaqUWEKf/mDLeJW7O4B4XgHXIWcPnbXCB3bZv1YEs8d10X8117WOc+LQrixcN1GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id 5430310DE9C4;
	Mon,  3 Nov 2025 17:19:47 +0100 (CET)
Message-ID: <a7c2b507-90e8-4b0b-92d6-5b232e7ba22f@emfend.at>
Date: Mon, 3 Nov 2025 17:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: add Himax HM1246 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>,
 bsp-development.geo@leica-geosystems.com
References: <20251017-hm1246-v4-0-e3388ea2f08c@emfend.at>
 <20251017-hm1246-v4-2-e3388ea2f08c@emfend.at>
 <aPec0SRvDlqtVKIJ@kekkonen.localdomain>
 <6e7a63b1-6aee-4b4f-9fb9-2f2df92782b4@emfend.at>
 <85df7f30-e9ac-422e-8ab5-7c6b82774aaf@emfend.at>
 <aQiL111bKgKE6M22@kekkonen.localdomain>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <aQiL111bKgKE6M22@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

Am 03.11.2025 um 12:02 schrieb Sakari Ailus:
> Hi Matthias,
> 
> Thanks for the ping.
> 
> On Mon, Nov 03, 2025 at 07:54:52AM +0100, Matthias Fend wrote:
>> Hi Sakari,
>>
>> Am 23.10.2025 um 11:00 schrieb Matthias Fend:
>>> Hi Sakari,
>>>
>>> thanks a lot for your feedback.
>>
>> I had two follow-up questions regarding your feedback, but I suspect they
>> got lost in all the code. I've cleaned up this mail a bit to make the
>> questions more visible.
>>
>>>>> +
>>>>> +static int hm1246_update_controls(struct hm1246 *hm1246,
>>>>> +                  const struct hm1246_mode *mode)
>>>>> +{
>>>>> +    s64 pixel_rate, exposure_max, vblank, hblank;
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl, mode-
>>>>>> link_freq_index);
>>>>
>>>> Does this do something? There's only a single link frequency value (and
>>>> index) supported.
>>>
>>> You're right. Even though hm1246_update_controls() isn't exactly wrong,
>>> I could currently remove this function completely. The sensor supports
>>> various modes (which result in different clock rates), and I've already
>>> started implementing more of them. With multiple modes the controls need
>>> to be updated. However, since there were still some internal sensor
>>> issues to be addressed and I haven't been able to fully test them, I've
>>> decided to use only the presumably most common RAW mode for now.
>>>
>>> Should I remove the function now and add it back once more modes are
>>> implemented?
> 
> I think it'd be better to postpone adding this. I think you'll need further
> logic to support this and it'd be better to review this in conjunction with
> the additional features.

Okay, then I will remove hm1246_update_controls() for now.

> 
>>>
>> ...
>>>>> +static int hm1246_parse_fwnode(struct hm1246 *hm1246)
>>>>> +{
>>>>> +    struct fwnode_handle *endpoint;
>>>>> +    struct v4l2_fwnode_endpoint bus_cfg = {
>>>>> +        .bus_type = V4L2_MBUS_PARALLEL,
>>>>> +    };
>>>>> +    int ret;
>>>>> +
>>>>> +    endpoint =
>>>>> fwnode_graph_get_endpoint_by_id(dev_fwnode(hm1246- >dev), 0,
>>>>> +                           0,
>>>>> +                           FWNODE_GRAPH_ENDPOINT_NEXT);
>>>>> +    if (!endpoint)
>>>>> +        return dev_err_probe(hm1246->dev, -EINVAL,
>>>>> +                     "missing endpoint node\n");
>>>>> +
>>>>> +    ret = v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg);
>>>>
>>>> What about validating the link frequencies? You can use
>>>> v4l2_link_freq_to_bitmap(), too.
>>>
>>> I was under the impression that for sensors with a parallel interface,
>>> no frequency information is provided in the device tree (because there's
>>> no need for it). Since there are no frequency entries, they can't be
>>> verified.
>>>
>>> Am I wrong, or did you perhaps mean something else?
> 
> The current documentation
> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html>
> doesn't distinguish CSI-2 and parallel interfaces in this respect. It's a
> good idea to ensure a safe frequency is used as the driver works the same
> way in all cases, whether or not using one is mandatory.

If I understand correctly, this means that in the bindings, the port 
property 'link-frequencies' should be marked as 'required', and the port 
in the example node should be extended with the line 'link-frequencies = 
/bits/ 64 <42174000>;'.
Then, during probe, it can be checked with v4l2_link_freq_to_bitmap() 
whether the link frequency entered in the device tree is supported (this 
also requires switching to v4l2_fwnode_endpoint_alloc_parse).

Does this describe the desired change?

Thanks for your help!
  ~Matthias

> 


