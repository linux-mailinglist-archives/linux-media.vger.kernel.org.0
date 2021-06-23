Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16ED3B1C6C
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 16:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhFWO3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 10:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbhFWO3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 10:29:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D93DC06175F;
        Wed, 23 Jun 2021 07:27:14 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81B148B6;
        Wed, 23 Jun 2021 16:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624458432;
        bh=oVP4ektLEGVx5hKZVEbN88NDHQGTqxrQUqQvY0XciP8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TslZS7gvVLnH/sJd/Y1TQSbibs0UeTve9cbGPy/hu0YFcfuEzMFZ7rY6Dcv+hV7GZ
         9ouvA1w+r02mS578w3vmNG4luUekLKMO4mQxZBXefTHdOMHzHDMWV+4ZSZ9vq4VOIh
         krCZKjNXLie7gJHPTCmY9YnEF4GuNEivDpJ6q1xE=
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <m3wnqm5eqo.fsf@t19.piap.pl>
 <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com> <m3r1gt5hzm.fsf@t19.piap.pl>
 <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com> <m3mtrh5evo.fsf@t19.piap.pl>
 <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
Date:   Wed, 23 Jun 2021 15:27:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof

On 23/06/2021 14:17, Laurent Pinchart wrote:
> On Wed, Jun 23, 2021 at 07:28:11AM +0200, Krzysztof Hałasa wrote:
>> Laurent Pinchart writes:
>>
>>> How does a lack of an SoB line prevent someone from doing exactly what
>>> you've described above ?
>>
>> The work is not published under GPL.

This seems like an odd thing to say when your patch explicitly contains:

> +++ b/drivers/media/i2c/ar0521.c
> @@ -0,0 +1,1060 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Sieć Badawcza Łukasiewicz * - Przemysłowy Instytut Automatyki i Pomiarów PIAP
> + * Written by Krzysztof Hałasa
> + */

and

> +MODULE_DESCRIPTION("AR0521 MIPI Camera subdev driver");
> +MODULE_AUTHOR("Krzysztof Hałasa <khalasa@piap.pl>");
> +MODULE_LICENSE("GPL");

--
Kieran


