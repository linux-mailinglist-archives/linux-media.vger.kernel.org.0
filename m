Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786CE41BBFC
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 02:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243575AbhI2A7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 20:59:32 -0400
Received: from mga04.intel.com ([192.55.52.120]:32557 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243478AbhI2A7b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 20:59:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="222942660"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="222942660"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 17:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="519516971"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2021 17:57:49 -0700
Subject: Re: [PATCH 1/7] media: ipu3-cio2: Check num_planes and sizes in
 queue_setup
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
References: <20210928211033.2415162-1-ribalda@chromium.org>
 <20210928211033.2415162-2-ribalda@chromium.org>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <accfbf21-12b3-5384-eb03-011942bac759@linux.intel.com>
Date:   Wed, 29 Sep 2021 08:54:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210928211033.2415162-2-ribalda@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ricardo, thanks for your patch.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 9/29/21 5:10 AM, Ricardo Ribalda wrote:
> if (*num_planes && sizes[i] < q->format.plane_fmt[i].sizeimage)

-- 
Best regards,
Bingbu Cao
