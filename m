Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299AF41D23
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 09:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407827AbfFLHCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 03:02:07 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:41829 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404851AbfFLHCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 03:02:06 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id axGihAHBrbiAgaxGlhBWpJ; Wed, 12 Jun 2019 09:02:04 +0200
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
 <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
 <ffaad429bbdcf1a15049ec6df404618f4f2a9a36.camel@ndufresne.ca>
 <9c19ece0-f980-62a6-f26e-a91930d117f3@xs4all.nl>
 <3ced040be477ca0d17405157f919deee3cd4675d.camel@ndufresne.ca>
 <f016182a-e7b8-2dc9-edde-e62e8aacc63b@xs4all.nl>
Message-ID: <1e2f5724-7ca6-2521-206a-c8edccda74f6@xs4all.nl>
Date:   Wed, 12 Jun 2019 09:02:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f016182a-e7b8-2dc9-edde-e62e8aacc63b@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHrdha4/tojLhC2AOCnzN7EcnIM/MPGkibxA03Ex60I5d+fzhBLqWHGGDPsPHARHpdlORQ4txudWeDkhD2Je+a8kwUO12tJDQ63rWQLat1GbCuRkDWJ/
 tBDdGOj/TLdfF4eVbBv9r6lfVUy2q7KMX/Taf9zYIRq/c2k7RHy36WXbh45Pb1q7dFUCRd961DvivHtuwGFniTOQKHB/Bq4SHh6GfDnB92m6i02y2asgOooF
 mh8f4GpSw4iM14aAVuZ0l2YcqrdPOeRDVXQA6NtMRT2LbOaXjiRHp4/K+0JLBB1sPcLzsNUXwvmYfebOmvyMZlkW0tXmjEPppGvY96GUDZCh/mMWnC0RxnSO
 ZBwNUkkWJxwnlqeHAB6nBd1A0dI386ddR1LDXKY7cqnOmRb3IRDjb3qGO3JRjJbqEyJWqRrVxmlVqQw2JawmOPn70l8z5hWYTEnBg1xXlj8jAAulzuWBKPZ1
 6IoRYS39TlgJ3ATM+dE+TcORNwHZ6+pW7j3Fags6dghSFClUbRuRLwErVWJ/4HoJwC65NGShuuY/txvx
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/12/19 8:49 AM, Hans Verkuil wrote:
> On 6/12/19 2:25 AM, Nicolas Dufresne wrote:
>> Le mardi 11 juin 2019 à 10:29 +0200, Hans Verkuil a écrit :
>>> On 6/10/19 9:54 PM, Nicolas Dufresne wrote:
>>>> Hi Hans,
>>>>
>>>> I went through it, and I think we are close to ready. Unfortunately, I
>>>> believe the SOURCE_CHANGE event is still under specified. There was a
>>>> post recently to try and add a new flag for changes in color space
>>>> which is not included here. We are also missing a workflow for changes
>>>> that don't affect the allocation but will affect the rendering on a
>>>> display (like colorimetry). Userspace needs to know at which frames
>>>> these parameter changes in order to signal that to the following
>>>> processing block. I think we must have a plane for this.
>>>
>>> Yes, we need a new flag for the SOURCE_CHANGE event to indicate colorimetry
>>> changes. That's actually useful for e.g. HDMI receivers as well.
>>>
>>> But I don't see why that should make much of a change to the spec: you still
>>> have to drain the capture queue, the only difference is that you don't need
>>> to reallocate buffers, you can just restart the decoder.
>>
>> I don't think you need to drain the queue if the change is just
>> metadata that have no impact on the buffers allocation or layout. I
>> think we should have a way to communicate these changed while
>> streaming. Basically, something like the event, but serialized.
> 
> I guess we can extend the struct v4l2_event_src_change and add a buffer
> index field to indicate at which capture buffer index the colorimetry
> change takes effect. Then there is no need for draining.

Just wanted to add something here: for now drivers can just use SOURCE_CHANGE
+ drain if they detect a colorimetry change. It's not as efficient as it can
be, but it will work. Applications can easily check that they don't need to
reallocate since the reported sizeimage will be the same for the old and new
formats.

> In the future when we create replacement streaming ioctls and have a
> new, larger struct v4l2_buffer, then we can add the colorimetry information
> there as well.

When this is in place, then it would make sense to add a V4L2_EVENT_SRC_CH_COLORIMETRY
flag that just indicates that something changed w.r.t. colorimetry.

We DO need this flag for HDMI receivers in any case.

Regards,

	Hans
