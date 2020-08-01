Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A6B235333
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 18:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgHAQIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Aug 2020 12:08:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50670 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgHAQIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Aug 2020 12:08:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4EF2D2854E4
Subject: Re: [PATCH v2 5/9] media: staging: rkisp1: add a pointer to
 rkisp1_device from struct rkisp1_isp
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
 <20200718145918.17752-6-dafna.hirschfeld@collabora.com>
 <d8475ade-94a3-48ad-02d7-f03810ddf6dc@collabora.com>
 <114a3242-88e9-46a1-c8c8-f5bfd424d05a@collabora.com>
 <CAAFQd5BLuwfnQfYbaWmtre5YCx-_YG4E10cZxeL+6pESap_U0A@mail.gmail.com>
 <fa457a47-4005-8c64-d135-96b321ddd6a6@collabora.com>
 <CAAFQd5ATRvBapupZaBf6TkWcVwOy7C9+A95+vLHJiwuUca4LQg@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <74c2563c-25ca-833b-2f72-b6e10e6e3847@collabora.com>
Date:   Sat, 1 Aug 2020 18:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5ATRvBapupZaBf6TkWcVwOy7C9+A95+vLHJiwuUca4LQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 21.07.20 17:32, Tomasz Figa wrote:
> On Tue, Jul 21, 2020 at 5:30 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> Hi,
>>
>> On 21.07.20 14:36, Tomasz Figa wrote:
>>> On Tue, Jul 21, 2020 at 2:26 PM Dafna Hirschfeld
>>> <dafna.hirschfeld@collabora.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 20.07.20 21:25, Helen Koike wrote:
>>>>>
>>>>>
>>>>> On 7/18/20 11:59 AM, Dafna Hirschfeld wrote:
>>>>>> The code in rkisp1-isp.c requires access to struct 'rkisp1_device'
>>>>>> in several places. It access it using the 'container_of' macro.
>>>>>> This patch adds a pointer to 'rkisp1_device' in struct 'rkisp1_isp'
>>>>>> to simplify the access.
>>>>>
>>>>> What is wrong with container_of?
>>>>
>>>> I remember Laurent suggested it a while ago.
>>>> I also feel container_of is a bit cumbersome and other entities already have a pointer to rkisp1_device.
>>>>
>>>
>>> Do we even need the rkisp1_isp struct? Could we just pass rkisp1_device instead?
>>
>> pass to where ?  You mean to the function rkisp1_mipi_csi2_start ?
> 
> Yes, all around the driver, where rkisp1_isp is passed.

Most of the functions are part of subdevice callback implementation
where the rkisp1_device is not needed, so I don't the see the point.

Thanks,
Dafna

> 
