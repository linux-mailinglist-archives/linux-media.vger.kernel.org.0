Return-Path: <linux-media+bounces-46178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 149CCC2A3E5
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 08:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750973B1FAD
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 07:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C28299949;
	Mon,  3 Nov 2025 07:05:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out2.tele.net (rmisp-mx-out2.tele.net [194.208.23.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1B28BEC;
	Mon,  3 Nov 2025 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762153507; cv=none; b=VQd5mFZ2r7ZmLoHlCD71Dr0ymgQJR63zgKP9ijNNbMUDb3WBg5h89jZZSm0BTLeMEh03rAM+fulgiTPzGGo3uFkysoEwQaahWujHgTsRKEjVylLznYILM2BVOwfcQATobp4VKf2HaTFKOJfNjrqDvcwtR7XySkieMO2RzBk+35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762153507; c=relaxed/simple;
	bh=HuveqqMQYBSMecE9DP/d0cDcuWOD0cx50Z8gOxyd9mk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aAtaToTkzR6Rob4Sk56qgm+aouCVkpgswfz1ypZgd23Jvib09eMXhhRufzthNS/zS3VSR0WfRaJG31RmYoJy1HtpfXenSQmIDu4u4+0RQd9yx3lRy89un6MA7/icBdwhBdHPyPvmpxsYgABUTiS1blZ4L27W8TeCxqQXWXHcOgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out2.tele.net (Postfix) with ESMTPA id CDCAE109E1C6;
	Mon,  3 Nov 2025 07:54:57 +0100 (CET)
Message-ID: <85df7f30-e9ac-422e-8ab5-7c6b82774aaf@emfend.at>
Date: Mon, 3 Nov 2025 07:54:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: add Himax HM1246 image sensor driver
From: Matthias Fend <matthias.fend@emfend.at>
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
Content-Language: de-DE
In-Reply-To: <6e7a63b1-6aee-4b4f-9fb9-2f2df92782b4@emfend.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

Am 23.10.2025 um 11:00 schrieb Matthias Fend:
> Hi Sakari,
> 
> thanks a lot for your feedback.

I had two follow-up questions regarding your feedback, but I suspect 
they got lost in all the code. I've cleaned up this mail a bit to make 
the questions more visible.

>>> +
>>> +static int hm1246_update_controls(struct hm1246 *hm1246,
>>> +                  const struct hm1246_mode *mode)
>>> +{
>>> +    s64 pixel_rate, exposure_max, vblank, hblank;
>>> +    int ret;
>>> +
>>> +    ret = __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl, mode- 
>>> >link_freq_index);
>>
>> Does this do something? There's only a single link frequency value (and
>> index) supported.
> 
> You're right. Even though hm1246_update_controls() isn't exactly wrong, 
> I could currently remove this function completely. The sensor supports 
> various modes (which result in different clock rates), and I've already 
> started implementing more of them. With multiple modes the controls need 
> to be updated. However, since there were still some internal sensor 
> issues to be addressed and I haven't been able to fully test them, I've 
> decided to use only the presumably most common RAW mode for now.
> 
> Should I remove the function now and add it back once more modes are 
> implemented?
> 
...
>>> +static int hm1246_parse_fwnode(struct hm1246 *hm1246)
>>> +{
>>> +    struct fwnode_handle *endpoint;
>>> +    struct v4l2_fwnode_endpoint bus_cfg = {
>>> +        .bus_type = V4L2_MBUS_PARALLEL,
>>> +    };
>>> +    int ret;
>>> +
>>> +    endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(hm1246- 
>>> >dev), 0,
>>> +                           0,
>>> +                           FWNODE_GRAPH_ENDPOINT_NEXT);
>>> +    if (!endpoint)
>>> +        return dev_err_probe(hm1246->dev, -EINVAL,
>>> +                     "missing endpoint node\n");
>>> +
>>> +    ret = v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg);
>>
>> What about validating the link frequencies? You can use
>> v4l2_link_freq_to_bitmap(), too.
> 
> I was under the impression that for sensors with a parallel interface, 
> no frequency information is provided in the device tree (because there's 
> no need for it). Since there are no frequency entries, they can't be 
> verified.
> 
> Am I wrong, or did you perhaps mean something else?
> 
Thanks
  ~Matthias


