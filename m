Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C51F719FAC9
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbgDFQvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:51:16 -0400
Received: from mga04.intel.com ([192.55.52.120]:56820 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729331AbgDFQvQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 12:51:16 -0400
IronPort-SDR: duF6fNvmuIy3p1pe0XWqMt8R91hjqWKX19Hj+K8kJ2c5XXPtr6MjDXWvxnsyH4IqPqtuwsm89s
 +nwKpuX+XW5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 09:51:16 -0700
IronPort-SDR: kjCiRUBms6Oudl08kIgmjRJ8yJFiqdbX9CskZ1NCkQPkJ5tiWYY/FBE+/gJesUjKh8ZqsLOOJZ
 Hi9KN4lWORPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="452131333"
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.252.48.155])
  by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2020 09:51:11 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id B273921D18; Mon,  6 Apr 2020 19:51:08 +0300 (EEST)
Date:   Mon, 6 Apr 2020 19:51:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency
 dt-property
Message-ID: <20200406165108.GA7646@kekkonen.localdomain>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Apr 06, 2020 at 05:42:38PM +0100, Lad Prabhakar wrote:
> Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> 24MHz. So instead making clock-frequency as dt-property just let the
> driver enforce the required clock frequency.

Even if some current systems where the driver is used are using 24 MHz
clock, that doesn't mean there wouldn't be systems using another frequency
that the driver does not support right now.

The driver really should not set the frequency unless it gets it from DT,
but I think the preferred means is to use assigned-clock-rates instead, and
not to involve the driver with setting the frequency.

Otherwise we'll make it impossible to support other frequencies, at least
without more or less random defaults.

-- 
Kind regards,

Sakari Ailus
