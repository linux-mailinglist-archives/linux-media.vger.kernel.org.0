Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7541C6BBD
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 10:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgEFIaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 04:30:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:61172 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728535AbgEFIaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 04:30:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588753818; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=jzdjT5/FfPOTtWWCKqxudmO6PH7po5sH4MzlpxAcptc=;
 b=mLUoJKiQwJ1UcAVWjvEUgSGmHCWfHrw96LI9qtZWfMUlCWPZziU9j+Q/tf47sRCrOPNm6Hl3
 jr4mFy0Cqji8j8gL/UeeCt7veyzSbVgWfzQZ6O3bREarmK66m2FTdWPKEHQYALYX4TYi4v6o
 I6TwDuIc3snOMqoxfm7oKn7pDzY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb27599.7f608a93aca8-smtp-out-n04;
 Wed, 06 May 2020 08:30:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58BC0C43636; Wed,  6 May 2020 08:30:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [183.83.139.238])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: charante)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 90C41C433BA;
        Wed,  6 May 2020 08:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 90C41C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=charante@codeaurora.org
From:   Charan Teja Kalla <charante@codeaurora.org>
Subject: Re: [PATCH] dma-buf: fix use-after-free in dmabuffs_dname
To:     Greg KH <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
Cc:     vinmenon@codeaurora.org, sumit.semwal@linaro.org,
        ghackmann@google.com, fengc@google.com, linux-media@vger.kernel.org
References: <1588060442-28638-1-git-send-email-charante@codeaurora.org>
 <20200505100806.GA4177627@kroah.com>
Message-ID: <8424b2ac-3ea6-6e5b-b99c-951a569f493d@codeaurora.org>
Date:   Wed, 6 May 2020 14:00:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505100806.GA4177627@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Greg for the reply.

On 5/5/2020 3:38 PM, Greg KH wrote:
> On Tue, Apr 28, 2020 at 01:24:02PM +0530, Charan Teja Reddy wrote:
>> The following race occurs while accessing the dmabuf object exported as
>> file:
>> P1				P2
>> dma_buf_release()          dmabuffs_dname()
>> 			   [say lsof reading /proc/<P1 pid>/fd/<num>]
>>
>> 			   read dmabuf stored in dentry->fsdata
>> Free the dmabuf object
>> 			   Start accessing the dmabuf structure
>>
>> In the above description, the dmabuf object freed in P1 is being
>> accessed from P2 which is resulting into the use-after-free. Below is
>> the dump stack reported.
>>
>> Call Trace:
>>   kasan_report+0x12/0x20
>>   __asan_report_load8_noabort+0x14/0x20
>>   dmabuffs_dname+0x4f4/0x560
>>   tomoyo_realpath_from_path+0x165/0x660
>>   tomoyo_get_realpath
>>   tomoyo_check_open_permission+0x2a3/0x3e0
>>   tomoyo_file_open
>>   tomoyo_file_open+0xa9/0xd0
>>   security_file_open+0x71/0x300
>>   do_dentry_open+0x37a/0x1380
>>   vfs_open+0xa0/0xd0
>>   path_openat+0x12ee/0x3490
>>   do_filp_open+0x192/0x260
>>   do_sys_openat2+0x5eb/0x7e0
>>   do_sys_open+0xf2/0x180
>>
>> Fixes: bb2bb90 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> Nit, please read the documentation for how to do a Fixes: line properly,
> you need more digits:
> 	Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")


Will update the patch


>> Reported-by:syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com
>> Signed-off-by: Charan Teja Reddy<charante@codeaurora.org>
> Also, any reason you didn't include the other mailing lists that
> get_maintainer.pl said to?


Really sorry for not sending to complete list. Added now.


> And finally, no cc: stable in the s-o-b area for an issue that needs to
> be backported to older kernels?


Will update the patch.


