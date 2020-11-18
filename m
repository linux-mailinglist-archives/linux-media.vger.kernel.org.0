Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF422B7BEE
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 11:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgKRK5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 05:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgKRK5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 05:57:48 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7C2C0613D4;
        Wed, 18 Nov 2020 02:57:48 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id k27so2089612ejs.10;
        Wed, 18 Nov 2020 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Ujs+84h/AV5va5lsnNUE6Cha4z0WdYf4Awwp5uvYq2s=;
        b=ec2dXjyKAgBuZgQiPsDp5dlX2Axa3/ZR+q3LPAUbNQK51MefRbkfyUzwGdwcFCNNsl
         DmAkYKWSssBL8pDXSTuIMb03r27h8P3C7U+//k3tiWfmUbqOc6vYiFgAr7mFQguCiSkc
         OrEEYzGMqPmV/YS7MOh6wuDzbz4ZtukA4ppcicdJqLSkgi9vmxq6hUetlEIql9xC1e+D
         gJYjQu75/yP0gqDhZ9DoHavl6V6VBNPHDiB4x1nDLZ49YGYM471bij22ozZh9FBiPYHY
         mft78EPbgAOqjcnAMJTpESq0Q+59GL2BcUtH6vopcqxr4H2uFtMKhBjytC9I6vggoFOh
         CQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=Ujs+84h/AV5va5lsnNUE6Cha4z0WdYf4Awwp5uvYq2s=;
        b=V9ajFqe9UWbjXQGfEom9Vox+CmaP+ESAfDcK/i95wz3Qre6nNZyeAsyLRiFUzzX+1d
         7UxYmY5BwxHW+JV8wl/5z4eKNof9gArZMFS2etj5Y2HBWJeFGqb1iYHn4v5ZB3tzgQ0I
         dFKpxR304qF0DfcGnXmGpGFLkGlxcV+XqkwNeY8mBibxESwe5ZveeRHIEjGUGDrqZPmO
         bYe3b50A78yXICZ3WATXrxThWsCQ/txpkEIujk2GRFFMos7Tj9nqwQ19tpIDUVlJbrWp
         rrvr8CQHemm3wtrAZTeG9jefMJuJJ6N+c3QC3zKOGudec0UvkxUDaYIqRJ3mCo+nRss9
         hIlQ==
X-Gm-Message-State: AOAM532vdPZ6fe1SA7Tf93YVY1wlP3KJNrU1cKKflxGssr2uNEKwTEag
        qF3VR0oyc9o0Vv2FBjrBNKMXdJgSd78=
X-Google-Smtp-Source: ABdhPJzwcar3mNBUaai8RXeIr42FsqX4abG+v5tYsTGBLf/nO0azD5aQGORqzDbjWMSqF0AU+Vgykw==
X-Received: by 2002:a17:906:2e0f:: with SMTP id n15mr6409546eji.486.1605697066669;
        Wed, 18 Nov 2020 02:57:46 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id n12sm12761784ejs.19.2020.11.18.02.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:57:46 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20201106114806.46015-1-christian.koenig@amd.com>
 <20201106114806.46015-2-christian.koenig@amd.com>
 <20201106144811.cf228ca9278ec78887d42960@linux-foundation.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e5a25173-ebea-d856-ed25-45437769f17f@gmail.com>
Date:   Wed, 18 Nov 2020 11:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106144811.cf228ca9278ec78887d42960@linux-foundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 06.11.20 um 23:48 schrieb Andrew Morton:
> On Fri,  6 Nov 2020 12:48:05 +0100 "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
>> adds a workaround for a bug in mmap_region.
>>
>> As the comment states ->mmap() callback can change
>> vma->vm_file and so we might call fput() on the wrong file.
>>
>> Revert the workaround and proper fix this in mmap_region.
>>
> Seems correct, best I can tell.  Presumably all ->mmap() instances will
> correctly fput() to original file* if they're rewriting vma->vm_file.

Yes, exactly.

Patch #2 provides a helper to make sure that everybody gets the 
get_file()/fput() correctly while updating vma->vm_file.

Can I add your acked-by to the patches and push them upstream through 
drm-misc-next?

Thanks,
Christian.


