Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026542AD2AC
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbgKJJlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:41:50 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42773 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726462AbgKJJlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:41:49 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id cQ9okknN2NanzcQ9rk5DX7; Tue, 10 Nov 2020 10:41:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605001307; bh=iUgbSl4OPSOSJGki6IpbBA/pJx/DxjIzDGiaU7VBg+I=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ePAATdNDHM85zueHPdXOQdTkmNZecWI8+iCnyzgbc9rs7wSMwuvEpA6vYx47FIgzd
         2llLxVNEys9OXetZrnhN66mI5qQJJNUOBoub/5cPhdNUyeDqPiIUuWZfmzqkx3VjpV
         GFLr08T3nh+TBxfacuybVriB1rYjk7PM5qstA5bl3FCZTlwOxJIUPkaacsSxhG/Z4O
         kUA79jFJKPjVfRu3vMZvSrq4w7PtQnLnZ3nSvpaxd1E7QROZtqA6knzD0EPu8dQc/P
         8slkU6nXlEf66syoO4mbCBGtU4zRrh3JehbUgF+edeiLhwwBR/65a7hmIBrBnt68IF
         +c36od6k9XAng==
Subject: Re: [PATCH 0/3] HDR10 static metadata
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
 <2f907743dbb77f4c2f871675070065dd372514be.camel@collabora.com>
 <79148cf4-96dc-0c00-2864-183e526a65e9@xs4all.nl>
Message-ID: <6b4f23be-060c-db6f-2fb5-e4d328789990@xs4all.nl>
Date:   Tue, 10 Nov 2020 10:41:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <79148cf4-96dc-0c00-2864-183e526a65e9@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfG/wMabN/muTEFi30FIMD/JhTmID7tYz2KkvbhkfjxElgyaXlI5Zx7aFnxjkzQK9wsrLjXJFiAYxnk1ty67jolxqUhgcd1j+eyW+Ht4fA7lcyRo7HNFq
 8xem92G9c4XcXduBe5I2KSJrPZ+qnn7wyupnlld3vSmjSKpjdAUNytkwIDsqmzk2p/rF8+uYijXnNeOp4dbYfVIDIJ7/xXvAoNIupS55AR23EYcIBkWZ92aI
 OrDlcNnWr2hdaJH5Jqy8OF0dKKjop8IxfUD6el6yDT+j4yzVxeebUOz2/+5i7VRGgizjsHy0RxyO3yO8c2kC60DR+VwEawuQRWwCb3jDYnYZHWeAQgTIcGbN
 DYEPhcymKyxRMD00N9TwYgXHwXgxcfpGCzQlAmEpU/ZmeyiizGbMdI+g9YmcmXz8AogfTCsl
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/11/2020 10:38, Hans Verkuil wrote:
> On 09/11/2020 20:53, Nicolas Dufresne wrote:
>> Le lundi 09 novembre 2020 à 19:31 +0200, Stanimir Varbanov a écrit :
>>> Hello,
>>>
>>> This patchset adds two HDR10 HEVC v4l2 controls for Content Light Level
>>> and Mastering display colour volume plus implenmentation in Venus encoder
>>> driver.
>>>
>>> Comments are welcome!
>>
>> It is not a formal review, but I did walked through the new API and
>> everything looks fine to me. One question though, are you aware that
>> the H.264/AVC equivalent is identical ? What is you plan for that ?
> 
> Not only that, but these structures are lifted straight from the
> CTA-861-G standard: see "6.9 Dynamic Range and Mastering InfoFrame"
> and "6.9.1 Static Metadata Type 1".

Correction: the CTA-861-G lifted it from SMPTE ST-2086 in turn.

Regards,

	Hans

> 
> So this is equally useful for HDMI receivers and transmitters.
> 
> Actually, include/linux/hdmi.h contains a struct for that, but it seems
> to be missing a lot of fields. But we need a v4l2 control anyway and hdmi.h
> isn't a good fit for that.
> 
> Regards,
> 
> 	Hans
> 
>>
>>>
>>> regards,
>>> Stan
>>>
>>> Stanimir Varbanov (3):
>>>   v4l: Add HDR10 HEVC static metadata controls
>>>   docs: media: Document CLL and Mastering display
>>>   venus: venc: Add support for CLL and Mastering display controls
>>>
>>>  .../media/v4l/ext-ctrls-codec.rst             | 61 +++++++++++++++++++
>>>  drivers/media/platform/qcom/venus/core.h      |  3 +
>>>  drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++
>>>  .../media/platform/qcom/venus/hfi_helper.h    | 20 ++++++
>>>  drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++
>>>  .../media/platform/qcom/venus/venc_ctrls.c    | 16 ++++-
>>>  drivers/media/v4l2-core/v4l2-ctrls.c          | 61 +++++++++++++++++++
>>>  include/media/hevc-ctrls.h                    | 41 +++++++++++++
>>>  include/media/v4l2-ctrls.h                    |  2 +
>>>  9 files changed, 240 insertions(+), 1 deletion(-)
>>>
>>
> 

