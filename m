Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215BC390527
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhEYPXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:23:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:5082 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230240AbhEYPXk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:23:40 -0400
IronPort-SDR: T07BKM34NuPCZMpzKxGBgWRY66WkuURhaqW6aDKV5zTiIiokog2FukjMI1LolDrKXtd4haLJbD
 pcY6XfiHlyDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="201970910"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="201970910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 08:22:09 -0700
IronPort-SDR: SWF6O43nY/kiGRsfHONX8Dd2Jg1+OD9dypljQq9VJLTRlOqqUPtpoz6dYA/MlCxq1tUYdDPn/P
 0Ntnu5F5KfOw==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="397385026"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 08:22:07 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E16FB202C8;
        Tue, 25 May 2021 18:22:04 +0300 (EEST)
Date:   Tue, 25 May 2021 18:22:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     lijian_8010a29@163.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: Re: [PATCH] media: v4l2-dev.c: Modified the macro SET_VALID_IOCTL
Message-ID: <20210525152204.GF3@paasikivi.fi.intel.com>
References: <20210525094148.74300-1-lijian_8010a29@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525094148.74300-1-lijian_8010a29@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 25, 2021 at 05:41:48PM +0800, lijian_8010a29@163.com wrote:
> From: lijian <lijian@yulong.com>
> 
> Macros starting with if should be enclosed by a do - while loop
> to avoid possible if/else logic defects.
> So modified the macro SET_VALID_IOCTL with do - while loop.
> 
> Signed-off-by: lijian <lijian@yulong.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
