Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25E74335EE
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbhJSMaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:30:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:13390 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231441AbhJSMaF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:30:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="291959518"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="291959518"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 05:27:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="531405674"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 05:27:50 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 994E520316;
        Tue, 19 Oct 2021 15:27:48 +0300 (EEST)
Date:   Tue, 19 Oct 2021 15:27:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] media: hi846: depend on OF
Message-ID: <YW65xC1Ln9Lc2tHJ@paasikivi.fi.intel.com>
References: <20211018095859.255912-1-martin.kepplinger@puri.sm>
 <20211018134246.383594-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018134246.383594-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Mon, Oct 18, 2021 at 03:42:46PM +0200, Martin Kepplinger wrote:
> Since other device enumerate mechanisms are currently not implemented,
> make the hi846 sensor driver depend on CONFIG_OF.

As far as I understand, this should work on ACPI based systems with just
of_match_ptr() macro removed.

In any case, linux/of_graph.h header should be replaced with
linux/property.h.

How about that instead?

-- 
Kind regards,

Sakari Ailus
