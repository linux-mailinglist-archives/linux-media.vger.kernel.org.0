Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D823D54EDA
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 14:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfFYM3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 08:29:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:6750 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbfFYM3X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 08:29:23 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 05:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="360380319"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jun 2019 05:29:20 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2FF99208BE; Tue, 25 Jun 2019 15:29:20 +0300 (EEST)
Date:   Tue, 25 Jun 2019 15:29:20 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH] media: schedule removal for legacy staging drivers
Message-ID: <20190625122919.mapp664xooij5f75@paasikivi.fi.intel.com>
References: <0fed8053f3f3a45762f2547c8ebc4e0d2728abd0.1561463295.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fed8053f3f3a45762f2547c8ebc4e0d2728abd0.1561463295.git.mchehab+samsung@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 25, 2019 at 08:48:26AM -0300, Mauro Carvalho Chehab wrote:
> Keeping legacy problematic code forever is not a good idea.
> 
> So, let's schedule a date for those legacy stuff to rest in piece.
> 
> If someone wants to steps up and take them from the staging ostracism
> and do give them a rejuvenation shower in order to address the
> isues pointed on their TODO lists, be our guest!
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
