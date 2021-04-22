Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C9B367B10
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 09:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhDVH1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 03:27:55 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37559 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230206AbhDVH1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 03:27:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZTk3lpZawvTEDZTk7lXx7G; Thu, 22 Apr 2021 09:27:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619076439; bh=T3ySyIhi3uB0029gV8V5SLi0VzSe/xYshfr6JKdJYHk=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bAM7je+vPopxGPrzw9e3tatXTrXmMDOs0BQ0L8edyC8wP/CBQB4NBTnDhC0bF+saI
         sCFL731BegtjG3tdBboDq2UczY+nJOoxUInijHowcsG9nH0nzTFKyTCobX97iBzj9D
         WBxXyU05MgoiO9LqtnR/KMvRi2tJG80vD2m4REjqcptbsR3Kf+qJqb/cW3tcEGcbEw
         LhJwVWNvJqtjGrchf8c3H76+HXJykyRjy8T0L4jm23U3PwY9pS9XAe7b+h8lr/n6Nx
         0I3smMeiR3DWNPu65K+6CqQbt0kD5O5xJJX3JoCJknv9UnNNc2GjNAlNswvm7+YSST
         KhH/eH7BVMqxg==
Subject: Re: [PATCH v4 0/3] cec: add tests to Audio Rate Control
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
 <bf312cbf-61a3-d809-be88-7b3ba318231c@xs4all.nl>
Message-ID: <9f15f894-afe8-af7d-fab8-a3da63440723@xs4all.nl>
Date:   Thu, 22 Apr 2021 09:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bf312cbf-61a3-d809-be88-7b3ba318231c@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKeHS8U3gbfYsJ3XeDbLTdvJyxLJ99JNxP/25Rygp4aJCysPdeuVErsf62hLGBSHE+D6uCfFn4QZkiOd66gzXMrw+EtsvVfcAT3XLQnTJo8OIswBLU3Y
 Q+niVz5Y9O0NFuv1Uv0Uv91ULdqdyM115Bwj/juzpW/8M0TO49hNaTQOwvbKQXRnWCau8LXs0O+eoWcQEbin3VM91orVv0FEsu2A4mXBGVuJPkcLWrrncY90
 6LyVyKuXAZWDYFfwon6qdA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2021 09:02, Hans Verkuil wrote:
> Hi Deb,
> 
> On 22/04/2021 05:27, Deborah Brouwer wrote:
>> Update the Set Audio Rate test to include the Audio System source mask.
>> Add an active sensing test.
>> Add an invalid operand test.
> 
> Thank you for this patch series, it's been applied so you can mark this
> Outreachy contribution as Accepted!
> 
> I have some follow-up comments for refinements (see my upcoming replies
> to the corresponding patches), but those can be addressed in new patches.

Just one follow-up comment, to be precise. See my reply to patch 2/3.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Changes since v3:
>> * Patch 1: cec-compliance: add Audio System mask to Set Audio Rate
>> 	* New patch
>>
>> * Patch 2: cec: add active sensing test for Audio Rate Control
>> 	* Remove comments indicating basic and rudimentary status of test.
>> 	* Add Audio System source mask to active sensing test.
>>
>> * Patch 3: cec: add invalid operand test for Audio Rate Control messages
>> 	* Replace "parameter" with "operand" in name, commit msg and comment.
>> 	* Add Audio System source mask to invalid operand test.
>>
>> Changes since v2:
>> * Patch 1: cec: add active sensing test for Audio Rate Control
>> 	* No changes.
>>
>> * Patch 2: cec: add invalid parameter test for Audio Rate Control
>> 	* Add indent to correct formatting error.
>> 	* Change invalid parameter from -1 to 0xa.
>> 	* Add check that message has not timed_out.
>> 	* Add check that cec_msg_status_is_abort.
>> 	* Add break at end of default case statement.
>>
>> Changes since v1:
>> * Patch 1: cec: add active sensing test for Audio Rate Control
>> 	* remove or add spaces to conform to kernel coding style.
>> 	* add empty line to improve readability.
>> 	* add and clarify comments; remove TODO comment.
>> 	* change commit subject to refer to "active sensing".
>> 	* rename function to audio_rate_ctl_active_sensing.
>> 	* rename node state to last_aud_rate_rx_ts.
>> 	* make follower warning more specific.
>> 	* change control flow in cec-processing to avoid extra indent.
>>
>> Deborah Brouwer (3):
>>   cec-compliance: add Audio System mask to Set Audio Rate
>>   cec: add active sensing test for Audio Rate Control messages
>>   cec: add invalid operand test for Audio Rate Control messages
>>
>>  utils/cec-compliance/cec-test-audio.cpp | 62 +++++++++++++++++++++++--
>>  utils/cec-follower/cec-follower.cpp     |  1 +
>>  utils/cec-follower/cec-follower.h       |  1 +
>>  utils/cec-follower/cec-processing.cpp   | 50 ++++++++++++++++----
>>  4 files changed, 100 insertions(+), 14 deletions(-)
>>
>> --
>> 2.17.1
>>
> 

