Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16EF1390661
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 18:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbhEYQRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 12:17:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:1722 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232656AbhEYQRF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 12:17:05 -0400
IronPort-SDR: MXnEhn8fbH0ZL5hovJF7zRUfBPXf4sU/qcBQvqOmnyGSXEWONyUtVnNvHcpprYHdEZw02/Rght
 m6g6dNuxhiRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="199178611"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="199178611"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:15:33 -0700
IronPort-SDR: vzdYtd4OXnte46NZji95265GhqVB8lQgcSH/GQ6MHj8cQQqknKyCccd/OlC2ZThxWy7WVpArdM
 V+oYK2rHu9DQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="476487564"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:15:31 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1B5C620337;
        Tue, 25 May 2021 19:15:29 +0300 (EEST)
Date:   Tue, 25 May 2021 19:15:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martiros Shakhzadyan <vrzh@vrzh.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: media: atomisp: Fix minor issues in
Message-ID: <20210525161528.GG3@paasikivi.fi.intel.com>
References: <20210508235622.300394-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508235622.300394-1-vrzh@vrzh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 08, 2021 at 07:56:18PM -0400, Martiros Shakhzadyan wrote:
> The following series of patches resolve some style and other minor
> issues in sh_css.c
> 
> Martiros Shakhzadyan (4):
>   staging: media: atomisp: Resolve goto style issue in sh_css.c
>   staging: media: atomisp: Remove unnecessary parens in sh_css.c
>   staging: media: atomisp: Use kcalloc instead of kzalloc with multiply
>     in sh_css.c
>   staging: media: atomisp: Fix line continuation style issue in sh_css.c
> 
>  drivers/staging/media/atomisp/pci/sh_css.c | 42 +++++++++++-----------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Thanks!

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
