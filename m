Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E254089BF
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 13:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239316AbhIMLCN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 07:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239199AbhIMLCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 07:02:13 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908EEC061574;
        Mon, 13 Sep 2021 04:00:57 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PjhmmYP8EpQdWPjhnm2dc0; Mon, 13 Sep 2021 13:00:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631530855; bh=cm4tx5E2BMsTJ0Uz8+lXiGq9cjmJ24vFtRs50dHXAxI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qLjkwpaGG8Dyqcmi2ZZZsEBn64tHzuCTK3vVSpY44P8mpSN7AY7EzaVbtGML1eMcJ
         j00YGk2wAWPyEonPYY94TOcDEOpya8O4jSXpPFsPm0wULyhu/SjXS3jl+3K5uLfvnq
         oqHMYHYIF7g0cuox4r1aIoxY1dG4lWz07HzP0R91Hs1ZQSftrOxRMuvuvcB8MtbiRk
         wrHXXOoto5XPj+N795ObgAjH9hJeclZDlHfoGoMS6rQvDlQCgWWoJZY02zYIl8gdAu
         XL0O5X4ok9otMWoieYykBa/nHPsSoLPKffX838/fGLQ8k18iwScLrqSCjvbGtWjvYb
         ygGkUUnKpyQJQ==
Subject: Re: NAK: [PATCH][next] media: pvrusb2: add newline between two
 statements
To:     Colin Ian King <colin.king@canonical.com>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902220112.55824-1-colin.king@canonical.com>
 <52c324ad-2467-9edc-c386-bc5a086cecbc@canonical.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <82d125bd-9d16-803d-754b-48aa79fde06c@xs4all.nl>
Date:   Mon, 13 Sep 2021 13:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <52c324ad-2467-9edc-c386-bc5a086cecbc@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBeyTGiasCGZOBOFh6cvtajmiKhRwxPqolSr9CzM0/PjMgMxmpoUM8fOyt9kwNb6N+e9+eigom8z+HBX3CLrt9r4LCccjw1nufd7Er92cNlRaiB6hzOh
 pXD/MyPDAKRg7jwEoGdQJ0Ff9+1kK5yHRMJH9Qh8zlLrudY6a25nbSnqbmaSp+BgDSuhrvna5gCvJ4sN0E7J0Yi8mXDxLdeJF8FL4LTaAaNpNoE2a1LiVNxA
 qcNpplKTbLMaAOJqTrMV172xOx+ZuyieC7CQ+BMzVp1rVKklUwOnlZgFDglh8bXCacMwJwZwvfkMl7XPC+M5VRzD868NyqVviL5yR0Fj9TC7iFuvA2XmNykc
 ILseXcHiSvb/BmwydQOed/tbg7coLEvO5f4wHdHBE/hYELvc3ZQHOGsqe2VaORhTcoT+mfyxgBdabnHxcubY3JGNqdYuUYCQyD92MAfYCFDXiIR7M88NedOQ
 /QGR8IpUTQvAva4D
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/09/2021 00:02, Colin Ian King wrote:
> On 02/09/2021 23:01, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There are two statements on the same line, add a newline to clean
>> this up.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>> index d38dee1792e4..ca00b7fe1e7f 100644
>> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>> @@ -1727,7 +1727,8 @@ int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
>>  				   enable_flag ? "enable" : "disable");
>>  		}
>>  		pvr2_hdw_state_sched(hdw);
>> -	} while (0); LOCK_GIVE(hdw->big_lock);
>> +	} while (0);
>> +	LOCK_GIVE(hdw->big_lock);
>>  	if ((ret = pvr2_hdw_wait(hdw,0)) < 0) return ret;
>>  	if (enable_flag) {
>>  		while ((st = hdw->master_state) != PVR2_STATE_RUN) {
>>
> 
> ignore, V2 being sent in a moment.

I haven't seen a V2 yet... In any case, I've rejected this patch in patchwork.

Regards,

	Hans
