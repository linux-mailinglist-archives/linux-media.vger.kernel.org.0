Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CDE267913
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 11:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgILJPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 05:15:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgILJPN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 05:15:13 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B643C214F1;
        Sat, 12 Sep 2020 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599902112;
        bh=W0uhZ2saWfmhse+6fr7q6uAeaNZ/gZdpLyIogvyRkKU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m7manp2r2H/9Z5BzHr8rDQ6eNzwZPOMp+UJchMIoJR5dI4QO3NnmoLq93Z2OxcjvF
         r81VAgQkLzPoPJv6qObs9COKnfpy5Yzdcdr0812AVkLXsfUuPLjUppec7koVDBCtoe
         Mk8NYXLQ9SuFROW0tWeCfZqYvBBq4kaJTZm7NOIM=
Date:   Sat, 12 Sep 2020 11:15:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        r.verdejo@samsung.com, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v10 0/4] media: vidtv: Implement a virtual DVB driver
Message-ID: <20200912111506.2d2bd512@coco.lan>
In-Reply-To: <94faa1f5-22b2-1a01-0812-526e8cf17596@xs4all.nl>
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
        <94faa1f5-22b2-1a01-0812-526e8cf17596@xs4all.nl>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans/Daniel,

Em Sat, 12 Sep 2020 10:21:59 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> > Building vidtv
> > --------------
> > vidtv is a test driver and thus is **not** enabled by default when
> > compiling the kernel.
> > 
> > In order to enable compilation of vidtv:
> > 
> > - Enable **DVB_TEST_DRIVERS**, then
> > - Enable **DVB_VIDTV**
> > 
> > When compiled as a module, expect the following .ko files:
> > 
> > - dvb_vidtv_tuner.ko
> > 
> > - dvb_vidtv_demod.ko
> > 
> > - dvb_vidtv_bridge.ko  
> 
> Why the dvb_ prefix? All virtual drivers just start with 'vi'.
> 
> And wouldn't it make more sense to call dvb_vidtv_bridge.ko just vidtv.ko?
> Just like the other virtual media drivers?

It is a sort of standard to use dvb_* for pure digital tv
bridge drivers.

Yet, I agree with you that at least an alias is needed.
earlier today, I wrote a patch with such purpose:

	https://patchwork.linuxtv.org/project/linux-media/patch/fccf254e33bdd169dde6bdd6f941cf773c82a1c0.1599901499.git.mchehab+huawei@kernel.org/

Still, maybe we should move dvb_vidtv_tuner.ko and dvb_vidtv_demod.ko
to dvb-frontends and rename them. Not 100% sure about that, though.

I would also rename vidtv_bridge.c to just vidtv.c.


Thanks,
Mauro
