Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9D57C166
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 14:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbfGaMdk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 31 Jul 2019 08:33:40 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:61736 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726259AbfGaMdk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 08:33:40 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17759077-1500050 
        for multiple; Wed, 31 Jul 2019 13:33:31 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190731113853.51779-1-christian.koenig@amd.com>
In-Reply-To: <20190731113853.51779-1-christian.koenig@amd.com>
Message-ID: <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
Subject: Re: [PATCH] dma-buf: add more reservation object locking wrappers
Date:   Wed, 31 Jul 2019 13:33:30 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-07-31 12:38:53)
> Complete the abstraction of the ww_mutex inside the reservation object.
> 
> This allows us to add more handling and debugging to the reservation
> object in the future.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Looks entirely mechanical,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Quietly opines for s/reservation_object/dma_reservation/
-Chris
