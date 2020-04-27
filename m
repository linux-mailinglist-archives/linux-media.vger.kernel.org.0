Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552FD1BA840
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 17:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgD0PoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 11:44:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:6830 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgD0PoE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 11:44:04 -0400
IronPort-SDR: rKvj49gYEseHJoG/o7Kot8wHk3XvAB5iCfm8ZwbRgXZPtRuaAu50AjnemHSkjoZB/SI8zDcxUZ
 /PsgKantIWRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 08:44:03 -0700
IronPort-SDR: 0uOdTfv4SpbzbSBkjPWZXtvYcren/7A6u+luOx/EFDq04HXtBMgU7ok6zD+ygSHknh3vB3K6PG
 lBh1TpfuDL6w==
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; 
   d="scan'208";a="404348088"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 08:44:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7FEF420751; Mon, 27 Apr 2020 18:43:59 +0300 (EEST)
Date:   Mon, 27 Apr 2020 18:43:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     linux-media@vger.kernel.org, rajmohan.mani@intel.com,
        bingbu.cao@intel.com, tfiga@chromium.org
Subject: Re: [PATCH 0/3] IPU3 ImgU driver parameter struct fixes
Message-ID: <20200427154359.GZ5381@paasikivi.fi.intel.com>
References: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
 <353192fa-6769-4c18-da5d-994743bcd55e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <353192fa-6769-4c18-da5d-994743bcd55e@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 26, 2020 at 10:42:52AM +0800, Bingbu Cao wrote:
> Tested-by: Bingbu Cao <bingbu.cao@intel.com>

Thanks, Bingbu!

-- 
Sakari Ailus
