Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F5B41BBF9
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 02:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243586AbhI2A6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 20:58:54 -0400
Received: from mga01.intel.com ([192.55.52.88]:56937 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243584AbhI2A6x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 20:58:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="247353170"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="247353170"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 17:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="519516844"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2021 17:57:11 -0700
Subject: Re: [PATCH 0/7] media: ipu3 i2c: Fix v4l2-compliance issues
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
References: <20210928211033.2415162-1-ribalda@chromium.org>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <cca17413-e3e4-643a-eca1-694375703fe2@linux.intel.com>
Date:   Wed, 29 Sep 2021 08:53:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210928211033.2415162-1-ribalda@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ricardo, thanks for your patch.

On 9/29/21 5:10 AM, Ricardo Ribalda wrote:
> Fix some issues found with v4l2-compliance. Tested in Soraka which also
> has some subdevices that had some issues with v4l2-compliance.
> 
> Ricardo Ribalda (7):
...

>   media: ipu3-cio2: Set valid initial format
>   media: ipu3-cio2: imgu_fmt: Handle properly try
>   media: ipu3-cio2: VIDIOC_QUERYCAP: Fix bus_info

These 3 should be staging ImgU category, not cio2 :).

>   media: dw9714: Add implementation for events
>   media: ov13858: Add implementation for events
>   media: ov5670: Add implementation for events
> 
>  drivers/media/i2c/dw9714.c                    | 14 ++++++++++++--
>  drivers/media/i2c/ov13858.c                   | 11 ++++++++++-
>  drivers/media/i2c/ov5670.c                    | 11 ++++++++++-
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  8 ++++++--
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  9 +++++----
>  5 files changed, 43 insertions(+), 10 deletions(-)
> 

-- 
Best regards,
Bingbu Cao
