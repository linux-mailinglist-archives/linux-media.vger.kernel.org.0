Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487FC203345
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 11:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgFVJ0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 05:26:50 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:25518 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726557AbgFVJ0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 05:26:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592818008; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ITYrsfJ9XT9p4LwafDewTjOHi2C3c1vMwb7EtEX/UxY=; b=t6qFIbhfJkb7OAEEme0Gkb2UBdOU/oXlVfwg2Zwh/56IP+IHvTbiQ8+swOKuQ2+NLadOohbb
 b7PEVqjU7rNRZdnvZrbY965r+0HZQzLRjfdorsP6q6DlHT+1A8aH7VHEaOwCpcw/aRsGjER6
 WuEP0g0airlW+V2jtM59Qn8nlN0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ef07945bfb34e631c5a9040 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 09:26:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 35FD9C4339C; Mon, 22 Jun 2020 09:26:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [183.83.143.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: charante)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2471AC433CA;
        Mon, 22 Jun 2020 09:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2471AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=charante@codeaurora.org
Subject: Re: [PATCH v2] dmabuf: use spinlock to access dmabuf->name
To:     "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "David.Laight@ACULAB.COM" <David.Laight@ACULAB.COM>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Cc:     Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <a83e7f0d-4e54-9848-4b58-e1acdbe06735@codeaurora.org>
 <14063C7AD467DE4B82DEDB5C278E866301154BAE9E@FMSMSX108.amr.corp.intel.com>
From:   Charan Teja Kalla <charante@codeaurora.org>
Message-ID: <97f2313e-a690-b5ab-567d-6887384debf5@codeaurora.org>
Date:   Mon, 22 Jun 2020 14:56:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E866301154BAE9E@FMSMSX108.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mike,

