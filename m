Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AB63F166D
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 11:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbhHSJlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 05:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhHSJld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 05:41:33 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744AFC061575;
        Thu, 19 Aug 2021 02:40:57 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q2so5347104pgt.6;
        Thu, 19 Aug 2021 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cSp9NwnxyOgzJbrJbt1VGvD7OEziQgHeU2j99tNdlpo=;
        b=sQSaBnD6DGdXEu4FJn47XGvy9Us77bXl/nsDwl6TW3a5px8jRAmU5BnUTv35j7bPuY
         3ApUSU1sSc6EbAjTwbK0Pdg0Di3V4k2gIYVQt/l5ftJDfHoRmjl/f6HYf/9xefPrpYcf
         RvaaxlHcuL6K0AXxLaEjKCR2sHDRQ9ZmMi6gr4Dx58cfT5qWoQdO9ifYvKJjgKC4tHVQ
         5xHuZPlf3GBgkLrkmlW55FO7UN0AFNo65cCdcvOIuMsOS3FCTM7ASuOZXC/ohR861vKP
         5uiSuzSapT3AKJ1seorxrgJ8EfSO+dO1GvcAr719X04oAGT5GnR84dv75OOVQyDhAWaI
         ywbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cSp9NwnxyOgzJbrJbt1VGvD7OEziQgHeU2j99tNdlpo=;
        b=M9esG04De6EVZqlwPBRzqgNRvSl123RBCIqdkip1qLwVxsXzNJEfflmvsj/CvWJ/33
         dhQMsdPGcvaFGDayI/FNn46IV8g07JoqHYMYXvA5mqomLXTQMcCzzkWzq5pA0Xa+C8Up
         aOFPZRQTfFqm6/c/zRAgwGd962AJHfgPvSQTJMeF9vIaTP4tB3nufcsiX0NYB+4k1i7u
         H613WzU0Lnw0SVwuPeEQdyhhotT1PP6Gm/EelI6y7Q8eQZNfblRMMT7vdL6ym2rxjLLU
         8Yl1vykAI8YKXmCxxe/3cbeuv1kc7xEWcUoolaPgpVqVXhiRGjPDgXqiwbhmcdcXdXVU
         J5tw==
X-Gm-Message-State: AOAM532T1KlA1V5+UiZ/q6HonnxhCuNnyQ8zTqIJSGDaJfvxqegOI8Hf
        ZjRxTyp2bWGw4hrqR1Er8mg=
X-Google-Smtp-Source: ABdhPJxq85oVvDdy2A3J4ATn8gQFyT/xNOQ1HXI/IX1f0Jg4ari85I+VOJhHYh8682YWHufRJFmglQ==
X-Received: by 2002:a63:de01:: with SMTP id f1mr1177149pgg.377.1629366057013;
        Thu, 19 Aug 2021 02:40:57 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id r14sm2740127pff.106.2021.08.19.02.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 02:40:56 -0700 (PDT)
Subject: Re: [PATCH v3 8/9] kernel: export task_work_add
To:     Christoph Hellwig <hch@infradead.org>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel test robot <lkp@intel.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-9-desmondcheongzx@gmail.com>
 <YR4jqvZtu0gbaVmx@infradead.org>
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <71c8e827-92f2-f34a-c9a6-9fc6923d315f@gmail.com>
Date:   Thu, 19 Aug 2021 17:40:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR4jqvZtu0gbaVmx@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/8/21 5:26 pm, Christoph Hellwig wrote:
> On Wed, Aug 18, 2021 at 03:38:23PM +0800, Desmond Cheong Zhi Xi wrote:
>> +EXPORT_SYMBOL(task_work_add);
> 
> EXPORT_SYMBOL_GPL for this kinds of functionality, please.
> 

Thanks, I wasn't aware of the GPL-only export. I'll update this in a 
future series if we still need the export.
