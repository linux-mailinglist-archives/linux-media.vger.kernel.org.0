Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC2352509B
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 16:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355600AbiELOuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 10:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355595AbiELOuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 10:50:16 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BEF24FDB2;
        Thu, 12 May 2022 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652367014; x=1683903014;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AJOZLU0t6aDTGHtV1c8nOzI70dn0CA+lR89QhiodPug=;
  b=bT/nGOKTSwtN5XFwzmaGjBl3My7qkqcXN9tueg3eN9RIGGewNouwec0Q
   tVHO1MUwOWkxCTaCqiEwZjNwjaj4+gUriaQXqJjZ43W0fikG7ES9d4ou2
   1tb1xpq/gFeh95Gf1BdsIeM/0311PIFPUvjCW1biPkQxT1FrldrpNWKYN
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 May 2022 07:50:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 07:50:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 12 May 2022 07:50:13 -0700
Received: from [10.214.30.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 07:50:10 -0700
Message-ID: <9be4ea50-4dc0-50f0-0552-e4b9e4feafa2@quicinc.com>
Date:   Thu, 12 May 2022 20:20:07 +0530
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
 <4d644a01-5259-a063-b5b2-ea95d5e7dd88@quicinc.com>
 <93103bb7-8d67-a9ae-31c8-d53cb651a027@amd.com>
From:   Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <93103bb7-8d67-a9ae-31c8-d53cb651a027@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Christian for the comments!!

On 5/11/2022 12:33 PM, Christian König wrote:
> 
>> The single number approach, generated by atomic, wouldn't break the
>> uapi, but that number won't give any meaningful information especially
>> when this is targeted just for debug purpose. And just 'inode' is not
>> usable for already stated reasons.
> 
> Well, why do you want to use the ino in the first place? This is an
> anonymous inode not associated with any filesystem, so that number is
> meaningless anyway.
> 

It is just for ease of debugging. Nothing more. I can quickly traverse
the /sys/kernel/dmabuf/buffers/* and get complete information about the
dmabuf buffers while relating to which process this buffer is allocated
by, using this inode as the 'unique' reference.

https://cs.android.com/android/platform/superproject/+/master:system/memory/libmeminfo/libdmabufinfo/tools/dmabuf_dump.cpp

>> How about using the atomic number generated it self used as inode
>> number? I see tmpfs also maintains its own inode numbers for the same
>> overflow reasons[2].
> 
> Yeah, that could potentially work as well.
> 

Thanks. Will work on the next version of this patch.

> Regards,
> Christian.
