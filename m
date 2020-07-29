Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89CB232137
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 17:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgG2PIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 11:08:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:11965 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbgG2PIl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 11:08:41 -0400
IronPort-SDR: SPuzCazUZ5ioKo67VL9lIGNiXm/AiZyLlhVpUxKQpI5w99qDsgK8nZj+hDhnG03vHtzpQM5cR0
 phCoi/mJ/nVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="215926470"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="215926470"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 08:08:39 -0700
IronPort-SDR: QO6Hpww0OgWUmZ1AGqLZNrzlO+3SThzVop3B5jUXD27CAQJ/jONgWMwjAPjidCoRGeF+uKn1BJ
 cD0EiezLbctQ==
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="313056856"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 08:08:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0AB5C2079D; Wed, 29 Jul 2020 18:08:29 +0300 (EEST)
Date:   Wed, 29 Jul 2020 18:08:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Antti Palosaari <crope@iki.fi>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sean Young <sean@mess.org>, Michael Buesch <m@bues.ch>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Brian Johnson <brijohn@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH][next] media: Use fallthrough pseudo-keyword
Message-ID: <20200729150828.GF16711@paasikivi.fi.intel.com>
References: <20200724221014.GA24349@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724221014.GA24349@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gustavo,

On Fri, Jul 24, 2020 at 05:10:14PM -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks for the patch. The number of recipients may hit the limit on some
lists.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
