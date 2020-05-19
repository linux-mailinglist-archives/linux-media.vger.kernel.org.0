Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073EA1D9350
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 11:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgESJ2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 05:28:54 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40299 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726605AbgESJ2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 05:28:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ayYKjzUhr8hmdayYNjj17c; Tue, 19 May 2020 11:28:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589880532; bh=owAAYqeeE3Z288iHS21IFk0SUNXS/jYDTfQF2Jr9M8Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=K1eUPKjZuLzZy1RdnN3tsbtu4EfSxE5b0uA0KxhLPTvGVtHUgNNyaBY+uRRfRfZ5k
         CzbObL/8zDM45xpDr0xkBqX3vvCfnr+tKMsZEh5V3Tl1mVSKpk7MlNXRp/ki8gfI+5
         /9G9N8L94pRudvRDjtWc6qYxrtX7ro85nzB85B3cHA/IFW2vxTWMflLYz1CRFpPPwm
         q4mly0Sx2uRcKxdzggrWK03uQS1gk8S0h57ErRX8nIKdvfe/ge5URJC1sQrNgyfOEN
         oVtZ++gT0QvGp3LQYtSR8TpnE5tkYBsmGJPD3SsYb2jq9AocTqWCbkzZTLG4ZLkIJh
         mMO1QuDQkSG+w==
Subject: Re: [PATCH v2 1/1] Documentation: media: Refer to mbus code
 documentation from CSI-2 docs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <20200519085014.32163-1-sakari.ailus@linux.intel.com>
 <7f303ad0-305c-595c-dfdd-4d5a0dd85157@xs4all.nl>
 <20200519091738.GE20066@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6fbbe377-0164-1c6c-a1f6-70112a105772@xs4all.nl>
Date:   Tue, 19 May 2020 11:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200519091738.GE20066@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJFnYFXNVvW0EHXjaQ3FY/bqgnwCbpUQ9UBcHjDPeguX6a99DL06N9PPy2WfhfZDDOFjwxC6QXaF0nC88CRLv25G39SCm09CJaEe/ksTjBSQtRI4SM+/
 6cS5qK7XKFA8Ecj7QnxRXSrA22CihboIlVSwrLx+4WdzyGjMP+bJMrUm7KtriI3HsZQo0iPykxh5jyNpCVnQo4iSyFP+S7MKNHLBaiyoA7k7kxst9atdkif+
 64jpoJ1UicG0BpZKKMjRK4wxJZXqB2540qj2BT6bb6c=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2020 11:17, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, May 19, 2020 at 11:05:31AM +0200, Hans Verkuil wrote:
>> On 19/05/2020 10:50, Sakari Ailus wrote:
>>> The media bus codes to be used on serial busses are documented but there
>>> was no reference from CSI-2 documentation. Add that now.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  Documentation/driver-api/media/csi2.rst | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
>>> index da8b356389f0..1653a51d2a6e 100644
>>> --- a/Documentation/driver-api/media/csi2.rst
>>> +++ b/Documentation/driver-api/media/csi2.rst
>>> @@ -10,6 +10,13 @@ the host SoC. It is defined by the `MIPI alliance`_.
>>>  
>>>  .. _`MIPI alliance`: http://www.mipi.org/
>>>  
>>> +Media bus formats
>>> +-----------------
>>> +
>>> +Always use the media bus pixel code that describes a parallel format that
>>> +transfers a sample on a single clock cycle. See :ref:`v4l2-mbus-format` for more
>>
>> How about: "transfers the pixel data as a single sample in one clock cycle"
> 
> The text is from mbus format documentation. Note that this might not be
> pixel data; it may be metadata as well.

My problem with 'a sample' is that all parallel media bus formats transfer 'a sample'
in a single clock cycle. It is not clearly defined what 'a sample' is.

Either the text needs to be improved, or an example should be added here as well
since an example clarifies what is meant.

> 
>>
>> Possibly with an example: "So use e.g. MEDIA_BUS_FMT_SBGGR10_1X10 instead of
>> MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE."
> 
> There's an example in mbus format documentation. I'm fine adding one here,
> too, but the purpose of this bit is to mainly refer to mbus format
> documentation. Mbus format documentation uses MEDIA_BUS_FMT_BGR888_1X24 and
> MEDIA_BUS_FMT_BGR888_3X8 as the example.
> 

Ah, I see. But then the reference to v4l2-mbus-format is confusing, I'd
change that to v4l2-mbus-pixelcode. That's where the example is.

Regards,

	Hans
