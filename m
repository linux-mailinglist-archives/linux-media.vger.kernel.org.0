Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11603C3D92
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 17:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbhGKPTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jul 2021 11:19:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:58999 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235126AbhGKPTl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jul 2021 11:19:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="209699431"
X-IronPort-AV: E=Sophos;i="5.84,231,1620716400"; 
   d="scan'208";a="209699431"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2021 08:16:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,231,1620716400"; 
   d="scan'208";a="429383349"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2021 08:16:51 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 507FC20556;
        Sun, 11 Jul 2021 18:16:49 +0300 (EEST)
Date:   Sun, 11 Jul 2021 18:16:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Perform a single memset() for union
Message-ID: <20210711151649.GA3@paasikivi.fi.intel.com>
References: <20210711145101.1434065-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210711145101.1434065-1-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 11, 2021 at 07:51:01AM -0700, Kees Cook wrote:
> There is no need to memset() both dvs_grid_info and dvs_stat_grid_info
> separately: they are part of the same union. Instead, just zero the
> union itself. This additionally avoids a false positive (due to a
> gcc optimization bug[1]) when building with the coming FORTIFY_SOURCE
> improvements:
> 
> In function 'fortify_memset_chk',
>     inlined from 'sh_css_pipe_get_grid_info' at drivers/staging/media/atomisp/pci/sh_css.c:5186:3,
>     inlined from 'ia_css_stream_create' at drivers/staging/media/atomisp/pci/sh_css.c:9442:10:
> ./include/linux/fortify-string.h:199:4: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
>   199 |    __write_overflow_field();
>       |    ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101419
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
