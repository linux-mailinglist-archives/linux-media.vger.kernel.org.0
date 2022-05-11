Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB969522C96
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 08:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242340AbiEKGtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 02:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240733AbiEKGte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 02:49:34 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2614D5A0AD;
        Tue, 10 May 2022 23:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652251773; x=1683787773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9xUB3PDaC1rihGyvYoy+dV8dCytkzaD9ByU0h7HXKAo=;
  b=oivXIAHSb4tVMfdbClsnpTN8TNa9PRN0bWHgA7VBDWtK7swd9iNot3Aj
   3mSmnaHe9J7lxtTZZzVbIOreemEjW+Fs9vWOihvz8yET92prg+GyczofQ
   k78SXVcngQfS6swprFA3dRzFEoQdfIZoXQjro9p5sNvl2bdaR/4xNLNP2
   k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 May 2022 23:49:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 23:49:32 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 23:49:32 -0700
Received: from [10.214.30.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 23:49:29 -0700
Message-ID: <4d644a01-5259-a063-b5b2-ea95d5e7dd88@quicinc.com>
Date:   Wed, 11 May 2022 12:19:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
        <hridya@google.com>, <daniel.vetter@ffwll.ch>,
        <tjmercier@google.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
 <4ac55be2-7d55-2c3b-0d5e-f61c02c62792@amd.com>
 <6dc59fa7-5885-9ed1-54c3-f2d112786312@quicinc.com>
 <2a0312d3-d576-b5be-c823-938b38096523@amd.com>
From:   Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <2a0312d3-d576-b5be-c823-938b38096523@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Christian for the inputs!!

On 5/10/2022 10:52 PM, Christian König wrote:
>>>>          if (!dmabuf || !dmabuf->file)
>>>>            return -EINVAL;
>>>> @@ -192,7 +193,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>>          /* create the directory for buffer stats */
>>>>        ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype,
>>>> NULL,
>>>> -                   "%lu", file_inode(dmabuf->file)->i_ino);
>>>> +                   "%lu-%lu", file_inode(dmabuf->file)->i_ino,
>>> Why not just use the unique value here? Or is the inode number necessary
>>> for something?
>> This will ease the debugging a lot. Given the dump, I can easily map
>> which dmabuf buffer to the process. On the crashutilty I just have to
>> search for this inode in the files output, just one example.
> 
> T.J. Mercier just confirmed my suspicion that this would break the UAPI.
> So that won't work.
> > This needs to be a single number, preferable documented as such.

Usually, What are the chances that a patch breaking UAPI will get
accepted. IMO, If there are few users, I had learnt that it is allowed
to merge. (Eg: In [1] where Andrew, -mm maintainer, mentioned that: "I
think we should just absorb any transitory damage which this causes
people." for the patch posted breaking the UAPI). Even the patch
c715def51591 ("dma-buf: Delete the DMA-BUF attachment sysfs statistics")
deleted the sysfs entries which also comes under the UAPI breakage but
still allowed to merge. On those lines, Is it fair to say If few users
are there, uapi breakage changes are allowed to merge on the assumption
that userspace code needs to be aligned with the new uapi changes? To my
knowledge, Android is the only user which is just getting the dmabuf
stats as part of the debug code.

The single number approach, generated by atomic, wouldn't break the
uapi, but that number won't give any meaningful information especially
when this is targeted just for debug purpose. And just 'inode' is not
usable for already stated reasons.

How about using the atomic number generated it self used as inode
number? I see tmpfs also maintains its own inode numbers for the same
overflow reasons[2]. The code will be like below(untested):

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a6fc96e..eeed770 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -408,11 +408,17 @@ static inline int is_dma_buf_file(struct file *file)
 static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
 {
        struct file *file;
+       static atomic64_t unique_id = ATOMIC64_INIT(0);
        struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);

        if (IS_ERR(inode))
                return ERR_CAST(inode);

+       /*
+        * Override the inode->i_no number with the unique
+        * dmabuf specific value
+        */
+       inode->i_no = atomic64_add_return(1, &unique_id);
        inode->i_size = dmabuf->size;
        inode_set_bytes(inode, dmabuf->size);


[1]
https://patchwork.kernel.org/project/linux-mm/patch/4f091776142f2ebf7b94018146de72318474e686.1647008754.git.quic_charante@quicinc.com/#24780139

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/?id=e809d5f0b5c912fe981dce738f3283b2010665f0

Thanks,
Charan
