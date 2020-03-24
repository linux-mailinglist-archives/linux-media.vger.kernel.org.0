Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDD6190975
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 10:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgCXJVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 05:21:33 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57139 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgCXJVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 05:21:33 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jGfkZ-0005UZ-S6; Tue, 24 Mar 2020 10:21:31 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jGfkZ-0005lD-I0; Tue, 24 Mar 2020 10:21:31 +0100
Date:   Tue, 24 Mar 2020 10:21:31 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        kernel@pengutronix.de, Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH 2/2] media: coda: be more flexible wrt jpeg dimensions
Message-ID: <20200324092131.GB12488@pengutronix.de>
References: <20200323130937.3666244-1-adrian.ratiu@collabora.com>
 <20200323130937.3666244-3-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323130937.3666244-3-adrian.ratiu@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:11:42 up 33 days, 16:42, 79 users,  load average: 0.12, 0.20,
 0.23
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adrian,

On Mon, Mar 23, 2020 at 03:09:37PM +0200, Adrian Ratiu wrote:
> Don't require jpeg dimensions to exactly match format dimensions,
> so we are able to decode and display a wider range jpegs instead
> of outright rejecting the ones which don't match.

I don't think this is right. If userspace feeds us an incomatible
JPEG we should probably stop decoding and send a source change
event instead [1].

[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/dev-decoder.html#dynamic-resolution-change

regards
Philipp
