Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4890AE418
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 08:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406522AbfIJG5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 02:57:38 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41947 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729634AbfIJG5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 02:57:37 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7a5ki8cZP50xT7a5niDcUA; Tue, 10 Sep 2019 08:57:36 +0200
Subject: Re: [PATCH] media: vimc: fla: Add virtual flash subdevice
To:     =?UTF-8?Q?Lucas_Magalh=c3=a3es?= <lucmaga@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>, edusbarretto@gmail.com
References: <20190901211139.2405-1-lucmaga@gmail.com>
 <1fea2f25-98d1-f9f6-a483-17c74f89452e@xs4all.nl>
 <CAK0xOaGZx5dyDMAFp+JxnrfOYH3yYdvtcJzWdAmHyeRwUe38Lg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4ee1410b-6ab2-b1e2-46e1-734ba69e8d49@xs4all.nl>
Date:   Tue, 10 Sep 2019 08:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK0xOaGZx5dyDMAFp+JxnrfOYH3yYdvtcJzWdAmHyeRwUe38Lg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKamq/PflL4zEMonyAaFfMMxg3y0lQOgRwwMET9oKFk0ms0iq8qBgSn7Qh3H8EJCej9PSK00T778GW2w+SaVsMZc4Q94KLs9b6MjxmQtIdeBU6wst9hY
 M0i4FZknYrdIb65f+8RRAwA02T7X2No/dKrRo4n1Dhuv5IUwkLdtGDSblIZD6LDRQFrA1w5gFZvEIFJOw1u9Nuut6oeKI0I3aBoBbo1W+z2cFIQKEUrnJTjz
 5/4ukxMl84GVBIyyrTXVphMWOnSFsqhEhrvELg2YZJ+KSWbIJhkVqlQkz/8aPWysEYYUDSB40P58axMCJtl3lg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/10/19 1:00 AM, Lucas Magalhães wrote:
> Hi Hans,
> Thanks for the review. I fixed most of the issues you found. Just have
> the question below.
> 
> On Mon, Sep 2, 2019 at 9:04 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>>> +
>>> +int vimc_fla_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>>> +{
>>> +     struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
>>> +     struct vimc_fla_device *vfla;
>>> +     int ret;
>>> +
>>> +     /* Allocate the vfla struct */
>>> +     vfla = kzalloc(sizeof(*vfla), GFP_KERNEL);
>>> +     if (!vfla)
>>> +             return -ENOMEM;
>>> +
>>> +     v4l2_ctrl_handler_init(&vfla->hdl, 4);
>>> +
>>> +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                            V4L2_CID_FLASH_LED_MODE,
>>> +                            V4L2_FLASH_LED_MODE_TORCH, ~0x7,
>>> +                            V4L2_FLASH_LED_MODE_NONE);
>>> +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                            V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
>>> +                            V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_TIMEOUT, 1, 10, 1, 10);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, 255);
>>> +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
>>> +                       V4L2_CID_FLASH_STROBE_STATUS, 0, 0, 0, 0);
>>
>> It would be nice if this would actually reflect the actual strobe status.
>>
> Regarding the strobe status I was reading the code and find out that
> V4L2_CID_FLASH_STROBE_STATUS is a V4L2_CTRL_FLAG_READ_ONLY
> but it's not a V4L2_CTRL_FLAG_VOLATILE. I found this intriguing. How an
> I suppose to get it if its not volatile? As I understood it changes over time
> if the strobe starts and the timeout expire, isn't it? Shouldn't it be volatile
> if so?

A non-volatile read-only control is set deterministically by the the driver.
So the driver calls v4l2_ctrl_s_ctrl() to change the controls value.

A volatile read-only control is one where the value is read from a hardware
register that is continuously changing. E.g. if autogain is on, then the gain
register in a device contains the currently calculated gain, but that might be
changed the next time the register is read.

Regards,

	Hans

> 
> I've already made a simple implementation were V4L2_CID_FLASH_STROBE_STATUS
> returns after calling V4L2_CID_FLASH_STROBE and becomes false after the timeout
> time passes.
> 
> Thanks!
> 

