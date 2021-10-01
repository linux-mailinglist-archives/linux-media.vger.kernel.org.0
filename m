Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE84841E972
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 11:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhJAJQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 05:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhJAJQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 05:16:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D65C06177C
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 02:14:37 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mWEcl-0006as-3k; Fri, 01 Oct 2021 11:14:35 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mWEck-00066I-Qp; Fri, 01 Oct 2021 11:14:34 +0200
Date:   Fri, 1 Oct 2021 11:14:34 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de
Subject: Re: [PATCH 0/7] media: allegro: fix and extend non-VCL NAL units
Message-ID: <20211001091434.GG28226@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de
References: <20210908130355.3295403-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210908130355.3295403-1-m.tretter@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:14:15 up 225 days, 12:38, 133 users,  load average: 0.05, 0.14,
 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 08 Sep 2021 15:03:48 +0200, Michael Tretter wrote:
> This series fixes and extends the non-VCL NAL units in the encoded video data
> of the Allegro DVT video encoder.

Gentle Ping.

Michael

> 
> Patches 1 and 2 fix and cleanup the handling of the ENCODE_FRAME firmware
> message and response.
> 
> Patch 3 improves the SPS of the h.264 encoded video data by correctly scaling
> the bit rate.
> 
> Patches 4 and 5 fix the color space that is written into the SPS of the h.264
> encoded video data.
> 
> Patches 6 and 7 add support for writing vui parameters to the hevc encoded
> video data. This allows to to specify the color space in the coded video for
> hevc, too.
> 
> This series is independent of my other series regarding the encoder buffer.
> 
> Michael
> 
> Michael Tretter (7):
>   media: allegro: fix row and column in response message
>   media: allegro: remove external QP table
>   media: allegro: correctly scale the bit rate in SPS
>   media: allegro: extract nal value lookup functions to header
>   media: allegro: write correct colorspace into SPS
>   media: allegro: nal-hevc: implement generator for vui
>   media: allegro: write vui parameters for HEVC
> 
>  .../media/platform/allegro-dvt/allegro-core.c |  82 +++++--
>  .../media/platform/allegro-dvt/allegro-mail.c |   4 +-
>  drivers/media/platform/allegro-dvt/nal-h264.c |  74 -------
>  drivers/media/platform/allegro-dvt/nal-h264.h | 200 ++++++++++++++++-
>  drivers/media/platform/allegro-dvt/nal-hevc.c | 202 ++++++++++++------
>  drivers/media/platform/allegro-dvt/nal-hevc.h | 189 +++++++++++++++-
>  6 files changed, 576 insertions(+), 175 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
