Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A103F7114
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 10:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhHYI0Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 04:26:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:1525 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229780AbhHYI0Y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 04:26:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217199744"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="217199744"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:25:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="527128771"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:25:37 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 58598201ED;
        Wed, 25 Aug 2021 11:25:35 +0300 (EEST)
Date:   Wed, 25 Aug 2021 11:25:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: Request API is no longer experimental
Message-ID: <20210825082535.GP3@paasikivi.fi.intel.com>
References: <20210825002337.6561-1-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825002337.6561-1-ezequiel@vanguardiasur.com.ar>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 24, 2021 at 09:23:37PM -0300, Ezequiel Garcia wrote:
> The Request API is currently used and specified as part of the
> Memory-to-memory Stateless Video Decoder Interface [1].
> 
> This can now be considered as non-experimental and stable, given
> the decoder API has been used by products since a couple years,
> supported by several drivers and userspace frameworks,
> 
> [1] Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
