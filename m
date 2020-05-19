Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DD71D91B1
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 10:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbgESIGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 04:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728611AbgESIGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 04:06:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEF1C061A0C;
        Tue, 19 May 2020 01:06:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f6so6041751pgm.1;
        Tue, 19 May 2020 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uQMpGjbYoWk8uaOr+TgHDPlcC+gHeyUprHQUVNojJpI=;
        b=JtDAr4x6+sGs4Vho3Ks43qUAaQFgbO23DZUISshK5z95XihBDafEDULQwQ1ucUC7sf
         Zqv4gdaUjvsmfe5iA9ArvtRv5uykcljqPZMZP1LUnmjLe5p/4oVXTtlSIbycFIa72M+D
         oAT8bh4IsfuppPwFyLj2oD/n3NChc9bdFWhei2ZtnyxC7QSuHmWFaDADXV13M8AbR6WH
         tNmbYTBO8hGeXSN11nBS2i+QFBpHb2Aa8YHYv/6l6qbIck4Rf1wI2gDSCiAE08Wyr4q+
         b997nnz1a/jdxgc5hHi1U/gbvNYhEw2Ajb70eDGR82MC45S2d7nMSvFdGsmLVak5megp
         5Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uQMpGjbYoWk8uaOr+TgHDPlcC+gHeyUprHQUVNojJpI=;
        b=lZTXBWqAnU26qloe4vLj4/qk6cUMDIKNEGNUnMtDBklbevSc0jEJYPpQIjKliNrsTy
         auo9OSsetQefrbPR5pbqGF6NuMiwi29cxBMKV1yvExQXINUb9u1CSjS/ftVzBUYyLWlo
         bDWY0uFDE4Ab8fT8Tt0FXRCjc0hJdIpt7EATT1XPGF4xn7KDczIeSXvqDsaR+DtJPYXs
         FteqIHp/y//taC3+mVAkw1IA4rFclvjCWidlXWe7ZTyTH6QLCX5iYh2xcqz53w8G2Zp7
         2bgVqDAUxJtKLYCL2on4zDU4sokLvG5Y5UQjI2Hx/rF5isAgR0uvIxLQu9M4waxAtzU0
         lLwQ==
X-Gm-Message-State: AOAM532PV7hsqsUyRWESrc8jRIyo0/YiVjDeNtYVZO1P05zWjCdjjF7i
        nFhz+vOB9U8CPldyr2nX3OTaz2pk
X-Google-Smtp-Source: ABdhPJzMM6CxEuSd8Yc1s6dUx2b6h5j5Ni7eBCPNcPreIEshV2siHmyTbYzNoXiqPPbi776cSf1WTQ==
X-Received: by 2002:a63:3546:: with SMTP id c67mr17968004pga.379.1589875591626;
        Tue, 19 May 2020 01:06:31 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id p4sm1985920pff.159.2020.05.19.01.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 01:06:30 -0700 (PDT)
Date:   Tue, 19 May 2020 17:06:28 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/14] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Message-ID: <20200519080628.GB161827@google.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <3fee9a3d-30fe-826a-7a36-b4c9720a94db@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fee9a3d-30fe-826a-7a36-b4c9720a94db@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On (20/05/18 17:18), Hans Verkuil wrote:
> Hi Sergey,
> 
> On 14/05/2020 18:01, Sergey Senozhatsky wrote:
> > Hello
> > 
> > v6 changes:
> > The design has been slightly reworked. The cache-hints capability has
> > been renamed to SUPPORTS_MMAP_CACHE_HINTS and is reported for all queues
> > that support MMAP and allow cache hints. However, the actual hints and
> > memory consistency are ignored unless the queue is used for the MMAP
> > streaming I/O. Plus some cleanups, documentation updates, and so on.
> 
> This looks good. If there are no new comments then I plan to make a PR for 5.9 in
> two weeks.
> 
> Thank you for all your work on this!

Hans, Tomasz, Ezequiel, thanks for all the help and guidance.

	-ss
