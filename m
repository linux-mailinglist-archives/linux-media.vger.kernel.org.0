Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D861F94A5
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 12:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbgFOKex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 06:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgFOKeu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 06:34:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646A6C061A0E
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 03:34:50 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o15so16839073ejm.12
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j5XMGazWwGhDJ5Y/GJxd/IOFuFz4Mx+W59DIWX6atAo=;
        b=yUN9zY+w+uEF7QUjafBk8bygiw68mGJQOUSQN1qm0nXky1JJl4ooC3C4lnT6eBEIsq
         9vNvV+fXRQ4KAj7m4pbN/bWKcyMsQyYVIB66iX8gUjSsz/bMfjOQGMgGjqEbb2YS7BZ4
         zvkfRM/bob0uBZbS+pt+joSiVGVtobC83KXezDgob1W9PfH/z3TZs8aQyeTrsaZMS1q0
         KZrUUdo03gANUOOLjwOBI6LD8pehI1rBeu0cqKr7ARKiJnFVE1U+upDauUgdEkgveKEf
         K/nztd00eMKZTlqV4gsN/PVZ5gzU3TBm7XTlfeZSlvtoWxeusfty1M/jxM244rzyyTZb
         9zEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j5XMGazWwGhDJ5Y/GJxd/IOFuFz4Mx+W59DIWX6atAo=;
        b=IRUdlIB3nBOlRyVyGQDIj0ZtGwx3wnZNtQV83GoiGHBQ7Ctpz02xUDnCpSyahA+aJR
         0DMCSryefUv3jpGWkEL2oJyus02pIljv6rUSye3b3EM46hqQ/0da4YI6m52XGCZOcXpH
         XhbPLfx5+rSLh11EX84ggnZ84iFmhJd38XkG9j4i+NXqAEeO9wL4LRCXXMpCEx2+qH5E
         LxGWXL8yR6b7HXe6Eoma3K4kDWS8oTyqWg2bAEF4vefcPVAo2M06Tk351VX4CJ2BSLCK
         BnYvPzcFsk7Jhy9UJx0CxVCmItIHpNLNtGVMkY1eaNNnaRQCjNu7rVuuc7z+RtAc+94u
         obAQ==
X-Gm-Message-State: AOAM531C6ubskjh3tDy5/jXCWBEVQaA8W0A/oQh01IpGOIOx3EY3aMN7
        q4LPKMBz7DiTpNcLnRSonrefPOIVpolBgA==
X-Google-Smtp-Source: ABdhPJx1280e9KwTAh7L8gxkMqPelJpVU6bgb9LhdKNWQEIq/YWdEIkALizUMB+r3MxYtN9/T11Ilg==
X-Received: by 2002:a17:906:fb19:: with SMTP id lz25mr25935106ejb.349.1592217288982;
        Mon, 15 Jun 2020 03:34:48 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.googlemail.com with ESMTPSA id rv14sm8837913ejb.110.2020.06.15.03.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 03:34:48 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] venus: Add debugfs interface to set firmware log
 level
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
 <20200613223919.7038-2-stanimir.varbanov@linaro.org>
 <20200614063511.GA2611869@kroah.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d86671f8-fb27-671b-cc0c-bc4ab1353943@linaro.org>
Date:   Mon, 15 Jun 2020 13:34:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614063511.GA2611869@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On 6/14/20 9:35 AM, Greg KH wrote:
> On Sun, Jun 14, 2020 at 01:39:17AM +0300, Stanimir Varbanov wrote:
>> This will be useful when debugging specific issues related to
>> firmware HFI interface.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> You didn't cc: any of us on the patchs, like you did on 0/3 :(

yes, sorry about that.