On 6/19/2020 7:11 PM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: charante=codeaurora.org@mg.codeaurora.org
>> <charante=codeaurora.org@mg.codeaurora.org> On Behalf Of Charan Teja
>> Kalla
>> Sent: Friday, June 19, 2020 7:57 AM
>> To: Sumit Semwal <sumit.semwal@linaro.org>; Ruhl, Michael J
>> <michael.j.ruhl@intel.com>; David.Laight@ACULAB.COM; open list:DMA
>> BUFFER SHARING FRAMEWORK <linux-media@vger.kernel.org>; DRI mailing
>> list <dri-devel@lists.freedesktop.org>
>> Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>; LKML <linux-
>> kernel@vger.kernel.org>
>> Subject: [PATCH v2] dmabuf: use spinlock to access dmabuf->name
>>
>> There exists a sleep-while-atomic bug while accessing the dmabuf->name
>> under mutex in the dmabuffs_dname(). This is caused from the SELinux
>> permissions checks on a process where it tries to validate the inherited
>> files from fork() by traversing them through iterate_fd() (which
>> traverse files under spin_lock) and call
>> match_file(security/selinux/hooks.c) where the permission checks happen.
>> This audit information is logged using dump_common_audit_data() where it
>> calls d_path() to get the file path name. If the file check happen on
>> the dmabuf's fd, then it ends up in ->dmabuffs_dname() and use mutex to
>> access dmabuf->name. The flow will be like below:
>> flush_unauthorized_files()
>>  iterate_fd()
>>    spin_lock() --> Start of the atomic section.
>>      match_file()
>>        file_has_perm()
>>          avc_has_perm()
>>            avc_audit()
>>              slow_avc_audit()
>> 	        common_lsm_audit()
>> 		  dump_common_audit_data()
>> 		    audit_log_d_path()
>> 		      d_path()
>>                        dmabuffs_dname()
>>                          mutex_lock()--> Sleep while atomic.
>>
>> Call trace captured (on 4.19 kernels) is below:
>> ___might_sleep+0x204/0x208
>> __might_sleep+0x50/0x88
>> __mutex_lock_common+0x5c/0x1068
>> __mutex_lock_common+0x5c/0x1068
>> mutex_lock_nested+0x40/0x50
>> dmabuffs_dname+0xa0/0x170
>> d_path+0x84/0x290
>> audit_log_d_path+0x74/0x130
>> common_lsm_audit+0x334/0x6e8
>> slow_avc_audit+0xb8/0xf8
>> avc_has_perm+0x154/0x218
>> file_has_perm+0x70/0x180
>> match_file+0x60/0x78
>> iterate_fd+0x128/0x168
>> selinux_bprm_committing_creds+0x178/0x248
>> security_bprm_committing_creds+0x30/0x48
>> install_exec_creds+0x1c/0x68
>> load_elf_binary+0x3a4/0x14e0
>> search_binary_handler+0xb0/0x1e0
>>
>> So, use spinlock to access dmabuf->name to avoid sleep-while-atomic.
>>
>> Cc: <stable@vger.kernel.org> [5.3+]
>> Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
>> ---
>>
>> Changes in V2: Addressed review comments from Ruhl, Michael J
>>
>> Changes in V1: https://lore.kernel.org/patchwork/patch/1255055/
>>
>> drivers/dma-buf/dma-buf.c | 11 +++++++----
>> include/linux/dma-buf.h   |  1 +
>> 2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 01ce125..d81d298 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -45,10 +45,10 @@ static char *dmabuffs_dname(struct dentry *dentry,
>> char *buffer, int buflen)
>> 	size_t ret = 0;
>>
>> 	dmabuf = dentry->d_fsdata;
>> -	dma_resv_lock(dmabuf->resv, NULL);
>> +	spin_lock(&dmabuf->name_lock);
>> 	if (dmabuf->name)
>> 		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
>> -	dma_resv_unlock(dmabuf->resv);
>> +	spin_unlock(&dmabuf->name_lock);
>>
>> 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
>> 			     dentry->d_name.name, ret > 0 ? name : "");
>> @@ -341,8 +341,10 @@ static long dma_buf_set_name(struct dma_buf
>> *dmabuf, const char __user *buf)
>> 		kfree(name);
>> 		goto out_unlock;
>> 	}
>> +	spin_lock(&dmabuf->name_lock);
>> 	kfree(dmabuf->name);
>> 	dmabuf->name = name;
>> +	spin_unlock(&dmabuf->name_lock);
> 
> While this code path is ok, I would have separated the protection of the
> attachment list and the name manipulation.
> 
> dma_resv_lock(resv)
> if (!list_empty(attachment)
> 	ret = -EBUSY
> dma_resv_unlock(resv)
> 
> if (ret) {
> 	kfree(name)
> 	return ret;
> }

Is it that the name should be visible before importer attaches to the
dmabuf,(using dma_buf_attach()), thus _buf_set_name() is under the
_resv_lock() as well?

> 
> spinlock(nam_lock)
> ...
> 
> Nesting locks  that don't need to be nested always makes me nervous
> for future use that misses the lock/unlock pattern.
> 
> However, this looks reasonable.
> 
> With this current code, or if you update to the above pattern:
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Thanks for the ACK.
> 
> Mike
> 
> 
>> out_unlock:
>> 	dma_resv_unlock(dmabuf->resv);
>> @@ -405,10 +407,10 @@ static void dma_buf_show_fdinfo(struct seq_file
>> *m, struct file *file)
>> 	/* Don't count the temporary reference taken inside procfs seq_show
>> */
>> 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
>> 	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
>> -	dma_resv_lock(dmabuf->resv, NULL);
>> +	spin_lock(&dmabuf->name_lock);
>> 	if (dmabuf->name)
>> 		seq_printf(m, "name:\t%s\n", dmabuf->name);
>> -	dma_resv_unlock(dmabuf->resv);
>> +	spin_unlock(&dmabuf->name_lock);
>> }
>>
>> static const struct file_operations dma_buf_fops = {
>> @@ -546,6 +548,7 @@ struct dma_buf *dma_buf_export(const struct
>> dma_buf_export_info *exp_info)
>> 	dmabuf->size = exp_info->size;
>> 	dmabuf->exp_name = exp_info->exp_name;
>> 	dmabuf->owner = exp_info->owner;
>> +	spin_lock_init(&dmabuf->name_lock);
>> 	init_waitqueue_head(&dmabuf->poll);
>> 	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
>> 	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index ab0c156..93108fd 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -311,6 +311,7 @@ struct dma_buf {
>> 	void *vmap_ptr;
>> 	const char *exp_name;
>> 	const char *name;
>> +	spinlock_t name_lock;
>> 	struct module *owner;
>> 	struct list_head list_node;
>> 	void *priv;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum, a Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
Forum, a Linux Foundation Collaborative Project
