Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 494F2921AB
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 12:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfHSKuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 06:50:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53901 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSKuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 06:50:17 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hzfEt-0000Ky-SP; Mon, 19 Aug 2019 12:50:15 +0200
Message-ID: <1566211815.3008.2.camel@pengutronix.de>
Subject: Re: [PATCH v9] media: imx: add csc/scaler mem2mem device
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Date:   Mon, 19 Aug 2019 12:50:15 +0200
In-Reply-To: <0da375f8-f4b8-fc13-74a0-9dd480688327@gmail.com>
References: <20190814122444.17920-1-p.zabel@pengutronix.de>
         <0da375f8-f4b8-fc13-74a0-9dd480688327@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Fri, 2019-08-16 at 16:17 -0700, Steve Longerbeam wrote:
> Hi Philipp,
> 
> If you haven't already, can you please test rotation with this version, 
> with both non-tiled and tiled scaling conversions. I found rotation was 
> broken in v8.
> 
> Steve

I've tested a few resolutions with both 90° and 270° rotations.

Upscale:

32x24 320x240 640x480 768x320 768x432 720x404 720x480 1024x768 -> 768x1024 768x1280 1080x1920 1600x2560
1280x720 -> 1080x1920

Downscale:

3840x2160 -> 1080x1920
1920x1080 -> 1080x1280 768x1024 576x1024 576x1024 540x960

Note that for horizontal flips the seam hiding does not work properly,
due to not being able to overshoot the input scanline backwards.
This is apparent when scaling 32x24 -> 768x1280 1080x1920 with 180° or
270° rotation, for example.

regards
Philipp
