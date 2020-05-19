Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00BA1D95AB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 13:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbgESLvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 07:51:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:15818 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbgESLvN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 07:51:13 -0400
IronPort-SDR: 8BVxFzWq5czlc5DqfUJUBCOCpUg4yAJQ50dkpFeS4N5I7B/sTt13A6RlCHqJKVIcbJ/BS0mjEU
 EpVVSRa3TyNA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:51:12 -0700
IronPort-SDR: AnY//32YLbelSgs7Tx6USgNj/zyg3fy8LBnHosoRWIWCL81pNMywog2n8l8xb++psXhjnNMvDM
 t5s2pJPdXOiA==
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="373704897"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:51:08 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C497F20CEF; Tue, 19 May 2020 14:51:06 +0300 (EEST)
Date:   Tue, 19 May 2020 14:51:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH v2 5/6] media: dt-bindings: ov5647: Add property for PWDN
 control
Message-ID: <20200519115106.GI20066@paasikivi.fi.intel.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
 <c81da93a9aa97c3cfd208a84d0391c856e5fcbcd.1589850165.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c81da93a9aa97c3cfd208a84d0391c856e5fcbcd.1589850165.git.roman.kovalivskyi@globallogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roman,

On Tue, May 19, 2020 at 04:16:20AM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> Add optional GPIO pwdn to connect to the PWDN line on the sensor.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>

This patch should precede the corresponding driver patch.

-- 
Sakari Ailus
