Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37434366197
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 23:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbhDTV1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 17:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbhDTV1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 17:27:47 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969A2C06174A;
        Tue, 20 Apr 2021 14:27:15 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id e89-20020a9d01e20000b0290294134181aeso11346153ote.5;
        Tue, 20 Apr 2021 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=30FxQx6+h/DPZfAuYkCh0ZYoDk/KVeqAfInmZT+LL3E=;
        b=sFZydY8u9ka2/hRBi6tB84+cNI9yI6A5eHiJF6L2eIBh5bTHgCEj8vr5GcNwyBX53m
         YtZgsDa35Y5jxsFYmBqwahuvtaNfyvFNS3GwlA2VqNHdBIlnzUiLdAQB6tm3VU5VDyso
         uFGc0Z8Qp7RcAooHar0ptvBIuQph1o6Nyk4TlTiba47P2aajD5eB79njpMy6nsbXLQuw
         tBMjHzP1MJLB9xQF4+AcMqjkWhZZuYfp697XThO2ZYGUamm5xYwqOAC0t3L9zJYGd9mI
         MMITrMovm2eLl47XlYTB8ZkWc6GmXSMT6zOSg4MEr7YvIPBkYf+x85LpaPChrLMFUSXG
         9ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=30FxQx6+h/DPZfAuYkCh0ZYoDk/KVeqAfInmZT+LL3E=;
        b=LaO7XGHcLnElEQeXB3X7G7CRzJCsj1HxlVAb7i+Qn27Dg5SJ8ZRGK0wtPgXZlpQjtD
         HivnpPchxlGxNQ2QU5GvREH3bzF3HEwnhRP6pOw6bX7nDYU/TjQoNYLsut0VjWtlWGpz
         3knMoZwuzqwSIgn/40qc895CqarXXxvK9ZZy7A5ik4zeYqnjlOLnsbbOozUlKVtkK9R/
         hKJN5P7BdrdfgrVqMjJgC/CYJRUqHsQBd2HytC+6xMxeq1lE2n9J29zzxEXDYd9StTwx
         aTUijv7mugfDOyRYPJ6ns07xIzaP6jaKo0f19lROSXtKIxcOiUOQZgZ2uiX7BHo15TSs
         yLUg==
X-Gm-Message-State: AOAM531k06U+muC5s/CyC/oulesDIDUt9U8T/21mXft76XI3KF7ipYF8
        RqmpMSxbJJ3cyTm70W6+t/uODylBbcqpYCAYZ21gqEpWqjw8pw==
X-Google-Smtp-Source: ABdhPJzyHli5TQG29616h8SoL5wezkFSsDA4ukcNLXQQEbIAs43KGcKjYGIETR2Kb01xcJ3OxH/pNSr2v18uh+7dFEc=
X-Received: by 2002:a9d:75c4:: with SMTP id c4mr18676343otl.311.1618954035087;
 Tue, 20 Apr 2021 14:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-24-lee.jones@linaro.org> <5035dd00-45a9-80c0-7bcc-8035167a8e0d@amd.com>
In-Reply-To: <5035dd00-45a9-80c0-7bcc-8035167a8e0d@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 20 Apr 2021 17:27:04 -0400
Message-ID: <CADnq5_Os8LjPoj7_fim2x2RqMhySSUT0BRFdMfd8AFdAjGkhTA@mail.gmail.com>
Subject: Re: [PATCH 23/40] drm/ttm/ttm_bo: Fix incorrectly documented function 'ttm_bo_cleanup_refs'
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Huang Rui <ray.huang@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 16, 2021 at 11:32 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.04.21 um 16:37 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/ttm/ttm_bo.c:293: warning: expecting prototype for fu=
nction ttm_bo_cleanup_refs(). Prototype was for ttm_bo_cleanup_refs() inste=
ad
> >
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Can you push the ttm and sched fixes to drm-misc?

Alex


>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> > index cfd0b92923973..defec9487e1de 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -274,7 +274,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buff=
er_object *bo)
> >   }
> >
> >   /**
> > - * function ttm_bo_cleanup_refs
> > + * ttm_bo_cleanup_refs
> >    * If bo idle, remove from lru lists, and unref.
> >    * If not idle, block if possible.
> >    *
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
