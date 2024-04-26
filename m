Return-Path: <linux-media+bounces-10169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0248B3215
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75DD3B225E7
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0021113C9A3;
	Fri, 26 Apr 2024 08:12:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA52210FF
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714119160; cv=none; b=BbduTHGKieCQgGehNwr3+CCJ/31fUAUTOuZSnGG7+m6aUoWAcwiakQ5CmXZRF4xGt3YB4O13gf9LHG2xHo2jhH3RNXYtBSYthsonI44OEPNPh5ekQEaVNif/fsBLAQFHDNQmd/e0kaJLGqX1AiykZt2JyPv1Dgg8LBLbXU0988Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714119160; c=relaxed/simple;
	bh=7Q+0jlYmZX1LqdSyDEtX4KtcnyXbJrlKgET2uoIf4dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwz4t+kgT7xP3Wgo/SUOqaH3IJ1oZv5UxsyNq1jtYHfNqR/fU8u1IwGz53WF98p0dVw5MzI4E4fNUrKtlbutDj0bY5cCR721/5fqN1zy9wKePh/FC7g5ONvfy9qTrtc4SZFvneLnPdWpb+tFZeeJ4zSzWuLlRpJhRUUcjYtMZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58239C113CD;
	Fri, 26 Apr 2024 08:12:39 +0000 (UTC)
Message-ID: <ba71685d-5eb8-414e-9893-1e72b1107dfd@xs4all.nl>
Date: Fri, 26 Apr 2024 10:12:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: Documentation: v4l: LINK_FREQ can be an
 INTEGER64 control
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Wentong Wu <wentong.wu@intel.com>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
 <20240220130339.543749-3-sakari.ailus@linux.intel.com>
 <87dbeab5-4c61-403e-9805-da3bac673ffd@xs4all.nl>
 <ZitaOthZ9dnG5-1B@kekkonen.localdomain>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZitaOthZ9dnG5-1B@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/26/24 09:39, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Apr 26, 2024 at 09:22:40AM +0200, Hans Verkuil wrote:
>> On 20/02/2024 14:03, Sakari Ailus wrote:
>>> When a device passes through the video data while still having its own
>>> receiver and transmitter, it can use the same frequency as the upstream
>>> link does. The Intel MEI CSI device is an example of this. An integer menu
>>> control isn't useful in conveying the actual frequency to the receiver in
>>> this case.
>>>
>>> Document that the LINK_FREQ control may also be a 64-bit integer control.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> index b1c2ab2854af..7a3ccb100e1d 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
>>> @@ -22,7 +22,7 @@ Image Process Control IDs
>>>  
>>>  .. _v4l2-cid-link-freq:
>>>  
>>> -``V4L2_CID_LINK_FREQ (integer menu)``
>>> +``V4L2_CID_LINK_FREQ (integer menu or 64-bit integer)``
>>>      The frequency of the data bus (e.g. parallel or CSI-2).
>>
>> I really think a new control should be created for this.
>>
>> As I understand it, V4L2_CID_LINK_FREQ gives a set of supported frequencies,
>> and the application has to pick one (I think?). Is it supposed to be a
>> read-only control? Some driver seem to set the READ_ONLY flag, and some do not.
>> The documentation isn't helpful in that respect.
> 
> This is read-only effectively in current IVSC implementation.
> 
>>
>> In the case of the Intel MEI CSI and similar devices a new control would be
>> better, I think. Do I understand it correctly that for these devices it would
>> always be a read-only control? I.e. it just reports the frequency, but applications
>> cannot change it?
> 
> How would you call the new control?
> 
> V4L2_CID_LINK_FREQ_READ_ONLY?
> 
> Originally the reason for changing LINK_FREQ for sensors was be part of
> changing sensor's configuration to achieve a given frame interval.

Will this new variant always be read-only?

How about V4L2_CID_CUR_LINK_FREQ?

I.e., it returns the current link frequency. That way it can also be
used by drivers that implement V4L2_CID_LINK_FREQ.

Better ideas are welcome :-)

Regards,

	Hans

