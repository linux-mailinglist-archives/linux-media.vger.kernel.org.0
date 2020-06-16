Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F0D1FAD19
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 11:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgFPJvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 05:51:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:14551 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbgFPJvj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 05:51:39 -0400
IronPort-SDR: B5n+jSuXf1h8PETQ48gupcFLpxRsQbL3hTmhfNue/W17YK4R8ucD/gMGwFhm+f/Z2KlnXyyVtr
 kPGnX1VM+h0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 02:51:39 -0700
IronPort-SDR: g/2dIkBA3me8YZgOL9fOEj6c3/Dp033UmA+/mBWmblNC6+rNiEKBxvhulqKJ4o2DcGHItxZku6
 lza7BwNcPMAw==
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="420708776"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 02:51:37 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B64112072F; Tue, 16 Jun 2020 12:51:35 +0300 (EEST)
Date:   Tue, 16 Jun 2020 12:51:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix a pointer math problem in
 dump_sp_dmem()
Message-ID: <20200616095135.GX16711@paasikivi.fi.intel.com>
References: <20200616092728.GB11940@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616092728.GB11940@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 16, 2020 at 12:27:28PM +0300, Dan Carpenter wrote:
> The "io_virt_addr" variable is a u32 pointer and it should be
> incremented by one instead of four.  The current code will dump bogus
> data and read beyond the end of the buffer.
> 
> Fixes: 69a03e36c711 ("media: atomisp: get rid of an iomem abstraction layer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
