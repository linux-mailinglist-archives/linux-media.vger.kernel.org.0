Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A10B198545
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 22:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbfHUULi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 21 Aug 2019 16:11:38 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:64492 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728044AbfHUULi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 16:11:38 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 18219228-1500050 
        for multiple; Wed, 21 Aug 2019 21:11:33 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
Message-ID: <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
Subject: Re: [RFC] replacing dma_resv API
Date:   Wed, 21 Aug 2019 21:11:31 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-08-21 13:31:37)
> Hi everyone,
> 
> In previous discussion it surfaced that different drivers use the shared and explicit fences in the dma_resv object with different meanings.
> 
> This is problematic when we share buffers between those drivers and requirements for implicit and explicit synchronization leaded to quite a number of workarounds related to this.
> 
> So I started an effort to get all drivers back to a common understanding of what the fences in the dma_resv object mean and be able to use the object for different kind of workloads independent of the classic DRM command submission interface.
> 
> The result is this patch set which modifies the dma_resv API to get away from a single explicit fence and multiple shared fences, towards a notation where we have explicit categories for writers, readers and others.

Fwiw, I would like the distinction here between optional fences
(writers, readers) and mandatory fences (others). The optional fences
are where we put the implicit fence tracking that clever userspace would
rather avoid. The mandatory fences (I would call internal) is where we
put the fences for tracking migration that userspace can not opt out of.
-Chris
