Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8699634A135
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 06:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhCZFzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 01:55:31 -0400
Received: from mout02.posteo.de ([185.67.36.66]:57709 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229812AbhCZFzY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 01:55:24 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 3AEBB2400FC
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 06:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1616738122; bh=xVJrWUvDIBXax8p1VtM+lvdxrrpksllShItHsl64FRI=;
        h=Date:From:To:Cc:Subject:From;
        b=bK5x52edGz3cQ2vVrTrrceCY7Ki/EcZtqXEBC2X03ifaaiaKMWLqF99qlS4caznMC
         NJ0yEftyDSv6moqrcYSeYoHfgkW6LGzFqjqOazqCrgdzo7aMEM1yRchx0/VgEXFzdr
         B3sVhYyfqps0PRVxgB5jN2dOrh05DHqdHl+U+Y14syqjXZO4oDWfXF2VUS/JfTeKfh
         VOyOE/vnCWnzsDqsOc6EPhoV9A1aXCZqM3YvgqIA789Kk2XvEOhGyHOQOV/hwbEOoO
         SuaU7fsF0tS1OibnO9HJYaqxeP18fvWBD9Gq0SOrkk1QMCrm70z9ihhBIRJBgceA5m
         72NQ5Z7zGomyQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4F6B5j56mwz9rxV;
        Fri, 26 Mar 2021 06:55:21 +0100 (CET)
Date:   Fri, 26 Mar 2021 06:55:21 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, heiko@sntech.de
Subject: Re: [PATCH 1/2] media: rkisp1: Increase ISP input resolution limit
Message-ID: <20210326055521.fb2jx7qbnku2zio5@basti-TUXEDO-Book-XA1510>
References: <20210325192700.21393-1-sebastian.fricke@posteo.net>
 <20210325192700.21393-2-sebastian.fricke@posteo.net>
 <YF1fw75lCud3Akxg@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <YF1fw75lCud3Akxg@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Laurent,

On 26.03.2021 06:14, Laurent Pinchart wrote:
>Hi Sebastian,
>
>Thank you for the patch.

Thank you for your review.

>
>On Thu, Mar 25, 2021 at 08:27:01PM +0100, Sebastian Fricke wrote:
>> The incentive for this patch was to overcome the inability of the
>> ISP device to work with resolutions greater than 4032x3024.
>> Increase the limit to 4416x3312 to allow higher input resolutions.
>> Use the old resolution to crop the input resolution down to the maximum
>> size for the ISP to process frames.
>>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
>> ---
>>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> index 038c303a8aed..553effda4d5e 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> @@ -30,10 +30,12 @@
>>  #define RKISP1_ISP_SD_SINK BIT(1)
>>
>>  /* min and max values for the widths and heights of the entities */
>> -#define RKISP1_ISP_MAX_WIDTH		4032
>> -#define RKISP1_ISP_MAX_HEIGHT		3024
>> -#define RKISP1_ISP_MIN_WIDTH		32
>> -#define RKISP1_ISP_MIN_HEIGHT		32
>> +#define RKISP1_ISP_MAX_WIDTH			4416
>> +#define RKISP1_ISP_MAX_HEIGHT			3312
>> +#define RKISP1_ISP_MAX_WIDTH_PROCESSING		4032
>> +#define RKISP1_ISP_MAX_HEIGHT_PROCESSING	3024
>
>Maybe s/_PROCESSING/_CROP/, or a name more descriptive ?

My thought behind this name was the difference between the maximum size
that the ISP accepts as an input and the maximum size that it can
actually process. So more descriptive in that case would be:
`RKISP1_ISP_MAX_HEIGHT_FOR_PROCESSING` but this is way too long.
I guess `RKISP1_ISP_MAX_HEIGHT_CROP` is a good short name, that also
makes sense at the place where it is used. I guess I should add a
comment though, to explain why the crop has that limitation.

>
>I would also squash this patch with 2/2, as otherwise you'll introduce a
>bisection breakage (applying 1/2 only will leave the driver in an
>incorrect state).

Oh yes, I will do that.

>
>> +#define RKISP1_ISP_MIN_WIDTH			32
>> +#define RKISP1_ISP_MIN_HEIGHT			32
>>
>>  #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
>>  #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
>
>-- 
>Regards,
>
>Laurent Pinchart

Greetings,

Sebastian Fricke
