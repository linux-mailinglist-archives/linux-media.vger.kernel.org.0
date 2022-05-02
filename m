Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE00516FF6
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 15:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385135AbiEBNH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 09:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbiEBNHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 09:07:55 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9755186DA
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 06:04:25 -0700 (PDT)
Received: from fsav414.sakura.ne.jp (fsav414.sakura.ne.jp [133.242.250.113])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 242D4Ovt065732;
        Mon, 2 May 2022 22:04:24 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav414.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp);
 Mon, 02 May 2022 22:04:23 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 242D4NA2065728
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 2 May 2022 22:04:23 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ae9de04c-3d00-1e5e-cd45-bb3baf4f6184@I-love.SAKURA.ne.jp>
Date:   Mon, 2 May 2022 22:04:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 (resend)] media: imon: reorganize serialization
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sean Young <sean@mess.org>, Alan Stern <stern@rowland.harvard.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jarod Wilson <jarod@redhat.com>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
 <YmZny7mzugFe0t+X@gofer.mess.org>
 <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
 <YmaMY/XKBmEfl8i6@gofer.mess.org> <YmbF071fSKUff6R2@rowland.harvard.edu>
 <YmbKiPna01aMQhJw@gofer.mess.org>
 <349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp>
 <Ymel5XtWC7rwpiXF@gofer.mess.org>
 <e17d6647-2c65-638b-1469-f546da7d0ba8@I-love.SAKURA.ne.jp>
 <21ffa07a-1bc1-cb1f-eef4-6c3a73953061@I-love.SAKURA.ne.jp>
 <Ym/UQpEV46W6frqH@kroah.com>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Ym/UQpEV46W6frqH@kroah.com>
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

On 2022/05/02 21:53, Greg KH wrote:
>> @@ -153,6 +153,24 @@ struct imon_context {
>>  	const struct imon_usb_dev_descr *dev_descr;
>>  					/* device description with key */
>>  					/* table for front panels */
>> +	/*
>> +	 * Fields for deferring free_imon_context().
>> +	 *
>> +	 * Since reference to "struct imon_context" is stored into
>> +	 * "struct file_operations"->private_data, we need to remember
>> +	 * how many file descriptors might access this "struct imon_context".
>> +	 */
>> +	refcount_t users;
> 
> Are you sure this is going to work properly?
> 
> How do you handle userspace passing around file descriptors to other
> processes?
> 
> You really should not ever have to count this.

Passing around file descriptors results in nothing but delay of freeing memory.
Is this so fatal problem?

static void free_imon_context(struct imon_context *ictx)
{
	struct device *dev = ictx->dev;

	usb_free_urb(ictx->tx_urb);
	usb_free_urb(ictx->rx_urb_intf0);
	usb_free_urb(ictx->rx_urb_intf1);
	kfree(ictx);

	dev_dbg(dev, "%s: iMON context freed\n", __func__);
}

If this is so fatal, can we call usb_free_urb() upon imon_disconnect() ?
