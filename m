Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B1C5CF3A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 14:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfGBMP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 08:15:28 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:40240 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfGBMP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 08:15:27 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id XoFQ2000W05gfCL01oFRCZ; Tue, 02 Jul 2019 14:15:25 +0200
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hiHgy-0000th-Sl; Tue, 02 Jul 2019 14:15:24 +0200
Date:   Tue, 2 Jul 2019 14:15:24 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        =?ISO-8859-15?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCHv2 for v5.3] v4l2-subdev: fix regression in check_pad()
In-Reply-To: <9885852d-d77e-7bfe-80d4-c4ff20443529@xs4all.nl>
Message-ID: <alpine.DEB.2.21.1907021413060.3147@ramsan.of.borg>
References: <9885852d-d77e-7bfe-80d4-c4ff20443529@xs4all.nl>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1525833268-1562069724=:3147"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1525833268-1562069724=:3147
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

 	Hi Hans,

On Sat, 29 Jun 2019, Hans Verkuil wrote:
> sd->entity.graph_obj.mdev can be NULL when this function is called, and
> that breaks existing drivers (rcar-vin, but probably others as well).
>
> Check if sd->entity.num_pads is non-zero instead since that doesn't depend
> on mdev.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in v4l2_subdev_call()")
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks, this fixes the following boot regression on r8a7791/koelsch:

     -rcar-vin e6ef0000.video: Device registered as video27
     +rcar-vin e6ef0000.video: Unsupported media bus format for adv7612 13-004c
     +rcar-vin e6ef0000.video: Notifier registration failed
     +rcar-vin: probe of e6ef0000.video failed with error -22

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-1525833268-1562069724=:3147--
