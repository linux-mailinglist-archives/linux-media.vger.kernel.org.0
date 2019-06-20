Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A939C4D21D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 17:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfFTP0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 11:26:51 -0400
Received: from mga03.intel.com ([134.134.136.65]:4413 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbfFTP0v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 11:26:51 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 08:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; 
   d="scan'208";a="311692885"
Received: from waelreed-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.63.228])
  by orsmga004.jf.intel.com with ESMTP; 20 Jun 2019 08:26:45 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id B5D8D21D88; Thu, 20 Jun 2019 18:26:41 +0300 (EEST)
Date:   Thu, 20 Jun 2019 18:26:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v2 1/3] media: stm32-dcmi: improve sensor subdev naming
Message-ID: <20190620152640.chd4u4u5hd56ausk@kekkonen.localdomain>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <1560242912-17138-2-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560242912-17138-2-git-send-email-hugues.fruchet@st.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Tue, Jun 11, 2019 at 10:48:30AM +0200, Hugues Fruchet wrote:
> Add a new "sensor" field to dcmi struct instead of
> reusing entity->subdev to address sensor subdev.

The purpose of the struct binding image source's async subdev as well as
related information is to allow associating the two. This patch breaks
that. If your device can support a single sensor, it might not be a big
deal. The end result remains somewhat inconsistent as subdev specific
information is spread across struct stm32_dcmi and struct
dcmi_graph_entity.

In general you don't need to know the sensor as you can always find it
using media_entity_remote_pad(). This driver is a little different though
as it could presumably continue to work without MC. Was that the intent?

On a side note: struct dcmi_graph_entity does NOT have struct
v4l2_async_subdev as its first member. Please fix that and prepend the fix
to this set.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
