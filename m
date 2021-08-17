Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1873EEB1F
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 12:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbhHQKmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 06:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbhHQKmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 06:42:43 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAA8C061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:42:10 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e19so24407642pla.10
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aKzGDr7dHh04PS8/3LkKuZULv7SL/REMWSzAyqyZcGc=;
        b=KZ3KMcr+OsClYx/pT219VgLK7g9oxiV0PXu4qvgXBcRoLQhoVNquSDENzU292Kx8xM
         fuEkU9yQvcREVQTCckq11zvSfbuJzsVlC/bjYhw76+bZCc5W4tMm9xZD92pWmILFWi56
         33I+cRu5uOLkdvtAjZYUcajDvGH+g0noQouRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aKzGDr7dHh04PS8/3LkKuZULv7SL/REMWSzAyqyZcGc=;
        b=AEmdCUKWucGomgu0ma5Tx1SXEkc2Rkr1+nEcZ+vUFDobfpnpxAD/s9ZQEFywtSeJmA
         13RmQllXQKrUwMC0YECRmt4NoX9vWQRew5nHevsY1RzZuUFZbumscG5GQ886WzgBJfP6
         dFnK70gSSP2fuj1+rQMj1w32kQVWU+EbIlPboC5RO/makFIt97MIJO4l09hBJZe6DWyo
         Kdz2YWZfkx9UNTszVcK7Ohe+f3wDwZTM+qflHii3z3DMTe+8WtzWY013CvoIP+9AqS+6
         Gmv21M7YlEqkP2RkcyLjjdNAdCwpGQmIJEZukEY0yRIKb8W1zkfAz6HO1y9mqyhjWQuB
         HXtw==
X-Gm-Message-State: AOAM530fnle1d/WLIr6oSWJo5eMPXNXv2UcqgGlKf1jif92BsJWYLEkV
        lbn/b5ZYGoHTguwXNt8PIQOkYQ==
X-Google-Smtp-Source: ABdhPJwdRJZ8bXQbpXUY2ozAfD3dJ28JlqF3MQWzXZmnWNKmoNiR9m4nMY4TwRQv+ny3vOMxKzl5KQ==
X-Received: by 2002:a63:b09:: with SMTP id 9mr2946580pgl.53.1629196930291;
        Tue, 17 Aug 2021 03:42:10 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8aab:cb84:5fe8:99dd])
        by smtp.gmail.com with ESMTPSA id m5sm2962503pgn.70.2021.08.17.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:42:09 -0700 (PDT)
Date:   Tue, 17 Aug 2021 19:42:04 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 4/8] videobuf2: move cache_hints handling to allocators
Message-ID: <YRuSfAZiDNwEF0QP@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-5-senozhatsky@chromium.org>
 <9997d302-effb-7026-6891-56426823fc25@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9997d302-effb-7026-6891-56426823fc25@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/08/03 10:11), Hans Verkuil wrote:
> On 27/07/2021 09:05, Sergey Senozhatsky wrote:
> > This moves cache hints handling from videobuf2 core down
> 
> from -> from the
> 
> > to allocators level, because allocators do the sync/flush
> 
> to allocators -> to the allocator's

Done, thanks.
