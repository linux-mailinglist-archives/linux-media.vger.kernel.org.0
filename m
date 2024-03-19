Return-Path: <linux-media+bounces-7319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98B87FFBF
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 15:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C2D1F262F3
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 14:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815E462818;
	Tue, 19 Mar 2024 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YaA7GB8E"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE4BA38
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710859125; cv=none; b=HAxhrviYyirGOPhno0+pxg59z+vWWiAkMIR/uPopdTfk9QGX9MpqRoHjAN0VPZrrYyP+DtjgxcM7BmPUdi9GcYE5hs7fEviidqIEaeqhbhDZww/PMRC8PLtfyCnw9HEqZeSEIBabiUXsMqoDzDD7etGm+TCA5MYsFOxtw7Sauck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710859125; c=relaxed/simple;
	bh=dszI2Xwrv/OAYEfQULjv+546emqZR5EyOa/lIxxX3rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDHoPYY0BRPFHX3YWm0f8Sizt6VtYfcPQ1XqCQjybtTfB78Bt06M+mjTfO+xMSBqTywgVB+1/C7oJuBUKDCiGyV4W63XcNuOSjje6xk1C5ETallfNbvklNTIsdw9CZ9R42Hy3GUjBYZqh1DruY2hdMt0xOxZcFcihGZCrI7hcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YaA7GB8E; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710859122;
	bh=dszI2Xwrv/OAYEfQULjv+546emqZR5EyOa/lIxxX3rI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YaA7GB8ERw0AnbUaBJmiQ5sJyVNxUKHq6IWuxvIEBj5YV5XYR5JQ5yPr3ZXZW5Nxf
	 L4eubsjdJ3ZsAwoY5hRqweCV9xxuNCb0Cf4wRmHKe2WKsmUsbLgyzJrb118a+1deC9
	 DT03QRM6Q7QerFxWJe0rdEw2/ndrMePepmOVDVwblU+z+GBmtPWNCin9RLUOVqbhuG
	 133jqPMolYiSAAR2ybu8flhYWNo5sPAA18oQE+qA93U2pa5e86/QeKEsfwojde3DuO
	 01+qizliu3szKf6qILQQK4Ab29RKYT06JvsBwLdyMJ1ot5/yy+BcMJmQFrk05mm9Fi
	 rWPCpc4U7QM4g==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 04B8F3780016;
	Tue, 19 Mar 2024 14:38:40 +0000 (UTC)
Message-ID: <b9ff9d89-ac54-46c5-ac9f-8b83fe604dc9@collabora.com>
Date: Tue, 19 Mar 2024 15:38:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/38] media: Documentation: v4l: Document internal
 source pads
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-10-sakari.ailus@linux.intel.com>
 <f4e9ebbe-29a6-4f7e-9420-c6c46293d762@collabora.com>
 <ZfmXW4tkh3FOKXU8@kekkonen.localdomain>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <ZfmXW4tkh3FOKXU8@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,
On 3/19/24 14:47, Sakari Ailus wrote:
> Hi Julien,
> 
> On Fri, Mar 15, 2024 at 04:32:59PM +0100, Julien Massot wrote:
>>
>>
>> On 3/13/24 08:24, Sakari Ailus wrote:
>>> Document internal source pads, pads that have both SINK and INTERNAL flags
>>> set. Use the IMX219 camera sensor as an example.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>    .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
>>>    1 file changed, 145 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> index a387e8a15b8d..1808f40f63e3 100644
>>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
>>>    sub-device and a (pad, stream) pair. For sub-devices that do not support
>>>    multiplexed streams the 'stream' field is always 0.
>>> +.. _v4l2-subdev-internal-source-pads:
>>> +
>>> +Internal source pads and routing
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +Cases where a single sub-device source pad is traversed by multiple streams, one
>>> +or more of which originate from within the sub-device itself, are special as
>>> +there is no external sink pad for such routes. In those cases, the sources of
>>> +the internally generated streams are represented by internal source pads, which
>>> +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
>>> +pad flag set.
>>> +
>>> +Internal pads have all the properties of an external pad, including formats and
>>> +selections. The format in this case is the source format of the stream. An
>>> +internal pad always has a single stream only (0).
>>> +
>>> +Routes from an internal source pad to an external source pad are typically not
>>> +modifiable but they can be activated and deactivated using the
>>> +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
>>> +on driver capabilities.
>>> +
>>>    Interaction between routes, streams, formats and selections
>>>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> @@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
>>>       the configurations along the stream towards the receiver, using
>>>       :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>>>       stream endpoint in each sub-device.
>>> +
>>> +Internal pads setup example
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +A simple example of a multiplexed stream setup might be as follows:
>>> +
>>> +- An IMX219 camera sensor source sub-device, with one sink pad (0), one source pad
>>> +  (1), an internal sink pad (2) that represents the source of embedded
>> The pixel pad is an internal pad as well ?
> 
> How about:
> 
> - An IMX219 camera sensor source sub-device, with one internal sink pad
>    (0) for image data, one source pad (1), an internal sink pad (2) that
>    represents the source of embedded
sure looks good to me!

>   
>>
>>> +  data. There are two routes, one from the sink pad to the source, and another
>>> +  from the internal sink pad to the source pad. Both streams are always active,
>>> +  i.e. there is no need to separately enable the embedded data stream. The
>>> +  sensor uses the CSI-2 bus.
>>> +
>>> +- A CSI-2 receiver in the SoC (Receiver). The receiver has a single sink pad
>>> +  (pad 0), connected to the bridge, and two source pads (pads 1-2), going to the
>>> +  DMA engine. The receiver demultiplexes the incoming streams to the source
>>> +  pads.
>>> +
>>> +- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
>>> +  connected to a single source pad in the receiver.
>>> +
>>> +The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
>>> +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
>>> +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
>>> +
>>> +To configure this pipeline, the userspace must take the following steps:
>>> +
>>> +1) Set up media links between entities: connect the sensors to the bridge,
>>> +   bridge to the receiver, and the receiver to the DMA engines. This step does
>>> +   not differ from normal non-multiplexed media controller setup.
>>> +
>>> +2) Configure routing
>>> +
>>> +.. flat-table:: Camera sensor. There are no configurable routes.
>>> +    :header-rows: 1
>>> +
>>> +    * - Sink Pad/Stream
>>> +      - Source Pad/Stream
>>> +      - Routing Flags
>>> +      - Comments
>>> +    * - 0/0
>>> +      - 1/0
>> - 1/0
>> - 0/0
>>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>>> +      - Pixel data stream from the sink pad
>>> +    * - 2/0
>>> +      - 1/1
>> - 0/1
>>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>>> +      - Metadata stream from the internal sink pad
>>
>> In latest patch "[PATCH v6 05/15] media: i2c: imx219: Add embedded data
>> support"
>> we have:
>> - 0 -> source pad
>> - 1 -> pixel/image
>> - 2 -> EDATA
>>
>> This is also what you did for ov2740.
> 
> Yes, these were leftovers from the CCS example. I've fixed them.
> 
>>
>> With that fixed:
>> Reviewed-by Julien Massot <julien.massot@collabora.com>
> 
> Thank you!
> 

