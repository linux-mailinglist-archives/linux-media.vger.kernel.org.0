Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABAA3906C2
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 18:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhEYQjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 12:39:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:43154 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232803AbhEYQjI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 12:39:08 -0400
IronPort-SDR: 7XvTiMokPdGo4LCYVooDE5+VxCqFtzKpdAdpWToDnUp2a8Mz3/UFDJBAE3qwwy8dMHaIuF2gKB
 tm3njwEcY0PQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189360028"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="189360028"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:37:35 -0700
IronPort-SDR: eDYEv6J9mE48IvFZZmQYVJZZg1dkizKn7462J1jAilYLdjkiuNLklBUak49FYkqeZK5tLtFBHT
 5KWc6U1bg8Qg==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="546698766"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:37:33 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 75B3E20337;
        Tue, 25 May 2021 19:37:30 +0300 (EEST)
Date:   Tue, 25 May 2021 19:37:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Nguyen Dinh Phi <phind.uet@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: atomisp: Use sysfs_emit() instead of sprintf()
 where appropriate
Message-ID: <20210525163730.GJ3@paasikivi.fi.intel.com>
References: <20210513034650.252993-1-phind.uet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513034650.252993-1-phind.uet@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 13, 2021 at 11:46:50AM +0800, Nguyen Dinh Phi wrote:
> sysfs_emit() is preferred over raw sprintf() for sysfs attributes since it
> knows about the sysfs buffer specifics and has some built-in sanity checks.
> 
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
