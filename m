Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48230516E3B
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 12:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384541AbiEBKo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 06:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384787AbiEBKoL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 06:44:11 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0636BF6E
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 03:40:39 -0700 (PDT)
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 242Aec00064619;
        Mon, 2 May 2022 19:40:38 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Mon, 02 May 2022 19:40:38 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 242AebDD064616
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 2 May 2022 19:40:37 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c0a519b5-22d9-ee55-c28e-777c0856198c@I-love.SAKURA.ne.jp>
Date:   Mon, 2 May 2022 19:40:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 (resend)] media: imon: reorganize serialization
Content-Language: en-US
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Sean Young <sean@mess.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
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
 <Ym+myt+bqap21r0O@gofer.mess.org>
 <e144d930-7b82-3310-1163-dae9f7914fa9@I-love.SAKURA.ne.jp>
In-Reply-To: <e144d930-7b82-3310-1163-dae9f7914fa9@I-love.SAKURA.ne.jp>
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

On 2022/05/02 19:26, Tetsuo Handa wrote:
> @@ -550,10 +548,15 @@ static int display_open(struct inode *inode, struct file *file)
>  
>  	mutex_unlock(&ictx->lock);
>  
> -	if (retval && refcount_dec_and_test(&ictx->users))
> -		free_imon_context(ictx);
> -
> +	if (retval) {
> +		mutex_unlock(&driver_lock);

Oops. This is mutex_lock(&driver_lock);.

> +		if (refcount_dec_and_test(&ictx->users))
> +			free_imon_context(ictx);
> +		mutex_unlock(&driver_lock);
> +	}
> +	return retval;
>  exit:
> +	mutex_unlock(&driver_lock);
>  	return retval;
>  }
>  

But if you merely want to avoid adding "struct rcu_head rcu;" to "struct imon_context",
we can use synchronize_rcu(); kfree(ictx); sequence (at the cost of waiting for RCU
grace period inside free_imon_context()).

