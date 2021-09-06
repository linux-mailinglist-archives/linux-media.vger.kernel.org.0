Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D5540175F
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 09:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240361AbhIFH5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 03:57:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:38491 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230466AbhIFH5M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 03:57:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219968292"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="219968292"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 00:56:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="448515225"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 00:56:05 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6DD73204C6;
        Mon,  6 Sep 2021 10:56:03 +0300 (EEST)
Date:   Mon, 6 Sep 2021 10:56:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ths8200 needs V4L2_ASYNC
Message-ID: <20210906075603.GD3@paasikivi.fi.intel.com>
References: <20210904232808.25638-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904232808.25638-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 04, 2021 at 04:28:08PM -0700, Randy Dunlap wrote:
> Fix the build errors reported by the kernel test robot by
> selecting V4L2_ASYNC:
> 
> mips-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_remove':
> ths8200.c:(.text+0x1ec): undefined reference to `v4l2_async_unregister_subdev'
> mips-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_probe':
> ths8200.c:(.text+0x404): undefined reference to `v4l2_async_register_subdev'
> 
> Fixes: ed29f89497006 ("media: i2c: ths8200: support asynchronous probing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
