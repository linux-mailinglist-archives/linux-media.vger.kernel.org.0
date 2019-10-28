Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD992E7C3C
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 23:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfJ1WST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 18:18:19 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60563 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725776AbfJ1WST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 18:18:19 -0400
Received: from [172.20.7.25] ([77.158.50.100])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PDL2ir1iNHfodPDL6iCzsv; Mon, 28 Oct 2019 23:18:17 +0100
Subject: Re: [ANN v2] Media sessions in Lyon in October: libcamera
To:     Daniel Gomez <daniel@qtec.com>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <b5b18a86-6137-99a0-0319-d389bac01206@xs4all.nl>
 <CAAEAJfA+ErfDTj87C7rKmo4qSqHL9+uyFEWrWecpCg8RpJ+Cpg@mail.gmail.com>
 <a774d273-fa54-d0b8-1043-48404958ca05@collabora.com>
 <CAH1Ww+S7DoMUbqX5hO_MFpM3i0H=1F8SOTRxoPXLrWf45d6RuA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3549a56a-0402-2134-f56b-e7baa5bcc0c3@xs4all.nl>
Date:   Mon, 28 Oct 2019 23:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAH1Ww+S7DoMUbqX5hO_MFpM3i0H=1F8SOTRxoPXLrWf45d6RuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK7RWZE8rg1YLeJW+DmuizcDR3XPZm9joqoOqluxYka1/725GIS0q8J+rRM3fnpgvJTUi/J6omHgdlcSJ7hfLUM+te6JBjUu66Jd7pTyVYFLIjd5twnO
 bv4+YXLnIFa16JVjIbEuhlA5vqy2Gx5QOHxZ8Pe+K50HTP7tv1PAONr/UlcCNpj/0jT3v+KRP/PD1N8Vx4DKvVBoBrRefVfI/69TCYmXN7J2CRvxgIz6y2Dh
 oAG+3TQevC8fNzwLjE3AWkq3D71h3T9RUtVE34q1SjKrhA3DC3yDmOCfFgOoVZ9KTJROp7uOnlXqBNujYAGNRHXJaU+eFYASBCtqT7xo/cuhsAGpgoazebO5
 PbqtUGRfWKFn568qWC+yi7ezJ7Pjcf495r5C+zksyJlccFcDW4roRK/Su995KhoS9H190Yz6pInJUaVq3NDMnfkWfYE2SFAu3VJHFejEjobE7f4gXsSFg9av
 QP+khDpFRM3y1r3nyK4z3y4bEYGJm1lk3/C+3JP2bUYetx7WRhDpq+iRzWkip5QHzY9F3U4GsGPqpqYeMBiaqjd/BnkuKfix2Cc7HfhWTpAG5HhaOd60GjS+
 l99RhmhU4BmHYqhuoASO1XHDfv+ZKTEenekPlX2TBi9dDZ+ztRZlLXk2bsx6SEI1ssg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/28/19 11:03 PM, Daniel Gomez wrote:
> Hi Hans,
> 
> On Mon, 21 Oct 2019 at 08:36, Helen Koike <helen.koike@collabora.com> wrote:
>>
>> Hello,
>>
>> On 10/20/19 5:13 PM, Ezequiel Garcia wrote:
>>> Hello Hans,
>>>
>>> On Thu, 17 Oct 2019 at 13:16, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> (Just updated the attendee list for this meeting, no other changes)
>>>>
>>>> Hi all,
>>>>
>>>> Since we have three separate half-day sessions for different topics I decided
>>>> to split the announcement for this in three emails as well, so these things
>>>> can be discussed in separate threads.
>>>>
>>>> All sessions are in room Terreaux VIP Lounge - Level 0.
>>>> There is a maximum of 15 people.
>>>>
>>>> The second session deals with libcamera and is on Wednesday morning
>>>> from 9:00 to 13:00.
>>>>
>>>> Attendees for this session:
>>>>
>>>> Nicolas Dufresne <nicolas@ndufresne.ca>
>>>> Tomasz Figa <tfiga@chromium.org>
>>>> Ezequiel Garcia <ezequiel@collabora.com>
>>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>
>>> I beliebe Dafna and I should not be on this list, and instead
>>> Helen Koike and Nicolas Dufresne would be attending.
>>
>> Yes, I'm interested in attending the libcamera session.
>>
>> Thanks
>> Helen
>>
>>>
>>> Thanks,
>>> Ezequiel
>>>
>>>> Eugen Hristev <Eugen.Hristev@microchip.com>
>>>> Jacopo Mondi <jacopo@jmondi.org>
>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Niklas Söderlund <niklas.soderlund@ragnatech.se>
>>>> Dave Stevenson <dave.stevenson@raspberrypi.org>
>>>> Hans Verkuil <hverkuil@xs4all.nl>
>>>>
>>>> That's 10 people.
>>>>
>>>> Planning to use libcamera, but willing to give up their seat if needed:
>>>>
>>>> Daniel Gomez <daniel@qtec.com>
>>>> Helen Koike <helen.koike@collabora.com>
>>>>
>>>> Just interested:
>>>>
>>>> Boris Brezillon <boris.brezillon@collabora.com>
>>>> Alexandre Courbot <acourbot@chromium.org>
>>>>
>>>> If I missed someone, or you are on the list but won't attend after all, then
>>>> please let me know.
>>>>
>>>> Attendees: it is probably useful if you let us know whether you have to
>>>> join this meeting because you plan to use libcamera, or if you are 'just
>>>> interested'. After the libcamera presentation on Tuesday afternoon we
>>>> should know how many of the 'just interested' list can join.
>>>>
>>>> Agenda:
>>>>
>>>> TBD by Laurent.
>>>>
>>>> Regards,
>>>>
>>>>          Hans
> 
> I would like to know if there are more people you plan to add to the
> attendee's list.
> If not, I would like to be there.

Laurent is in charge of this meeting. I also suspect that this won't be 
finalized until after the libcamera presentation tomorrow.

Regards,

	Hans

> 
> Thanks,
> Daniel
> 

