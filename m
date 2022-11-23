Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997EE6365E4
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 17:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238106AbiKWQeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 11:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237578AbiKWQd7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 11:33:59 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F18E27DC1
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:33:58 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id x102so25658007ede.0
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vQ8nm6+WyKeJ4NSkaQqYp2teKXcJsmSR2OlnL5nJCng=;
        b=LTaFlYw0Pm8utr+zS/UXk0FrQTM6S4ZrXc7dE2wTm7nTS9rZ8ucryQq8shd4RhG9kc
         r71lmcHkASsmyfN1/CaYdQBfvLaqjDdGshMjTLB6NY6FGg2bX5UtJmqsuDDXnT6Fjk47
         ERYCfdANhr7rbF2w+N6ES5m3u7CEOUYzqV9sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ8nm6+WyKeJ4NSkaQqYp2teKXcJsmSR2OlnL5nJCng=;
        b=aExchVgu7P44VOVoXCwVmQl3ueEKYvH0q1O+IfDSolosL4kmrx2ZILrxaVKy5pQisn
         IF//8S4qQTMPqFa7Ol0JIhGl91wRYVNIjzuwQOvDRyE6FB+P2UBXmKOwmz4tVdasMvEN
         qNfPT+0LQkx0c4ZzSL3eAEjvKgjvohG/yFLnpl8oC0dV9BYY75XFqJfZqJCgRkQrnBYe
         y5oPmBQT/Y1m7LtMFnKNy9c4mcaSR4m31Z4luNcyX4yIL6aIYEmSh48h1SVLEJ7HOA5b
         qS9REJwS5Y7o7S8K38RQxUt/m34XyBVcWkyqIBIvQnb1PYC1lRG8+dkwr3NExr5WKKdv
         uUPw==
X-Gm-Message-State: ANoB5pkPtgLGW88/mh+KcOjiBgW+A9D9FWYkmQEncY4lYHJZn1jTLmZj
        hMXKaq5j9TQ9peDFdpXr5ds6Bg==
X-Google-Smtp-Source: AA0mqf4Enr1qM6eoPL9aF0axGh9DxgF+M99FiwcrAbYtdUzrx2lqXegdh98KtI4edE32ukwrcdXh6Q==
X-Received: by 2002:a05:6402:3719:b0:461:4f34:d8f4 with SMTP id ek25-20020a056402371900b004614f34d8f4mr26937012edb.144.1669221236923;
        Wed, 23 Nov 2022 08:33:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id ez6-20020a056402450600b004643f1524f3sm7770969edb.44.2022.11.23.08.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:33:56 -0800 (PST)
Date:   Wed, 23 Nov 2022 17:33:54 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Stone <daniel@fooishbar.org>, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <Y35LcspZ385IC4lJ@phenom.ffwll.local>
References: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
 <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
 <20221123103338.238571e1@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123103338.238571e1@eldfell>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 23, 2022 at 10:33:38AM +0200, Pekka Paalanen wrote:
> On Tue, 22 Nov 2022 18:33:59 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
> > We should have come up with dma-heaps earlier and make it clear that 
> > exporting a DMA-buf from a device gives you something device specific 
> > which might or might not work with others.
> > 
> > Apart from that I agree, DMA-buf should be capable of handling this. 
> > Question left is what documentation is missing to make it clear how 
> > things are supposed to work?
> 
> Perhaps somewhat related from Daniel Stone that seems to have been
> forgotten:
> https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.com/
> 
> It aimed mostly at userspace, but sounds to me like the coherency stuff
> could use a section of its own there?

Hm yeah it would be great to land that and then eventually extend. Daniel?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
