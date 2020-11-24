Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EB82C21F4
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731678AbgKXJm7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:42:59 -0500
Received: from mga14.intel.com ([192.55.52.115]:6375 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgKXJm6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:42:58 -0500
IronPort-SDR: 13GKq5DjEpBS6O/D7vI4pNKw4E6ywYOnX7BNpcCXhVdzyVsi58DHeRDhPVW2cGEeq60Pof/GPs
 7y/SziuWcJNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171137349"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="171137349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 01:42:58 -0800
IronPort-SDR: qEprpNnqc9rGcCvcI4GmqyK+Pq7MKuSCYEEZ3anIkwfBZ5kvbLxEGLlZ9/vXoFQEGFAHx8zzeA
 7vqf0bCs82MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="546768087"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2020 01:42:56 -0800
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     Robert Foss <robert.foss@linaro.org>, dongchun.zhu@mediatek.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ben Kao <ben.kao@intel.com>
References: <20201116155008.118124-1-robert.foss@linaro.org>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <cf0b935d-3ccd-8360-1b52-89fab0b181eb@linux.intel.com>
Date:   Tue, 24 Nov 2020 17:40:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116155008.118124-1-robert.foss@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Robert

I remember that the full size of ov8856 image sensor is 3296x2480 and we can get the 3280x2464
frames based on current settings.

Do you have any issues with this mode?

On 11/16/20 11:50 PM, Robert Foss wrote:
> 0x3812, 0x00},
> 236 {0x3813, 0x01},

-- 
Best regards,
Bingbu Cao
