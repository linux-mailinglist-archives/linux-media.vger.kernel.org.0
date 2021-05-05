Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820B6373D03
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbhEEOHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:07:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:56594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232569AbhEEOHs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 10:07:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57B47610D2;
        Wed,  5 May 2021 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620223611;
        bh=OjNXdtLe+rldbt/eqf2MzCXHGnPYO6PJB+Ud+Wzr38k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K4+OsyGPs1zXOojHu74svR1YSoxWe1oURMRbr+cAqnG6P83C+wzhhyB1dh1+Gt16v
         HLa7Jdu63iOhY5UmIgAtLPMcWiNNlQ6mB+O7FFbcVTjOBaidr0oPDZL/hN40wKPV0l
         IDwI38xSYDXaNT8/yhgWidCuGhv/KlyY/9QxGKrtU4x54adPkNUq8/YWxnulJCPtk8
         r1j5PD/c3eZ/Khv9AxovP6rcAlc9Gy9GENAfcpJYoCQXZGhAsX0PaiAnxPTWOW8poO
         d8mGE2yTq0V1vgcKKVAMt7TaF/sQrkfYGfcmLiwN09e5GUbOQji0Z9gWLjuOCqI86m
         j5dIoFxCk2LbA==
Date:   Wed, 5 May 2021 16:06:45 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>, <linuxarm@huawei.com>,
        <mauro.chehab@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 25/25] media: i2c: ccs-core: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210505160645.1d197193@coco.lan>
In-Reply-To: <20210505133548.00005c1a@Huawei.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <83ec24acb15f17e2ce589575c2f5eb7bdd1daf28.1620207353.git.mchehab+huawei@kernel.org>
        <20210505103409.GN3@paasikivi.fi.intel.com>
        <20210505125700.4a7584ca@coco.lan>
        <20210505125857.7f30d8fa@coco.lan>
        <20210505133548.00005c1a@Huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

Em Wed, 5 May 2021 13:35:48 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> > > [PATCH] media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
> > > 
> > > The pm_runtime_get_sync() internally increments the
> > > dev->power.usage_count without decrementing it, even on errors.
> > > 
> > > There is a bug at ccs_pm_get_init(): when this function returns
> > > an error, the stream is not started, and RPM usage_count
> > > should not be incremented. However, if the calls to
> > > v4l2_ctrl_handler_setup() return errors, it will be kept
> > > incremented.
> > > 
> > > At ccs_suspend() the best is to replace it by the new
> > > pm_runtime_resume_and_get(), introduced by:
> > > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > in order to properly decrement the usage counter automatically,
> > > in the case of errors.
> > > 
> > > Fixes: 96e3a6b92f23 ("media: smiapp: Avoid maintaining power state information")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Per Sakari's request (for practical reasons on backporting and
c/c stable), this was split into two separate patches, one
fixing the issues, and a separate trivial one with just the
pm_runtime_resume_and_get(). I'm adding your RB on both.

Thanks,
Mauro
