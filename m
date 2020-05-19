Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F1A1D94D2
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 13:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgESLAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 07:00:10 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33231 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbgESLAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 07:00:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id azybjzy2w8hmdazyejjJ1c; Tue, 19 May 2020 13:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589886005; bh=bUThl3nyqDy2dk+sYIFSYqusp16a1LenXdFw6VLLhIg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=piYNWm6GVg/q4l/B7BVFWWtXQhdcc1V6AneGfsZCYlPfmog02kJuvrFqa6bvOhGE3
         MNS98w06TT3CbK00DK5SC51sAcHUnIFbfZkwpFFeDPj4ogIeVS6VoZyraB+tYup8CT
         ahRcfayT6z68IZOJTOkPhrdz5IO8I2d82LAmWJx/MwZoHVNZ6h4g13MfHaxvG5/2vL
         nQdAP86UrP36un8Z8LXJ2KDOTIvPBjMkETsICRZMy7yHpdiVuTSBS1NOiBtgIY6uz6
         mc90qmWwNiKSNCQYoTece4C2x8hGq1bHaMD1FF6eFkYEir9UTz4Lc3QeR1V626LI/v
         pq+CSLXwlhIHg==
Subject: Re: [PATCH v2 1/1] Documentation: media: Refer to mbus code
 documentation from CSI-2 docs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <20200519085014.32163-1-sakari.ailus@linux.intel.com>
 <7f303ad0-305c-595c-dfdd-4d5a0dd85157@xs4all.nl>
 <20200519091738.GE20066@paasikivi.fi.intel.com>
 <6fbbe377-0164-1c6c-a1f6-70112a105772@xs4all.nl>
 <20200519100850.GF20066@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <660b4c8a-2218-f263-007f-28b9849878d8@xs4all.nl>
Date:   Tue, 19 May 2020 13:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200519100850.GF20066@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH8FbTYiRTXIyoZaB8JXYB2GpIeroNLmvqJ9bZ7UmTUULfKWdq0N02et4GHOgws1E97QGCKjUevdn5o8h2/NLXmn/55BAOUMN7Fd6dP0xPuSTS7wuche
 ZPPhmIbnnHP+SZ1s5wMEMsXS1QvAqsCufcB2Or87aKMqU3vvg/wrUlJEMEzhH2t4xlQEgyoC8dWfA1hJ1GGuuFhyJQAntIpJedVajbA5om6fzvqAg/B6FmPd
 bO2TAbxS8oXPGBS0Dz8W8nwcizA1bvs+zIB3HJwejco=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2020 12:08, Sakari Ailus wrote:
> On Tue, May 19, 2020 at 11:28:48AM +0200, Hans Verkuil wrote:
>> On 19/05/2020 11:17, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Tue, May 19, 2020 at 11:05:31AM +0200, Hans Verkuil wrote:
>>>> On 19/05/2020 10:50, Sakari Ailus wrote:
>>>>> The media bus codes to be used on serial busses are documented but there
>>>>> was no reference from CSI-2 documentation. Add that now.
>>>>>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> ---
>>>>>  Documentation/driver-api/media/csi2.rst | 7 +++++++
>>>>>  1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
>>>>> index da8b356389f0..1653a51d2a6e 100644
>>>>> --- a/Documentation/driver-api/media/csi2.rst
>>>>> +++ b/Documentation/driver-api/media/csi2.rst
>>>>> @@ -10,6 +10,13 @@ the host SoC. It is defined by the `MIPI alliance`_.
>>>>>  
>>>>>  .. _`MIPI alliance`: http://www.mipi.org/
>>>>>  
>>>>> +Media bus formats
>>>>> +-----------------
>>>>> +
>>>>> +Always use the media bus pixel code that describes a parallel format that
>>>>> +transfers a sample on a single clock cycle. See :ref:`v4l2-mbus-format` for more
>>>>
>>>> How about: "transfers the pixel data as a single sample in one clock cycle"
>>>
>>> The text is from mbus format documentation. Note that this might not be
>>> pixel data; it may be metadata as well.
>>
>> My problem with 'a sample' is that all parallel media bus formats transfer 'a sample'
>> in a single clock cycle. It is not clearly defined what 'a sample' is.
>>
>> Either the text needs to be improved, or an example should be added here as well
>> since an example clarifies what is meant.
>>
>>>
>>>>
>>>> Possibly with an example: "So use e.g. MEDIA_BUS_FMT_SBGGR10_1X10 instead of
>>>> MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE."
>>>
>>> There's an example in mbus format documentation. I'm fine adding one here,
>>> too, but the purpose of this bit is to mainly refer to mbus format
>>> documentation. Mbus format documentation uses MEDIA_BUS_FMT_BGR888_1X24 and
>>> MEDIA_BUS_FMT_BGR888_3X8 as the example.
>>>
>>
>> Ah, I see. But then the reference to v4l2-mbus-format is confusing, I'd
>> change that to v4l2-mbus-pixelcode. That's where the example is.
> 
> Ah, that's a better label indeed. I'll use that. With this, do you prefer
> having the example here as well?
> 

Rather than duplicating text, perhaps it is better to just refer to the
v4l2-mbus-pixelcode section:

+Media bus formats
+-----------------
+
+See :ref:`v4l2-mbus-pixelcode` for details on which media bus formats should
+be used for CSI-2 interfaces.

Regards,

	Hans
