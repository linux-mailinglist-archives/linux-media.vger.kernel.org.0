Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A232EB137
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 18:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729536AbhAERTY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 12:19:24 -0500
Received: from mga12.intel.com ([192.55.52.136]:22675 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729242AbhAERTY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 12:19:24 -0500
IronPort-SDR: wGgag4AiFFvF0isKkTN5YH7Tebdf23Uxk+kwrwZfnYwIuCgDDgwiyPCFSyOopFlSgptQ4ywvUq
 +GMxmgWpRGBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="156338285"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="156338285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 09:17:38 -0800
IronPort-SDR: u4DGOaxng84q7iXd7QVyqEabe4yyA+Ql/9INcaEvRx7Kdtdes+kNYJV5zRAHe+Iui37vN2eE26
 WpNOj1WjpORg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="361239554"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 09:17:37 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7EF8620757; Tue,  5 Jan 2021 19:17:35 +0200 (EET)
Date:   Tue, 5 Jan 2021 19:17:35 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ccs: Make (non-)use of uninitialised variables more
 robust
Message-ID: <20210105171735.GT11878@paasikivi.fi.intel.com>
References: <20210105124914.22900-1-sakari.ailus@linux.intel.com>
 <9ea0a248-a317-6536-0786-d85ceb585928@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea0a248-a317-6536-0786-d85ceb585928@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 05, 2021 at 05:18:08PM +0100, Hans Verkuil wrote:
> On 05/01/2021 13:49, Sakari Ailus wrote:
> > GCC with W=2 level of kernel compiler warnings warns about the use of
> > uninitialised variables in a few locations. While these uninitialised
> > variables were not used in reality, this still produced compiler warnings.
> > 
> > Address this by assigning the variables to NULL and checking for NULL in
> > places it is not expected, returning -EPROTO in that case. This provides
> > at least some sanity checking at runtime as the compiler appears unable to
> > do that at compile time.
> > 
> > Reported-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> This fixes the warnings!

Thanks!

I think I'll switch the error code to something else. -EPROTO is already in
use, so I'll send v2 with -EIO.

-- 
Sakari Ailus
