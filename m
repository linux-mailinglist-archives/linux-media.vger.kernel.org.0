Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71813E7BB9
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 17:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242619AbhHJPID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 11:08:03 -0400
Received: from mga06.intel.com ([134.134.136.31]:46236 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239566AbhHJPID (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 11:08:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="275956713"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="275956713"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 08:04:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="526178724"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 08:04:13 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9D9C820345;
        Tue, 10 Aug 2021 18:04:11 +0300 (EEST)
Date:   Tue, 10 Aug 2021 18:04:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] media: atomisp: Fix error handling in probe
Message-ID: <20210810150411.GG3@paasikivi.fi.intel.com>
References: <20210810115303.9089-1-novikov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810115303.9089-1-novikov@ispras.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 02:53:03PM +0300, Evgeny Novikov wrote:
> There were several issues with handling errors in lm3554_probe():
> - Probe did not set the error code when v4l2_ctrl_handler_init() failed.
> - It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
>   and media_entity_pads_init().
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
