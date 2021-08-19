Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A983F161E
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 11:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbhHSJ2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 05:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbhHSJ2a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 05:28:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B0AC061575;
        Thu, 19 Aug 2021 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=o71atK1N/ttros2m0GUwiV587h5QYRfIAhyzKk18UQQ=; b=iFi3JwVYlsdso3W4Dc3dMUU70s
        XK19q5yE4rJdVY/Sl0nQRrQcs3HQU+QdWs7bY2S/Gr4Tj9PyTUGNzQYrz+Y/khCli0gdeUHxt8xv7
        e2pz+vw0+beWpW7vjuoPPoYDMfBC3OAdeIHdKTl1oeB0gGA7X0MgcsgRDSq2mnM5vYeIQHiVikFMR
        0x51mSFLKcjeUESvZoZOgiRjbGX0bVOyLH5WuUF8c2Np42kh34ZGpOmT+fha6YQwrjP4LMFKFiua0
        qYPF547PsvMrvJF2HGkhmk4YL4o3fnbtOt8l77GP/jH9XCLv4Drdm01suCQ4bDnbNgamIu2S6SXlT
        wVHeRNTw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mGeJG-004ruk-MC; Thu, 19 Aug 2021 09:26:09 +0000
Date:   Thu, 19 Aug 2021 10:26:02 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 8/9] kernel: export task_work_add
Message-ID: <YR4jqvZtu0gbaVmx@infradead.org>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-9-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-9-desmondcheongzx@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 03:38:23PM +0800, Desmond Cheong Zhi Xi wrote:
> +EXPORT_SYMBOL(task_work_add);

EXPORT_SYMBOL_GPL for this kinds of functionality, please.
