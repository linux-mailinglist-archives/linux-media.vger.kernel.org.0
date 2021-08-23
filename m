Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DFB3F4644
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 10:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbhHWIBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 04:01:02 -0400
Received: from mga11.intel.com ([192.55.52.93]:2441 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235226AbhHWIBB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 04:01:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="213926185"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="213926185"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 01:00:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="683089408"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 01:00:14 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id C11312051E;
        Mon, 23 Aug 2021 11:00:12 +0300 (EEST)
Date:   Mon, 23 Aug 2021 11:00:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        awalls@md.metrocast.net, yong.zhi@intel.com, bingbu.cao@intel.com,
        djrscally@gmail.com, tian.shu.qiu@intel.com, serjk@netup.ru,
        aospan@netup.ru, tskd08@gmail.com, maintainers@bluecherrydvr.com,
        anton@corp.bluecherry.net, andrey.utkin@corp.bluecherry.net,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: switch from 'pci_' to 'dma_' API
Message-ID: <20210823080012.GD3@paasikivi.fi.intel.com>
References: <71a7e0029ce28ec748eb045c8381d354011cebe6.1629623093.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a7e0029ce28ec748eb045c8381d354011cebe6.1629623093.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks, Christophe.

On Sun, Aug 22, 2021 at 11:30:08AM +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below.
> 
> It has been compile tested.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
