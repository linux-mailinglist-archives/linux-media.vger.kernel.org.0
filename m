Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5542D30246B
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 12:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbhAYLqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 06:46:10 -0500
Received: from mga06.intel.com ([134.134.136.31]:38767 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727756AbhAYLFC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 06:05:02 -0500
IronPort-SDR: lDeWOc+jmD4o99Jlc31KSbTdJzc8pNRNmZjfdzXmrx6kjgsW9eBXKMq/QJ37Qklz+qKgSUKKlM
 htA6HQSEujQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="241241105"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="241241105"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 03:03:05 -0800
IronPort-SDR: zEjhkGCmt9zDNGMPaOTcQNSmmMUumuD1ZI6kBY3gMhXD+DuSI/bUaGz/Mb1f8sRG7lvn/r8jnx
 0HlJAdEOVFVA==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="350234107"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 03:03:02 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1FBFD2080B; Mon, 25 Jan 2021 13:02:30 +0200 (EET)
Date:   Mon, 25 Jan 2021 13:02:30 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 01/14] media: v4l2-async: Clean
 v4l2_async_notifier_add_fwnode_remote_subdev
Message-ID: <20210125110229.GH27155@paasikivi.fi.intel.com>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-2-ezequiel@collabora.com>
 <d00fd549-79a1-5dc8-c239-52c9cbd94625@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d00fd549-79a1-5dc8-c239-52c9cbd94625@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for the comments.

On Tue, Jan 19, 2021 at 03:51:32PM -0300, Helen Koike wrote:
> Hi Ezequiel,
> 
> Thanks for you patch, I just have minor comments.
> 
> I think there are more improvements that could be done to
> reduce some identation levels, but I see the idea here is
> to change drivers the least as possible, so I won't comment
> on that.

I discussed with Ezequiel that I can take the set forwards from here.

I'd be inclined to avoiding making larger than necessary changes here in
drivers that won't end up being tested this time around. The set already
does a lot, such changes could be done later on of course.

-- 
Kind regards,

Sakari Ailus
