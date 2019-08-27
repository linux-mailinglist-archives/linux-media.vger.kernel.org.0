Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABD79F053
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 18:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbfH0Qhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 12:37:46 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:40288 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfH0Qhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 12:37:45 -0400
Received: by mail-ed1-f53.google.com with SMTP id h8so32184145edv.7
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=X6m6ji0wgVmeCJH3F3ZV9wKLZzsKCQSRHMJxqstYqj0=;
        b=ELmS9Cb3e++5pqjflPQtkofvROLhs5tvezuQztDFOIZOrL/RfK5A0hKz9A8lIkXlQg
         pkkDDw8o//CAsRG09I/kg++nFSxNItQ+8s6OBkrFqhDJYH/aeAPjHKIo78QGl27NIr2e
         DODtIGdVKSTrIUgmKtFqurRXZeH/xSgBeYOiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=X6m6ji0wgVmeCJH3F3ZV9wKLZzsKCQSRHMJxqstYqj0=;
        b=RXHLYXsld/wJeOIIHTD7I8Xmy+AVuJdW0eu2xrNMcQpiyuWg+6T1wp6p6JZKSNyvBk
         rtvCIhli3DBH0wi3uvRkKC1I7t21SmVE7J8ijSAfZew79pw7y19gUhKT7oUVUXg+GuAg
         kNRdB2sNtNl4jng+MgGsJR1uQjJRkCI3fe9vuVajzsP5WX7UMZP2zIF1GKlUzx0aCTZ3
         c//w0w6JdkNNpMsb8t0Ce1w/++oJcAsr6x3Hnv0p6YyRP8FVqovX6xDF7ORFKRfJjVpG
         JLVXkI26Jl4c+fw1cBN1ykYEr4ZtDI7CzhVCprfoAbXHCFZ6PUFhfeWKtpx6bxm1Lr4h
         0isg==
X-Gm-Message-State: APjAAAXa5qgq0Np0xKDX4EcfoYsXlRFWvlLgHBxz4jdpvWSh9L8EGxeI
        yXHi4uAEdUpjTWF0t0CyWYuSbmyeViI9zw==
X-Google-Smtp-Source: APXvYqyeWUFA33qFqfl3sPquTqe6/sfRYpA7x0PgfM1qpojyxFDmNnmf7vo6xcpK8EEJHtHIbtO/AQ==
X-Received: by 2002:a17:906:3518:: with SMTP id r24mr22158673eja.133.1566923864171;
        Tue, 27 Aug 2019 09:37:44 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id br8sm3665083ejb.92.2019.08.27.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:37:43 -0700 (PDT)
Date:   Tue, 27 Aug 2019 18:37:41 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: Use dma_fence_array for implementing shared dma_resv fences
Message-ID: <20190827163741.GD2112@phenom.ffwll.local>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 26, 2019 at 04:57:22PM +0200, Christian König wrote:
> This is the new dma_fence_array based container for shared fences in the
> dma_resv object.
> 
> Advantage of this approach is that you can grab a reference to the
> current set of shared fences at any time, which allows us to drop the
> sequence number increment and makes the whole RCU handling much more
> easier.
> 
> Disadvantage is that RCU users now have to grab a reference instead of
> using the sequence counter. As far as I can see i915 was actually the
> only driver doing this.
> 
> So we optimize for adding more fences instead of reading them now.
> 
> Another behavior change worth noting is that the shared fences are now
> only visible after unlocking the dma_resv object or calling
> dma_resv_fences_commit() manually.

I think more specific point for publishing fences makes a lot of sense, so
this sounds like a solid improvement on the dma_resv api. I'm working on
some dma_fence instrumentation where that at least might be useful.

/me back to burried state

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
