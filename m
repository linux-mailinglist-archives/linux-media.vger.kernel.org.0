Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5BAC11E4C3
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 14:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfLMNhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 08:37:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57944 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMNhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 08:37:36 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD2F6292C8F;
        Fri, 13 Dec 2019 13:37:34 +0000 (GMT)
Date:   Fri, 13 Dec 2019 14:37:30 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/3] media: rkvdec: Add a VP9 backend
Message-ID: <20191213143730.3b1e4d9e@collabora.com>
In-Reply-To: <20191213133157.105554-1-boris.brezillon@collabora.com>
References: <20191213133157.105554-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Dec 2019 14:31:54 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> This patch series adds controls for stateless VP9 decoders plus a VP9
> backend to the rkvdec driver showing how those controls can be used in
> a real implementation. This means this series depends on the rkvdec
> series posted here [1].
> 

Forgot to mention that this implementation has been tested with a
modified version of FFmpeg (please don't look at the code/commits it's
all ugly...)

> Regards,
> 
> Boris
> 
> [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=1483

[2]https://github.com/bbrezillon/FFmpeg/commits/v4l2-vp9

> 
> Boris Brezillon (3):
>   media: v4l2-ctrls: Add the [__]v4l2_ctrl_s_ctrl_compound() helpers
>   media: uapi: Add VP9 stateless decoder controls
>   media: rkvdec: Add the VP9 backend
> 
>  Documentation/media/uapi/v4l/biblio.rst       |   10 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        |  584 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  258 +++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  drivers/staging/media/rkvdec/Makefile         |    2 +-
>  drivers/staging/media/rkvdec/rkvdec-vp9.c     | 1572 +++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.c         |   56 +-
>  drivers/staging/media/rkvdec/rkvdec.h         |    6 +
>  include/media/v4l2-ctrls.h                    |   44 +
>  include/media/vp9-ctrls.h                     |  515 ++++++
>  10 files changed, 3044 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
>  create mode 100644 include/media/vp9-ctrls.h
> 

