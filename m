Return-Path: <linux-media+bounces-25926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8644EA2EF37
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 15:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3454C7A30A7
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65126231A52;
	Mon, 10 Feb 2025 14:07:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C518231C89
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196461; cv=none; b=m2DNbuvnJLKNJpzxVKh2Vl5S9JCe/dgzPq88EiztuEXo4Nrm9TLDClo7g9K5ZmG4iLxFJX2IiKyQ7UQXpEHRPnQzwSpggs0IBQvbGObs46Vp9NF7aqwsDbQwSkxYyK4GswIJr93S2QdJvOU1ns8VKCUcUMXFJNfEUz2nr6a7+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196461; c=relaxed/simple;
	bh=I/Cy4wNzXkhO+RCgxyw1lu2HFOiKTeZFa+ZutVOYOi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nlmbsq3hUDRHckihLyVBd+ODBZ9Zvs4j/rabQvru8BnL05OYfukG5LYT0OWMdvsq7hERb7WBmVPSQidTtlcXliYWQT8kGVbIw9B4dn8wKbMjdhMCt8oehw2TM90V+KPud+Mj4r/jTQY0Z0nqsp2i1Rxj/VWzptEO1TBcWLExJrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574BAC4CEE5;
	Mon, 10 Feb 2025 14:07:34 +0000 (UTC)
Message-ID: <98c452a6-454b-4842-8083-c7e748abff21@xs4all.nl>
Date: Mon, 10 Feb 2025 15:07:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 06/15] media: uapi: Add V4L2_CID_CONFIG_MODEL control
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-7-sakari.ailus@linux.intel.com>
 <5ea2deef-09f4-4788-908c-239a1e4c6b69@xs4all.nl>
 <Z6n-Nff-7dsvMHaI@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <Z6n-Nff-7dsvMHaI@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 14:25, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Feb 10, 2025 at 10:09:33AM +0100, Hans Verkuil wrote:
>> Hi Sakari,
>>
>> On 03/02/2025 09:58, Sakari Ailus wrote:
>>> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
>>>  include/uapi/linux/v4l2-controls.h                           | 3 +++
>>>  3 files changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> index 27803dca8d3e..2ae17ed99729 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> @@ -55,3 +55,7 @@ Image Process Control IDs
>>>      control value divided by e.g. 0x100, meaning that to get no
>>>      digital gain the control value needs to be 0x100. The no-gain
>>>      configuration is also typically the default.
>>> +
>>> +``V4L2_CID_CONFIG_MODEL (bitmask)``
>>> +    Which configuration models the sub-device supports. Please see
>>> +    :ref:`media_subdev_config_model`. This is a read-only control.
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 1ea52011247a..24c9c25e20d1 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
>>>  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
>>>  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
>>> +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
>>>  
>>>  	/* DV controls */
>>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>> @@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>  	case V4L2_CID_DV_RX_POWER_PRESENT:
>>>  		*type = V4L2_CTRL_TYPE_BITMASK;
>>>  		break;
>>> +	case V4L2_CID_CONFIG_MODEL:
>>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +		*type = V4L2_CTRL_TYPE_BITMASK;
>>> +		break;
>>>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>>>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 974fd254e573..731add75d9ee 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
>>>  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
>>>  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
>>>  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
>>> +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
>>> +
>>> +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1U << 0)
>>
>> I think I mentioned this before, but what's the point of this?
> 
> I recall Laurent was last to reply to the thread, with a good explanation
> of the purpose. The message id is
> <20241118024002.GJ31681@pendragon.ideasonboard.com> .

Now document that in this patch series. I double checked patch 04/15 again,
and there is no mention of that explanation from Laurent. It should be incorporated
in that patch.

Open questions:

1) If this control is not available, but it is still a camera sensor, what is
   userspace supposed to to? I guess all it can do is assume that the driver
   follows the standard rules, since there is no way to figure out if there are
   differences. So again, how does this help? In any case, this should be
   documented as well.

2) Are there compliance tests for this? Because there is no point adding this
   without having tests for it as well. Otherwise I can 100% guarantee that
   drivers will set this even if it deviates from what it should do in some
   way. Relying on code review alone is going to be a very tough job.

> 
>>
>> You are adding a control describing a configuration model, but it has
>> just a single possible configuration model. I see no description anywhere
>> about when a new model would need to be added, or what userspace is
>> supposed to do with this.
> 
> At this point I'm not sure how many other configuration models might be
> needed or when they would be needed.
> 
>>
>> And as long as there is only one model anyway, I don't see the point of
>> this control.
> 
> I could create a control just for the common raw sensor model but 
> 
>>
>> Is the intention that all sensor drivers will set this control? The RFC
>> series isn't clear about this.
> 
> I'd expect almost all new raw sensor drivers to expose this control with
> the common raw bit set.
> 
>>
>> The problem I see with this series is that it seems to mix seemingly
>> unrelated changes: adding COLOUR_PATTERN/BINNING controls doesn't seem to
>> depend on configuration models. Or if they do, I clearly didn't get that.
> 
> These are all related to sensor API improvements. There is no direct
> dependency, no, but I expect drivers implementing the common raw sensor
> model would also support these controls. I can document this.

Just split it up in two separate series. I have no objections to the sensor API
improvements, so it is much easier to get that in.

But I think that the 'config_model' part is poorly documented and I am quite
skeptical about the whole thing. So that shouldn't block the other changes
from this RFC series.

Regards,

	Hans

