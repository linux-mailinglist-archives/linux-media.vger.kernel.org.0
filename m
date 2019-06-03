Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE7833A1C
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 23:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfFCVtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 17:49:03 -0400
Received: from mailoutvs10.siol.net ([185.57.226.201]:40561 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726076AbfFCVtD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 17:49:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id A2003520D13;
        Mon,  3 Jun 2019 23:48:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id u8vABNiJXYF5; Mon,  3 Jun 2019 23:48:59 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 44A4A520297;
        Mon,  3 Jun 2019 23:48:59 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 309AE520D13;
        Mon,  3 Jun 2019 23:48:58 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RFC 5/6] media: cedrus: Make the slice_params array size limitation more explicit
Date:   Mon, 03 Jun 2019 23:48:57 +0200
Message-ID: <1764986.tDiRxPxGAQ@jernej-laptop>
In-Reply-To: <20190603110946.4952-6-boris.brezillon@collabora.com>
References: <20190603110946.4952-1-boris.brezillon@collabora.com> <20190603110946.4952-6-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 03. junij 2019 ob 13:09:45 CEST je Boris Brezillon napisal(a):
> The driver only supports per-slice decoding, and in that mode
> decode_params->num_slices must be set to 1 and the slice_params array
> should contain only one element.

What Cedrus actually needs to know is if this is first slice in frame or not. I 
imagine it resets some stuff internally when first slice is processed.

So if driver won't get all slices of one frame at once, it can't know if this 
is first slice in frame or not. I guess we need additional flag for this.

Best regards,
Jernej

> 
> The current code already had this limitation but it made it look like
> the slice_params control was a single struct while, according to the
> spec, it's actually an array. Make it more explicit by setting dims[0]
> and adding a comment explaining why we have this limitation.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>



