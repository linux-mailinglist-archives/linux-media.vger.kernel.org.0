Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F2B3472C3
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 08:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbhCXHgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 03:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbhCXHft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 03:35:49 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67910C0613DC
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 00:35:49 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t20so7460019plr.13
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UHnQXvCUEV0VtT2MvwRRUTMl7zF6eBJNcfSgoe0/Exk=;
        b=k9D/2cT0CpmkqGaY/11MKywcaywPYQDVieLebj1UULT8z9sBDXaJNLJowStEUy3/w6
         3apxlPcQNPpUIPRzmPeZtywZ2THyPh6PlVTJGkfrAxdMXskEC7osX7UNhOZtOEfT1h+S
         xou4rtF6ZowEhSkONdvfuYE5baadAn8u+2Tu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UHnQXvCUEV0VtT2MvwRRUTMl7zF6eBJNcfSgoe0/Exk=;
        b=ZSVJiIBI2K2cT7J8Tp9LRTWPPCPnZl+NGletHnkgW2qdpvLJbmDPmpt3p2zFgV/j3Z
         vmqtSUk/tKgi3FAefv9srcic0Jm/1Iez5x52pHmRkRCg8ZyiBUQHdc+9bd0l8sL7nC41
         BZpuUzGkR1gfbyHiXWKhdrjGqzIC195UdTbPhq06eMYp05jqFA4bWhK6lB86rNn64TWV
         bVPs2XGDbie9RlFsDPbwYegf8s8QnwkjLUFHpadmGbWksI3y5qBdcQauLDqCfM91yPCI
         kD+xmVqOYgTPKQXi1zPOPscioWxocSZOJHjwEsQun1rcvi9kuQJ/nqnu6V3hLzA8olRa
         2bTg==
X-Gm-Message-State: AOAM530JXgz3yKTLuuroqpQBm+lkqwgr38sGQ1ycGs4qyStVe8T0CbuQ
        cbMLbFw4rfA9WjdeamXBlmUNcw==
X-Google-Smtp-Source: ABdhPJxycrxLUpmuIUIcDbco/lAquBY2NOJSa5mzOIKXSD3tzJTJJp0YJbxXBT0Xe1i6vAvjoAo2qQ==
X-Received: by 2002:a17:90a:c004:: with SMTP id p4mr2112110pjt.202.1616571348923;
        Wed, 24 Mar 2021 00:35:48 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:bcf2:e05a:a993:9494])
        by smtp.gmail.com with ESMTPSA id k64sm1366705pgk.23.2021.03.24.00.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 00:35:48 -0700 (PDT)
Date:   Wed, 24 Mar 2021 16:35:43 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3 3/6] media: v4l UAPI: add ROI auto-controls flags
Message-ID: <YFrrz9lEKgjY1Arn@google.com>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
 <20210319055342.127308-4-senozhatsky@chromium.org>
 <CANiDSCseJdKuPSZFDvc8VGp=PDqGEN42ZsLVGgkwhAz5hhVCQQ@mail.gmail.com>
 <YFqiWixqSuPMTwXz@google.com>
 <CANiDSCujVZy93W=HW317R5rEzEtdaaR8XwA_tu-ZT4eFe1VSrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCujVZy93W=HW317R5rEzEtdaaR8XwA_tu-ZT4eFe1VSrQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/24 08:28), Ricardo Ribalda wrote:
[..]
> > >
> > > Are you sure that you do not want to start with 1<<3, there might be
> > > some hardware that support LE/SE
> >
> > How the hardware's going to support this? There is simply no way to
> > pass these flags to the firmware, the values already overlap with
> > auto-controls. So I guess these flags are for the driver (C code).
> > uvcvideo driver is not doing any "lesser or equal rectangle" magic
> > for ROI. No such thing is defined by UVC spec.
> 
> The driver can implement se/le.

Right. I wonder if we can actually fit ROI into selection API.
v4l2 selection is focusing on rectangle, that's the only thing
that matters, but in ROI rectangle and autocontrols are equally
important.
