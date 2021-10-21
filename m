Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E58E4363CE
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 16:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhJUOMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 10:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhJUOM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 10:12:29 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70632C061348
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 07:10:13 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dYlkmkzXhqPdpdYlnmw7zH; Thu, 21 Oct 2021 16:10:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634825412; bh=XGf4IhAMVepr88UUiKhoWOYLTyktrG/Hp4NBkFiVjL4=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lslYHsjwBcz0alxZ+shMUA+iHKMPL4CERXCDLmG0hdE6ZBWLS/sJZESnu2AgBbq2y
         GMaRS2bUkr1s8VWdhvRODiZzPX9cWmAzWlkB4LE6H3kbEjl5HTx796KVpd6wf4rvoh
         Yk8szXEpkeM6GE2BIMgYMF/H13dtXafIdhdrH5FYvliCi81qRvqcW7nPTs6X4PEMhM
         CfJ9mwlewL8bSCMbL8Ivf+1C1Bjmdm3rYOVvQvK9QDycd7Zhl5uEAr0lvb+QVoBpDj
         zx/DvBXABHZXtV2+oipBlSE2XJSqBOa0XAuh8jT6Mq6j37+5OKGW4xzo7DIVNDEplL
         IxyRHY3cRO/DQ==
Subject: Re: [PATCH] media: Document coding style requirements
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
References: <20211013092005.14268-1-jacopo@jmondi.org>
 <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
Message-ID: <154bef2e-15e9-0f81-dac9-8a9e39d43b17@xs4all.nl>
Date:   Thu, 21 Oct 2021 16:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ0z7rNiq5A6zJAUV9yYlqkZswYO+MvbMZ8NnepfzX/L8w5Gr2Z75llKNoggqaKP4qRZNZmtt/dSw6ZYNeqS/KmVPYat0/BGARMVZhRxlB/NAFc5wXNf
 uNMUe7QZAA1M0a2z9ig6/s/M4gIsoz+PyGKw/qcObUSIz2suqlPqQVoA7c/TBAsEAJjcRF5w6U0DaOQxooieMqyh+XP3fDliTkyrviUI42ZrkopOSC9E2l2d
 VaWaQDkXAfxQQiHkAbQBriygAhbhbmb1EWCp4ILFh8yD60inse1YvS5rLJINHZ2b1O4l2n+0C4bx/DlpJi5ASykzvjoPfSG9KHH23qAdVxfdFdGZfUHXmvK/
 6aRANPjdrIiNLqVaKmdWoejRNu3PSg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/10/2021 16:00, Hans Verkuil wrote:
> On 13/10/2021 11:20, Jacopo Mondi wrote:
>> There are a few additional coding style conventions in place in
>> the media subsystem. If they do not get documented, it's hard to enforce
>> them during review as well as it is hard for developers to follow them
>> without having previously contributed to the subsystem.
>>
>> Add them to the subsystem profile documentation.
>>
>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>
>> All points are up for discussion ofc.
>>
>> But the idea is to get to have more requirement defined, as otherwise
>> it's very hard to enforce them during review.
>>
>> Thanks
>>    j
>>
>> ---
>>  .../media/maintainer-entry-profile.rst        | 24 +++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
>> index eb1cdfd280ba..9c376f843e1c 100644
>> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
>> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
>> @@ -180,6 +180,30 @@ In particular, we accept lines with more than 80 columns:
>>      - when they avoid a line to end with an open parenthesis or an open
>>        bracket.
>>
>> +There are a few additional requirements which are not enforced by tooling
>> +but mostly during the review process:
>> +
>> +    - C++ style comments are not allowed, if not for SPDX headers;
> 
> if not -> except
> 
>> +    - hexadecimal values should be spelled using lowercase letters;
>> +    - one structure/enum member declaration per line;
>> +    - one variable declaration per line;
> 
> Hmm, I don't mind something like: int i, j;
> 
> But for anything more complex I too prefer one declaration per line.
> 
>> +    - prefer variable declaration order in reverse-x-mas-tree over
>> +      initialization at variable declare time;
> 
> Add something like:
> 
> ...unless there are dependencies or other readability reasons to
> depart from this.
> 
>> +
>> +      As an example, the following style is preferred::
>> +
>> +         struct priv_struct *priv = container_of(....)
>> +         struct foo_struct *foo = priv->foo;
>> +         int b;
>> +
>> +         b = a_very_long_operation_name(foo, s->bar)
>> +
>> +      over the following one::
>> +
>> +         struct priv_struct *priv = container_of(....)
>> +         struct foo_struct *foo = priv->foo;
>> +         int b = a_very_long_operation_name(foo, s->bar)
> 
> I'm not sure if this is what you typically see.
> 
> Perhaps this is a better example:
> 
> 	int i;
> 	struct foo_struct *foo = priv->foo;
> 	int result;
> 
> should be written as:
> 
> 	struct foo_struct *foo = priv->foo;
> 	int result;
> 	int i;

There is one other requirement: the patches must be run through
scripts/checkpatch.pl --strict. Anything that --strict notifies you of and
that is reasonable to fix (not everything can be fixed) should be fixed.

Also (although perhaps out of scope for a coding style) before new V4L2
drivers or substantial enhancements to V4L2 drivers can be accepted, you must
run 'v4l2-compliance -s' for the video device (or even better use -m if the driver
creates a media device) and include the output with the cover letter of
the patch series. Obviously, any failures should be fixed.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> +
>>  Key Cycle Dates
>>  ---------------
>>
>> --
>> 2.33.0
>>
> 

