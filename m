Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D601132DAB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 18:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgAGRzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 12:55:38 -0500
Received: from mga05.intel.com ([192.55.52.43]:58331 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728266AbgAGRzi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 12:55:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 09:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; 
   d="scan'208";a="395464278"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga005.jf.intel.com with ESMTP; 07 Jan 2020 09:55:37 -0800
Subject: Re: [PATCH 3/3] video: aspeed: Update copyright information
To:     Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200107034324.38073-1-joel@jms.id.au>
 <20200107034324.38073-4-joel@jms.id.au>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2fdfd5c4-6c0f-313c-297d-fcf51b38adb2@linux.intel.com>
Date:   Tue, 7 Jan 2020 09:55:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107034324.38073-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/6/2020 7:43 PM, Joel Stanley wrote:
> Use the preferred form for GPL2+, and add IBM and Intel as the authors.
> The driver was initially upstreamed by Eddie from IBM, and has had major
> contributions from Jae at Intel.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/media/platform/aspeed-video.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index d70b893fd4cf..71e0dbdb37dc 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1,4 +1,6 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2020 IBM Corp.
> +// Copyright (c) 2019 Intel Corporation

Acked-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Thanks a lot for adding Intel's copyright.

-Jae

>   #include <linux/atomic.h>
>   #include <linux/bitfield.h>
> 
