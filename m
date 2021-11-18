Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69183455B09
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 12:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344343AbhKRL7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 06:59:30 -0500
Received: from mga14.intel.com ([192.55.52.115]:45858 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344409AbhKRL71 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 06:59:27 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234407490"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="234407490"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 03:56:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="505577255"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 03:56:07 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E050020138;
        Thu, 18 Nov 2021 13:56:04 +0200 (EET)
Date:   Thu, 18 Nov 2021 13:56:04 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     eajames@linux.ibm.com, mchehab@kernel.org, joel@jms.id.au,
        andrew@aj.id.au, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/10] media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg
 for log
Message-ID: <YZY/VCt8WZx/4dFt@paasikivi.fi.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-3-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118074030.685-3-jammy_huang@aspeedtech.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jammy,

On Thu, Nov 18, 2021 at 03:40:23PM +0800, Jammy Huang wrote:
> The debug log level, 0~3, is controlled by module_param, debug.
> The higher the value, the more the information.
>   0: off
>   1: info
>   2: debug
>   3: register operations
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Just wondering: what's the purpose of switching to v4l2_*() functions for
printing when dev_*() equivalents already can do the same?

-- 
Sakari Ailus
