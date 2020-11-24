Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D252C320C
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 21:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731605AbgKXUhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 15:37:55 -0500
Received: from mailoutvs36.siol.net ([185.57.226.227]:52471 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726854AbgKXUhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 15:37:55 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 97F305214C2;
        Tue, 24 Nov 2020 21:37:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id vEhkI0j4o7Nn; Tue, 24 Nov 2020 21:37:53 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 52D4E5214C3;
        Tue, 24 Nov 2020 21:37:53 +0100 (CET)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id D99AD5214C2;
        Tue, 24 Nov 2020 21:37:52 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v4 03/13] media: cedrus: h264: Support profile controls
Date:   Tue, 24 Nov 2020 21:43:55 +0100
Message-ID: <19353453.CX4p2haUEV@kista>
In-Reply-To: <20201123144000.81310-4-ezequiel@collabora.com>
References: <20201123144000.81310-1-ezequiel@collabora.com> <20201123144000.81310-4-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne ponedeljek, 23. november 2020 ob 15:39:50 CET je Ezequiel Garcia 
napisal(a):
> Cedrus supports H.264 profiles from Baseline to High,
> except for the Extended profile
> 
> Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE so that
> userspace can query the driver for the supported
> profiles and levels.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


