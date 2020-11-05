Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA7C2A7CC9
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 12:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgKELSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 06:18:12 -0500
Received: from mga18.intel.com ([134.134.136.126]:26310 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKELSL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 06:18:11 -0500
IronPort-SDR: Ps+UUsa8kcDZgfUqAQ3hcAbWGuhMU/j/H7Fi56ajcc09aBsewMsZNt1WS1i30Hcc+uIBhbZLy2
 L3AsbD3vrOoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="157144308"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="157144308"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:18:11 -0800
IronPort-SDR: ylHE/88QJjqEgJs1FTjnDXgKCj2TlHxuKiLC73suMgTG4KCjjm9W2Q5vb1sgOZel/UtjbImNhn
 p2R5fQOFQ+pA==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="539360308"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:18:10 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 497EB20901; Thu,  5 Nov 2020 13:18:07 +0200 (EET)
Date:   Thu, 5 Nov 2020 13:18:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 033/106] ccs: Add CCS static data parser library
Message-ID: <20201105111807.GB26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-26-sakari.ailus@linux.intel.com>
 <20201105115032.53381197@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105115032.53381197@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the review.

On Thu, Nov 05, 2020 at 11:50:32AM +0100, Mauro Carvalho Chehab wrote:

...

> > +struct __ccs_data_block_end {
> > +	uint8_t crc[4];
> > +} __attribute__((packed));
> > +
> > +#endif /* __CCS_DATA_DEFS_H__ */
> 
> Nitpick: why all the above struct/enums start with "__"?

We have two sets of data structure: those that are related to the binary
file format (these, so they're packed) as well as the in-kernel
representation. So I've used the underscores to designate these are the
binary format ones. They're only used in ccs-data.c.

-- 
Kind regards,

Sakari Ailus
