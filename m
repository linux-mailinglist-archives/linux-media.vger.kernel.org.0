Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAED4312C0E
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 09:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhBHIkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 03:40:51 -0500
Received: from mga14.intel.com ([192.55.52.115]:38967 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhBHIhB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 03:37:01 -0500
IronPort-SDR: GCZjWUG83NwKAOANHpcSiS651JZRFJZ+VM/Ba1h13w6Pxiqai0O2KmaRYWVO3rRMOX93jpKbZu
 KHzRbk/LnpKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="180902659"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="180902659"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 00:35:08 -0800
IronPort-SDR: f5Q0JMXynqxmRrLix0yp6EWBOTVGz3OqP/HcFNrVA5w1nUlF/Ri4WFaJI73kdqcFmLdn4ERXkD
 tobrbywOC8ww==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="577587708"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 00:35:03 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 957D22082C; Mon,  8 Feb 2021 10:35:01 +0200 (EET)
Date:   Mon, 8 Feb 2021 10:35:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5 13/13] media: Clarify v4l2-async subdevice addition API
Message-ID: <20210208083501.GM32460@paasikivi.fi.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
 <20210202135611.13920-14-sakari.ailus@linux.intel.com>
 <20210206092954.1c75e92c@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206092954.1c75e92c@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Feb 06, 2021 at 09:29:54AM +0100, Mauro Carvalho Chehab wrote:
> Please send a followup patch.

Sure.

-- 
Sakari Ailus
