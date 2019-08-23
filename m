Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4804D9B030
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 15:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395074AbfHWM4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:56:53 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55503 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395072AbfHWM4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:56:50 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i197U-0006UL-Qs; Fri, 23 Aug 2019 14:56:44 +0200
Message-ID: <1566565004.3023.14.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/7] media: imx214: Add new control with
 V4L2_CID_UNIT_CELL_SIZE
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Date:   Fri, 23 Aug 2019 14:56:44 +0200
In-Reply-To: <20190823123737.7774-4-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
         <20190823123737.7774-4-ribalda@kernel.org>
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

On Fri, 2019-08-23 at 14:37 +0200, Ricardo Ribalda Delgado wrote:
> According to the product brief, the unit cell size is 1120 nanometers^2.
> 
> https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>

If the v4l2_ctrl_new_area helper is accepted, I'd reorder this
afterwards and squash it together with patch 7.

regards
Philipp
