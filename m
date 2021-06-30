Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D053B7D78
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 08:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhF3Gj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 02:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhF3Gj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 02:39:58 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73E6C061766;
        Tue, 29 Jun 2021 23:37:29 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id y17so1233771pgf.12;
        Tue, 29 Jun 2021 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QIvNKpu6whR4KbUvMINCyHMH+hf3gIcrSC/Vwhdr3Lw=;
        b=YNGt9ANUzqBZpiARnaJOzXbbBqylmMuYP/nI/dR8iVc9BR8fyloomrSEDAc7BHhB1t
         3TGc7sm8bxGH/Kh9sl8FHkfQJSb9d3wZc8s8UirITisqGy/BMijpPFumavBt9BKtTU5t
         KzteOijczl9A4g7/s10zsj2dYedhe1Fapf+4S2kq7X8GW4dWZ0TB6l4xKWnCaHJBb3yv
         aCAHePk8renhA6LzrrWsTBRGjtv5j4O5a8Au8q3RkfIywGYHTOT0+daMkNfKzK0g8ow7
         H32WH1O2xZUCj3wKo23i3lBi3mlxMgE9oEMsxMx30Gk6CRC9uoOiSUHvfb+/212Ng/q9
         bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QIvNKpu6whR4KbUvMINCyHMH+hf3gIcrSC/Vwhdr3Lw=;
        b=XUcM7x70yCkNmJaB+EhyAAUMXCbxnPI4RKVVjOBN7jru8x1m4I7+xLn3XsmdrMdioL
         907WagfbuVYNvcCvJqlf5lnAba4YQIeWYoO1Vr7dFspNXj7DgwbIyBu06gsQL8/cLYXx
         f53EsNMi44FjwjE64ubppJ/GzzD37tvUICUTklhJd5VFLSVsPeDjitvBHVV6IWHkxvoO
         DyEaJZ6ADUfU9KGgLFZplvhcgtIYntj+9Tem4wNrbeH1/M3maT/HbTnwaNqFzClwODlN
         2AxKc06O20KSW5N0S+oxyQBh83lQUQJEtjVrDNyNOr9hUcMhyte44egMct5azyAkMEjw
         oABg==
X-Gm-Message-State: AOAM531gdZZ8usUa8e2sYOLus3PqWQ3bOJDb2JA292TaDWFZgRnJIRtP
        Qtv7yovd/sds6xztGAwP1iE=
X-Google-Smtp-Source: ABdhPJxv35ffdyTf2HuDhIhk6MMvfhVyiCMQtPK0P585CwMD0Mvofwueer0wUTiw7OflmgcVoXCMCQ==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr32113452pgv.449.1625035049301;
        Tue, 29 Jun 2021 23:37:29 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id h24sm20304574pjv.27.2021.06.29.23.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 23:37:28 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
 <20210629033706.20537-4-desmondcheongzx@gmail.com>
 <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <e2ca777f-f185-688a-5813-0ff2e5025f77@gmail.com>
Date:   Wed, 30 Jun 2021 14:37:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/6/21 8:16 am, Emil Velikov wrote:
> Hi Desmond,
> 
> Couple of small suggestions, with those the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> On Tue, 29 Jun 2021 at 04:38, Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
> 
>> @@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>>          struct drm_master *master;
>>          bool ret;
>>
>> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>> +       if (!file_priv)
>>                  return true;
>>
>> -       master = file_priv->master;
>> +       master = drm_file_get_master(file_priv);
>> +       if (master == NULL)
>> +               return true;
>> +       if (!master->lessor) {
>> +               drm_master_put(&master);
>> +               return true;
> 
> Let's add a "ret = true; goto unlock;" here, so we can have a single
> drm_master_put() in the function.
> Nearly all code paths touched by this patch already follow this approach.
> 
>> @@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>>          int count_in, count_out;
>>          uint32_t crtcs_out = 0;
>>
>> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>> +       if (!file_priv)
>>                  return crtcs_in;
>>
>> -       master = file_priv->master;
>> +       master = drm_file_get_master(file_priv);
>> +       if (master == NULL)
>> +               return crtcs_in;
>> +       if (!master->lessor) {
>> +               drm_master_put(&master);
>> +               return crtcs_in;
> 
> Ditto
> 
> Thanks
> Emil
> 

Sounds good to me, I'll revise these functions. Thanks for the review 
and suggestions, Emil.

Best wishes,
Desmond
