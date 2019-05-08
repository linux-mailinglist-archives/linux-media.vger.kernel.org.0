Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A317A17E39
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbfEHQix (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 12:38:53 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:42155 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725889AbfEHQix (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 May 2019 12:38:53 -0400
Received: from [IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b] ([IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OPajhzfge3qlsOPakhLnRq; Wed, 08 May 2019 18:38:51 +0200
Subject: Re: [PATCH v2] v4l: Add source event change for bit-depth
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20190508113759.19168-1-stanimir.varbanov@linaro.org>
 <d6dcee9a-0308-855c-9819-3e7413cb617d@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a63d1c5f-806e-92c3-a6f7-e70f0686a27d@xs4all.nl>
Date:   Wed, 8 May 2019 18:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d6dcee9a-0308-855c-9819-3e7413cb617d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA2G6OTFamVBKLYKYcEXPMd55QMkc85iZIPxrM91Ve0+9dGD8w/wHJD//upbepQx/xWZ4EsVFzzPsUfiOGkQRMIcqOSEjkdRBeC2TuAJ6BRqM0NjJBlC
 V3K45LT9RPhChatrXpv+tT4o3aP1AK1jDnBYJiuo0YvQYTun4T/U+70wagWERUFtQFtRt3TkPDBRseOF7cMdzNJ6FV1yQAIbHFnu8YhpU0lHXPzTaydgi1rw
 aQPrcYN4XXkiKaZ+WwWKb9NZa8KHkwovd0sN0bpHC61JQMB+ZTmoT1bByVfnNfV65BabiHkiYG9nGv/ZI2xIsBVzh1DUtSYxZy2qK7T8ZTnMV5c0mDIBSk23
 l/pHJG6jF980ZvTElO74Bpb1m4SFGJRQ7kPBg9Z2EAlU3gEjs/e8xA8Uc0iaJwRTdKdWgvCOM9nM4lYIRyQmovJE7no+m1F+nV1LRhs3ZCrnn5d9MPL+NcrT
 Ib06TuXCHdx7yNNS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/8/19 5:34 PM, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 5/8/19 2:37 PM, Stanimir Varbanov wrote:
>> This event indicate that the source bit-depth is changed during
>> run-time. The client must get the new format and re-allocate buffers
>> for it. This can usually happens with video decoder (encoders) when
>> the bit-stream depth is changed from 8 to 10bits or vice versa.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>> Change since v1: s/BITDEPTH/BIT_DEPTH
>>
>>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 7 +++++++
>>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
>>  include/uapi/linux/videodev2.h                  | 1 +
>>  3 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>> index dea9c0cc00ab..f7782cbddc5f 100644
>> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
>> @@ -397,6 +397,13 @@ call.
>>  	that many devices are not able to recover from a temporary loss of
>>  	signal and so restarting streaming I/O is required in order for the
>>  	hardware to synchronize to the video signal.
>> +    * - ``V4L2_EVENT_SRC_CH_BIT_DEPTH``
> 
> I started to wonder isn't COLOR_DEPTH more appropriate? Bit-depth
> doesn't describe what is actually deep.
> 

I agree. COLOR_DEPTH is a better name.

Regards,

	Hans
