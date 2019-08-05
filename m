Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488F1822A1
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 18:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbfHEQlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 12:41:50 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46183 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEQlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 12:41:50 -0400
Received: by mail-ed1-f66.google.com with SMTP id d4so79404013edr.13
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hf8FvBTAOyggpm2dvd4BtwrryCtsii7uz4O8VRrML7E=;
        b=Cyr53hdwUMN5whYeNI4sQtK4949Kf9XdSQAuLtcirO+KLENd/SqV8BIzUQ4PQxBGHZ
         jup80kW0eVZVml7QSMebZq7lVMVPh6I0FPLCTkSHYGUcvdOkng8Adf2FTUMEdIT3cyhb
         nPSKmvUnMUU2+CSRzh1KtfXMBeTKvZCpraqzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=hf8FvBTAOyggpm2dvd4BtwrryCtsii7uz4O8VRrML7E=;
        b=PPEkMEktez5KM6wZuchDRj8F0LPehexBPvY4ofAgFuRa8H+UmqsJeNF6uedTzcb8Tp
         ym6CbBDLROa4W5RHRuhj3L/1nzxCQprpYQGKU0Gulgyu7hPC+f31J2g/DBO1jM+lsbO6
         Jr/KBC/Nv/xcUxzAX8YqnTDd7dQyf7Nqj63Aum4Okkg5HjigD5HW/+WIJhnA3OiYU2JH
         dOcqim+p7l0V3GjRQWSm6MZ1CYigwvVVDojJmTJ8Bf8Uexc41gkBsRN28ukq4rD6IAk/
         0hDsWKOW78q3+j+Ghu6LRPnw3nLQo5h30UjB6T9u1RcUEvk5CY5WySM5eZwxU2MaYsX+
         qTUw==
X-Gm-Message-State: APjAAAVXsZJ+29ZI+zE+VpjWBnaDDhzSiKSfWuUPbQidrJiwqYXe+Rgl
        tm6040vwYDasMQWXOWfOAe0=
X-Google-Smtp-Source: APXvYqzB+kkvE6XHVSaOiar91jcBLzv+PjeK8RERQ/cfP8IvIxj7oGLsBKvncel8k1kqD4HhJ2fKEQ==
X-Received: by 2002:a17:906:c459:: with SMTP id ck25mr116923991ejb.32.1565023308629;
        Mon, 05 Aug 2019 09:41:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id b15sm7448204ejj.5.2019.08.05.09.41.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 09:41:47 -0700 (PDT)
Date:   Mon, 5 Aug 2019 18:41:46 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 5/5] dma-buf: nuke reservation_object seq
 number
Message-ID: <20190805164145.GW7444@phenom.ffwll.local>
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <20190805154554.3476-5-christian.koenig@amd.com>
 <156502126144.28464.11399426968315988701@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <156502126144.28464.11399426968315988701@skylake-alporthouse-com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 05, 2019 at 05:07:41PM +0100, Chris Wilson wrote:
> Quoting Christian König (2019-08-05 16:45:54)
> > @@ -214,16 +214,16 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >                 return 0;
> >  
> >  retry:
> > -       seq = read_seqcount_begin(&resv->seq);
> >         rcu_read_lock();
> >  
> > +       fence_excl = rcu_dereference(resv->fence_excl);
> >         fobj = rcu_dereference(resv->fence);
> >         if (fobj)
> >                 shared_count = fobj->shared_count;
> >         else
> >                 shared_count = 0;
> > -       fence_excl = rcu_dereference(resv->fence_excl);
> > -       if (read_seqcount_retry(&resv->seq, seq)) {
> > +
> > +       if (rcu_dereference(resv->fence_excl) != fence_excl) {
> 
> If I remember my rules correctly, rcu_dereference is a
> read-data-depends, which only means that a read through the pointer
> returned by rcu_dereference() is after the retrieval of that pointer.
> Nothing orders the retrieval of fence_excl vs shared_count (different
> pointers), so I think the last line should be:
> 
> smp_rmb();
> if (rcu_access_pointer(resv->fence_excl) != fence_excl)

Also, barriers must have a comment, the comment must be on both barriers
(if you don't have two, you're doing it wrong), and each barrier comment
must reference its counterpart.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
