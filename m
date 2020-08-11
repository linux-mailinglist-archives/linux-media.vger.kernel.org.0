Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D573B25A0DD
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 23:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgIAVi4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 1 Sep 2020 17:38:56 -0400
Received: from mailoutvs47.siol.net ([185.57.226.238]:38772 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728179AbgIAViy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 17:38:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 282055267C4;
        Tue,  1 Sep 2020 23:38:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id JNyKGgweMjQS; Tue,  1 Sep 2020 23:38:51 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id B612452644C;
        Tue,  1 Sep 2020 23:38:51 +0200 (CEST)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id ECFCB5263BF;
        Tue,  1 Sep 2020 23:38:50 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 00/14] Clean H264 stateless uAPI
Date:   Tue, 11 Aug 2020 21:16:09 +0200
Message-ID: <3072394.25LIjdDuC7@kista>
In-Reply-To: <20200806151310.98624-1-ezequiel@collabora.com>
References: <20200806151310.98624-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne četrtek, 06. avgust 2020 ob 17:12:56 CEST je Ezequiel Garcia napisal(a):
> Here's a new round for the H.264 uAPI cleanup, which as discussed
> aims at being stabilized and promoted as a first-class public uAPI soon.
> 
> It should be noted that there is already GStreamer native
> support for this interface, which will be part of 1.18,
> once it's released.
> 
> I have pushed a branch porting GStreamer to
> support these interface changes:
> 
> https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/commits/for_
> h264_uapi_v3
> 
> As was discussed the SLICE_PARAMS control is now clarified
> to work for one-slice-per-request operation, using CAPTURE
> buffer holding features. This is how Cedrus driver is implemented.
> 
> The other drivers currently supported Hantro and Rockchip VDEC,
> as well as the MTK stateless decoder posted by Alex Courbot
> operate in frame-based mode.
> 
> These "frame-based" devices parse the slice headers in hardware,
> and therefore shall not support SLICE_PARAMS. To that extent,
> the redundant bitstream fields are now part of the DECODE_PARAMS
> control.
> 
> Hopefully now the specification documentation is clear enough.
> GStreamer, Chromium and FFmpeg (which I'm sure will be implemented
> as soon as we stabilize the API) should serve as reference examples
> on how the API is consumed.
> 

I tested this series using https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3.1 on Cedrus (Allwinner H6) using additional patch 
contained in discussion around patch 3 and I couldn't find any issue.

You can add to whole series:
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


