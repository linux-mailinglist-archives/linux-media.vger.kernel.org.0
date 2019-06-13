Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3C244AC1
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 20:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfFMSfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 14:35:13 -0400
Received: from casper.infradead.org ([85.118.1.10]:37432 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbfFMSfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 14:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7jGVIyevnc3QNhubAdmkxBAVZun/3UPqIv9OmErJmZ0=; b=aEsHSupQ5pUEy48wA2g8B3EW1O
        WBjeRUgMdMXuc4yMQU80tjSZ89hI14Ec5eyd1NX+a0AdmjxglAQ2mQIbjiBc7CXz660DUVuMgsTP5
        RYubRz4L25nGMEN0PG82AbxRWwKhPrLt6IqCeO92GIRsjgBhpjyfQHizEL1QL7jHm9PLChiv4X/cU
        PBHmeg6/ERDa//u2MwEpER9cPdOs2vCknAtXPDvPYXI3weSfAoUIRHV+HRIJINpkOiqIwDJig6IlP
        93vi/lIKczr3e+BQQ7a/N33oQ6eN5VNUQg7nws9uWgHVXXhORB0/1hNyBCv/xrYnu/nhClQ3vs8mp
        +giDmheA==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbUZ3-0006hB-H5; Thu, 13 Jun 2019 18:35:09 +0000
Date:   Thu, 13 Jun 2019 15:35:07 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Brad Love <brad@nextdimension.cc>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.3] Add Hauppauge DVB devices
Message-ID: <20190613153507.4b6f95d3@coco.lan>
In-Reply-To: <20190613181447.16036-1-brad@nextdimension.cc>
References: <20190613181447.16036-1-brad@nextdimension.cc>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 13 Jun 2019 13:14:47 -0500
Brad Love <brad@nextdimension.cc> escreveu:

> Hi Mauro,
> 
> Here is my first pull request. Please be gentle :)

:-)

First problem:

	error: FETCH_HEAD: cannot verify a non-tag object of type commit.

You should use branches and sign them with your gpg signature.

Patches applied, thanks!

There are also a /12 patch series from you:

	https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=7220&state=13&q=&archive=&delegate=
> 
> This adds support for Hauppauge HVR1955 and HVR1975 devices, along with
> adding a vid:pid for a missing OEM Hauppauge 955Q variant.
> 
> Cheers,
> 
> Brad
> ---
> The following changes since commit 513dbd35b5d93c45fa7291147f21fc0227a9f999:
> 
>   media: add SPDX headers to some files (2019-06-12 11:42:27 -0400)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/brad/media_tree.git pr-5.3
> 
> for you to fetch changes up to 24a620ad0b74d485a1e61d5babe043f59a0ddd57:
> 
>   cx231xx-cards: Add Hauppauge 955Q variant (2019-06-13 12:27:57 -0500)
> 
> ----------------------------------------------------------------
> Brad Love (5):
>       si2157: add detection of si2177 tuner
>       pvrusb2: Add multiple dvb frontend support
>       pvrusb2: Add i2c client demod/tuner support
>       pvrusb2: Add Hauppauge HVR1955/1975 devices
>       cx231xx-cards: Add Hauppauge 955Q variant
> 
>  drivers/media/tuners/si2157.c                   |   6 +
>  drivers/media/tuners/si2157_priv.h              |   3 +-
>  drivers/media/usb/cx231xx/cx231xx-cards.c       |   2 +
>  drivers/media/usb/pvrusb2/Kconfig               |   2 +
>  drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c |  25 +++
>  drivers/media/usb/pvrusb2/pvrusb2-devattr.c     | 212 +++++++++++++++++++++---
>  drivers/media/usb/pvrusb2/pvrusb2-devattr.h     |   1 +
>  drivers/media/usb/pvrusb2/pvrusb2-dvb.c         |  88 +++++++---
>  drivers/media/usb/pvrusb2/pvrusb2-dvb.h         |   5 +-
>  drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h     |   4 +
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c         |  36 +++-
>  11 files changed, 339 insertions(+), 45 deletions(-)



Thanks,
Mauro
