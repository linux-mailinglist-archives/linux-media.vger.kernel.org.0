Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D480390676
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 18:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhEYQUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 12:20:08 -0400
Received: from mga04.intel.com ([192.55.52.120]:62282 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231419AbhEYQUI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 12:20:08 -0400
IronPort-SDR: iQKb7B4DCtvIUeDRR06l5qWuliNTtZg7i/leydPcw2WKhoxEY9sf9t2FFqTsE8k6OvPeuR3cfr
 peIwwbnIajTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="200336565"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="200336565"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:18:33 -0700
IronPort-SDR: LIWuLww+11lC2yv/j2JWjUMB6GYCTANZu6SA1YPq3G62mjor1ShrgbmJc0/47CTB4QHTMV3LWL
 KV0UeAPX88fQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="476488634"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:18:31 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1EB3320337;
        Tue, 25 May 2021 19:18:00 +0300 (EEST)
Date:   Tue, 25 May 2021 19:18:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] staging: media: atomisp: code clean up
Message-ID: <20210525161759.GH3@paasikivi.fi.intel.com>
References: <20210508124334.GA1403@agape.jhs>
 <cover.1620479607.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620479607.git.paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 08, 2021 at 04:16:47PM +0300, Pavel Skripkin wrote:
> This patch series include code clean up for input_system.c.
> 
> Changes from v4:
>   Fixed commit message in 3rd patch
> 
> Changes from v3:
>   Removed returns at the end of void functions
>   Split all changes into 3 patches
> 
> Changes from v2:
>   Removed useless returns
> 
> 
> Pavel Skripkin (3):
>   staging: media: atomisp: remove useless breaks
>   staging: media: atomisp: remove dublicate code
>   staging: media: atomisp: remove useless returns
> 
>  .../hive_isp_css_common/host/input_system.c   | 62 -------------------
>  1 file changed, 62 deletions(-)

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
