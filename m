Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511FE2A7ED0
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgKEMmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:42:01 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51441 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgKEMmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:42:00 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aeaRkCxE3NanzaeaVkoLdx; Thu, 05 Nov 2020 13:41:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604580119; bh=jqHcqG5+Hw27GEBQppj1Jp5agjk2Ih5aC0SwUkpUF1E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NSyIJ6L7XzzFCOEc8igGKSa0PC379TwnMw78aVraMo+YL7ovv4ZCnfsFhVoLBJmA1
         FiPrTeWyoNl6wiuhlPUTJcUcVU7DerAnaUEp9tmX4YR3TBsBxmqRO85v5K6EGczr8S
         BeXv4z76ABi9U/8mqPzOR7VfLuaDvoEOdDap3DSj6I0fNimkMM0Py/O1Av1/87Fgye
         ZZrp3qntB9pMIdl2krg4nDAPTXxe8/ClUZra9Z4cz6TFx7ojs+NP5Hvzo74qzHJHrn
         yQqlcXck9HPmP/8Y85n8Rq0wKTuDYxI3VbmT/zjbOyKecr9I6GA4PnhRakECt9+YHe
         Jt9F0mn2SnW/A==
Subject: Re: [PATCH v2 099/106] v4l: uapi: ccs: Add controls for analogue gain
 constants
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-90-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bccb9a91-99bf-71d2-f3e5-caa429c90f64@xs4all.nl>
Date:   Thu, 5 Nov 2020 13:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007084557.25843-90-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBxQgoXx9uDPDE/H6YiJMY2qZZZ5avhHAX0ACCfr0lePY4MWIncIe2Uo/sw+psEQ2nm7ezvkmj3gxyqCikCluumY30xoBCLr4SZ7WYiQuwi24azcKcTI
 WtSjsJwjf3xjL5uoihO93o1DKLUbf7A6Gqi2KDCb60g1TKsvS1MeulqGZmCHhJ0JTR3+oWft5R8BHYqnNsmtkZdFpwWp3WBDrqReH4RahI8u6Gu2Y5+s9kCi
 ZSPViMifxwWaZYrrmVI0uQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/10/2020 10:45, Sakari Ailus wrote:
> Add a V4L2 controls for analogue gai constants required to control

gai -> gain

> analogue gain. The values are device specific and thus need to be obtained
> from the driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS              |  1 +
>  include/uapi/linux/ccs.h | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 include/uapi/linux/ccs.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b72f666b8b60..c173e503b0b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11569,6 +11569,7 @@ F:	drivers/media/i2c/ccs/
>  F:	drivers/media/i2c/ccs-pll.c
>  F:	drivers/media/i2c/ccs-pll.h
>  F:	include/uapi/linux/smiapp.h
> +F:	include/uapi/linux/ccs.h
>  
>  MIPS
>  M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> diff --git a/include/uapi/linux/ccs.h b/include/uapi/linux/ccs.h
> new file mode 100644
> index 000000000000..bcdce95955b0
> --- /dev/null
> +++ b/include/uapi/linux/ccs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only AND BSD-3-Clause */
> +/* Copyright (C) 2020 Intel Corporation */
> +
> +#ifndef __UAPI_CCS_H__
> +#define __UAPI_CCS_H__
> +
> +#include <linux/videodev2.h>
> +
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_M0		(V4L2_CID_USER_CCS_BASE + 1)
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_C0		(V4L2_CID_USER_CCS_BASE + 2)
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_M1		(V4L2_CID_USER_CCS_BASE + 3)
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_C1		(V4L2_CID_USER_CCS_BASE + 4)

Please document these controls. Ditto for the later patches that add more
of these controls.

This header is a good place to put the documentation.

Regards,

	Hans

> +
> +#endif
> 

