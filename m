Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79821D2C27
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgENKFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 06:05:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60988 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENKFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 06:05:34 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2ECC9A8;
        Thu, 14 May 2020 12:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589450732;
        bh=HIFwH/zOaG31nesCn5CYtH8UsMJVPfM9hl/t5q8ugGw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l3JU6WsAtFYJQ0oW0AMxTQpL7yuv2VFOn2B78j+H5oRrMUCN8EywMz11LKmckgDGQ
         WTQ5EKNg372EPCC1DFcy161FEDQCIdL/LANgmeGPK/THbUe9E5ZqT1QOeM2RRW3lIu
         ygToiBIb6KqYFH8FtHADBrUwhlK2rA8kU+2RTeM4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200512174056.GH5526@Mani-XPS-13-9360>
 <e07af762-2db1-920c-5ab8-5528bdcfc2ce@ideasonboard.com>
 <20200514095948.GE2877@Mani-XPS-13-9360>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <92d53749-4ba4-503c-f7c2-386d32d2876d@ideasonboard.com>
Date:   Thu, 14 May 2020 11:05:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514095948.GE2877@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mani,

On 14/05/2020 10:59, Manivannan Sadhasivam wrote:
> On Thu, May 14, 2020 at 10:53:00AM +0100, Kieran Bingham wrote:
>> Hi Mani,
>>>> +static int max9286_set_fmt(struct v4l2_subdev *sd,
>>>> +			   struct v4l2_subdev_pad_config *cfg,
>>>> +			   struct v4l2_subdev_format *format)
>>>> +{
>>>> +	struct max9286_priv *priv = sd_to_max9286(sd);
>>>> +	struct v4l2_mbus_framefmt *cfg_fmt;
>>>> +
>>>> +	if (format->pad >= MAX9286_SRC_PAD)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
>>>> +	switch (format->format.code) {
>>>> +	case MEDIA_BUS_FMT_UYVY8_2X8:
>>>> +	case MEDIA_BUS_FMT_VYUY8_2X8:
>>>> +	case MEDIA_BUS_FMT_YUYV8_2X8:
>>>> +	case MEDIA_BUS_FMT_YVYU8_2X8:
>>>> +		break;
>>>> +	default:
>>>> +		format->format.code = MEDIA_BUS_FMT_YUYV8_2X8;
>>>
>>> Is there any reason for not setting default format to MEDIA_BUS_FMT_UYVY8_2X8?
>>>
>>
>>
>> No good reason no, and I see that in max9286_enum_mbus_code(), we
>> currently code to MEDIA_BUS_FMT_YUYV8_2X8, and that's the value that we
>> init to, so that would be a better default indeed.
>>
> 
> max9286_enum_mbus_code() returns MEDIA_BUS_FMT_UYVY8_2X8, no?

Argh, sorry - yet anther typo or copy/paste error.

Indeed, I have changed this locally to ...
   <double checks> MEDIA_BUS_FMT_UYVY8_2X8 </double checks>
as suggested. ;-)


> 
> Thanks,
> Mani
