Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442C023DDEA
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgHFRS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:18:56 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40497 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730460AbgHFRSf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 13:18:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3fqskhfymywL53fqtk4ZKC; Thu, 06 Aug 2020 15:22:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596720156; bh=RUNHmjWKtE61EzaljHMlZ14pOR3jiEYUObArwQ/lc5k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BZ9RgeKWTMhePMWLmav9dt6PJCdqwPJMPWlUU16kbG1ry0kH5WNpCwNydKllbnRBC
         BqCbihIRJM/z5YNJ9JpCM7aAlTBW13wqhgqRNRUL5189IFCioYR3Pmfj+1BCkby+66
         H2wbjUjwvdsdey++cqEw8b6c4ijOWikhDuta0Jr72fn3VZNC7HO9v/YocnkXzxiV9Z
         M1Pi7LB4GtGkZHZtz8puCqNizEa8XknLRH4zUq4yFtS1Ya5d7KHBLT3HSJulhOrT0g
         8OcrK9yGKSnZ0JpHzXLF1obtwBfEJd4cGB7jqR5735ThRlyfT47i0B1Uc+iiwIkK02
         0YuCJ1N7ijggg==
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <184f8787-ebf1-90e3-82b3-44fa66e65a84@xs4all.nl>
 <20200806095038.tc6mmwknqdinaeth@uno.localdomain>
 <f4e50cbb-8b25-1269-d8b9-9c81fa73b7e1@xs4all.nl>
 <20200806125445.GA16270@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1ee9f378-8df1-7c03-2136-ce7870934443@xs4all.nl>
Date:   Thu, 6 Aug 2020 15:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806125445.GA16270@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBdgPbFoVgDv1u1ASPkUZgMGyJ3087RIhCO6Dqw7qrrTM8JL/KY1l310LgZT0CvwMfMz2fmw/UMt6t6dVs95bFNmEUT9dXKJjx+RyTmKzVaC7g8dV3A1
 PKP9xX03hwpzbbNsu6oX8N2pDx7vndtmYlX4S3g2QSHJ3ri2HjEsG9rDLptCSzoM+rny5u8bzKV4DF0LawKKu51QL1tPsluP4/7TzpmR51oY0zO7YvXXMMM+
 dDxkLno2uep4hq6HXC7CT3FAJl4PIovFbF/g5bOUaJiRg7/QgOJsbzQJuiyeTk9/zoFkiZdELVY17m1DSNstRBw+Z2F4geOjMGT6xn6HMKGttU0m/BhdfsNS
 se7FV9IBKUk0JCxX1a3HRoHKA/N4P19yfVtA0q+nmqG0QymITHw9M2UcYi74mSIIcqhiVLDwLUd2aMpW8pKrmvse+hzm7VT0zoOVg4kzdx/kQj/U87iRDTG+
 B7kJX4I/3sD919kYC4I+uY9vY2bICncp/QUweqCNe/5QIsn0J4Q4OR7/Znk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 14:54, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Aug 06, 2020 at 11:58:31AM +0200, Hans Verkuil wrote:
>> On 06/08/2020 11:50, Jacopo Mondi wrote:
>>> Hi Hans,
>>>
>>> On Thu, Aug 06, 2020 at 10:05:37AM +0200, Hans Verkuil wrote:
>>>> Hi Jacopo,
>>>>
>>>> Some review comments below:
>>>>
>>>> On 05/08/2020 12:57, Jacopo Mondi wrote:
>>>>> +Analog crop rectangle
>>>>
>>>> Why analog? It's just the crop rectangle, nothing analog about it.
>>>>
>>>
>>> We used the 'analogCrop' term in libcamera to differentiate the
>>> cropping which happens on the sensor pixel array matrix to select the
>>> region to process and produce image from. Sensor with an on-board
>>> scaler can perform other cropping steps to implement, in example digital
>>> zoom, so we expect to have a 'digital crop' phase as well. RAW
>>> sensors, in example, will only have an analogCrop rectangle.
>>>
>>> Quoting the libcamera definition of analog crop:
>>>
>>>  * horizontal and vertical sizes define the portion of the pixel array which
>>>  * is read-out and provided to the sensor's internal processing pipeline, before
>>>  * any pixel sub-sampling method, such as pixel binning, skipping and averaging
>>>  * take place.
>>>
>>> should I keep it or remove it ?
>>
>> It's a very confusing term. Especially since this API can also be used with analog
>> video capture devices (Composite/S-Video) where the video signal actually is analog.
>>
>> In the V4L2 API there is no such thing as 'analog crop', so please remove it.
> 
> There isn't in the V4L2 API but I don't see why we couldn't document it
> here. Analogue crop is an established term related to raw (perhaps others,
> too?) camera sensors which describes cropping that is implemented by not
> reading parts of the pixel array.
> 
> As this documentation only applies to camera sensors, I think it's entirely
> appropriate to document this here, and using that term.
> 

It's always been called just 'crop' in the V4L2 API, so renaming it suddenly
to something else is IMHO confusing. What you can do, however, is that in the
description of the "crop rectangle" you mention that "it is also known as
"analog crop" in the context of camera sensors.

With perhaps some more extensive explanation of the term.

Regards,

	Hans
