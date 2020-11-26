Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74562C5518
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389973AbgKZNNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:13:55 -0500
Received: from gofer.mess.org ([88.97.38.141]:54031 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389842AbgKZNNy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:13:54 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2C1C011A001; Thu, 26 Nov 2020 13:13:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606396433; bh=G9GZVwEwbGPJHW2iplMsmHucEn2aoEZzNAbb26Qagr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gx9rbrhTEqCXju6nJ5techAUzQiDXzPoJMqw4j6E4ezXLzJPUEUVGTwzDMu4nzc5h
         qpD2hQFrDfUCa4Vkl/2Pr6i3ZdjB4v4Dc70gjfh2A6h6CdXNT33cnublSCt57HnGZ3
         OB2GT6+irebqLM0TWXsUn1N7SRzjrwWxGo+OlswbmpZxLqMI5Do7pBuPB5GDOBVVXv
         o9ttCfPOFiGRQ7BNJnjdt5an6cL6t4pZHEORsuuJd8JcaOPQXN5wHZY1h1U+qV+7JP
         UcyH2bgI5Cc3KA+jI6I4iv3s12iVIP1ES0GAA154sz4sDmvnTbtGErbRAvOZQmGc6a
         0Q+6y+sY0tAdw==
Date:   Thu, 26 Nov 2020 13:13:53 +0000
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Improve LIRC documentation
Message-ID: <20201126131352.GA20099@gofer.mess.org>
References: <cover.1606395586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1606395586.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 26, 2020 at 02:00:54PM +0100, Mauro Carvalho Chehab wrote:
> Hi Sean,
> 
> Those two patches improve LIRC uAPI docs by adding the structs documented at
> lirc.h to the output of Documentation/output/userspace-api/media/rc/lirc-dev-intro.html
> 
> Please review.

Thanks,

For the series:

Signed-off-by: Sean Young <sean@mess.org>

> 
> Mauro Carvalho Chehab (2):
>   media: docs: uAPI: rc: dual-license the docs with GPL v2
>   media: rc: improve LIRC documentation
> 
>  Documentation/userspace-api/media/rc/keytable.c.rst |  2 +-
>  .../userspace-api/media/rc/lirc-dev-intro.rst       | 13 ++++++++++---
>  Documentation/userspace-api/media/rc/lirc-dev.rst   |  2 +-
>  Documentation/userspace-api/media/rc/lirc-func.rst  |  2 +-
>  .../userspace-api/media/rc/lirc-get-features.rst    |  2 +-
>  .../userspace-api/media/rc/lirc-get-rec-mode.rst    |  2 +-
>  .../media/rc/lirc-get-rec-resolution.rst            |  2 +-
>  .../userspace-api/media/rc/lirc-get-send-mode.rst   |  2 +-
>  .../userspace-api/media/rc/lirc-get-timeout.rst     |  2 +-
>  .../userspace-api/media/rc/lirc-header.rst          |  2 +-
>  Documentation/userspace-api/media/rc/lirc-read.rst  |  2 +-
>  .../media/rc/lirc-set-measure-carrier-mode.rst      |  2 +-
>  .../media/rc/lirc-set-rec-carrier-range.rst         |  2 +-
>  .../userspace-api/media/rc/lirc-set-rec-carrier.rst |  2 +-
>  .../media/rc/lirc-set-rec-timeout-reports.rst       |  2 +-
>  .../userspace-api/media/rc/lirc-set-rec-timeout.rst |  2 +-
>  .../media/rc/lirc-set-send-carrier.rst              |  2 +-
>  .../media/rc/lirc-set-send-duty-cycle.rst           |  2 +-
>  .../media/rc/lirc-set-transmitter-mask.rst          |  2 +-
>  .../media/rc/lirc-set-wideband-receiver.rst         |  2 +-
>  Documentation/userspace-api/media/rc/lirc-write.rst |  2 +-
>  Documentation/userspace-api/media/rc/rc-intro.rst   |  2 +-
>  Documentation/userspace-api/media/rc/rc-protos.rst  |  2 +-
>  .../userspace-api/media/rc/rc-sysfs-nodes.rst       |  2 +-
>  .../userspace-api/media/rc/rc-table-change.rst      |  2 +-
>  Documentation/userspace-api/media/rc/rc-tables.rst  |  2 +-
>  .../userspace-api/media/rc/remote_controllers.rst   |  2 +-
>  include/uapi/linux/lirc.h                           |  2 +-
>  28 files changed, 37 insertions(+), 30 deletions(-)
> 
> -- 
> 2.28.0
> 
