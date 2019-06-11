Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEA623C691
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 10:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403992AbfFKIwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 04:52:15 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42261 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403860AbfFKIwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 04:52:14 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hacVl-0000Hr-C9; Tue, 11 Jun 2019 10:52:09 +0200
Message-ID: <1560243127.13886.3.camel@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: videodev2: add
 V4L2_FMT_FLAG_FIXED_RESOLUTION
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Date:   Tue, 11 Jun 2019 10:52:07 +0200
In-Reply-To: <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
         <20190531093126.26956-3-mjourdan@baylibre.com>
         <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
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

On Wed, 2019-06-05 at 15:39 +0200, Hans Verkuil wrote:
> Hi Maxime,
> 
> I am wondering if this flag shouldn't be inverted: you set
> V4L2_FMT_FLAG_DYN_RESOLUTION if dynamic resolution is supported,
> otherwise it isn't.
> 
> Can all the existing mainlined codec drivers handle midstream
> resolution changes?
> 
> s5p-mfc, venus and mediatek can, but I see no SOURCE_CHANGE event in
> the coda drivers, so I suspect that that can't handle this.
> 
> Philipp, what is the status of the coda driver for dynamic resolution
> changes?

FTR, to my knowledge there is no dynamic resolution change support in
the firmware, as there is no signal (interrupt nor picture run return
value) to indicate that different headers were parsed.

I am planning to add the initial source change event required by the
current decoder API documentation, but I am afraid there will be no
support for source changes due to mid-stream resolution changes due to
firmware limitations.

regards
Philipp
