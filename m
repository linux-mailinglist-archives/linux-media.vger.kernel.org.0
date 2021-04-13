Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B3835E345
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237646AbhDMP5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:57:31 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45787 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232257AbhDMP5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:57:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WLPVlG2piMxedWLPZljL3m; Tue, 13 Apr 2021 17:57:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618329429; bh=tMjh7Fx8g0mfEqYYJTUBaPBBWs0QJabhYBJ91ZY1qsk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GFjXltaZ6w0cMoF1yVUAXBtgKhhP6HE9ieFrKVRTVQvXk2eigY9A9D+NwrqiXFDhC
         cUJvkrHH7vIEKWB4n1hgQsg0ta0jqF75rP+nXjY//edJgfI5fiVk27bDBN3pbex8Wi
         AsIKAeIoJuWb7q+Eew2D+ObRlR5AFZEZQjcJ7yThzhc/eqfhnfHvNs2rIYHLI9fxa9
         yrgfvD7057IfhVlR66AudFBs4I/iZ7lRsoY3fV3dhybOqZfBF7FL0ffXDzjFpy8YV2
         wPUlikJoIc4rxsq//TXDmLps4udmJAJoQskBjEJcH16pP/iSLmxDvDFfx1zM9Tmrtp
         7m0hu4L1hk+OQ==
Subject: Re: [PATCH v3 0/2] Intra-refresh period control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com
References: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
 <3480b6ee-f442-57be-473f-c90966584d40@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <29fc026d-6ba3-dfc3-d57b-1dabce765dca@xs4all.nl>
Date:   Tue, 13 Apr 2021 17:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3480b6ee-f442-57be-473f-c90966584d40@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOGwePcNIn1fhjFclzjFpxNeors/OL9DTg1rh8hEueWxzhHoFCFp1LrQwZvNP/dUfNT0zxxLB2G2BIlAgPmCsqD7CQ7M9o9VhaddugI9qbD5SM1s5UZG
 PM1fmOr28RU1gQeKfoFaQodI96eOvhh/oAx6shy75jgFyYZVDfRfwaI1tyk98JpyezyWOihJ/nYQonlALMCPGfmHA9mpi30j5v4zk6st2c8Tjr65xnIkRypK
 BqfR54AnM4OLAXAktZriVOdwEqT4dIfD1D4ivCv71xOc0vDoDHYnX2M3Ei6GmkYBD7q487y6cfPg3c+1WLswV7RAgHr+wDg/Z06+9U6NKNSyuUQ1s50P946Y
 2gtwPsYU9ikzmOAJ1pyEIn3/zmgYNlFy1Q6x8B3/Bi7lOY9dgx6463ItgZ2uQEMmptNhkEwj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2021 17:49, Stanimir Varbanov wrote:
> Hi Hans,
> 
> Any comments?

Thanks for the reminder, I replied to the patch.

Regards,

	Hans

> 
> On 3/2/21 11:53 AM, Stanimir Varbanov wrote:
>> Hi,
>>
>> This series add a new intra-refresh period control for encoders. The
>> series is a continuation of [1]. Comments addressed:
>>  * A typo in .rst (Hans)
>>  * Clarified the relationship with CYCLIC_INTRA_REFRESH_MB (Hans)
>>
>> Comments are welcome!
>>
>> regards,
>> Stan
>>
>> [1] https://www.spinics.net/lists/linux-media/msg183019.html
>>
>> Stanimir Varbanov (2):
>>   media: v4l2-ctrls: Add intra-refresh period control
>>   venus: venc: Add support for intra-refresh period
>>
>>  .../media/v4l/ext-ctrls-codec.rst             | 12 ++++++++
>>  drivers/media/platform/qcom/venus/core.h      |  1 +
>>  drivers/media/platform/qcom/venus/venc.c      | 28 +++++++++++++++++++
>>  .../media/platform/qcom/venus/venc_ctrls.c    | 13 ++++-----
>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  2 ++
>>  include/uapi/linux/v4l2-controls.h            |  1 +
>>  6 files changed, 50 insertions(+), 7 deletions(-)
>>
> 

