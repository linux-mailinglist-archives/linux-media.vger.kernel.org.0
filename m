Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A12108AB8
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 10:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfKYJWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 04:22:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33482 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfKYJWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 04:22:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id w9so17054393wrr.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2019 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QiRSkNH09nDsKaV88CvJJn/s44TY85sod7XlDRyFXvQ=;
        b=jI6XqUKbE97OBR/UjSAdMYh4vADo7HA8Po0z1ZkXIMS3qB0URQJUFT1wc74uDMBR9W
         UWJa4/mNsQvrq6cMlNkpwknrPDbfv+qIYOKEH3ZWkUM7fMi2c76QIvjsxC6F7kgS6llk
         OZyNOS7CRJFGADKBjENW/ez+cXb85ep20lVUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=QiRSkNH09nDsKaV88CvJJn/s44TY85sod7XlDRyFXvQ=;
        b=r3jSoM2rJeRp3Uhjw4+V7lEMJOTmTEdJMSvzPcD9pv42vKSGO3yJEDPhj5jGQyosIG
         Uc+3pCKfwSs1BGVEFFE49JSN/c42IVlgNWHalYKOnYo1hJXXwEnIcE/i1kq4wC1A2HZB
         vVdziP4ZIpTFb4Qf4hi9IvRN6bQd99H9RDpjvzZjpYF6Nj15w0gNxND2GbNb1/vSfcde
         J5Oyl7TunzyucxPob7Rj+gSMEoEHgQJl0MyN4pXZtv+M+VkHPjGcR3Q5LxSqDUWBCCoI
         diaGffh5My94iDkkIJ93oaAgxltmlHJrm7p1OmAqOm6rIetIgk4WyOscZGzRjriSqCSv
         j0xQ==
X-Gm-Message-State: APjAAAVaG9rP0vpst6pFnJbXygmpDz1LPPlKbmL/DGRJMSwMgHu3ZwKX
        apvUljyP9pDjuTKQGxjkEHuaWw==
X-Google-Smtp-Source: APXvYqz5j9Sk1KwP87Rie41BfxNaFxInLur5nJHL6zE3OzpkLJ4XRYQBBQiJWf93BsiUzqYndQdomA==
X-Received: by 2002:adf:da52:: with SMTP id r18mr30554159wrl.167.1574673752986;
        Mon, 25 Nov 2019 01:22:32 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id l4sm7659664wme.4.2019.11.25.01.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 01:22:32 -0800 (PST)
Date:   Mon, 25 Nov 2019 10:22:30 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        emamd001@umn.edu
Subject: Re: [PATCH] dma-buf: Fix memory leak in sync_file_merge()
Message-ID: <20191125092230.GJ29965@phenom.ffwll.local>
Mail-Followup-To: Navid Emamdoost <navid.emamdoost@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, emamd001@umn.edu
References: <20191122220957.30427-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122220957.30427-1-navid.emamdoost@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 22, 2019 at 04:09:55PM -0600, Navid Emamdoost wrote:
> In the implementation of sync_file_merge() the allocated sync_file is
> leaked if number of fences overflows. Release sync_file by goto err.
> 
> Fixes: a02b9dc90d84 ("dma-buf/sync_file: refactor fence storage in struct sync_file")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Thanks for your patch, applied with a cc:stable.
-Daniel

> ---
>  drivers/dma-buf/sync_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 25c5c071645b..91185db9a952 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -221,7 +221,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  	a_fences = get_fences(a, &a_num_fences);
>  	b_fences = get_fences(b, &b_num_fences);
>  	if (a_num_fences > INT_MAX - b_num_fences)
> -		return NULL;
> +		goto err;
>  
>  	num_fences = a_num_fences + b_num_fences;
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
