Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C296516E87
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 13:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384836AbiEBLKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 07:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384687AbiEBLIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 07:08:49 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA3C1131
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 04:05:18 -0700 (PDT)
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 242B5GMb078599;
        Mon, 2 May 2022 20:05:17 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Mon, 02 May 2022 20:05:16 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 242B5Gal078593
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 2 May 2022 20:05:16 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <1b7b9a2a-d52c-ff35-f32d-d22d7980a80f@I-love.SAKURA.ne.jp>
Date:   Mon, 2 May 2022 20:05:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 (resend)] media: imon: reorganize serialization
Content-Language: en-US
To:     Oliver Neukum <oneukum@suse.com>, Sean Young <sean@mess.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jarod Wilson <jarod@redhat.com>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <00000000000043b599058faf0145@google.com>
 <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
 <YmZny7mzugFe0t+X@gofer.mess.org>
 <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
 <YmaMY/XKBmEfl8i6@gofer.mess.org> <YmbF071fSKUff6R2@rowland.harvard.edu>
 <YmbKiPna01aMQhJw@gofer.mess.org>
 <349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp>
 <Ymel5XtWC7rwpiXF@gofer.mess.org>
 <e17d6647-2c65-638b-1469-f546da7d0ba8@I-love.SAKURA.ne.jp>
 <21ffa07a-1bc1-cb1f-eef4-6c3a73953061@I-love.SAKURA.ne.jp>
 <6ab13405-b942-ddbe-c2de-dd193fe40795@suse.com>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <6ab13405-b942-ddbe-c2de-dd193fe40795@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2022/05/02 19:46, Oliver Neukum wrote:
> 
> 
> On 02.05.22 05:49, Tetsuo Handa wrote:
> Hi,
> 
> there is one open question with this patch I am afraid.
>>  
>> @@ -533,8 +550,10 @@ static int display_open(struct inode *inode, struct file *file)
>>  
>>  	mutex_unlock(&ictx->lock);
>>  
>> +	if (retval && refcount_dec_and_test(&ictx->users))
>> +		free_imon_context(ictx);
>> +
>>
> 
> When could this ever happen? Either the device is disconnected, then
> you'll go to 'exit' or the refcount will go back to something >0, won't it?
> 

(Step 0) Say, ictx->users is initially 1.

(Step 1) display_open() increments via refcount_inc_not_zero(), now is 2.

(Step 2) imon_disconnect() decrements via refcount_dec_and_test(), now is 1.

(Step 3) if retval != 0, display_open() needs to undo (Step 1) via
         refcount_dec_and_test(), now is 0.

because imon_disconnect() can be called while display_open() is in progress...