> 
> 
>> ---
>>  drivers/media/platform/qcom/venus/Makefile    |  2 +-
>>  drivers/media/platform/qcom/venus/core.c      |  3 +++
>>  drivers/media/platform/qcom/venus/core.h      |  3 +++
>>  drivers/media/platform/qcom/venus/dbgfs.c     | 21 +++++++++++++++++++
>>  drivers/media/platform/qcom/venus/dbgfs.h     | 12 +++++++++++
>>  drivers/media/platform/qcom/venus/hfi_venus.c |  7 ++++++-
>>  6 files changed, 46 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
>>  create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h
>>
>> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
>> index 64af0bc1edae..dfc636865709 100644
>> --- a/drivers/media/platform/qcom/venus/Makefile
>> +++ b/drivers/media/platform/qcom/venus/Makefile
>> @@ -3,7 +3,7 @@
>>  
>>  venus-core-objs += core.o helpers.o firmware.o \
>>  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
>> -		   hfi_parser.o pm_helpers.o
>> +		   hfi_parser.o pm_helpers.o dbgfs.o
>>  
>>  venus-dec-objs += vdec.o vdec_ctrls.o
>>  venus-enc-objs += venc.o venc_ctrls.o
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 203c6538044f..249141e27fea 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -290,6 +290,8 @@ static int venus_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_dev_unregister;
>>  
>> +	venus_dbgfs_init(core);
>> +
>>  	return 0;
>>  
>>  err_dev_unregister:
>> @@ -337,6 +339,7 @@ static int venus_remove(struct platform_device *pdev)
>>  	v4l2_device_unregister(&core->v4l2_dev);
>>  	mutex_destroy(&core->pm_lock);
>>  	mutex_destroy(&core->lock);
>> +	venus_dbgfs_deinit(core);
>>  
>>  	return ret;
>>  }
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index 7118612673c9..b48782f9aa95 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -12,6 +12,7 @@
>>  #include <media/v4l2-ctrls.h>
>>  #include <media/v4l2-device.h>
>>  
>> +#include "dbgfs.h"
>>  #include "hfi.h"
>>  
>>  #define VIDC_CLKS_NUM_MAX		4
>> @@ -136,6 +137,7 @@ struct venus_caps {
>>   * @priv:	a private filed for HFI operations
>>   * @ops:		the core HFI operations
>>   * @work:	a delayed work for handling system fatal error
>> + * @root:	debugfs root directory
>>   */
>>  struct venus_core {
>>  	void __iomem *base;
>> @@ -185,6 +187,7 @@ struct venus_core {
>>  	unsigned int codecs_count;
>>  	unsigned int core0_usage_count;
>>  	unsigned int core1_usage_count;
>> +	struct dentry *root;
>>  };
>>  
>>  struct vdec_controls {
>> diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
>> new file mode 100644
>> index 000000000000..782d54ac1b8f
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/venus/dbgfs.c
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 Linaro Ltd.
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +
>> +#include "core.h"
>> +
>> +extern int venus_fw_debug;
>> +
>> +void venus_dbgfs_init(struct venus_core *core)
>> +{
>> +	core->root = debugfs_create_dir("venus", NULL);
>> +	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
>> +}
>> +
>> +void venus_dbgfs_deinit(struct venus_core *core)
>> +{
>> +	debugfs_remove_recursive(core->root);
>> +}
>> diff --git a/drivers/media/platform/qcom/venus/dbgfs.h b/drivers/media/platform/qcom/venus/dbgfs.h
>> new file mode 100644
>> index 000000000000..b7b621a8472f
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/venus/dbgfs.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* Copyright (C) 2020 Linaro Ltd. */
>> +
>> +#ifndef __VENUS_DBGFS_H__
>> +#define __VENUS_DBGFS_H__
>> +
>> +struct venus_core;
>> +
>> +void venus_dbgfs_init(struct venus_core *core);
>> +void venus_dbgfs_deinit(struct venus_core *core);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index 0d8855014ab3..3a04b08ab85a 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -130,7 +130,7 @@ struct venus_hfi_device {
>>  };
>>  
>>  static bool venus_pkt_debug;
>> -static int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
>> +int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
>>  static bool venus_sys_idle_indicator;
>>  static bool venus_fw_low_power_mode = true;
>>  static int venus_hw_rsp_timeout = 1000;
>> @@ -1130,9 +1130,14 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
>>  			      u32 codec)
>>  {
>>  	struct venus_hfi_device *hdev = to_hfi_priv(inst->core);
>> +	struct device *dev = hdev->core->dev;
>>  	struct hfi_session_init_pkt pkt;
>>  	int ret;
>>  
>> +	ret = venus_sys_set_debug(hdev, venus_fw_debug);
>> +	if (ret)
>> +		dev_warn(dev, "setting fw debug msg ON failed (%d)\n", ret);
> 
> Why do you care about this to tell the user about it?

I already answered to this question in previous patchset version. I'll
drop the message and return an error if set_debug fail.

> 
> thanks,
> 
> greg k-h
> 

-- 
regards,
Stan
