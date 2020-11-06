Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499562A95CB
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 12:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgKFLxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 06:53:14 -0500
Received: from mga05.intel.com ([192.55.52.43]:41404 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgKFLxO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 06:53:14 -0500
IronPort-SDR: vyqZ0ZEpTd2RMh0pzP1nHCvDiqB0cLOuKpEWD7owXIHpWQhInz/ayIQBXAMzX5pLWV5rcwWbdb
 oNQPV9TEPTpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="254241285"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="254241285"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 03:53:14 -0800
IronPort-SDR: u5lLLRj4LViCOb/QKvW4vpaGxu7xRftl+vFevt0ogDJ0ptsySK/75DosimeRUmYZquCjychi0+
 MnRticfo+YZQ==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="307193590"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 03:53:11 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 046CA207BF; Fri,  6 Nov 2020 13:53:08 +0200 (EET)
Date:   Fri, 6 Nov 2020 13:53:08 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Hugues Fruchet <hugues.fruchet@st.com>,
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
Message-ID: <20201106115308.GO26150@paasikivi.fi.intel.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
 <016661fc-e9dd-bd4a-f26d-00e54626f030@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <016661fc-e9dd-bd4a-f26d-00e54626f030@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

On Thu, Nov 05, 2020 at 10:26:37AM +0100, Alexandre Torgue wrote:
> Hi Huges
> 
> On 11/4/20 6:32 PM, Hugues Fruchet wrote:
> > Add support of BT656 embedded synchronization bus.
> > This mode allows to save hardware synchro lines hsync & vsync
> > by replacing them with synchro codes embedded in data stream.
> > Add "bus-type" property and make it required so that there is no
> > ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).
> > 
> > ===========
> > = history =
> > ===========
> > version 5:
> >    - Add revisited bindings and devicetree with explicit use of "bus-type"
> > 
> > version 4:
> >    - Fix typo in commit message
> > 
> > version 3:
> >    - Fix bus_width print to %u as per Sakari comment
> > 
> > version 2:
> >    - As per Sakari remark, revisit commit message and document
> >      BT656 parallel bus mode in bindings
> > 
> > version 1:
> >    - Initial submission
> > 
> > Hugues Fruchet (4):
> >    media: stm32-dcmi: add support of BT656 bus
> >    media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
> >    ARM: dts: stm32: set bus-type in DCMI endpoint for stm32mp157c-ev1
> >      board
> >    ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval
> >      board
> > 
> >   .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
> >   arch/arm/boot/dts/stm32429i-eval.dts               |  1 +
> >   arch/arm/boot/dts/stm32mp157c-ev1.dts              |  1 +
> >   drivers/media/platform/stm32/stm32-dcmi.c          | 37 +++++++++++++++++++--
> >   4 files changed, 75 insertions(+), 2 deletions(-)
> > 
> 
> I'll take DT patches on stm32-next tree.

Just checking: that is only the two last patches in the set, or also the
binding patch?

-- 
Regards,

Sakari Ailus
