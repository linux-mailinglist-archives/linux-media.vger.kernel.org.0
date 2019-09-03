Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D69A6D16
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 17:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbfICPkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 11:40:16 -0400
Received: from mailoutvs50.siol.net ([185.57.226.241]:58392 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729056AbfICPkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 11:40:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 5DBCE52196E;
        Tue,  3 Sep 2019 17:40:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id S2uxfrI8SPdf; Tue,  3 Sep 2019 17:40:14 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 209AA52309D;
        Tue,  3 Sep 2019 17:40:14 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Zimbra) with ESMTPA id DB95652196E;
        Tue,  3 Sep 2019 17:40:13 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] cedrus: choose default pixelformat in try_fmt
Date:   Tue, 03 Sep 2019 17:40:13 +0200
Message-ID: <3939264.zjO8auq5R6@jernej-laptop>
In-Reply-To: <20190830092624.18228-3-hverkuil-cisco@xs4all.nl>
References: <20190830092624.18228-1-hverkuil-cisco@xs4all.nl> <20190830092624.18228-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne petek, 30. avgust 2019 ob 11:26:23 CEST je Hans Verkuil napisal(a):
> If an unsupported pixelformat is passed to try_fmt, then pick
> the first valid pixelformat instead. This is more standard V4L2
> behavior.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 46 ++++++++-----------
>  1 file changed, 20 insertions(+), 26 deletions(-)

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


