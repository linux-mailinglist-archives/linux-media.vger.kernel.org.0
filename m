Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5103F2C67F3
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 15:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730963AbgK0Oah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 09:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbgK0Oag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 09:30:36 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DE6C0613D1;
        Fri, 27 Nov 2020 06:30:36 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id b10so3340471pfo.4;
        Fri, 27 Nov 2020 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iivTDKjcCzrHmLkUESvvviQvq63fYAR1BOIPn70WYPg=;
        b=b3KNcVPyNZG2r6dOTvaZaR23Erfk7CcTdUJ5HZ3hYF5NgYS9Dld01yFVjZ8VzEFdlH
         /7rV+nySTELbUeM0a82i+35LNXBKj0bbEXQ8G6bEWWp5pYeTgFvqdUqUIss9dK0FuSkr
         oZFDs+0yyej2rtvvHjN6DgBDebP5LDHtvlWCEI9Tplhtmdayv9/LySO549+JxW0JqcjS
         +HewLzdohXqQ4rP5QEPP4CKthL0vcezxqX6NFROyGYWEJrx5pd3A2c6fKytVgCIoCDLQ
         lEkqyvuGGF2CbRGtIKY/uBhbDRDLqDj6QGD6AYYbgkXfpYpZ+NHLy+F/hPFjojmUTT4I
         smZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iivTDKjcCzrHmLkUESvvviQvq63fYAR1BOIPn70WYPg=;
        b=rN7CRTdILm6lk+UEO6T193teURkZ4eJibkK2ToYG0clTAIWH+e4E4IbjtzKKRaIisl
         KUSPbTc9K1stP/EeCG/t2gitIADtT2+Dk5MgcKHSEqT9LA7qyPh8FFMTVaikjte2ordi
         y66mbA0e6A55vtEFkDnCUJcxTDds9BnouEsIgYiHCB8OfujcyGczyW1N8tsHoeDSrHCS
         oG4Oo6AJ7Jxr9GoUOmOsRtnSeZEIH3p5jwKNMTqVYwjrm86SWl9/mCQQgiw8JOFB3dDM
         p6nT1nVwQId6Uvnd6+kyKkUodZ9RDz0DHq/6j+kXwBe+SsPO1kWJtSxfgCCKbLcSrzMj
         rJBw==
X-Gm-Message-State: AOAM530qAY0V+jLBjBXdHjT0K6cGBqKuC3M7WutRqnlhL0lsECZhD3rs
        90nT6+0OzWPt12+tKpdiEJg=
X-Google-Smtp-Source: ABdhPJz5S55z/xe2ih3s9onsP9tvvTCP5NITUDRKJm6rR+yozPXbbqoIbRZ4K/mFSCMZpO19Jt9N7g==
X-Received: by 2002:a17:90a:6287:: with SMTP id d7mr9895375pjj.80.1606487436320;
        Fri, 27 Nov 2020 06:30:36 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id ge21sm10362685pjb.5.2020.11.27.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:30:35 -0800 (PST)
Date:   Fri, 27 Nov 2020 23:30:33 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: vb2: always set buffer cache sync hints
Message-ID: <X8ENifLanjYuhF/r@jagdpanzerIV.localdomain>
References: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
 <0dbfa509-8c82-7470-c18b-24ab5c92dc4b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dbfa509-8c82-7470-c18b-24ab5c92dc4b@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/27 13:59), Hans Verkuil wrote:
> 
> I think this needs a comment, basically explaining what you said in
> the commit log. It's not obvious from the code that this is a
> workaround.

Something like this?

---

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 5499013cf82e..21b2b0ae3629 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -414,6 +414,16 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
                vb->index = q->num_buffers + buffer;
                vb->type = q->type;
                vb->memory = memory;
+               /*
+                * A workaround fix. We need to set these flags here so that
+                * videobuf2 core will always call ->prepare()/->finish()
+                * cache sync/flush on vb2 buffers. Otherwise, for backends
+                * that don't rely on V4L2 (perhaps dvb) these flags will
+                * always be false and, hence, videobuf2 core will skip cache
+                * sync/flush operations.
+                */
+               vb->need_cache_sync_on_prepare = 1;
+               vb->need_cache_sync_on_finish = 1;
                for (plane = 0; plane < num_planes; ++plane) {
                        vb->planes[plane].length = plane_sizes[plane];
                        vb->planes[plane].min_length = plane_sizes[plane];
