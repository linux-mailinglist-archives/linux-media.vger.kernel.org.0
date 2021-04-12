Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE5E35D297
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 23:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238902AbhDLV3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 17:29:06 -0400
Received: from mga12.intel.com ([192.55.52.136]:21127 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231854AbhDLV3F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 17:29:05 -0400
IronPort-SDR: SZL7e2556Yq0dnhCqci2icZT0YrHKzdKjz4nnJGFKhlqAuY50L9/lh2U3m7ZudPDAQ+9lne92J
 Vk1cJIqEuwbw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="173774149"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="173774149"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 14:28:47 -0700
IronPort-SDR: rTZO2P2TuD/UHwL02577Aud/0N8nBf+2UoHTqRWlzoMUp1iJ9EYBTSl1u81AMaz914rL8jE1i2
 PNXL+FBj8Slw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="532030511"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 14:28:45 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AEF74200E8;
        Tue, 13 Apr 2021 00:28:43 +0300 (EEST)
Date:   Tue, 13 Apr 2021 00:28:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martiros Shakhzadyan <vrzh@vrzh.net>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Removed a function entry log
Message-ID: <20210412212843.GO3@paasikivi.fi.intel.com>
References: <20210412155959.6647-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412155959.6647-1-vrzh@vrzh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martiros,

Thanks for the patch.

On Mon, Apr 12, 2021 at 11:59:59AM -0400, Martiros Shakhzadyan wrote:
> Removed a function entry log in ov2722_remove, as ftrace is a preferred
> method for function entry/exit tracing.
> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>

For this and your other atomisp patch:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
