Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9384602FB
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 11:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbfGEJQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 05:16:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:16234 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727632AbfGEJQm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jul 2019 05:16:42 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jul 2019 02:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,454,1557212400"; 
   d="scan'208";a="363551708"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2019 02:16:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 07C2820904; Fri,  5 Jul 2019 12:16:37 +0300 (EEST)
Date:   Fri, 5 Jul 2019 12:16:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hugues FRUCHET <hugues.fruchet@st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v2 0/3] DCMI bridge support
Message-ID: <20190705091637.b5626yvkycumsp6z@paasikivi.fi.intel.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
 <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
 <20190626172503.GB6118@pendragon.ideasonboard.com>
 <b21efe64-7762-308b-c2e5-503589041c35@st.com>
 <20190627133824.GC5021@pendragon.ideasonboard.com>
 <20190705075522.o7kuptdy3p3o64l7@paasikivi.fi.intel.com>
 <20190705080424.GA4994@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705080424.GA4994@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 05, 2019 at 11:04:24AM +0300, Laurent Pinchart wrote:

...

> > A reasonable compromise would be to add a Kconfig option that allows
> > enabling MC. This way you can provide backwards compatibility and allow
> > making use of the full potential of the hardware. That's also why hardware
> > that may be part of a non-trivial MC pipeline should start with MC-enabled
> > so we wouldn't run into this.
> 
> I really don't like this, as it introduces additional complexity. My
> recommendation is to go for an MC-centric approach. Going for a video
> node-centric approach is really shooting oneself in the foot regarding
> future extensions. But that being said, if there's a strong desire to go
> for foot self-shooting, the way to go is explained above.

Well, there's nothing that can be done anymore as this has already
happened: this is an existing driver in the mainline kernel. Unless you
have a time machine of some sort, of course. :-) The choice is now really
between breaking existing applications (plain V4L2) and supporting new
functionality (MC-centric), so if you need both, I don't really see another
choice than a Kconfig option.

On the other hand, if we know there are no existing users that could not
support the MC-centric view of the device, we could just change the driver
API and forget the Kconfig option. It'd be much more simple that way
indeed. But I don'k know what's the case.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
