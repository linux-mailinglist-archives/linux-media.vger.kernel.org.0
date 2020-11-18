Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F922B8798
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 23:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgKRWPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 17:15:44 -0500
Received: from mga04.intel.com ([192.55.52.120]:33362 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgKRWPo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 17:15:44 -0500
IronPort-SDR: y+AOHHPXk1+NvwZbeC6DH+0vzLcA9q+2C66izuZo2ZmaPKvuOnGU7XU+Fqg9tR4FcNo2uPPDCD
 B9rdHk+rRXcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="168623286"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="168623286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 14:15:44 -0800
IronPort-SDR: v7YI/Hl1zOw5HG/4DejAVTslJljbcKBT4tJmVbGMrtnO9gwL45GqwL0llIZ1zLKrO7tLxPMH8t
 2jkhdsHGCp9Q==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="532908997"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 14:15:43 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 81C88207BF; Thu, 19 Nov 2020 00:15:41 +0200 (EET)
Date:   Thu, 19 Nov 2020 00:15:41 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 029/106] =?iso-8859-1?Q?ccs?=
 =?iso-8859-1?Q?=3A_Remove_the_I=B2C?= ID table
Message-ID: <20201118221541.GQ3940@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-22-sakari.ailus@linux.intel.com>
 <20201105103445.36d6c5ee@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201105103445.36d6c5ee@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Nov 05, 2020 at 10:34:45AM +0100, Mauro Carvalho Chehab wrote:
> Em Wed,  7 Oct 2020 11:44:42 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > The I²C ID table is no longer needed; remove it.
> 
> Why not? Please provide more information.
> 
> In summary, please change the description in order to answer the
> following questions:
> 
> For OF-based drivers, removing I2C probing won't cause any harm,
> as the patch is keeping css_of_able, but wouldn't it affect other 
> drivers that could, for example, be using ACPI, instead?
> 
> Or is this driver incompatible with other probing methods?

ACPI doesn't need this anymore. It did though.

Platform data support has been (gradually) removed so I believe this can be
removed, too. If someone can show it has a purpose, I don't have objections
to reverting this later either.

-- 
Regards,

Sakari Ailus
