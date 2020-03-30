Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 594C7197B94
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 14:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgC3MLX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 08:11:23 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:53203 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729627AbgC3MLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 08:11:23 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ItG9jGqa3Br2bItGCjcWqO; Mon, 30 Mar 2020 14:11:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585570281; bh=cabpKDmlIdkrU7aBSi0S71uJhd/OAbhY6Kq4EfdkncI=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=im4vcPYKPKSsnQWBo6g8bNxnrvwedbNi+73yT8mwiIPW18EICqgMXkSOPyrrK6Axx
         /ENVvTWePALJnlYUrCSAvSwwhGyTYFGi2Gvq/IK2+WAJ8lY0kZh5mJWhdDOHLqA4Xh
         6s+abir2tkrd1+5Jbp2naLCCLm6glaEYg+fadtqgAKARXMoHvbvHSKXAwK2WrdTpv0
         DlqCeWuA7arSvHxOxAWawHEm4RWoZRKVEprGKPQqSPBsaAswDh22o/504j0dVmUjBv
         8jdX80CHRNkNRE/hru1mb2b/8+VLb41soHQ9311IiK5G996/VNirZsU0qRFEn1vG9d
         XQMoiXO7gpcQw==
Subject: Re: [PATCH 5/5] media: vimc: add vimc_ent_type struct for the
 callbacks of entities
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
 <20200328075254.4616-6-dafna.hirschfeld@collabora.com>
 <7992a63b-14bb-d4e6-5c9c-30f1fb779b7b@xs4all.nl>
Message-ID: <dedeb28d-cde0-3c32-bcd2-b1d2ed44fedc@xs4all.nl>
Date:   Mon, 30 Mar 2020 14:11:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7992a63b-14bb-d4e6-5c9c-30f1fb779b7b@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIYWtkG2H7NKvzvnPAiJm6W1Qwlhos/9Ia9Qsd09YdXqNFhDwnre8nJxlTdF8VktTmrIhlu0WmgOU/rHj9IxC79H0r5GdE1pjZYFQ4W7WIc2X5WlON4Y
 ePFjlDPTAwVFUIq0W3aUoenls3+ui/eXNA+zrPuoKZA1pexd1BPpL+wHBkOtwxs91shTvM/9GR71H821uE1XLAalUH+l/PmkyvGrkhRzj5+XojSlpos6t3Zw
 TZAgsiFmrKBkCW7A39E0jvVyXLYz1yBus/zmEAX+qNrYZDAIHQjJQgeSSXgbCDjKOsijIsIrlwqV1ANRusZHbM0Zs2XTbM3A9yvRPdQtrW6bP3o+T/KjCXrC
 TQP4xtpA+gxhkXmIeF7wv0Ie5lWJU8RXHXBA95+h3abnjZXLi2hPMv2jDNF1X+rOXMQNTCP+inJX2zrCqfcuvmEWQ1ZuBA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/30/20 2:10 PM, Hans Verkuil wrote:
> On 3/28/20 8:52 AM, Dafna Hirschfeld wrote:
>> Since each vimc entity type is defined by the
>> callbacks implementation, it is a good idea to
>> add a struct to hold these callbacks.
>>
>> Each vimc entity then declare its type in the file for
>> the entity.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> I get these warnings:
> 
> drivers/media/platform/vimc/vimc-capture.c:328:6: warning: no previous prototype for ‘vimc_cap_release’ [-Wmissing-prototypes]
> 
>   328 | void vimc_cap_release(struct vimc_ent_device *ved)
>       |      ^~~~~~~~~~~~~~~~
> drivers/media/platform/vimc/vimc-capture.c:337:6: warning: no previous prototype for ‘vimc_cap_unregister’ [-Wmissing-prototypes]
> 
>   337 | void vimc_cap_unregister(struct vimc_ent_device *ved)
>       |      ^~~~~~~~~~~~~~~~~~~
> drivers/media/platform/vimc/vimc-capture.c:385:25: warning: no previous prototype for ‘vimc_cap_add’ [-Wmissing-prototypes]
> 
>   385 | struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>       |                         ^~~~~~~~~~~~
>   CC      drivers/media/platform/vimc/vimc-scaler.o
> drivers/media/platform/vimc/vimc-debayer.c:497:6: warning: no previous prototype for ‘vimc_deb_release’ [-Wmissing-prototypes]
> 
>   497 | void vimc_deb_release(struct vimc_ent_device *ved)
>       |      ^~~~~~~~~~~~~~~~
> drivers/media/platform/vimc/vimc-debayer.c:525:25: warning: no previous prototype for ‘vimc_deb_add’ [-Wmissing-prototypes]
> 
>   525 | struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>       |                         ^~~~~~~~~~~~
>   CC      drivers/media/platform/vimc/vimc-sensor.o
> drivers/media/platform/vimc/vimc-scaler.c:467:6: warning: no previous prototype for ‘vimc_sca_release’ [-Wmissing-prototypes]
> 
>   467 | void vimc_sca_release(struct vimc_ent_device *ved)
>       |      ^~~~~~~~~~~~~~~~
> drivers/media/platform/vimc/vimc-scaler.c:476:25: warning: no previous prototype for ‘vimc_sca_add’ [-Wmissing-prototypes]
> 
>   476 | struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>       |                         ^~~~~~~~~~~~
> drivers/media/platform/vimc/vimc-sensor.c:282:6: warning: no previous prototype for ‘vimc_sen_release’ [-Wmissing-prototypes]
> 
>   282 | void vimc_sen_release(struct vimc_ent_device *ved)
>       |      ^~~~~~~~~~~~~~~~
> drivers/media/platform/vimc/vimc-sensor.c:310:25: warning: no previous prototype for ‘vimc_sen_add’ [-Wmissing-prototypes]
> 
>   310 | struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>       |                         ^~~~~~~~~~~~
> 
> 
> I think that all these functions should become static.

Forgot to mention: the other patches in this series look fine, so I'll take
those and wait for a v2 of this last patch.

Regards,

	Hans
