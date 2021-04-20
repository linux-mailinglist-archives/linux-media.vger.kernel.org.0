Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFD8366148
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 22:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbhDTU7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 16:59:55 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34973 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233882AbhDTU7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 16:59:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YxSmlcYTVvTEDYxSplSDa7; Tue, 20 Apr 2021 22:59:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618952360; bh=Dx9z4m+tcq77Y2QWeVSRtkdtMnqt9hD1nYc+JsLKuEc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=c+745kh6jG77urYLBBImE/CtrtVcIuBSWvMCjWwzdlsEW8uAbTvbvDv4UFAdBaIem
         8c5NepcEmgb4lDmm/LWLad6Y2lbCrAONQbH7/pD3UReP2jyalYhJy2HJRGTyloXbf6
         vZdyFywjkJ6nMq7NTA8M3NvBtd3U1VD51qIfkbThM4FD0l0EarBoW8EbbD2tRL4AKC
         8sliQK/FbROyo79eWNRprMCSdWWPiIkQ710+24jNxmFZ2QtuP6sn8XJV4OZ0vbh/Bn
         6yAt/kh3IiTIiwokzv+7fy/qGaSeFW1EVdo6Fuyl1A93HpNeLf34QBRuj2SdZHg7nW
         2HqAwwqhmo1eg==
Subject: Re: [PATCH 1/6] staging: media: atomisp: improve function argument
 alignment
To:     Deepak R Varma <mh12gx2825@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <cover.1618859059.git.drv@mailo.com>
 <9b517e04d1a9b56dc14494a246d70915d51b1839.1618859059.git.drv@mailo.com>
 <401d7d5a-70b7-3443-8612-eb4812e22af1@xs4all.nl>
 <20210420171943.GC193332@localhost>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2b4bffc8-7851-45aa-eb64-8f8d2d5928eb@xs4all.nl>
Date:   Tue, 20 Apr 2021 22:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420171943.GC193332@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIYrcPqvrIctGROFUKWmQNc4N7HaEWpsfcbuL6ABHxHIlnKw7FyPNfcQxmECSxMuJ3bLBKYLfquMFeocMYtCzH5erb4GnK2Jo1hGujq6UFxCcxeTilj+
 MIOD36G7RSMqdFbPUDX+cpVQLpmjxnPDzZWcBTdkqqUcl6emL5JsITajfLxkW6Wg8f2ReCfKsfxAXyXWwwb7DCUKs3MRkJ1ouTXu2bw2H+6B7Z6mG0ONkhn1
 V1pn/2vhdYWu6NryoAnFAHG331ZbljUFC1DXEGSOT8Gg4NL7ZKpvGyaLABpHOG+w2HmYez/eX42EX1XNi5r/y5GiQiiecP5DHNEv+jJQXfS1IelgKuctAvuF
 7UuG0NaiaMfMYFHrKIE1MODSoFY5FMAjl3FChcTV2RzfbPAjD6ZHtx8erj0jaImbLsjaHfKb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 19:19, Deepak R Varma wrote:
> On Tue, Apr 20, 2021 at 03:24:32PM +0200, Hans Verkuil wrote:
>> On 19/04/2021 21:12, Deepak R Varma wrote:
>>> Improve multi-line function argument alignment according to the code style
>>> guidelines. Resolves checkpatch feedback: "Alignment should match
>>> open parenthesis".
>>>
>>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>>
>> WARNING: From:/Signed-off-by: email address mismatch: 'From: Deepak R Varma <mh12gx2825@gmail.com>' != 'Signed-off-by: Deepak R Varma
>> <drv@mailo.com>'
>>
>> Which email should I use? Ideally you should post from the same email
>> as the Signed-off-by.
> 
> I am really sorry for this. I was trying to set up mutt to handle both
> my accounts and guess that led to this issue. I will resubmit the patch
> set with the appropriate email match. Will that be okay?

It is sufficient to just let me know which email I should use. I can edit
it so it shows the correct author email.

Regards,

	Hans

> 
> Thank you,
> deepak.
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> ---
>>>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
>>>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
>>>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
>>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>>> index 2b71de722ec3..6be3ee1d93a5 100644
>>> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>>> @@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
>>>  }
>>>  
>>>  static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
>>> -	struct gc0310_write_ctrl *ctrl,
>>> -	const struct gc0310_reg *next)
>>> +					     struct gc0310_write_ctrl *ctrl,
>>> +					     const struct gc0310_reg *next)
>>>  {
>>>  	if (ctrl->index == 0)
>>>  		return 1;
>>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
>>> index 78147ffb6099..6ba4a8adff7c 100644
>>> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
>>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
>>> @@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
>>>  }
>>>  
>>>  static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
>>> -	struct gc2235_write_ctrl *ctrl,
>>> -	const struct gc2235_reg *next)
>>> +					     struct gc2235_write_ctrl *ctrl,
>>> +					     const struct gc2235_reg *next)
>>>  {
>>>  	if (ctrl->index == 0)
>>>  		return 1;
>>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>>> index eecefcd734d0..aec7392fd1de 100644
>>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
>>> @@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
>>>  }
>>>  
>>>  static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
>>> -	struct ov2722_write_ctrl *ctrl,
>>> -	const struct ov2722_reg *next)
>>> +					     struct ov2722_write_ctrl *ctrl,
>>> +					     const struct ov2722_reg *next)
>>>  {
>>>  	if (ctrl->index == 0)
>>>  		return 1;
>>>
>>

