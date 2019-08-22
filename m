Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FB69946A
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 15:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbfHVNC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 09:02:57 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34044 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731576AbfHVNC4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 09:02:56 -0400
Received: by mail-ed1-f68.google.com with SMTP id s49so7868182edb.1
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2019 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bEFie1V4YsBEnCBAlHqq7MFKWHgQ85EhvEaFWOkyQHo=;
        b=hBi1/a5Sk53J8hG1FJGP1eO8pUWuEP+z/NWMMFF+FUlpZZEW0DU2RYUVogAsw0khcd
         R/WmDkhX4CGY9lGlnjqNCMsXomCJAfIGzhp+pfe81eTusSg3XRlgU+osCxMP9leZoB6y
         NcwA8WQeb6Vft5qggbpDgfJp9UzE9H18g43s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=bEFie1V4YsBEnCBAlHqq7MFKWHgQ85EhvEaFWOkyQHo=;
        b=TRQtIWO9Zk29Q3iyRprll5ZjfmXa3t+Br3xW4MekK/jbPWiosPwOasNPO/PJG+xx0p
         CzaJJgkjdvD/NWs9rVu/UbpGTJYhbSTA+ERwsXky9B5dyd+XFzO/59iJVhmGGsDnsWUY
         YMzz/tiGBYBkLo7A4mql4MYV8YQzASEonl4JzqzUB+nKMCJ4BjHqvvq0+vWjHwzziowi
         bPhSFE+iucmiRYxmWHNb3asJYvhENQBC0D0rkP2n4LcHzWY4RVjL6g0C3KbzVuI5IGz9
         xesJHfKnhgvZgdmDwbuQ+Bc7s5tGHoDgmmTKjyxPsg3eylLf/KtUgSMYdgfTnCAYwI+f
         4TPQ==
X-Gm-Message-State: APjAAAU9siJI/wWlPLtWoIndPvY8Wr+TeNhlQH8clyojjclWl92xzEZS
        QOSqIt8GbUwRUChdQVs4DEUSYQ==
X-Google-Smtp-Source: APXvYqzVizM+IhVvZ/KDzjJkM0D3bX0ibIr5zP64xbY4bQ0J9bsHBAipHCk0eVnBmhuRecD8ZiCGtQ==
X-Received: by 2002:aa7:d58d:: with SMTP id r13mr41129002edq.118.1566478975166;
        Thu, 22 Aug 2019 06:02:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id b3sm2273200ejl.55.2019.08.22.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 06:02:54 -0700 (PDT)
Date:   Thu, 22 Aug 2019 15:02:51 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        chris@chris-wilson.co.uk, daniel.vetter@ffwll.ch,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 07/10] dma-buf/resv: add new fences container
 implementation
Message-ID: <20190822130251.GT11147@phenom.ffwll.local>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-8-christian.koenig@amd.com>
 <20190821160454.GN11147@phenom.ffwll.local>
 <c1ff88ef-0e49-fd7a-6317-de432a04ddf2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1ff88ef-0e49-fd7a-6317-de432a04ddf2@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 22, 2019 at 10:23:29AM +0200, Christian König wrote:
> Am 21.08.19 um 18:04 schrieb Daniel Vetter:
> > On Wed, Aug 21, 2019 at 02:31:44PM +0200, Christian König wrote:
> > > [SNIP]
> > > +	/* Try to drop the last reference */
> > > +	if (!dma_fence_array_recycle(staged))
> > Without an rcu barrier here you're not syncing to new clients at all.
> > I don't think this works, and I expect that once you've readded all the
> > barriers and retry loops we're back to seqlocks.
> 
> The key difference is that RCU users now use dma_fence_get_rcu_safe() to
> grab a reference to the current set of fences.
> 
> In other words the whole array is reference counted and RCU protected
> instead of each individual entry in the array.
> 
> This way you don't need the sequence count any more because you grab a
> reference to all of them at once and then can be sure that they don't
> change.

Hm yeah ... I think there's still some users left that have an open-coded
rcu section though. But yeah if you can concince Chris that this is ok I
think it makes sense as an overall cleanup of the hand-rolled fences array
we have for shared fences. But I'd really like to untangle it from the
entire semantics discussion, since that seems entirely unrelated.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
