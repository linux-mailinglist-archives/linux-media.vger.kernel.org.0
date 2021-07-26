Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D720F3D522C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 06:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhGZDZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 23:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbhGZDZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 23:25:34 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C25C061757
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:06:03 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id e14so10089652plh.8
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xiWitXT290UcByDjy4CV0WmRGLnUtUIPDLLBbCJ8IDc=;
        b=fUs5u9A2a5DivlQK6Sg0JrGLgJXIPYe7pwxwekbQfczrOF7C0jTUI5nUklETv0tNu6
         s/9XO2ZgJPne3GLw52Jt8SKdnjFuSu5J2oH8fdnurwdaDQhs/RCRNSv4p5+4h5IVvzDs
         9qu7clubgpT93TMnvfLV00Z4mqHgSOhzsimDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xiWitXT290UcByDjy4CV0WmRGLnUtUIPDLLBbCJ8IDc=;
        b=FxNwIdEXmHMO4RoyMoyChYJR+129LkxPRexVgOG3gSbjHFsq2ysArCtKq48DosugOw
         VDa8Fl81ka2D7wK9Ewm4IiebjbmkX9u+yalFSOSMAQnY5U6Jav89DJAJ4GhX4+rOom/Q
         w6Qxbn1Q93WzBbA12p7EGzvhicLl+xDqRv1IHNkwk1VmJeuUF4m/Imm6ylAfUAOTVmkp
         BYADUun+SqFbQvuVqwLdquJuWJ2jpwLopm4j4vI8HU4GSXaqjnz3wNAj00LFouLcYqgU
         A7bOq3GuaQwI4HR/fati5IWMpDwW2aX2MwSdp/Uu4VCqPjScgClC1Cb4sBxLkmA5tt8I
         wrxQ==
X-Gm-Message-State: AOAM533d8DCszAru/bKKCzJ0BkzuwVEN+V6Fyi4KJmSMZfu+MiNe2YSh
        yf0YyKRysBZiZulwhNrAj1mOuQ==
X-Google-Smtp-Source: ABdhPJxPpkDCVPhmtEpwxjcoHVvEIwaGFP4/ubAgNHcqzQYT+OQ4R0Q0rmcmuOVO4cs1HYPlIHNkiw==
X-Received: by 2002:a63:1621:: with SMTP id w33mr16182815pgl.291.1627272362829;
        Sun, 25 Jul 2021 21:06:02 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:d699:4331:827:4150])
        by smtp.gmail.com with ESMTPSA id r18sm2448184pgk.54.2021.07.25.21.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 21:06:02 -0700 (PDT)
Date:   Mon, 26 Jul 2021 13:05:57 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv3 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT
 flag
Message-ID: <YP40paMcGjlfofi8@google.com>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-8-senozhatsky@chromium.org>
 <0c89ef1e-8abb-8749-bbce-c7e5a2e2f304@collabora.com>
 <YP4Sfo0PjLokYi3B@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YP4Sfo0PjLokYi3B@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/26 10:40), Sergey Senozhatsky wrote:
> On (21/07/22 19:33), Dafna Hirschfeld wrote:
> [..]
> > >   int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
> > >   {
> > >   	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> > > +	u32 flags = req->flags;
> > >   	fill_buf_caps(q, &req->capabilities);
> > > -	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
> > > +	validate_memory_flags(q, req->memory, &flags);
> > > +	req->flags = flags;
> > 
> > you can do instead
> > 
> > validate_memory_flags(q, req->memory, &req->flags);
> 
> ->flags are u32 for create-bufs and u8 for reqi-bufs. So `*flags = <value>`
> can write to ->reserved[] for req-bufs (if the value is huge enough).

I guess ->flags can become u8 for both create-bufs and req-bufs.
We had ->flags in both structs as u32, but then decided to leave
some reserved[] space in req-bufs and switched to u8 there.
