Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A5F26B78D
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgIPAZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:25:00 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:35324 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgIOOPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 10:15:54 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 0A6013A39CE;
        Tue, 15 Sep 2020 13:21:00 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5B356FF80F;
        Tue, 15 Sep 2020 13:18:34 +0000 (UTC)
Date:   Tue, 15 Sep 2020 15:22:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/3] media: docs: v4l2-subdev: fix typo
Message-ID: <20200915132225.vagwwswb7d6dvx63@uno.localdomain>
References: <20200904215141.20862-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200904215141.20862-1-luca@lucaceresoli.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On Fri, Sep 04, 2020 at 11:51:39PM +0200, Luca Ceresoli wrote:
> Fix "will to" -> "will do".
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>


Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j


> ---
>  Documentation/driver-api/media/v4l2-subdev.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index bc7e1fc40a9d..9a7dddd97f5a 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -191,7 +191,7 @@ but it is better and easier to use this macro:
>
>  	err = v4l2_subdev_call(sd, core, g_std, &norm);
>
> -The macro will to the right ``NULL`` pointer checks and returns ``-ENODEV``
> +The macro will do the right ``NULL`` pointer checks and returns ``-ENODEV``
>  if :c:type:`sd <v4l2_subdev>` is ``NULL``, ``-ENOIOCTLCMD`` if either
>  :c:type:`sd <v4l2_subdev>`->core or :c:type:`sd <v4l2_subdev>`->core->g_std is ``NULL``, or the actual result of the
>  :c:type:`sd <v4l2_subdev>`->ops->core->g_std ops.
> --
> 2.28.0
>
