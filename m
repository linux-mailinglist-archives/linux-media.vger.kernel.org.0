Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB4A521458
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 13:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241311AbiEJL7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 07:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241299AbiEJL7L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 07:59:11 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C610928BDFB;
        Tue, 10 May 2022 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652183714; x=1683719714;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Dm3X0ozVMRc4qPMKkmV0VxYC7We4StxOkXMsdvVYhuI=;
  b=blyBUH/3gcyUJffTCUkvF3RGTRyMIuMScYpdEHK9vEY/ZmU073TQ9hRq
   Of1rF2T1YM5e8vZd4+Zx952Lfa+F28CQ6MMG+gOPv5vXFvODjTXYgXC8M
   sFDowY2CR9b+936AMrqYfFRcY15b8OTCDHadSVtJS+QPaEDeTOfbjSwF2
   g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 10 May 2022 04:55:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 04:55:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 04:55:08 -0700
Received: from [10.216.42.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 04:55:04 -0700
Message-ID: <c95bd5fb-0880-c98b-5f5c-b2b0bdd7b042@quicinc.com>
Date:   Tue, 10 May 2022 17:25:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <daniel.vetter@ffwll.ch>, <tjmercier@google.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <1652178212-22383-1-git-send-email-quic_charante@quicinc.com>
 <YnpF1XP1tH83uBlM@kroah.com>
From:   Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <YnpF1XP1tH83uBlM@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Thanks Greg for the inputs!!

On 5/10/2022 4:30 PM, Greg KH wrote:
>> The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
>> alloc_anon_inode()) to get an inode number and uses the same as a
>> directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
>> used to collect the dmabuf stats and it is created through
>> dma_buf_stats_setup(). At current, failure to create this directory
>> entry can make the dma_buf_export() to fail.
>>
>> Now, as the get_next_ino() can definitely give a repetitive inode no
>> causing the directory entry creation to fail with -EEXIST. This is a
>> problem on the systems where dmabuf stats functionality is enabled on
>> the production builds can make the dma_buf_export(), though the dmabuf
>> memory is allocated successfully, to fail just because it couldn't
>> create stats entry.
> Then maybe we should not fail the creation path of the kobject fails to
> be created?  It's just for debugging, it should be fine if the creation
> of it isn't there.

Not creating the debug node under some special cases can make this
interface not reliable if one wants to know info about the created
dmabuf buffers. Please help in correcting me If my perspective is wrong
here.

IIUC, except this -EEXIST condition, under the other conditions (-EINVAL
and -ENOMEM) failure is fine. Since, we are going to fix the -EEXIST
error in this patch, my opinion is failure in the kobject creation path
is acceptable for the reasons: a) The user is expected to pass the valid
dmabuf to create the stats node, b) The user can undefine the
CONFIG_DMABUF_SYSFS_STATS if he don't want this stats.

> 
>> This issue we are able to see on the snapdragon system within 13 days
>> where there already exists a directory with inode no "122602" so
>> dma_buf_stats_setup() failed with -EEXIST as it is trying to create
>> the same directory entry.
>>
>> To make the directory entry as unique, append the inode creation time to
>> the inode. With this change the stats directory entries will be in the
>> format of: /sys/kernel/dmabuf/buffers/<inode no>-<inode creation time in
>> secs>.
> As you are changing the format here, shouldn't the Documentation/ABI/
> entry for this also be changed?
> 
> And what's to keep the seconds field from also being the same?

get_next_ino() just increases the inode number monotonically and return
to the caller and it is 'unsigned int' data type. Thus 2 successive
calls always generate the different inode_number but can be the same
secs value.  With inode-secs format, this will be still be a unique
string.  Say it will be like ino1-sec1 and ino2-sec1.

Now after the inode number overflow and wraps, we may get the ino1 again
from the get_next_ino() but then secs will be different i.e. say it may
be like ino1-secn and ion2-secn. So, it always be a unique string.

IOW, with secs field added, to get the same inode-secs string, the uint
should overflow in the same second which is impossible.

Thanks for pointing out the changes to be done in ABI document. Will do
it in the next spin.
