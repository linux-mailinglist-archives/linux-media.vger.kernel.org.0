Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906E535E3EF
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 18:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344716AbhDMQ2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 12:28:44 -0400
Received: from mga11.intel.com ([192.55.52.93]:27422 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345086AbhDMQ2n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 12:28:43 -0400
IronPort-SDR: j7AeHMcMi+hc/OyazTaVyG8GfPSGaT6DZvpLHRWCV9squLb/1Q6qdbFqTZtlOX4PTvYg2ddRxs
 Hbm5qmYoXKvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="191262086"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="191262086"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:21:18 -0700
IronPort-SDR: Q51ZUF7fUPgxel3O2ZVeJfjn/hFIrUOaCHA0a9nTOCojMvw50WfJKB6VLPSXbNQS/DgH8ZP5Ay
 AmhW2FitOWsQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="382016739"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:21:14 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D28A62082C;
        Tue, 13 Apr 2021 19:21:11 +0300 (EEST)
Date:   Tue, 13 Apr 2021 19:21:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v3 0/4] staging: media: intel-ipu3: Cleanup patchset for
 style issues
Message-ID: <20210413162111.GX3@paasikivi.fi.intel.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 08:58:19PM +0530, Mitali Borkar wrote:
> Changes from v2:- Rebased these four patces and made changes against
> mailine code

Thanks for the update, Mitali.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
