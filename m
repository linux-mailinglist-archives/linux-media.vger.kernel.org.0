Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B95987EC9
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 18:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436666AbfHIQCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 12:02:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:8195 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfHIQCZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 12:02:25 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 09:02:24 -0700
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="166045189"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 09:02:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 22D9E20CEA; Fri,  9 Aug 2019 19:01:22 +0300 (EEST)
Date:   Fri, 9 Aug 2019 19:01:21 +0300
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
Subject: Re: [PATCH v4 1/3] media: stm32-dcmi: improve sensor subdev naming
Message-ID: <20190809160121.GA6194@paasikivi.fi.intel.com>
References: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
 <1564577783-18627-2-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564577783-18627-2-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

Thanks for teh update.

On Wed, Jul 31, 2019 at 02:56:21PM +0200, Hugues Fruchet wrote:
> Rename "subdev" entity struct field to "source"
> to prepare for several subdev support.
> Move asd field on top of entity struct.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> Change-Id: I1545a1a29a8061ee67cc6e4b799e9a69071911e7

No Change-Id tags in the kernel, please. Check the other two as well.

With that fixed,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
