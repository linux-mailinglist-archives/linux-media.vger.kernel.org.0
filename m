Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368581D95BB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 13:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728785AbgESL5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 07:57:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:18100 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbgESL5m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 07:57:42 -0400
IronPort-SDR: F5YMKoU+qMHz1kUB8YfHDcjFhoLUYYLyGBP/VUD3srrqJfDKukutqK2Es39oaWn9Gi0u18cHo0
 wOx2S9xuUhgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:57:42 -0700
IronPort-SDR: YBmlirqP1mfDY2/shxRL2nz01uQVfsC6fFTTtPR/n2bkG/ZnhNOR6vu9dTc262VIJWmiUccltJ
 OFYuh7X3uZnQ==
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="439594040"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:57:37 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id BBB2920CEF; Tue, 19 May 2020 14:57:35 +0300 (EEST)
Date:   Tue, 19 May 2020 14:57:35 +0300
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
Subject: Re: [PATCH v2 4/6] media: ov5647: Use gpiod_set_value_cansleep
Message-ID: <20200519115735.GL20066@paasikivi.fi.intel.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
 <ff9d9fe93a50efdeced9efab7b38d72c7dabc08f.1589850165.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff9d9fe93a50efdeced9efab7b38d72c7dabc08f.1589850165.git.roman.kovalivskyi@globallogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 19, 2020 at 04:16:19AM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> All calls to the gpio library are in contexts that can sleep,
> therefore there is no issue with having those GPIOs controlled
> by controllers which require sleeping (eg I2C GPIO expanders).
> 
> Switch to using gpiod_set_value_cansleep instead of gpiod_set_value
> to avoid triggering the warning in gpiolib should the GPIO
> controller need to sleep.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>

This needs to be merged with the 2nd patch.

-- 
Sakari Ailus
