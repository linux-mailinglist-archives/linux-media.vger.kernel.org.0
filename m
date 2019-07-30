Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA047A2F1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 10:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfG3IOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 04:14:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37408 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfG3IOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 04:14:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9C54B28A7DD
Message-ID: <8b859fd7758c3f95b45b5b70909be0d2ae2e4f34.camel@collabora.com>
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl
Cc:     slongerbeam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org
Date:   Tue, 30 Jul 2019 05:14:24 -0300
In-Reply-To: <1561963729.3753.5.camel@pengutronix.de>
References: <20190627222912.25485-1-festevam@gmail.com>
         <1561963729.3753.5.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Hans,

On Mon, 2019-07-01 at 08:48 +0200, Philipp Zabel wrote:
> On Thu, 2019-06-27 at 19:29 -0300, Fabio Estevam wrote:
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > Not all sensors will be able to guarantee a proper initial state.
> > This may be either because the driver is not properly written,
> > or (probably unlikely) because the hardware won't support it.
> > 
> > While the right solution in the former case is to fix the sensor
> > driver, the real world not always allows right solutions, due to lack
> > of available documentation and support on these sensors.
> > 
> > Let's relax this requirement, and allow the driver to support stream start,
> > even if the sensor initial sequence wasn't the expected.
> > 
> > Also improve the warning message to better explain the problem and provide
> > a hint that the sensor driver needs to be fixed.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 

This seems ready to pick and it has Philipp's and Steve's RB.

Thanks,
Eze

