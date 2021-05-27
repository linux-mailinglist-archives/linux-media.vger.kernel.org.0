Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659F93936AB
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 21:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbhE0Tyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 15:54:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:30929 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234847AbhE0Tyc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 15:54:32 -0400
IronPort-SDR: E4qv/9KaH5DrZLvFMJ9iyun+0LXpQQM9of3SE0NwpJ0qnQHW6ZxGqByiy7yiKGf07M8fNkTEBx
 m1M9YFzD2qLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="199779939"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; 
   d="scan'208";a="199779939"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 12:52:57 -0700
IronPort-SDR: pykGfpnCpfM7zswMkG1eNMwP9EvLV5DsCACCVn3dUeT7jqZBMj0NRGrSZAVwLC8FKINODHNq71
 ZMTuGZ+adxrw==
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; 
   d="scan'208";a="547747177"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 12:52:55 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1C2A120248;
        Thu, 27 May 2021 22:52:23 +0300 (EEST)
Date:   Thu, 27 May 2021 22:52:23 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: Remove checks before
 kfree/kvfree
Message-ID: <20210527195222.GK3@paasikivi.fi.intel.com>
References: <20210527193922.25225-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527193922.25225-1-fmdefrancesco@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 27, 2021 at 09:39:22PM +0200, Fabio M. De Francesco wrote:
> Removed checks for pointers != NULL before freeing memory. If kvfree()
> and kfree() are given NULL pointers no operations are performed, so
> there is no need for the above-mentioned checks. Coccinelle detected the
> second of the two unnecessary checks.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
