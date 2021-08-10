Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7963E8498
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 22:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbhHJUvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 16:51:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:16577 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232783AbhHJUvL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 16:51:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="213136584"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="213136584"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 13:50:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="421337800"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 13:50:46 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id EE8AB20345;
        Tue, 10 Aug 2021 23:50:43 +0300 (EEST)
Date:   Tue, 10 Aug 2021 23:50:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH v2] media: atomisp: Fix error handling in probe
Message-ID: <20210810205043.GK3@paasikivi.fi.intel.com>
References: <20210810162943.19852-1-novikov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810162943.19852-1-novikov@ispras.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 07:29:43PM +0300, Evgeny Novikov wrote:
> There were several issues with handling errors in lm3554_probe():
> - Probe did not set the error code when v4l2_ctrl_handler_init() failed.
> - It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
>   and media_entity_pads_init().
> - It did not set the error code for failures of v4l2_ctrl_new_custom().
> - Probe did not free resources in case of failures of
>   atomisp_register_i2c_module().
> 
> The patch fixes all these issues.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
