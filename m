Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB28D1D92A6
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 10:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgESIzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 04:55:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55470 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgESIzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 04:55:31 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8803B30C;
        Tue, 19 May 2020 10:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589878528;
        bh=5E5kdHtg8HwlXJSc6jOly3iQtH1Uqe/vd3xbGoNnfJg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cPAZTj1i5klrl5mz6J1Kj5Iv817BrE78mWpsTFs/85C0tYwK9Xo6EvU6P0tM5EciH
         IskEj7HGbJ8mdWqvUt2+0HbHN1e8xgJkgbS/qIT/l+ov3Acc9h9AlpaTj8zjOfbouN
         PUCe6ZBaua9OfkUMrSdjAJ8TMxRZbokr7UjLV7Z4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200516215103.GA857@valkosipuli.retiisi.org.uk>
 <930009cd-d887-752a-4f1f-567c795101ee@ideasonboard.com>
 <20200519081019.GB3877@valkosipuli.retiisi.org.uk>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8932699a-b321-2308-8903-31268af774cb@ideasonboard.com>
Date:   Tue, 19 May 2020 09:55:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519081019.GB3877@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 19/05/2020 09:10, Sakari Ailus wrote:
> Hi Kieran,
> 
> On Mon, May 18, 2020 at 12:45:18PM +0100, Kieran Bingham wrote:
>> Hi Sakari,
>>
>> There are only fairly minor comments here, fix ups will be included in a
>> v10.
>>
>> Is there anything major blocking integration?
> 
> Not that I can see. But please see my comments below.

Thanks,

We might have some more work tidying up the DT validation anyway which
has come too late, and perhaps is going to bump this to v5.9 now anyway.

I can still try but ... ;-S

At least hopefully now we /can/ see a path to integration though.

I probably don't care if it's 5.8 or 5.9 as long as it's not 8.5 ;-)

>>
>> Regards
>>
>> Kieran
>>
>>
>>
>> On 16/05/2020 22:51, Sakari Ailus wrote:
>>> Hi Kieran,
>>>
>>> Thanks for the update.
>>>
>>> On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
>>>
>>> ...
>>>
>>>> +static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>>>> +				  struct v4l2_subdev_pad_config *cfg,
>>>> +				  struct v4l2_subdev_mbus_code_enum *code)
>>>> +{
>>>> +	if (code->pad || code->index > 0)
>>>> +		return -EINVAL;
>>>> +
>>>> +	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
>>>
>>> Why UYVY8_2X8 and not UYVY8_1X16? In general, the single sample / pixel
>>> variant of the format is generally used on the serial busses. This choice
>>> was made when serial busses were introduced.
>>
>> Ok - I presume this doesn't really have much effect anyway, they just
>> have to match for the transmitter/receiver?
> 
> In this case, yes. But it's harder to change later, so let's indeed do that
> now.

Yes indeed, I have to change my test scripts for the new configuration
(or we should update the scripts to get the configuration from the
device ;D)


>> But it makes sense to me, so I'll update to the 1x16 variant.
> 
> ...

done anyway ;-)

I see the ADV748x is using the 2x8 variants though ... (all the more
reason for our scripts to /get/ the correct version when propagating
formats).

Perhaps I should/could add the 1x16 formats to the ADV748x too. (later)


>>> And as you don't, you also won't know which frequencies are known to be
>>> safe to use. That said, perhaps where this device is used having a random
>>> frequency on that bus could not be an issue. Perhaps.
>>
>> Does this generate a range? or a list of static supported frequencies?
>>
>> We configure the pixel clock based upon the number of cameras connected,
>> and their pixel rates etc ...
>>
>> Are you saying that the frequency of this clock should be validated to
>> be a specific range? or are you talking about a different frequency?
> 
> It depends on the system. In general, only frequencies known to be safe
> should be used. If this one has enough shielding to guarantee there won't
> be problems in using a random frequency in the entire range, is there a
> guarantee that will be the case for all systems with this chip?

I have no idea here... Maybe Niklas knows more having dealt more with
the RCar-VIN/CSI parts.

It seems like this is something we can add later if necessary, by
extending the descriptions in the DT?

--
Kieran


