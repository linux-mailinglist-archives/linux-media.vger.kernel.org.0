Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81B4741C96
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 08:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390800AbfFLGtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 02:49:39 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39397 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390376AbfFLGtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 02:49:39 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ax4dhACelbiAgax4ghBTsF; Wed, 12 Jun 2019 08:49:37 +0200
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f016182a-e7b8-2dc9-edde-e62e8aacc63b@xs4all.nl>
Date:   Wed, 12 Jun 2019 08:49:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3ced040be477ca0d17405157f919deee3cd4675d.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDKin55+5JKQlwresyM7SGiB0viexchg1pco6TMLoagwhqMDZjJzGmKjHfWa+gWRIYMVMipsZRpelgmvWlXhlqSWYe58zwmdYqzQVHjx+Xv6TpkQo6Wt
 qotjfnPjCTjQQod+LrBYIWFxuJxVRxFhdblbRBqL6R54xGlXBA/bH14lpHyyXwbhBr1hWbeZjza4lUHnfji5rekA53JLvA/Z8kPL3n//xW6FevpN2FvXxd8R
 E4X9CnNsuTJZBhZsUoE7HdH1UMARnyYDk8yRpniw/wYxR1WDoOJNoB9aIui2K+sFsLPn9IdbLRyCbP8jjv2pVnAJkMHqLlmGZcyvrUMOAYYiihJc9MGfT2BR
 BZ6k63N+TjprgNyGzoR7FlSf1nkudO+rzaJZsUeJUpngjPsV3SS3yBFD8xriXRhIPDRzYc/pN4G7GZrVI3YFpGU1jHH+KFJF+k/F3KubxPoS9eaGwCm6Fvrs
 Q4IGtgg3erZlQS7zSLlDJO4lXy+1r+TmQzJAxFrqrUWpFbK6sCLEBI0txfI/Bh0J1CDva3IqgJc01Zs7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/12/19 2:25 AM, Nicolas Dufresne wrote:
> Le mardi 11 juin 2019 à 10:29 +0200, Hans Verkuil a écrit :
>> On 6/10/19 9:54 PM, Nicolas Dufresne wrote:
>>> Hi Hans,
>>>
>>> I went through it, and I think we are close to ready. Unfortunately, I
>>> believe the SOURCE_CHANGE event is still under specified. There was a
>>> post recently to try and add a new flag for changes in color space
>>> which is not included here. We are also missing a workflow for changes
>>> that don't affect the allocation but will affect the rendering on a
>>> display (like colorimetry). Userspace needs to know at which frames
>>> these parameter changes in order to signal that to the following
>>> processing block. I think we must have a plane for this.
>>
>> Yes, we need a new flag for the SOURCE_CHANGE event to indicate colorimetry
>> changes. That's actually useful for e.g. HDMI receivers as well.
>>
>> But I don't see why that should make much of a change to the spec: you still
>> have to drain the capture queue, the only difference is that you don't need
>> to reallocate buffers, you can just restart the decoder.
> 
> I don't think you need to drain the queue if the change is just
> metadata that have no impact on the buffers allocation or layout. I
> think we should have a way to communicate these changed while
> streaming. Basically, something like the event, but serialized.

I guess we can extend the struct v4l2_event_src_change and add a buffer
index field to indicate at which capture buffer index the colorimetry
change takes effect. Then there is no need for draining.

In the future when we create replacement streaming ioctls and have a
new, larger struct v4l2_buffer, then we can add the colorimetry information
there as well.

Regards,

	Hans
