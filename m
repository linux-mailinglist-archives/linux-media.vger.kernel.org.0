Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB73049A5EC
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 03:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2364661AbiAYCMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 21:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1455378AbiAXVfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 16:35:19 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15EC4C0604F3
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 12:22:15 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso165338wma.1
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 12:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Ke9g6kY1kLIfyyex335F3KDC37XIQ1ezTOdv6ZYLv/k=;
        b=D80hcT4XcxMGtftOj/oiDZCuJHosbWOP9px3lg36MlSFohIalMEXsIsmWHUeYOBUVM
         SEnLNESjYym6MXBC4OgLnvX3F3afiJMfQn9g7zvmuDDClKoY74ZfeMgQ5KJolU/MiNd7
         F7ewGlbdOGeNAWRJ8WA6uOejSJ3zoxj0T0kEiw6TNpp74QiWLyMsCYYb/cup3DkSHBdG
         nAHisJX8oZAYE4rqRS45RSzV8GGsbClXEaO0jw7YvcaXeAvPSCVWhcWi81OQhBljz3Mb
         FnBBctXMK27UU+EZ9nYFWS8Nl5s1ScmigcH3alPAZBcuaytebOuuunep3czM6jzKMLa8
         E9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ke9g6kY1kLIfyyex335F3KDC37XIQ1ezTOdv6ZYLv/k=;
        b=ruRFznjMAkYTRTX2urUamQRh/9u8dlnV9y2/9l37f/stq8xVSWLmwqjD4nLlHc93YP
         WENZ41i2mZkXaJfteDMU/Rqz9Ai6vtvZenLl1Ipyx+Rpy+b4XipMTqiBTaP+frNasAZd
         IS5ev3Z/888HwsPohVmKdTTgqpV832vWOxsj2P3ZUh8e9f243mw7A+ofcJ4TBzZGGTLC
         liNMBLA/1sEgi/wmFZPkaRQbsONLDWdYMHw2+Qov13ReJMYYCULM5ORS9rY7fqgm7YrY
         Z1+BdJgR6sTFxSMeOn4MbrpRVsQvoAira82K4oKxQHTVmPYDgK9EKfF1c3HZXdwEc/gk
         gETQ==
X-Gm-Message-State: AOAM533iuhKXl9X9dtuE95EO3HjJU2cdsbYMCtzY9ImU1lIAJK8BUtlx
        GrYXAp71chBUfNhgRASOFM4=
X-Google-Smtp-Source: ABdhPJyO2wiaxPV+BJ/+R4PvbC7zfnD9KOapfcHGORzhc/1QStS+iy1PdwoosEFvI+8zJy4QN3OwVA==
X-Received: by 2002:a05:600c:22da:: with SMTP id 26mr3228599wmg.121.1643055733649;
        Mon, 24 Jan 2022 12:22:13 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:139c:f8a8:1313:ffa0? ([2a02:908:1252:fb60:139c:f8a8:1313:ffa0])
        by smtp.gmail.com with ESMTPSA id m4sm325570wmc.1.2022.01.24.12.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 12:22:13 -0800 (PST)
Subject: Re: [Intel-gfx] [PATCH 06/11] dma-buf: warn about containers in
 dma_resv object
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>, thomas.hellstrom@linux.intel.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-7-christian.koenig@amd.com>
 <cfdefdc5-bd4a-31e4-a0e2-fb02acf6d01f@shipmail.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <319496ce-0551-5cd3-ef0c-4b503c4bc212@gmail.com>
Date:   Mon, 24 Jan 2022 21:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cfdefdc5-bd4a-31e4-a0e2-fb02acf6d01f@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 24.01.22 um 17:36 schrieb Thomas Hellström (Intel):
>
> On 1/24/22 14:03, Christian König wrote:
>> Drivers should not add containers as shared fences to the dma_resv
>> object, instead each fence should be added individually.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Is there any indication that this triggers on existing drivers?

There used to be a case in amdgpu which triggered this, but at least I'm 
not aware of any in the current code.

Christian.

>
> Thomas
>
>

