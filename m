Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1064A1EA7FA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 18:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgFAQvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 12:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgFAQvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 12:51:38 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3903C05BD43
        for <linux-media@vger.kernel.org>; Mon,  1 Jun 2020 09:51:37 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id e8so1113687ooi.11
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T7w7j4yQwplmXQxxnc/dAqR0xCmeWec60t3EIHBSr/c=;
        b=JaPe6H9A/OWTCRY9H5QuCuNhjT4T6J4+XtVy7aU5HUXhaR5LkOr1czyxIYmF6D7lDf
         EWOcnaDeVZYPoPmxuv/1kjqIseUe0OS8nNvkBEY9+6qinMQarEQc8zWsUx9shc6yPDbg
         omwwhEDhV5ilKLyWvYOMMKTScvHprq7LR3lLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T7w7j4yQwplmXQxxnc/dAqR0xCmeWec60t3EIHBSr/c=;
        b=gB2rFK0TaY6FVuhf5aBnAHFPi09M6QG1LmxbaNiKem6/ZzZs2Cy+vC98xGYho4I0Uh
         MAs43xpBP+69O/qpEZTxRaTHgYQMGR8KY/NJlu19dH3FUSMIGOegEH+c0NfjmbRKNDjM
         wlEIIX0B1XK26f2U3/NGw3+2YUIa/SPQ10rZ0oA71HnWOpvzvj5u2s9YjfwVOU5M8/Ny
         JgO1ZSJ0chuRaHpqbXO12Ou0rrMRJG+806xmmVW6tcqGFvDLeV7sm1BStgsPXg/9mSPe
         JE+V/UQ6A5FaH1QWy2cHHAB8eyEMDe3Wztlz0uO0CIkrwEJSvq1O000nUP7TqRuDV5br
         Y7LQ==
X-Gm-Message-State: AOAM531V21XtEjtIGmZDNALgiVOEnb3E2R7DmNdxDWhGjMhSuFqHznxb
        TBB3+qjuKVQSrLtmsnnC6N6yQA==
X-Google-Smtp-Source: ABdhPJyeVfnGsjB7FHe6WfKM3RmmWvuRQH99VnMLxtmhXrtfmi5Cw9fJvC5C7Qov1rzbjhrALU9CgA==
X-Received: by 2002:a4a:2c88:: with SMTP id o130mr17528761ooo.81.1591030297092;
        Mon, 01 Jun 2020 09:51:37 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c184sm5388325oif.3.2020.06.01.09.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 09:51:36 -0700 (PDT)
Subject: Re: [RFC, WIP, v6 05/10] media: vidtv: add wrappers for memcpy and
 memset
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
 <20200520070334.1778751-6-dwlsalmeida@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2b00fc7a-8818-b0be-7e42-a2df9787876b@linuxfoundation.org>
Date:   Mon, 1 Jun 2020 10:51:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-6-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> A lot of code in this driver is for serializing structures. This is
> error prone.
> 
> Therefore, prevent buffer overflows by wrapping memcpy and memset,
> comparing the requested length against the buffer size.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>   .../media/test-drivers/vidtv/vidtv_common.c   | 86 +++++++++++++++++++
>   .../media/test-drivers/vidtv/vidtv_common.h   | 27 ++++++
>   2 files changed, 113 insertions(+)
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
> 

I don't see these added to Makefile. Building the driver with the patch
has no effect.

In any case I don't see any value in adding the wrappers here. They
really do nothing other than doing range checks. It adda a layer of
indirection that is unnecessary.

> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
> new file mode 100644
> index 0000000000000..6810212087c17
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
> +
> +#include <linux/printk.h>
> +#include <linux/ratelimit.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "vidtv_common.h"
> +
> +/**
> + * vidtv_memcpy() - wrapper routine to be used by MPEG-TS
> + *	generator, in order to avoid going past the
> + *	output buffer.
> + * @to:	Starting element to where a MPEG-TS packet will
> + *	be copied.
> + * @to_offset:	Starting position of the @to buffer to be filled.
> + * @to_size:	Size of the @to buffer.
> + * @from:	Starting element of the buffer to be copied.
> + * @len:	Number of elements to be copy from @from buffer
> + *	into @to+ @to_offset buffer.
> + *
> + * Note:
> + *	Real digital TV demod drivers should not have memcpy
> + *	wrappers. We use it here because emulating MPEG-TS
> + *	generation at kernelspace requires some extra care.
> + *
> + * Return:
> + *	Returns the number of bytes written
> + */
> +u32 vidtv_memcpy(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 const void *from,
> +		 size_t len)
> +{
> +	if (unlikely(to_offset + len > to_size)) {

Use of unlikely isn't necessarily beneficial in all cases.

> +		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
> +		return 0;
> +	}
> +
> +	memcpy(to + to_offset, from, len);
> +	return len;
> +}
> +
> +/**
> + * vidtv_memset() - wrapper routine to be used by MPEG-TS
> + *	generator, in order to avoid going past the
> + *	output buffer.
> + * @to:	Starting element to set
> + * @to_offset:	Starting position of the @to buffer to be filled.
> + * @to_size:	Size of the @to buffer.
> + * @from:	Starting element of the buffer to be copied.
> + * @ten:	Number of elements to be copy from @from buffer
> + *	into @to+ @to_offset buffer.
> + *
> + * Note:
> + *	Real digital TV demod drivers should not have memset
> + *	wrappers. We use it here because emulating MPEG-TS
> + *	generation at kernelspace requires some extra care.
> + *
> + * Return:
> + *	Returns the number of bytes written
> + */
> +u32 vidtv_memset(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 const int c,
> +		 size_t len)
> +{
> +	if (unlikely(to_offset + len > to_size)) {
> +		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
> +		return 0;
> +	}
> +
> +	memset(to + to_offset, c, len);
> +	return len;
> +}
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
> new file mode 100644
> index 0000000000000..a3cb303cc7423
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_COMMON_H
> +#define VIDTV_COMMON_H
> +
> +#include <linux/types.h>
> +
> +u32 vidtv_memcpy(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 const void *from,
> +		 size_t len);
> +
> +u32 vidtv_memset(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 int c,
> +		 size_t len);
> +
> +#endif // VIDTV_COMMON_H
> 

thanks,
-- Shuah
