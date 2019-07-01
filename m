Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD47C5B54F
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 08:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfGAGsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 02:48:53 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55281 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfGAGsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 02:48:53 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hhq7O-0006PQ-0x; Mon, 01 Jul 2019 08:48:50 +0200
Message-ID: <1561963729.3753.5.camel@pengutronix.de>
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl
Cc:     slongerbeam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org, ezequiel@collabora.com
Date:   Mon, 01 Jul 2019 08:48:49 +0200
In-Reply-To: <20190627222912.25485-1-festevam@gmail.com>
References: <20190627222912.25485-1-festevam@gmail.com>
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

On Thu, 2019-06-27 at 19:29 -0300, Fabio Estevam wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Not all sensors will be able to guarantee a proper initial state.
> This may be either because the driver is not properly written,
> or (probably unlikely) because the hardware won't support it.
> 
> While the right solution in the former case is to fix the sensor
> driver, the real world not always allows right solutions, due to lack
> of available documentation and support on these sensors.
> 
> Let's relax this requirement, and allow the driver to support stream start,
> even if the sensor initial sequence wasn't the expected.
> 
> Also improve the warning message to better explain the problem and provide
> a hint that the sensor driver needs to be fixed.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

thanks
Philipp
