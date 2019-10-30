Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA8DE980C
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 09:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfJ3IY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 04:24:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:9739 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbfJ3IY0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 04:24:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 01:24:25 -0700
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; 
   d="scan'208";a="193894229"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 01:24:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 50839208A0; Wed, 30 Oct 2019 10:24:21 +0200 (EET)
Date:   Wed, 30 Oct 2019 10:24:21 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: smiapp: unlock on error in
 smiapp_start_streaming()
Message-ID: <20191030082421.GE10211@paasikivi.fi.intel.com>
References: <20191029182401.GB17569@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029182401.GB17569@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 29, 2019 at 09:24:01PM +0300, Dan Carpenter wrote:
> We added two new error paths to smiapp_start_streaming(), but we can't
> return directly without dropping the "sensor->mutex" lock.
> 
> Fixes: f8c4352c1bef ("media: smiapp: Move binning configuration to streaming start")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan!

-- 
Sakari Ailus
