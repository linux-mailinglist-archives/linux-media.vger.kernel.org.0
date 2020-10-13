Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BBD28CFC2
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgJMOCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:02:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:43956 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbgJMOCG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:02:06 -0400
IronPort-SDR: uf6eOTONiQwgfi9T1eR1hQwSyrnjtIYX+mSe6fm1V9913AyNbW7t/u2Os9hy26bpXFlSmjVHxh
 7c/Mw7tq1okA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="165123235"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="165123235"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 07:01:51 -0700
IronPort-SDR: 9Rl7KQ8kZfaxe6uloqIiIwIQ0ORTQx6/j9HOPZbkkv65lMAQE55DUON7QVScEdV08jlOQbwLU4
 EbHkPfAlpKTg==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="357011504"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 07:01:49 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 088C3205E8; Tue, 13 Oct 2020 17:01:47 +0300 (EEST)
Date:   Tue, 13 Oct 2020 17:01:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/1] ipu3-cio2: Check receved the size against payload
 size, not buffer size
Message-ID: <20201013140146.GB13341@paasikivi.fi.intel.com>
References: <20201013124143.12459-1-sakari.ailus@linux.intel.com>
 <ed6e7c65-aedb-b61f-ea7e-74de24e283c6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed6e7c65-aedb-b61f-ea7e-74de24e283c6@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 13, 2020 at 03:47:44PM +0200, Jean-Michel Hautbois wrote:
> Hi Sakari,
> 
> Thanks for the patch !
> 
> On 13/10/2020 14:41, Sakari Ailus wrote:
> > Compare the received size of the payload size, not the allocated size of
> > the buffer that is page aligned. This way also images that aren't aligned
> > to page size are not warned about.
> > 
> > Also wrap a line over 80 characters.
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>

Merci, Jean-Michel!

-- 
Sakari Ailus
