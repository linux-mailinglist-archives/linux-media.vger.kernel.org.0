Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C663741B8
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 18:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234962AbhEEQkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 12:40:43 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3033 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbhEEQit (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 12:38:49 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Fb2Cw7414z6tm0f;
        Thu,  6 May 2021 00:26:52 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 18:37:50 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 17:37:49 +0100
Date:   Wed, 5 May 2021 17:36:10 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>, <linuxarm@huawei.com>,
        <mauro.chehab@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 25/25] media: i2c: ccs-core: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210505173610.000027e7@Huawei.com>
In-Reply-To: <20210505160645.1d197193@coco.lan>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <83ec24acb15f17e2ce589575c2f5eb7bdd1daf28.1620207353.git.mchehab+huawei@kernel.org>
        <20210505103409.GN3@paasikivi.fi.intel.com>
        <20210505125700.4a7584ca@coco.lan>
        <20210505125857.7f30d8fa@coco.lan>
        <20210505133548.00005c1a@Huawei.com>
        <20210505160645.1d197193@coco.lan>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 May 2021 16:06:45 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Jonathan,
> 
> Em Wed, 5 May 2021 13:35:48 +0100
> Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:
> 
> > > > [PATCH] media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
> > > > 
> > > > The pm_runtime_get_sync() internally increments the
> > > > dev->power.usage_count without decrementing it, even on errors.
> > > > 
> > > > There is a bug at ccs_pm_get_init(): when this function returns
> > > > an error, the stream is not started, and RPM usage_count
> > > > should not be incremented. However, if the calls to
> > > > v4l2_ctrl_handler_setup() return errors, it will be kept
> > > > incremented.
> > > > 
> > > > At ccs_suspend() the best is to replace it by the new
> > > > pm_runtime_resume_and_get(), introduced by:
> > > > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > > in order to properly decrement the usage counter automatically,
> > > > in the case of errors.
> > > > 
> > > > Fixes: 96e3a6b92f23 ("media: smiapp: Avoid maintaining power state information")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>    
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> Per Sakari's request (for practical reasons on backporting and
> c/c stable), this was split into two separate patches, one
> fixing the issues, and a separate trivial one with just the
> pm_runtime_resume_and_get(). I'm adding your RB on both.
Makes sense.

Jonathan

> 
> Thanks,
> Mauro

