Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15CFEEB3FA
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 16:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbfJaPdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 11:33:20 -0400
Received: from mga07.intel.com ([134.134.136.100]:59698 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbfJaPdT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 11:33:19 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 08:33:19 -0700
X-IronPort-AV: E=Sophos;i="5.68,252,1569308400"; 
   d="scan'208";a="199048068"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 08:33:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E53C02075A; Thu, 31 Oct 2019 17:33:15 +0200 (EET)
Date:   Thu, 31 Oct 2019 17:33:15 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        bingbu.cao@linux.intel.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2] doc-rst: add more info for resolution change blocks
 in ipu3
Message-ID: <20191031153315.GL10211@paasikivi.fi.intel.com>
References: <1570508487-27325-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570508487-27325-1-git-send-email-bingbu.cao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Tue, Oct 08, 2019 at 12:21:27PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch add more details for the resolution change blocks
> It can help the developer to understand the main resolution
> change blocks in ImgU.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

Applied with the following change:

diff --git a/MAINTAINERS b/MAINTAINERS
index 8077b453f2e9..8f46346b1516 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8335,6 +8335,7 @@ S:	Maintained
 F:	drivers/staging/media/ipu3/
 F:	Documentation/media/uapi/v4l/pixfmt-meta-intel-ipu3.rst
 F:	Documentation/media/v4l-drivers/ipu3.rst
+F:	Documentation/media/v4l-drivers/ipu3_rcb.svg
 
 INTEL IXP4XX QMGR, NPE, ETHERNET and HSS SUPPORT
 M:	Krzysztof Halasa <khalasa@piap.pl>

-- 
Sakari Ailus
