Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 361C4173F45
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 19:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgB1SQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 13:16:11 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55908 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgB1SQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 13:16:11 -0500
Received: by mail-pj1-f66.google.com with SMTP id a18so1606311pjs.5;
        Fri, 28 Feb 2020 10:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BVlQGMV/dlLGU8gmf4FB65yDuYZrcSYwu3rmOUHQCKU=;
        b=tS9wg1JOmqNfXXI8nSE7wGqf4MWa4f0ygw9aMUvNcOlwmaudIrd1RdgRs5mDtGoulM
         QQnEOv23JAjX9lCxJH8QCkXYo1oUZAI3dR4RZ8ncR/03QZ7Zp0p3zhRvFI7cGX0I59dv
         b4b+j6B1u8Qbelz/2W31Aac7KVddqaR789yUSRTsWJZRzdO2J2a2VK3GX29MaeDUmbQr
         uM+08i0puvKfi6JO/Q9Dm6MQRgqf8zv+5TEb4CSrQhAUm/TgKfNeHEKfVF94pTtgc962
         mulOvvlQ2zW/PuchGstri/gdmsDIBB115xh2IITn/NR3nEEHkSKPxR5yXJdIEDOi9vUT
         DCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BVlQGMV/dlLGU8gmf4FB65yDuYZrcSYwu3rmOUHQCKU=;
        b=ahdEMOCsFvcHeo//EU7oPSWHH12HBm/j7QGRKD5JINHeq1NzCqUSrZFyjbegwmXv9f
         MP7JLFHh3pLRHrNVP6dF0uBD5RunHSshjLm+nybTO8Q6rKGK8PURykmVRrrV3TgFETGn
         50cw2uALRKtKKHdqTMmAP7bfq4UvRdP20thbP3+k/RrSBmekZAGaSj2q5qAPt168E3c6
         GSRNVZZgSv0Ym3fgjL3Gx59OtB2EkZjSUUzcXs3orS/z2Kc1yj2plSDM3wmd/sfnOX2h
         R/GSUgDyGTQO2s+Dv1ePSQNSpOCx5UQuZQvPKltwkLQUqWTT19qhFFch/vLviLD2AZQa
         c+3g==
X-Gm-Message-State: APjAAAV0Zow3xbhp4YU4DOzs7XdjWhhyspXethuxVQbbaUhY3/QcgeVZ
        smAupyoZGY73Z7TIfcP0+Jc=
X-Google-Smtp-Source: APXvYqwJV6NXOWi/9kpfdOV26a82C6ZHklO6PCZixEzsPy5UNqDSWCPvB0B6NoGHXvzOSey5lcIDFg==
X-Received: by 2002:a17:902:7797:: with SMTP id o23mr4889179pll.298.1582913769852;
        Fri, 28 Feb 2020 10:16:09 -0800 (PST)
Received: from [172.30.88.172] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id p17sm6148220pff.116.2020.02.28.10.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 10:16:08 -0800 (PST)
Subject: Re: [RESEND PATCH v3 02/17] media: v4l2-fwnode: Pass notifier to
 v4l2_async_register_fwnode_subdev()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
 <20200215194136.10131-3-slongerbeam@gmail.com>
 <20200225150721.GO5379@paasikivi.fi.intel.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <c9b232d6-07c9-d13d-18aa-3e1e640aadc2@gmail.com>
Date:   Fri, 28 Feb 2020 10:16:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225150721.GO5379@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 2/25/20 7:07 AM, Sakari Ailus wrote:
> Hi Steve,
>
> On Sat, Feb 15, 2020 at 11:41:21AM -0800, Steve Longerbeam wrote:
>> Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
>> have the caller provide one. This allows the caller to implement
>> notifier ops (bind, unbind).
>>
>> The caller is now responsible for first initializing its notifier with a
>> call to v4l2_async_notifier_init().
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> Instead of improving v4l2_async_register_fwnode_subdev(), could you convert
> the users (IMX driver in this case) to call the preferred APIs instead? As
> the lines below show, v4l2_async_register_fwnode_subdev() has only two
> users left --- the other one of which is the IMX driver. After converting
> these two, we could just remove this API.
>
> See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2.c and
> drivers/media/platform/omap3isp/isp.c for examples.

Shouldn't v4l2_async_notifier_add_fwnode_remote_subdev() check for the 
availability of the remote before adding it to the notifier's asd list, 
as in:

diff --git a/drivers/media/v4l2-core/v4l2-async.c 
b/drivers/media/v4l2-core/v4l2-async.c
index 8bde33c21ce4..b48ed68c6c6c 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -615,7 +615,7 @@ v4l2_async_notifier_add_fwnode_remote_subdev(struct 
v4l2_async_notifier *notif,
         int ret;

         remote = fwnode_graph_get_remote_port_parent(endpoint);
-       if (!remote)
+       if (!remote || !fwnode_device_is_available(remote))
                 return -ENOTCONN;

         asd->match_type = V4L2_ASYNC_MATCH_FWNODE;


Otherwise we are back to the problem that the notifier will never 
complete because the remote's driver is not probed.

Steve

>
>> ---
>> Changes in v3:
>> - added the missing calls to unregister/cleanup the new subdev notifiers.
>>    Reported by Rui Silva.
>> ---
>>   drivers/media/platform/video-mux.c         |  8 +++++++-
>>   drivers/media/v4l2-core/v4l2-fwnode.c      | 11 +----------
>>   drivers/staging/media/imx/imx6-mipi-csi2.c |  7 ++++++-
>>   drivers/staging/media/imx/imx7-media-csi.c |  7 ++++++-
>>   drivers/staging/media/imx/imx7-mipi-csis.c |  9 ++++++++-
>>   include/media/v4l2-fwnode.h                | 12 ++++++++----
>>   6 files changed, 36 insertions(+), 18 deletions(-)

