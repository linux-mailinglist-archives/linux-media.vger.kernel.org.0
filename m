Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F2D1A8FA5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 02:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392356AbgDOARf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 20:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392351AbgDOAR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 20:17:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494EBC061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 17:17:27 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so5931281pjb.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 17:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WgQe8pIzE9UmRzz3rfqqYpoD0kdZ2cEd3WmcL3l/NqM=;
        b=lbA8skElEAM2eXtP4JJZAlOd4h3whwhj8rLKFlEE2mljlHyrG4LH4szQlDZFW18hfH
         vwnVJD3VxTLuzs2cuN81fr7eX5q98m3g4sNvMgk7CIJScy4jqEqNIkJKYJ3Wz8PrvOAc
         xrhPI0f5PHGKACrfs5bex1eDuf3aIxgYpESOvn/mRUwebR9DjXK2fjsIbRIyVl/cZgyX
         3dvU/mF3onEjf7Lz0sD1tpygwqzt/j+Joyo01zRseS4OmugRKSi+KTRHSJAvvEVSmHwR
         WJPZKHFJPxHMAX8SmnV602HS8bLXOOl5pDiEhElx/jyFI/4T/vxgi+U57MRd7NfeurtO
         BcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WgQe8pIzE9UmRzz3rfqqYpoD0kdZ2cEd3WmcL3l/NqM=;
        b=eXw+WQssa5fXcsL0KiKMpFCHaGVrJnxudtL5Gz4vDmlxquLqTOK1yBWE+Y5YsgXSna
         JpNMRR72ykrpkz6NPj5b79iAQ+RrPqIGDqVbs7L/lRVX0deOmIIt+rSz1228wygeTdkk
         mzhIWv2rh+CLvHqCdHYrHO5Vn66/INYAtLT7kUv0ofUL7k0Tnlp2/r7DHkvOVC83lvEq
         EhEO1fdGwjmI0dJe6yv9hmr1yWo5prCUa5pLp+C31xOnCWxZLIxC09uKKGKG8iQWP5bH
         aa7qVekq3ugygMMaP7tbTXyPyXPk6i5HtYli+p/52cQdxibMZE/NEfKczXreJAyRwHAm
         Y/2g==
X-Gm-Message-State: AGi0Pua6xdlxmqynTloSNaAMu2WDXk39CBm6zCJVqEXDXoxr8LEoPpNW
        N81mouNJEJ6+utJjpgswB+g=
X-Google-Smtp-Source: APiQypIlMOq0DR7Ks2ZsLMZEu+hImxCRK1qSN8HxufnMjKzF7xlscm/cO6ghlKVq2G+MY178ChS6TQ==
X-Received: by 2002:a17:90a:558a:: with SMTP id c10mr2940369pji.53.1586909846688;
        Tue, 14 Apr 2020 17:17:26 -0700 (PDT)
Received: from [192.168.1.101] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id a13sm2280276pfo.85.2020.04.14.17.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 17:17:25 -0700 (PDT)
Subject: Re: [PATCH v4 07/17] media: video-mux: Implement get_fwnode_pad op
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-8-slongerbeam@gmail.com>
 <20200414230830.GD27621@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <6ca31589-32a8-31bc-7e76-d291b4f6516d@gmail.com>
Date:   Tue, 14 Apr 2020 17:17:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414230830.GD27621@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/14/20 4:08 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> Thank you for the patch.
>
> On Tue, Mar 03, 2020 at 03:42:46PM -0800, Steve Longerbeam wrote:
>> Implement get_fwnode_pad operation. If the endpoint is owned by the video
>> mux, return the endpoint's port number. The video mux maps fwnode port
>> numbers and pad indexes 1:1.
> If you follow my suggestion from 06/17, this patch could be dropped.

Agreed.

Steve

>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/media/platform/video-mux.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
>> index 7b6c96a29aa5..f446ada82176 100644
>> --- a/drivers/media/platform/video-mux.c
>> +++ b/drivers/media/platform/video-mux.c
>> @@ -94,9 +94,38 @@ static int video_mux_link_setup(struct media_entity *entity,
>>   	return ret;
>>   }
>>   
>> +static int video_mux_get_fwnode_pad(struct media_entity *entity,
>> +				    struct fwnode_endpoint *endpoint)
>> +{
>> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>> +	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
>> +	struct fwnode_handle *vmux_fwnode = dev_fwnode(vmux->subdev.dev);
>> +	struct fwnode_handle *vmux_ep;
>> +
>> +	/*
>> +	 * If the endpoint is one of ours, return the endpoint's port
>> +	 * number. This device maps port numbers and pad indexes 1:1.
>> +	 */
>> +	fwnode_graph_for_each_endpoint(vmux_fwnode, vmux_ep) {
>> +		if (endpoint->local_fwnode == vmux_ep) {
>> +			struct fwnode_endpoint fwep;
>> +			int ret;
>> +
>> +			ret = fwnode_graph_parse_endpoint(vmux_ep, &fwep);
>> +
>> +			fwnode_handle_put(vmux_ep);
>> +
>> +			return ret ? ret : fwep.port;
>> +		}
>> +	}
>> +
>> +	return -ENXIO;
>> +}
>> +
>>   static const struct media_entity_operations video_mux_ops = {
>>   	.link_setup = video_mux_link_setup,
>>   	.link_validate = v4l2_subdev_link_validate,
>> +	.get_fwnode_pad = video_mux_get_fwnode_pad,
>>   };
>>   
>>   static int video_mux_s_stream(struct v4l2_subdev *sd, int enable)

