Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA50D327939
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 09:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhCAI3m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 03:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbhCAI3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 03:29:15 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1015C061756
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 00:28:35 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id h22so15689879otr.6
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 00:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Po0BcOHVOJTG0hvFYjPlIwmZEd13oK67+UakEhu7B6Q=;
        b=YfA/r0mER8n6UfMIfPlTKU0tRsfBtD2fSPCMtOkQ8qPbEjf0wZj6SbP66leHhGrHh+
         Hefkni+38PRa4KEDwHN6qnHZRU5pOke97rViY26d9G2cKSpStSv9bG/3mRknk5+4smVr
         eJo5XoeUTuVG3dYspWAIHl+D7uvwXlei75bAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Po0BcOHVOJTG0hvFYjPlIwmZEd13oK67+UakEhu7B6Q=;
        b=eqxtRIxt0B+jvbdKdCC/bkLhbe6YbhAJLeY3ShPUDv0jGS0ZmSvXPT3PmIoBRN+iFJ
         L9VDOfPlJ/vaCpKJ6tt9rB6MX3b8wPKtTg85RQNPqNwcoxN1ymWVk5C0VNGgZYSFGlYv
         Iv/938i3fiirJHHQ6LiZsxKpLImQFJADPBZXrgOqGx6PgYOLLecMU8cpO8NqR1om9X9c
         ej7eK5wKtW/j76BvSQbSxn6xu0YUGp30qJbfB4+vfKxoZ+Pnk0GUOjRHQQ6EvGc21rfc
         sw351IkK672FnymW2GQTHAigqOKE8axg28PknKShwoba+GVU2WGbipzQin8sT26BnWZK
         qyKw==
X-Gm-Message-State: AOAM531bK3ns+28fMjAZUSLK8Qc31zCV4IRP/4UHEiH/qMhSD9dz9l08
        Z8tKdCDK5whNsk+efpq+jNNfeujgus3bA+PaLhrN8w==
X-Google-Smtp-Source: ABdhPJympOz7bwbjwQR+/YqRgluV9bZ9F2UL/K13jiisJVkY2GNo/v3HZSpiXQHFFJMtqZ1UFhbbahYsC9DYYMGGasg=
X-Received: by 2002:a9d:6481:: with SMTP id g1mr2759310otl.303.1614587314867;
 Mon, 01 Mar 2021 00:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org> <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org> <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com> <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org> <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
In-Reply-To: <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 1 Mar 2021 09:28:23 +0100
Message-ID: <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
> On 2/26/21 2:28 PM, Daniel Vetter wrote:
> > So I think it stops gup. But I haven't verified at all. Would be good
> > if Christian can check this with some direct io to a buffer in system
> > memory.
>
> Hmm,
>
> Docs (again vm_normal_page() say)
>
>   * VM_MIXEDMAP mappings can likewise contain memory with or without "str=
uct
>   * page" backing, however the difference is that _all_ pages with a stru=
ct
>   * page (that is, those where pfn_valid is true) are refcounted and
> considered
>   * normal pages by the VM. The disadvantage is that pages are refcounted
>   * (which can be slower and simply not an option for some PFNMAP
> users). The
>   * advantage is that we don't have to follow the strict linearity rule o=
f
>   * PFNMAP mappings in order to support COWable mappings.
>
> but it's true __vm_insert_mixed() ends up in the insert_pfn() path, so
> the above isn't really true, which makes me wonder if and in that case
> why there could any longer ever be a significant performance difference
> between MIXEDMAP and PFNMAP.

Yeah it's definitely confusing. I guess I'll hack up a patch and see
what sticks.

> BTW regarding the TTM hugeptes, I don't think we ever landed that devmap
> hack, so they are (for the non-gup case) relying on
> vma_is_special_huge(). For the gup case, I think the bug is still there.

Maybe there's another devmap hack, but the ttm_vm_insert functions do
use PFN_DEV and all that. And I think that stops gup_fast from trying
to find the underlying page.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
