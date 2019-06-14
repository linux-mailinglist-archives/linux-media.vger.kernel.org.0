Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43AC54625D
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 17:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfFNPQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 11:16:18 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:50010 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725843AbfFNPQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 11:16:18 -0400
Received: from [109.168.11.45] (port=40856 helo=[192.168.101.64])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hbnw6-000D0p-KC; Fri, 14 Jun 2019 17:16:14 +0200
Subject: Re: [PATCH 1/9] media: docs: v4l2-controls: fix sentence rendered in
 a nonsense way
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20190613141826.26775-1-luca@lucaceresoli.net>
 <069ac18c-7b9e-652a-1ff8-35fca09e6538@xs4all.nl>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <f132a0a3-d762-d4a3-f76c-a3cdc1dc5c56@lucaceresoli.net>
Date:   Fri, 14 Jun 2019 17:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <069ac18c-7b9e-652a-1ff8-35fca09e6538@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 14/06/19 09:14, Hans Verkuil wrote:
> On 6/13/19 4:18 PM, Luca Ceresoli wrote:
>> This sentence renders as:
>>
>>> Since such compound controls need to expose more information about
>>> themselves than is possible with ioctls VIDIOC_QUERYCTRL,
>>> VIDIOC_QUERY_EXT_CTRL and VIDIOC_QUERYMENU the VIDIOC_QUERY_EXT_CTRL
>>   ^^^^^^^^^^^^^^^^^^^^^                          ^^^^^^^^^^^^^^^^^^^^^
>>> ioctl was added.
>>
>> This does not make sense. Fix by providing an explicit link text. This
>> results in:
>>
>>> Since such compound controls need to expose more information about
>>> themselves than is possible with VIDIOC_QUERYCTRL and VIDIOC_QUERYMENU
>>> the VIDIOC_QUERY_EXT_CTRL ioctl was added.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  Documentation/media/uapi/v4l/extended-controls.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Documentation/media/uapi/v4l/extended-controls.rst
>> index 24274b398e63..0968aa9cd167 100644
>> --- a/Documentation/media/uapi/v4l/extended-controls.rst
>> +++ b/Documentation/media/uapi/v4l/extended-controls.rst
>> @@ -86,7 +86,7 @@ with compound types should only be used programmatically.
>>  
>>  Since such compound controls need to expose more information about
>>  themselves than is possible with
>> -:ref:`VIDIOC_QUERYCTRL` the
>> +:ref:`VIDIOC_QUERYCTRL and VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` the
> 
> This should just refer to VIDIOC_QUERYCTRL, not QUERYMENU. So this
> becomes: :ref:`VIDIOC_QUERYCTRL <VIDIOC_QUERYCTRL>`

Thanks for your prompt review. v2 on its way with this patch only, since
you already added the other ones in your latest pull request.

-- 
Luca
