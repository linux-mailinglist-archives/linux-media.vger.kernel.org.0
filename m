Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439AC1E76AE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 09:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgE2Hbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 03:31:52 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44799 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725839AbgE2Hbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 03:31:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eZUXjM2wmFjnUeZUbjjqKe; Fri, 29 May 2020 09:31:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590737509; bh=0jX1VAQItv80C8QLgV1gmtlNTjQTX35j9lFnKAm/mOE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SdfEXpjBxHtk15WEZ5X3Q33YlNgcWc+MX/LhoKlHyXTFl3Bx2hScbEAvtrYYeDtmy
         ZkffNyr6jvGn/8uQOsW3tulig4Q4CUdWJmbkPbH7iMdWDsHf770E65jT0xeKfbZEYV
         kykOJE7s3s3ook0mk6NBfrBjfdZGtPtqUjkj2aPVYbcFt477WKzCt/wApP6cBKjSwM
         mRziooM57XKrs93/Qms9DdeAEce9/W0V0xGu399xvxzUhFm70XXPWtssDQyNgFIOOd
         T1ei7BPo5oBlQ6Kh9z6lpmAU3yJogBjT0CL0pBWp/au232OFlfn/r2X8MFbTv13DIu
         ckdhRR2V8X80Q==
Subject: Re: [RFC] METADATA design using V4l2 Request API
To:     dikshita@codeaurora.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
 <d1179bc1-662b-615f-0f9b-67693fe8c906@xs4all.nl>
 <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
 <7be1070ee7aad1f48fc6de63523da8e1bc952dc8.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ad61378b-e279-d161-adaa-17349adf183e@xs4all.nl>
Date:   Fri, 29 May 2020 09:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7be1070ee7aad1f48fc6de63523da8e1bc952dc8.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMGzJsdAlhSpzy8YNRO3rLLisRNTL/dP4tB5OOnpjDg3iTZj8bKXFG02nicNLhDvmZTeYThnUfdYOYUyBGRK4vBF11dVPX8wA1Vpxv2RL3aZ/Saig7AS
 4AuPS17AjLsFABgJeE2zo0oFjArxA6EcLWo66Mb4Ah8mBbYYGlqId9M17G66yoQs5/DidQ6S1+1uE9TdlUV/RzjnmZBzxBDdwRxQGZU+hWdQnyAOZrfzUiFQ
 zA8/IEg2bvriBA69wPXU/VJp+sQUoz8LeQGJSgeebs+zjCYlT8lmH9QtF2hiERZarLwQFySN3vfEczzvK98WKHfrsH1YdcJTvJVC8ZIwBx9GJ7eV0tuv24to
 amaCOVZqR+e8Nvv9rCLPbHsTflO5ViKv/xxVRAr6FRooenmO6JjMQJmR8JITJv9Mj88puitYQ/sNwat6u7ktQyPcg8dc/ktby2A1YvFrNEQgHmrfpAHu7yBg
 2ZoKJ+rx96OBV/jP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/05/2020 04:18, Nicolas Dufresne wrote:
> Le jeudi 28 mai 2020 à 16:18 +0530, dikshita@codeaurora.org a écrit :
>>> not allowed. So I need to know more about this.
>>> Regards,
>>>        Hans
>>
>> we need this for use cases like HDR10+ where metadata info is part of
>> the bitstream.
>>
>> To handle such frame specific data, support for request api on capture 
>> plane would be needed.
> 
> I have a bit of a mixed impression here. Considering how large the ioctl
> interface overhead is, relying on HW parser to extract this medata woud be the
> last thing I would consider.
> 
> Instead, I'm quite convince we can achieve greater and likely zero-copy
> perfromance by locating this header in userspace. So everytime I see this kind
> of API, were the HW is *needed* to parse a trivial bit of bistream, I ended
> thinking that we simply craft this API to expose this because the HW can do it,
> but no further logical thinking or higher level design seems to have been
> applied.
> 
> I'm sorry for this open critic, but are we designing this because the HW
> designer exposed that feature? This is so low complexity to extract in
> userspace, with the bonus that we are not forced into expanding the
> representation to another form immediatly, as maybe the display will be able to
> handle that form directly (where converting to a C structure and then back to
> some binary format to satisfy DRM property seems very sub-optimal).
> 
> Nicolas
> 

Nicolas raises good questions: it would help if you can give more detailed information
about the hardware. We had similar discussions with Xilinx about HDR10+ (see this
thread: https://www.spinics.net/lists/linux-media/msg163297.html).

There is no clear answer at the moment on how to handle dynamic HDR metadata.
It will help if we have some more information how different SoCs handle this
in hardware.

Regards,

	Hans
