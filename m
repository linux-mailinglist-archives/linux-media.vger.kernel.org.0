Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881F51CE014
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 18:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730668AbgEKQID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 12:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730664AbgEKQIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 12:08:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BE9C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 09:07:59 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so11688116wra.7
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EOTrhKoXTQCksNt/M+2O2ZRPWzowDLqWNSVg2dHxPYE=;
        b=HMbhTFp/lUZqbswKm59PgdUfWw5d1xrYUpBIcTwVd3/KCQr73HBeGY2kjmvMrd+sHq
         1mUH/KcNBUxsJSGGHIkA6JEnIzZs1K9lb4a1xuNO3aowxpHGsscZ8F3yCc2FnzBR1XEt
         SUkrSqQy6LcWPvxCCcJ5KAopHnvutWMi9ksaulwlzI3iLrpdOIyFQPkUlpYzKu51vVEx
         jnWBLJp1NIGuf4uBofR4tKXeWibIYanReI9gNwpwQsXG6l4EnRnm7stnbprM+M46Rvvg
         Xh8DqLVJH14mJeex83ONRMxTsrjp5Jb7byY3enuBPl4Pr9x8Nwevt8nkrmEDTlMHr57i
         72OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EOTrhKoXTQCksNt/M+2O2ZRPWzowDLqWNSVg2dHxPYE=;
        b=GDExMpHMOSyi7xG12sDMQaRDJmSL374gh20z2olmxlqKBfgWhMTXIg4UkqpkJogXXy
         6Q2+AKorEjD7zCAR4DCqPL7OwphKKoeTTaXxs3bBvtGpOWUI8rVMPo8Th6d2cEk8YeG0
         VWzhhXdjCtLwX2M4yRyDK0BgE4ug0AzX9ZIz+RFIvk7mmWlylCCBAiLk2MRMjyKCmTSQ
         1KXb7qyYkwRcniYMhxK50ZGW0/C3JcgVZCuWFx1ie3VgPQIYRLpvx9cTVp9iD1Ua1eH5
         ldAcR1gKh3uzoEA+klUrFOgQq2Pend1GZjTuaiP7Xxv2DV92/VZurGtQoswI3yjnXtX/
         pQrw==
X-Gm-Message-State: AGi0PuYWBZLYjphgeEHMwfwx35RnljreHDeKtnBY0SeptrkaOc/5rtNd
        Ss71cLhAy+Ygm0FP/kdlWAIlzw==
X-Google-Smtp-Source: APiQypKuf+PStVH4uY61ONd676UlcdylUrMZvc56RU5mJo/8UsPwIqP2FolnBFSWR+vZ2DMpKQh/Xg==
X-Received: by 2002:adf:dc89:: with SMTP id r9mr18626985wrj.138.1589213278457;
        Mon, 11 May 2020 09:07:58 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id s8sm17867754wrt.69.2020.05.11.09.07.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 09:07:57 -0700 (PDT)
Subject: Re: [bug report] misc: fastrpc: Add support for context Invoke method
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20200511145100.GA221682@mwanda>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e644a0fc-bf9c-c43d-1f44-07aa49a5030b@linaro.org>
Date:   Mon, 11 May 2020 17:07:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200511145100.GA221682@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Dan for reporting this,

On 11/05/2020 15:51, Dan Carpenter wrote:
> Hello Srinivas Kandagatla,
> 
> The patch c68cfb718c8f: "misc: fastrpc: Add support for context
> Invoke method" from Feb 8, 2019, leads to the following static
> checker warning:
> 
> 	drivers/misc/fastrpc.c:990 fastrpc_internal_invoke()
> 	warn: 'ctx->refcount.refcount.ref.counter' not decremented on lines: 990.
> 
> drivers/misc/fastrpc.c
>     925  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>     926                                     u32 handle, u32 sc,
>     927                                     struct fastrpc_invoke_args *args)
>     928  {
>     929          struct fastrpc_invoke_ctx *ctx = NULL;
>     930          int err = 0;
>     931
>     932          if (!fl->sctx)
>     933                  return -EINVAL;
>     934
>     935          if (!fl->cctx->rpdev)
>     936                  return -EPIPE;
>     937
>     938          ctx = fastrpc_context_alloc(fl, kernel, sc, args);
> 
> refcount is 1.
> 
>     939          if (IS_ERR(ctx))
>     940                  return PTR_ERR(ctx);
>     941
>     942          if (ctx->nscalars) {
>     943                  err = fastrpc_get_args(kernel, ctx);
>     944                  if (err)
>     945                          goto bail;
>                                  ^^^^^^^^^
> Still holding one refcount.
> 
>     946          }
>     947
>     948          /* make sure that all CPU memory writes are seen by DSP */
>     949          dma_wmb();
>     950          /* Send invoke buffer to remote dsp */
>     951          err = fastrpc_invoke_send(fl->sctx, ctx, kernel, handle);
>                        ^^^^^^^^^^^^^^^^^^^
> Takes a reference count.  Refcount is now 2.
> 
>     952          if (err)
>     953                  goto bail;
>     954
>     955          if (kernel) {
>     956                  if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>     957                          err = -ETIMEDOUT;
>     958          } else {
>     959                  err = wait_for_completion_interruptible(&ctx->work);
> 
> This drops a refcount.
> 
>     960          }
>     961
>     962          if (err)
>     963                  goto bail;
>     964
>     965          /* Check the response from remote dsp */
>     966          err = ctx->retval;
>     967          if (err)
>     968                  goto bail;
>     969
>     970          if (ctx->nscalars) {
>     971                  /* make sure that all memory writes by DSP are seen by CPU */
>     972                  dma_rmb();
>     973                  /* populate all the output buffers with results */
>     974                  err = fastrpc_put_args(ctx, kernel);
>     975                  if (err)
>     976                          goto bail;
>     977          }
>     978
>     979  bail:
>     980          if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
>     981                  /* We are done with this compute context */
>     982                  spin_lock(&fl->lock);
>     983                  list_del(&ctx->node);
>     984                  spin_unlock(&fl->lock);
>     985                  fastrpc_context_put(ctx);
> 
> If we're holding two refcounts then I think this leaks.

Code can enter with two refcounts only an error other than -ERESTARTSYS 
&& err != -ETIMEDOUT. This is only possible rpmsg_send() fails for some 
reason.

Let me send a patch to fix this!

thanks,
srini

> 
>     986          }
>     987          if (err)
>     988                  dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
>     989
>     990          return err;
>     991  }
> 
> regards,
> dan carpenter
> 
