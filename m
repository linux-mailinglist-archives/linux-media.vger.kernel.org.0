Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAC42C6224
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 10:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgK0Joa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 04:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgK0Joa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 04:44:30 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2FDC0613D1;
        Fri, 27 Nov 2020 01:44:29 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so4064594pfg.8;
        Fri, 27 Nov 2020 01:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qta/7T3ApDOGxr9m6W4TTMp2sW4GC6DoZbVIhhhP/sw=;
        b=nLDVA3TT7mnW63SG7P9rHhCahOWF2XdulW+ix2KuzM7icLe/Q2IbjbjecMMGWU1IZB
         rZGMnEkQxMLpNx74vvCU+IrYxUWuWstR9PY2sDc7XvLXMFIEYUiNLLRcKDcOOl/O2xgN
         FCbuT2xh28P+lI2zZ6PZca/FVruMDjI3+wuscr6ZhJjT+53gG1rn52ScFaG2hgYIGhFZ
         4jQwGdjTAx1YI02NNHFflCcHiec2RrbabZYkcwxQevxZ+LkgXoiqEteAqPlDLXwoXj/w
         klDi3j7c9dDVTxElt53H1X2t/ODbLFdcdqtOz+fbGRI4o+mI9CQnWW4u/hCuP/Hb0W4p
         prEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qta/7T3ApDOGxr9m6W4TTMp2sW4GC6DoZbVIhhhP/sw=;
        b=hzPWJgfInz0Qo2AryCAi08/wKogo0DE4o617R0aBnYwOAY9AW2dMFcYXmLJpZcyXxC
         j07+Voib5TtgFpKW7i5nhywM9SmgCGNC2V/sprnDeGvAKJRG/ajdKyGULE+rrRI6vLOe
         VkGue7FeR+ga+NVZcIBJs1mDBngaf7RGrZzIs/1D9/9Hcu35+f8lcA0odZypETDDjOHm
         QgsUnace2VF9U2Cuk8IMPgORQ2m01fP0BhzRu1A+Ag6nlpi84U+6uL9LtIlM/Lm7Oy34
         44z3OPyltVj7aZOSxHXFk07McCsZcMyjkMteHGOR8NJIXivUdjxXUsEb9ZrkWWrWL/Yp
         Hngg==
X-Gm-Message-State: AOAM533bNEb+NdKy4vjOqvQeC87QJu4wDKhzR5QI4OyAUkEeIbV/b30x
        57zN84nKKtH6nv7/LNaBJbU=
X-Google-Smtp-Source: ABdhPJzq7mqU4z2GsLpwYxXvMmr0PU/Bavj6hh3fL9ae/yy80stfaDpQfBI4NvoOYxt/lNyzUg6Shg==
X-Received: by 2002:a63:8f4f:: with SMTP id r15mr1023890pgn.381.1606470269456;
        Fri, 27 Nov 2020 01:44:29 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id l10sm9719705pjg.3.2020.11.27.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:44:28 -0800 (PST)
Date:   Fri, 27 Nov 2020 18:44:26 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: vb2: always set buffer cache sync hints
Message-ID: <X8DKeqvtgck8qSzs@jagdpanzerIV.localdomain>
References: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/27 18:41), Sergey Senozhatsky wrote:
> We need to always set ->need_cache_sync_on_prepare and
> ->need_cache_sync_on_finish when we initialize vb2 buffer.
> 
> Currently these flags are set/adjusted only in V4L2's
> vb2_queue_or_prepare_buf(), which means that for the code
> paths that don't use V4L2 vb2 will always tell videobuf2
> core to skip ->prepare() and ->finish() cache syncs/flushes.
> 
> This is a quick solution that should do the trick. The
> proper fix, however, is much more complicated and requires
> a rather big videobuf2 refactoring - we need to move cache
> sync/flush decision making out of core videobuf2 to the
> allocators.
> 
> Reported-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Fixes: f5f5fa73fbfb ("media: videobuf2: handle V4L2 buffer cache flags")

	-ss
