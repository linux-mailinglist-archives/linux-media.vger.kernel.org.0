Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80253F4A11
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 13:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236269AbhHWLvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 07:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235337AbhHWLvT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 07:51:19 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CE9C061575;
        Mon, 23 Aug 2021 04:50:36 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id e15so9983832plh.8;
        Mon, 23 Aug 2021 04:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=O5DM1sJkMAZ9pupJ/zl5vudKhULLO2p/SdJWZo+B+eo=;
        b=PJvNXb8mSnm9cemZbK+4j70aWxx4Lee2OayaWVuYrLvVhGvzVf0+35TDcdzhEkKyiC
         thE3GiTXw8a8tWqL5XAZbWFES6Q7ZfET23jlCT7QrOXtoxXRQJdBaH9Kdr0u4VG9KqV8
         1z8yyYn+rPrIKImrryJUbeZNy6e9fUeyKcUwisAoAxxBLhD5zdqURfMVxKyyDXqvGBUq
         j8RVMJoTNRhuzYEWXpb/qVn8/TUhYYUzn+tewG6e+f0/69GTNzkCWEhm9Kd6p+43TXfL
         uzAtO5RxSlYKjiHKikc9VzfzZk6mddt3QeT+lkAsoJ/lYwvHBD2bF0HsHVP74P5BkFsW
         lRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=O5DM1sJkMAZ9pupJ/zl5vudKhULLO2p/SdJWZo+B+eo=;
        b=oboj3uN+u8qAAxbk+8EqY6IFtE4SHLzQxnl2okJ2wuoWDNwoODZa94O9DDCSWVD5J5
         JVna4xo+dnD29jWEPPzx/Aqu4Z6rhaQLeFJMtJNpA1bpz+zIToA6Fp7F+jwKdFUxURGX
         bKS2vIpwzqqEPMw+T3Z8Ea/+0NpcvDERx1KvIbb8fTdTLdELOypjnTxmkX3wWF8pwzL7
         aUk7NMM0sdOkeU23xeoWn7WW4Ufsuuxw8WfEsFATjAuR8IPNeUjw9YhE7U0OegG/C8jQ
         Z0Fq9h0vkKT+iwcCVNC6peWA05CkKdDgPDBQIST1330mbFfXVZe9eg90D8sHYT5L5VmN
         u78g==
X-Gm-Message-State: AOAM532kz+4RTqlNgkubvhBJbABzFFkO+q/OrvafoNLXuzQgp6IQSOGb
        cTp+8B8MUZITw5SMVgvNN+ExSwDvXog=
X-Google-Smtp-Source: ABdhPJyoKd8/N5yLCg/VKSt+JpWXIGEWPIPoRYiqsQg1ld8auxvdPPOsCmXasF0S+D02ad5sc+tvHQ==
X-Received: by 2002:a17:902:6b47:b0:12f:6c5f:ab4f with SMTP id g7-20020a1709026b4700b0012f6c5fab4fmr20997699plt.17.1629719436043;
        Mon, 23 Aug 2021 04:50:36 -0700 (PDT)
Received: from [10.136.0.70] ([45.145.248.194])
        by smtp.gmail.com with ESMTPSA id n30sm15965384pfv.87.2021.08.23.04.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 04:50:35 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] media: platform: qcom: venus: possible ABBA deadlock in
 venus_event_notify() and venus_helper_vb2_buf_queue()
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <b5c2a28b-9c67-05d1-0bed-eac8af508d07@gmail.com>
Date:   Mon, 23 Aug 2021 19:50:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

My static analysis tool reports a possible ABBA deadlock in the venus 
driver in Linux 5.10:

venus_event_notify()
   mutex_lock(&core->lock); --> line 37 (Lock A)
   vdec_event_notify() --> via a function pointer 
"inst->ops->event_notify(...)"
   vdec_event_change()
     mutex_lock(&inst->lock); --> line 1301 (Lock B)

venus_helper_vb2_buf_queue()
   mutex_lock(&inst->lock); --> line 1346 (Lock B)
   session_process_buf()
     venus_pm_load_scale()
       load_scale_v4() via a function pointer 
"core->pm_ops->load_scale(...)"
         mutex_lock(&core->lock); --> line 966 (Lock A)

Besides, if "core->pm_ops->load_scale(...)" is load_scale_v1():
load_scale_v1()
   load_per_type()
     mutex_lock(&core->lock); --> line 150 (Lock A)

When venus_event_notify() and venus_helper_vb2_buf_queue() are 
concurrently executed, the deadlock can occur.

I am not quite sure whether this possible deadlock is real and how to 
fix it if it is real.
Any feedback would be appreciated, thanks

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>


Best wishes,
Jia-Ju Bai
