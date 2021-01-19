Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCAF52FBC04
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 17:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391462AbhASQKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 11:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391433AbhASPwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 10:52:45 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641B8C061574;
        Tue, 19 Jan 2021 07:51:55 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id i63so5408102pfg.7;
        Tue, 19 Jan 2021 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jGeJYEKHSWeoJcj5qAEZzduzYII6G03XjO2vsKZy9EA=;
        b=hJ0iWDtRDdsvNgT4hiugAwGjsUNhnUCdTvbXWk4iz/IOuvGZmbcvd16r0EnSkMqqnp
         QkQLl9bzqEgmLVsz0ItuuP6eTWk/sVER62hGsW0mDDRsLiExwHbDYT9ll5fJV4mKn8BP
         hN1ILSB4S0B5U/LwWcOoBp5jzIPPEG67Wd/akzffGALccvQxyg+CiSZor4lrXcwdKjHQ
         YTmTBZj5l1mclfnWNgreXQUnt38S6kwUXPv66RuvGNJpnfWVNOIO1P/5ArhQMphsPX32
         RdXm9StV2ozHpE6ZZd78hBi9RpFCQtOkgrQCt5x4aFJFRKzRUMtPtjCR3ZihNQnR6kPJ
         iwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=jGeJYEKHSWeoJcj5qAEZzduzYII6G03XjO2vsKZy9EA=;
        b=APDRGHHv1gP48mGq7RvcTUyN2ayM/7RY1QNNBuKD9xFFIrzurS+RZwdzVL30fmV9i4
         RKBZkJD1dvy5YRgFAa7cjM48YDD3UCwu1tEc/FzJgru+EDfQUikdTVrhKLS/2hK8+e5O
         oNy/EMDhIQ3BTR265LNhVNPZzfAPtS58Hyn8DKL+be4d+Zs2Noy+LybTUj3Yfx0DycIy
         8mZWtYEmpymOP5CeaAulBZDNm4Nbqs0IKClm8tAQ0l1gTBxc0LzldAsWab9iVeGc1StG
         ZhM66ECYv8KCGBDhaqMHVCsHnOfhEvTIk+yYCIAqmfgg01eUVkOwirsj16jL+2zsrRj5
         0DTQ==
X-Gm-Message-State: AOAM532ruegrAmCGEK91JlO5zpA1YaMkmGIKjksnbAGnqOh4aFHS/oct
        /wPSemgOLT75hFk1SpGz8ac=
X-Google-Smtp-Source: ABdhPJyIr1aZov1YBsbDAEgjuC6i0+b3UdroSmkUYkfVGPf5O/G+0lPpjcSTJae7Ou5RcNlfOjI74Q==
X-Received: by 2002:a63:605:: with SMTP id 5mr4916819pgg.144.1611071514834;
        Tue, 19 Jan 2021 07:51:54 -0800 (PST)
Received: from google.com ([2620:15c:211:201:8d1f:e7:cd3c:db2f])
        by smtp.gmail.com with ESMTPSA id a204sm5841762pfa.49.2021.01.19.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 07:51:53 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 19 Jan 2021 07:51:51 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <YAcAF2FUhaOIDY3N@google.com>
References: <20210113012143.1201105-1-minchan@kernel.org>
 <20210113012143.1201105-5-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113012143.1201105-5-minchan@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 05:21:43PM -0800, Minchan Kim wrote:
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> This patch supports chunk heap that allocates the buffers that
> arranged into a list a fixed size chunks taken from CMA.
> 
> The chunk heap driver is bound directly to a reserved_memory
> node by following Rob Herring's suggestion in [1].
> 
> [1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>

DMABUF folks,

It would be great if you guys give any comments.