>
>> ---
>>   drivers/dma-buf/dma-buf.c | 25 +++++++++++++++++++++++--
>>   include/linux/dma-buf.h   |  1 +
>>   2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 570c923..069d8f78 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -25,6 +25,7 @@
>>   #include <linux/mm.h>
>>   #include <linux/mount.h>
>>   #include <linux/pseudo_fs.h>
>> +#include <linux/dcache.h>
>>   
>>   #include <uapi/linux/dma-buf.h>
>>   #include <uapi/linux/magic.h>
>> @@ -38,18 +39,34 @@ struct dma_buf_list {
>>   
>>   static struct dma_buf_list db_list;
>>   
>> +static void dmabuf_dent_put(struct dma_buf *dmabuf)
>> +{
>> +	if (atomic_dec_and_test(&dmabuf->dent_count)) {
>> +		kfree(dmabuf->name);
>> +		kfree(dmabuf);
>> +	}
> Why not just use a kref instead of an open-coded atomic value?


Kref approach looks cleaner. will update the patch accordingly.


>> +}
>> +
>>   static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
>>   {
>>   	struct dma_buf *dmabuf;
>>   	char name[DMA_BUF_NAME_LEN];
>>   	size_t ret = 0;
>>   
>> +	spin_lock(&dentry->d_lock);
>>   	dmabuf = dentry->d_fsdata;
>> +	if (!dmabuf || !atomic_add_unless(&dmabuf->dent_count, 1, 0)) {
>> +		spin_unlock(&dentry->d_lock);
>> +		goto out;
> How can dmabuf not be valid here?
>
> And isn't there already a usecount for the buffer?


dmabuf exported as file simply relies on that file's refcount, thus 
fput() releases the dmabuf.

We are storing the dmabuf in the dentry->d_fsdata but there is no 
binding between the dentry and the dmabuf. So, flow will be like

1) P1 calls fput(dmabuf_fd)

2) P2 trying to access the file information of P1.
     Eg: lsof command trying to list out the dmabuf_fd information using 
/proc/<P1 pid>/fd/dmabuf_fd

3) P1 calls the file->f_op->release(dmabuf_fd_file)(ends up in calling 
dma_buf_release()),   thus frees up the dmabuf buffer.

4) P2 access the dmabuf stored in the dentry->d_fsdata which was freed 
in step 3.

So we need to have some refcount mechanism to avoid the use-after-free 
in step 4.

>> +	}
>> +	spin_unlock(&dentry->d_lock);
>>   	dma_resv_lock(dmabuf->resv, NULL);
>>   	if (dmabuf->name)
>>   		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
>>   	dma_resv_unlock(dmabuf->resv);
>> +	dmabuf_dent_put(dmabuf);
>>   
>> +out:
>>   	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
>>   			     dentry->d_name.name, ret > 0 ? name : "");
>>   }
>> @@ -80,12 +97,16 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
>>   static int dma_buf_release(struct inode *inode, struct file *file)
>>   {
>>   	struct dma_buf *dmabuf;
>> +	struct dentry *dentry = file->f_path.dentry;
>>   
>>   	if (!is_dma_buf_file(file))
>>   		return -EINVAL;
>>   
>>   	dmabuf = file->private_data;
>>   
>> +	spin_lock(&dentry->d_lock);
>> +	dentry->d_fsdata = NULL;
>> +	spin_unlock(&dentry->d_lock);
>>   	BUG_ON(dmabuf->vmapping_counter);
>>   
>>   	/*
>> @@ -108,8 +129,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
>>   		dma_resv_fini(dmabuf->resv);
>>   
>>   	module_put(dmabuf->owner);
>> -	kfree(dmabuf->name);
>> -	kfree(dmabuf);
>> +	dmabuf_dent_put(dmabuf);
>>   	return 0;
>>   }
>>   
>> @@ -548,6 +568,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>   	init_waitqueue_head(&dmabuf->poll);
>>   	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
>>   	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
>> +	atomic_set(&dmabuf->dent_count, 1);
>>   
>>   	if (!resv) {
>>   		resv = (struct dma_resv *)&dmabuf[1];
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index 82e0a4a..a259042 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -315,6 +315,7 @@ struct dma_buf {
>>   	struct list_head list_node;
>>   	void *priv;
>>   	struct dma_resv *resv;
>> +	atomic_t dent_count;
> Isn't there other usage counters here that can support this?  Adding
> another one feels wrong as now we have multiple use counts, right?


I couldn't see any refcount exist and couldn't find the need either, 
earlier.

But the change bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls") 
requires to have one.


> thanks,
>
> greg k-h
