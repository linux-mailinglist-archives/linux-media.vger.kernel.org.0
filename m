Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929F01A7E01
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 15:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731921AbgDNN0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 09:26:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:58268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731811AbgDNN0i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 09:26:38 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CF632064A;
        Tue, 14 Apr 2020 13:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586870795;
        bh=9W/HyBUTNA9xJihOP6WNQHBn9qXODr85F+yJ6JRchDc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R/Cm15qvptpJz5+ZTlJbK0Q3ZZpttQRtj06aQlvTOKJInt0FBc4ZAsxoWB+V91W6K
         44ROAr80b/6pq8c2vkNzGO8Naut9E/Jtup6jPQNgIwin1QL0S6nK1kpQc1o4+XNFQ8
         8GXElpEYPEdZzwQgk18C33jKVcGSZbndo+atYD4E=
Date:   Tue, 14 Apr 2020 15:26:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH] media: Kconfig: Don't expose API options
Message-ID: <20200414152631.7d1f1925@coco.lan>
In-Reply-To: <20200414152147.053b4b29@coco.lan>
References: <20200414130210.18970-1-ezequiel@collabora.com>
        <20200414152147.053b4b29@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 14 Apr 2020 15:21:47 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Tue, 14 Apr 2020 10:02:10 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > There is no need to expose API options; instead,
> > drivers that support a given API are expected to just select it.
> > 
> > Happily, this is currently the case, so simply stop
> > exposing the options.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/Kconfig           | 2 +-
> >  drivers/media/mc/Kconfig        | 3 +--
> >  drivers/media/v4l2-core/Kconfig | 2 +-
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index a8def1591352..eef4c6761ffb 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -173,7 +173,7 @@ config VIDEO_DEV
> >  	  radio devices and by some input devices.
> >  
> >  config MEDIA_CONTROLLER
> > -	bool "Media Controller API"
> > +	bool  
> 
> This is not true here... non-embedded drivers like DVB and UVC can work
> with or without the media controller. For them, the API is experimental.

Heh.... I meant to say:

	For them, the API is ***optional***.

Thanks,
Mauro
