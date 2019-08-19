Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5719791EB3
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 10:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfHSIQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 04:16:26 -0400
Received: from mga18.intel.com ([134.134.136.126]:1948 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfHSIQ0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 04:16:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Aug 2019 01:11:58 -0700
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; 
   d="scan'208";a="182801171"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Aug 2019 01:11:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1C050202FC; Mon, 19 Aug 2019 11:10:55 +0300 (EEST)
Date:   Mon, 19 Aug 2019 11:10:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
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
Subject: Re: [PATCH v6 2/4] media: stm32-dcmi: trace the supported
 fourcc/mbus_code
Message-ID: <20190819081054.GB6133@paasikivi.fi.intel.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
 <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
 <20190816081514.GU6133@paasikivi.fi.intel.com>
 <fb02573f-991a-18c5-b780-b5fc100da6a8@st.com>
 <20190819072621.GZ6133@paasikivi.fi.intel.com>
 <ceec05d1-5791-4ba6-e2a8-3a5fd8b89955@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceec05d1-5791-4ba6-e2a8-3a5fd8b89955@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 19, 2019 at 07:40:53AM +0000, Hugues FRUCHET wrote:
> Hi Sakari,
> 
> OK, I will change.
> 
> Have you some other remarks on this serie in order that I group changes 
> in the next version ?

No other comments.

Thanks.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
