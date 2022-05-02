Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB09516E20
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 12:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384503AbiEBKbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 06:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384672AbiEBKa7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 06:30:59 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9B21E3EC
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 03:26:33 -0700 (PDT)
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 242AQWhJ056596;
        Mon, 2 May 2022 19:26:32 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Mon, 02 May 2022 19:26:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 242AQV3T056592
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 2 May 2022 19:26:32 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <e144d930-7b82-3310-1163-dae9f7914fa9@I-love.SAKURA.ne.jp>
Date:   Mon, 2 May 2022 19:26:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 (resend)] media: imon: reorganize serialization
Content-Language: en-US
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
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Ym+myt+bqap21r0O@gofer.mess.org>
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

On 2022/05/02 18:39, Sean Young wrote:
> So this part of the patch address the issue of driver_lock being
> unnecessary. This should be in its own patch, so I am going to merge:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp/

driver_lock is not unnecessary, unless combined with kfree_rcu() approach.

>> +	/*
>> +	 * We need to wait for RCU grace period in order to allow
>> +	 * display_open() to safely check ->disconnected and increment ->users.
>> +	 */
>> +	struct rcu_head rcu;
> 
> Is it possible to modify the users/disconnected fields while holding the
> lock mutex in imon_context? This would make it unnecessary to use rcu and
> simplify the code.

I don't think it is possible, and I don't think it simplifies the code.

Unless we revive global driver_lock lock (untested delta diff is shown below),
nothing prevents from calling kfree(ictx) before holding ictx->lock or
checking ->disconnected or incrementing ->users.

As a whole, I think kfree_rcu() is simpler while removing global lock.

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 9a4f24e294bc..469a2f869572 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -166,11 +166,6 @@ struct imon_context {
 	 * imon_disconnect() was already called.
 	 */
 	bool disconnected;
-	/*
-	 * We need to wait for RCU grace period in order to allow
-	 * display_open() to safely check ->disconnected and increment ->users.
-	 */
-	struct rcu_head rcu;
 };
 
 #define TOUCH_TIMEOUT	(HZ/30)
@@ -457,6 +452,9 @@ static struct usb_driver imon_driver = {
 	.id_table	= imon_usb_id_table,
 };
 
+/* to prevent races between open() and kfree() */
+static DEFINE_MUTEX(driver_lock);
+
 /* Module bookkeeping bits */
 MODULE_AUTHOR(MOD_AUTHOR);
 MODULE_DESCRIPTION(MOD_DESC);
@@ -516,6 +514,8 @@ static int display_open(struct inode *inode, struct file *file)
 	int subminor;
 	int retval = 0;
 
+	mutex_lock(&driver_lock);
+
 	subminor = iminor(inode);
 	interface = usb_find_interface(&imon_driver, subminor);
 	if (!interface) {
@@ -524,15 +524,13 @@ static int display_open(struct inode *inode, struct file *file)
 		goto exit;
 	}
 
-	rcu_read_lock();
 	ictx = usb_get_intfdata(interface);
 	if (!ictx || ictx->disconnected || !refcount_inc_not_zero(&ictx->users)) {
-		rcu_read_unlock();
 		pr_err("no context found for minor %d\n", subminor);
 		retval = -ENODEV;
 		goto exit;
 	}
-	rcu_read_unlock();
+	mutex_unlock(&driver_lock);
 
 	mutex_lock(&ictx->lock);
 
@@ -550,10 +548,15 @@ static int display_open(struct inode *inode, struct file *file)
 
 	mutex_unlock(&ictx->lock);
 
-	if (retval && refcount_dec_and_test(&ictx->users))
-		free_imon_context(ictx);
-
+	if (retval) {
+		mutex_unlock(&driver_lock);
+		if (refcount_dec_and_test(&ictx->users))
+			free_imon_context(ictx);
+		mutex_unlock(&driver_lock);
+	}
+	return retval;
 exit:
+	mutex_unlock(&driver_lock);
 	return retval;
 }
 
@@ -2497,6 +2500,8 @@ static void imon_disconnect(struct usb_interface *interface)
 	struct device *dev;
 	int ifnum;
 
+	mutex_lock(&driver_lock);
+
 	ictx = usb_get_intfdata(interface);
 	ictx->disconnected = true;
 	dev = ictx->dev;
@@ -2542,6 +2547,8 @@ static void imon_disconnect(struct usb_interface *interface)
 	if (refcount_dec_and_test(&ictx->users))
 		free_imon_context(ictx);
 
+	mutex_unlock(&driver_lock);
+
 	dev_dbg(dev, "%s: iMON device (intf%d) disconnected\n",
 		__func__, ifnum);
 }
