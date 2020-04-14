Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8021A8F24
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392164AbgDNXaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392146AbgDNX3s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:29:48 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E45C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:29:48 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b8so679222pfp.8
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+BoPuEfnHdXE2gEAnAoQk4gK86mk79wFQ7SQqtT5kv8=;
        b=C56ReY3Pi4phZUnbedXBFj0EpqaDywpsQNyNTnqLBpMTj4tILohMTI1VUkWX/u6FG3
         oB6I2i3AZEwI+AnLio8Z+rzf203bdqIzEYbf7ATI7T30XUo/GwriveM3XdyVebWYnx6j
         e51LfbmHt5d13rpx4TSeZDgNXD5Z6Nje/Ws5vcpJMrPKrvxDqL5FGwgaPMPYg4Y4rd76
         MpmguXOD2Cr4yxU/9NTwfd6O7gVUZ9wNJPh/keTJcgpY04mZZhPvlvp8V+oHqalLGTyN
         XvSDuN37aiCZFqowNtQdutSikvo7PJw7sig5H2eA0s3B3W+dJIQnlhNdK5Rm+BzHYpH/
         vxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+BoPuEfnHdXE2gEAnAoQk4gK86mk79wFQ7SQqtT5kv8=;
        b=K4jLpOYDod8WJljuJaVXyIAeQpKXSDFVATivQNMdJ+D3O6mMkZMBJJG0SnrlBglKjI
         7vfiHn+KBYruRTAuq7TDsbvqWrKuNWG489ZKEqt+9Josdv3qdQIhlr1RZmKt7NpVudEw
         DXHujU7Cugv+mPSiDjHUXG+gEpYJQPbrTinsbUmI2UqIXkP0lVLUmlHRyMowxYDEydQL
         ZqeATX9KH5t4YM15d7F2YFzJgRcHlfEtpf5ZhrGqvSsq+RoRj4tEnWXpKdveq8D7FsSH
         k+w99TVNcaTMzrUishqG34M991gRyLjq/34vCyqBgYncKNcY+Vkcp31/apoFhFfTkddg
         5e4Q==
X-Gm-Message-State: AGi0Puag0KVHOHRmxpG8oe89uAIXdTL9ruS2828GdEDLgaswZwx0C9u0
        lNU4V6XnZCqL3elGYWLUMGE=
X-Google-Smtp-Source: APiQypKbNXvQ1ro/dDr/N596XmLLRECF4iAAQYcCKwxV0nYTxE7iX/UQgvsbuu3vWMJMApuD6BxBmg==
X-Received: by 2002:a63:1210:: with SMTP id h16mr11139247pgl.328.1586906988231;
        Tue, 14 Apr 2020 16:29:48 -0700 (PDT)
Received: from [192.168.1.101] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id a13sm12167598pfc.26.2020.04.14.16.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 16:29:47 -0700 (PDT)
Subject: Re: [PATCH v4 06/17] media: imx: mipi csi-2: Implement get_fwnode_pad
 op
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-7-slongerbeam@gmail.com>
 <20200414230729.GC27621@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <10089e5e-a24e-20cc-17da-0cda7611441c@gmail.com>
Date:   Tue, 14 Apr 2020 16:29:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414230729.GC27621@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 4/14/20 4:07 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> Thank you for the patch.
>
> On Tue, Mar 03, 2020 at 03:42:45PM -0800, Steve Longerbeam wrote:
>> Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
>> CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
>> maps port numbers and pad indexes 1:1.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
>> index fdd763587e6c..8500207e5ea9 100644
>> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
>> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
>> @@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
>>   				      640, 480, 0, V4L2_FIELD_NONE, NULL);
>>   }
>>   
>> +static int csi2_get_fwnode_pad(struct media_entity *entity,
>> +			       struct fwnode_endpoint *endpoint)
>> +{
>> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>> +	struct csi2_dev *csi2 = sd_to_dev(sd);
>> +	struct fwnode_handle *csi2_ep;
>> +
>> +	/*
>> +	 * If the endpoint is one of ours, return the endpoint's port
>> +	 * number. This device maps port numbers and pad indexes 1:1.
>> +	 */
>> +	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
>> +		if (endpoint->local_fwnode == csi2_ep) {
>> +			struct fwnode_endpoint fwep;
>> +			int ret;
>> +
>> +			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
>> +
>> +			fwnode_handle_put(csi2_ep);
>> +
>> +			return ret ? ret : fwep.port;
>> +		}
>> +	}
>> +
>> +	return -ENXIO;
>> +}
> As the 1:1 mapping is the common case, would it make sense to modify
> media_entity_get_fwnode_pad() accordingly when .get_fwnode_pad is not
> set ?

Yes! In fact that was a previous revision of this patchset (v2). But I 
dropped that idea in v3 and v4 because it didn't seem to be getting any 
traction.

I guess I'll try again. I'll bring back [1] in v5.

Steve


[1] https://patchwork.linuxtv.org/patch/60312/

>   The current behaviour is to return the first pad that matches the
> requested direction, which could be preserved as a second-level fallback
> if the 1:1 mapping doesn't give the right direction (but I'm not sure
> there's a use case for that, the 1:1 mapping seems to be all we need if
> there's no specific .get_fwnode_pad implementation).
>
>> +
>>   static const struct media_entity_operations csi2_entity_ops = {
>>   	.link_setup = csi2_link_setup,
>>   	.link_validate = v4l2_subdev_link_validate,
>> +	.get_fwnode_pad = csi2_get_fwnode_pad,
>>   };
>>   
>>   static const struct v4l2_subdev_video_ops csi2_video_ops = {

