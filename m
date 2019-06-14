Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 957DE4602F
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 16:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbfFNOLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 10:11:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38275 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbfFNOLD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 10:11:03 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hbmv0-0001nW-0Z; Fri, 14 Jun 2019 16:11:02 +0200
Message-ID: <1560521459.18257.1.camel@pengutronix.de>
Subject: Re: [PATCH v8 5/5] media: imx: Try colorimetry at both sink and
 source pads
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Fri, 14 Jun 2019 16:10:59 +0200
In-Reply-To: <20190522010317.23710-6-slongerbeam@gmail.com>
References: <20190522010317.23710-1-slongerbeam@gmail.com>
         <20190522010317.23710-6-slongerbeam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Tue, 2019-05-21 at 18:03 -0700, Steve Longerbeam wrote:
> Retask imx_media_fill_default_mbus_fields() to try colorimetry parameters,
> renaming it to to imx_media_try_colorimetry(), and call it at both sink and
> source pad try_fmt's. The unrelated check for uninitialized field value is
> moved out to appropriate places in each subdev try_fmt.
> 
> The IC now supports Rec.709 and BT.601 Y'CbCr encoding, and both limited
> and full range quantization for both YUV and RGB space, so allow those
> for pipelines that route through the IC.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

I've applied them on the imx-drm/next branch with Hans' Acked-by on 5/5.

regards
Philipp
