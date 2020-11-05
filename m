Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E6C2A794C
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbgKEI37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:29:59 -0500
Received: from mga14.intel.com ([192.55.52.115]:38466 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgKEI37 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 03:29:59 -0500
IronPort-SDR: Cj+uM4S8BHz0vTOEMHfjAtiQjHqSEfCpwFwSKXwodAWEJY8DQlCSmVxCiua/HXacAgHfU/VWq8
 Kna28syZ91cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="168564869"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="168564869"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:29:59 -0800
IronPort-SDR: bIpWq1MLoGbvv+4fLB/sb1nvEAbF/YGJYWVHJmiYLBDG12K4o23kaNDfCyCukglqXZYbgG63yr
 BK6hOCaBOnEw==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="306758610"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:29:54 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4B1AE20901; Thu,  5 Nov 2020 10:29:51 +0200 (EET)
Date:   Thu, 5 Nov 2020 10:29:51 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alain Volmat <alain.volmat@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v5 0/4] DCMI BT656 parallel bus mode support
Message-ID: <20201105082951.GY26150@paasikivi.fi.intel.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Wed, Nov 04, 2020 at 06:32:08PM +0100, Hugues Fruchet wrote:
> Add support of BT656 embedded synchronization bus.
> This mode allows to save hardware synchro lines hsync & vsync
> by replacing them with synchro codes embedded in data stream.
> Add "bus-type" property and make it required so that there is no
> ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).

Thanks for the update.

Regarding the two last patches, which tree they're intended to go to?
Something else than media? I can also take them if it's ok for the
maintainer of the "right" tree.

-- 
Kind regards,

Sakari Ailus
