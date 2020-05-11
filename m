Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6241CD582
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 11:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgEKJlK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 May 2020 05:41:10 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:62201 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725790AbgEKJlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 05:41:10 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 21157987-1500050 
        for multiple; Mon, 11 May 2020 10:41:05 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200511091142.208787-2-daniel.vetter@ffwll.ch>
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch> <20200511091142.208787-2-daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/3] dma-fence: use default wait function for mock fences
From:   Chris Wilson <chris@chris-wilson.co.uk>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Message-ID: <158919006380.1729.6928823811672806738@build.alporthouse.com>
User-Agent: alot/0.8.1
Date:   Mon, 11 May 2020 10:41:03 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Vetter (2020-05-11 10:11:41)
> No need to micro-optmize when we're waiting in a mocked object ...

It's setting up the expected return values for the test.
-Chris
