Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60033D511B
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 03:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhGZA7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 20:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhGZA7u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 20:59:50 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE55C061757
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 18:40:20 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id k1so9636281plt.12
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 18:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RKIKuAaTQlG88etJbUulWv2ZbXxRWG1nGC16MCIPM3w=;
        b=ms8/Jx8P90hOP/FP0L/OO2bILCSysQRSgk6BGqpUNEiyo29FUL08Zmxb3aiqDWglEL
         hKTWizKDgEI1HdGyb08vp4/EARp+ppjmp8AZro4tp1sv8U2ztEgFcNL0pbp8bO9KbwHt
         oX4XW2q4v89JVM+RtkxmP8nmccjwirG2A0nG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RKIKuAaTQlG88etJbUulWv2ZbXxRWG1nGC16MCIPM3w=;
        b=GmGzPeBlz4glpblm23sMwbNzqO/ZhPSjywF17Mbzw+i62CT6N5pv8brrv1oxBWuiRZ
         Gl0jfklRyyu+FCxkOY/fLDVhhIaSfcAyuVErkeQH8lJBHIoTw7+38vU5akRzf6KpXGtm
         WXlIwIZWDZZqKe8phT40h21DGXfz14iiUn5aK6qxi7BoxlF5WhDLl0aNtOFNDant+KUb
         4Oi5iFCLbhc4NKOoHnTK307MHNjvj1Ek+koETGY+gGk/6mrdN2NB59SHlRFIylcUuij1
         fCVsRw1Q1FehdwPiMd1lu3yU7BlwUWiaJ3b48vhLAxvA03NoyOcFjF+KwljmkIXsAjNj
         YY7A==
X-Gm-Message-State: AOAM532uCIJKauALQGZgCXMyravRMvcrWlzs4LhMuGed2H5Ln8yS+gqT
        VENJJweFPKuzhljtCR3k1u9z3w==
X-Google-Smtp-Source: ABdhPJyVZ7XxDxNbUh3apH7bz124wc1cFBxqH5WbFeR33S8SV+IY9fRu6qvDNB1w6A+5XSDWqVOpdA==
X-Received: by 2002:a05:6a00:9a3:b029:355:d45b:ad9a with SMTP id u35-20020a056a0009a3b0290355d45bad9amr15829812pfg.73.1627263619760;
        Sun, 25 Jul 2021 18:40:19 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:967a:60e8:38b7:1227])
        by smtp.gmail.com with ESMTPSA id v15sm25235523pff.105.2021.07.25.18.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 18:40:19 -0700 (PDT)
Date:   Mon, 26 Jul 2021 10:40:14 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: [PATCHv3 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT
 flag
Message-ID: <YP4Sfo0PjLokYi3B@google.com>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-8-senozhatsky@chromium.org>
 <0c89ef1e-8abb-8749-bbce-c7e5a2e2f304@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c89ef1e-8abb-8749-bbce-c7e5a2e2f304@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/22 19:33), Dafna Hirschfeld wrote:
[..]
> >   int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
> >   {
> >   	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> > +	u32 flags = req->flags;
> >   	fill_buf_caps(q, &req->capabilities);
> > -	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
> > +	validate_memory_flags(q, req->memory, &flags);
> > +	req->flags = flags;
> 
> you can do instead
> 
> validate_memory_flags(q, req->memory, &req->flags);

->flags are u32 for create-bufs and u8 for reqi-bufs. So `*flags = <value>`
can write to ->reserved[] for req-bufs (if the value is huge enough).
