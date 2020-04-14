Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6D41A8F51
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634442AbgDNXu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634435AbgDNXu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:50:57 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22D1C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:50:57 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v23so713240pfm.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ryfJ1ujTjfeYpol9FsSgOw6W4bPzr8jdsMy5KM29IRU=;
        b=JQjGwsfPFz+skxrYAnZCNNotsqOmAyWPHV+gtQ5o6bgoYHEuCIP+FhqRBG9kXk91A1
         wpLgQCMzWsTp1sJSoVlFcl1LUlNHiMpLvV0SlPHJ/upthcEkWTVmk14XmY63rwkONZPf
         k3yL55+nugKSun++NMW2q/RdCQY8VA7vumtQpwJVf3JP/rXxslIBCkPVLhc6UNpOKHUH
         4YK/dCAosZEFe/e9JPDT4YruPeCmXXPs6cqfD08hRf6Ef6iV1cQUCxdNMIzQosk5W8oC
         X/fsF/I1tVluYUeF/jbe0IX5KXhJUliOJ3n4IIjMv2j5cL7NYt06YH8XADpXgBKXIv9m
         jx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ryfJ1ujTjfeYpol9FsSgOw6W4bPzr8jdsMy5KM29IRU=;
        b=Ga12kFvlxNPewwsdhbbzJa1LUw74t1iDj3xcIQZEw9FTLxkufPvJXZ2jWLBMNruSG4
         zxbtj83p4T3df58qZNdnZW3emdum50Yi7CVFYVxtLzL1/qjuclTIW3jxM9xvt6Rfhayl
         VJJthC/NI6jmlEtQR9g70gsmhp7+9MKPTJnO7ymG9hSBITqsk/uLTK0xfxz3mykiu+U7
         E7838n8H7aVih1RgChBuxxtU3W+xDm3a36QMN6Xf/sruYhbcmlReiRqPxi2TdE2LbEok
         0HMofRUovBZqRsFbparA2B+vknCzaVkLg/5LjukplDt+OeBef6fn6qYw0gj20ssvGOxk
         S02g==
X-Gm-Message-State: AGi0Pub6RtCvFCqrsh0sPEGpiI8RldLYr6FwPpiljq7tG6QMnLR+3T3y
        uOMG8trawr9jWDo7mU0OsvY=
X-Google-Smtp-Source: APiQypL7L6tJhNIzXP3EH+3UWE2Bz7cMl+GIaQEZad+b12S9VYy8CCXNQ8dxkInAfzSv60Con4YL4w==
X-Received: by 2002:a63:7b1a:: with SMTP id w26mr22990250pgc.298.1586908257212;
        Tue, 14 Apr 2020 16:50:57 -0700 (PDT)
Received: from [192.168.1.101] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id h6sm12039263pfq.200.2020.04.14.16.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 16:50:56 -0700 (PDT)
Subject: Re: [PATCH v4 06/17] media: imx: mipi csi-2: Implement get_fwnode_pad
 op
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-7-slongerbeam@gmail.com>
 <20200414230729.GC27621@pendragon.ideasonboard.com>
 <20200414232036.GB27762@paasikivi.fi.intel.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <6d8b82c4-be84-4722-4f5a-558b5ffe7b80@gmail.com>
Date:   Tue, 14 Apr 2020 16:50:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414232036.GB27762@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Laurent,

On 4/14/20 4:20 PM, Sakari Ailus wrote:
> Hi Laurent,
>
> On Wed, Apr 15, 2020 at 02:07:29AM +0300, Laurent Pinchart wrote:
>> Hi Steve,
>>
>> Thank you for the patch.
>>
>> On Tue, Mar 03, 2020 at 03:42:45PM -0800, Steve Longerbeam wrote:
>>> Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
>>> CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
>>> maps port numbers and pad indexes 1:1.
>>>
>>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>>> ---
>>>   drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
>>> index fdd763587e6c..8500207e5ea9 100644
>>> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
>>> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
>>> @@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
>>>   				      640, 480, 0, V4L2_FIELD_NONE, NULL);
>>>   }
>>>   
>>> +static int csi2_get_fwnode_pad(struct media_entity *entity,
>>> +			       struct fwnode_endpoint *endpoint)
>>> +{
>>> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>>> +	struct csi2_dev *csi2 = sd_to_dev(sd);
>>> +	struct fwnode_handle *csi2_ep;
>>> +
>>> +	/*
>>> +	 * If the endpoint is one of ours, return the endpoint's port
>>> +	 * number. This device maps port numbers and pad indexes 1:1.
>>> +	 */
>>> +	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
>>> +		if (endpoint->local_fwnode == csi2_ep) {
>>> +			struct fwnode_endpoint fwep;
>>> +			int ret;
>>> +
>>> +			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
>>> +
>>> +			fwnode_handle_put(csi2_ep);
>>> +
>>> +			return ret ? ret : fwep.port;
>>> +		}
>>> +	}
>>> +
>>> +	return -ENXIO;
>>> +}
>> As the 1:1 mapping is the common case, would it make sense to modify
>> media_entity_get_fwnode_pad() accordingly when .get_fwnode_pad is not
>> set ? The current behaviour is to return the first pad that matches the
> I also think this would make sense.

What do you think about https://patchwork.linuxtv.org/patch/60312/ ? I'm 
planning to resurrect it for v5.

Steve

>> requested direction, which could be preserved as a second-level fallback
>> if the 1:1 mapping doesn't give the right direction (but I'm not sure
>> there's a use case for that, the 1:1 mapping seems to be all we need if
>> there's no specific .get_fwnode_pad implementation).
> I believe at least the smiapp driver breaks if you do that, so the current
> behaviour should be retained (secondary to the 1:1 mapping).
>

