Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BF52A787E
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKEIBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:01:47 -0500
Received: from mga02.intel.com ([134.134.136.20]:41524 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKEIBr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 03:01:47 -0500
IronPort-SDR: GuScLjC1MY2VUFpbyZZVkvZfpHJA5RYPJdFAhIIUjmMjAxOtVzGT8wY8CMs8fN+7WB8A2toXKA
 pppbjCRbZClQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="156335233"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="156335233"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:01:46 -0800
IronPort-SDR: rpvNT74G1NaU7BKNz0F4TaJC4eTn5A/2kp424p/9TgrSEwGKc+ZT0vWEorCKz6WGeXXQ0fTxaA
 u4P+Av3NsGbA==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="352965672"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:01:45 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 336EC20901; Thu,  5 Nov 2020 10:01:43 +0200 (EET)
Date:   Thu, 5 Nov 2020 10:01:43 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 003/106] smiapp: Calculate CCS limit offsets and limit
 buffer size
Message-ID: <20201105080142.GV26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-3-sakari.ailus@linux.intel.com>
 <20201105084338.23327eea@coco.lan>
 <20201105085859.250ff135@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105085859.250ff135@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Nov 05, 2020 at 08:58:59AM +0100, Mauro Carvalho Chehab wrote:
> > static int smiapp_module_init(void)
> > {
> > 	struct ccs_limit_offset ccs_limit_offsets[CCS_L_LAST + 1];
> > 	unsigned int i, l;
> 
> 
> Ok, it sounds that you start using this on patch 007/106.
> 
> So, it sounds that you should just need to add "static" to its definition.

Agreed, I'll add that for v3.

-- 
Sakari Ailus
