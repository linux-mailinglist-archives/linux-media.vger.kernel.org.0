Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF4E219224A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 09:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbgCYIOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 04:14:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54375 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbgCYIOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 04:14:07 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jH1Ao-00014f-Na; Wed, 25 Mar 2020 09:14:02 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jH1An-0001B0-TI; Wed, 25 Mar 2020 09:14:01 +0100
Date:   Wed, 25 Mar 2020 09:14:01 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: coda: jpeg: support optimized huffman tables
Message-ID: <20200325081401.GA21635@pengutronix.de>
References: <20200324160429.2626-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324160429.2626-1-adrian.ratiu@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:09:36 up 34 days, 15:40, 75 users,  load average: 1.00, 0.75,
 0.45
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 24, 2020 at 06:04:29PM +0200, Adrian Ratiu wrote:
> Each jpeg can have the huffman tables optimized for its specific content
> meaning that the table lenghts and values don't match the standard table
> of substitutions so there's no reason to hardcode and expect the standard
> lengths, otherwise we just end up rejecting optimized jpegs altogether.
> 
> Tested on CODA960.
> 
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
