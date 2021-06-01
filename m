Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBAF2396C81
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 06:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbhFAEwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 00:52:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhFAEwi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 00:52:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E77B6136E;
        Tue,  1 Jun 2021 04:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622523057;
        bh=/IBXi1HaEE5LEcU2BkX0FxR1OKGyLQofH1Odj5MsqU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wItfuzFT4jGAJlguxYJ57vnAo6BWD1p15d2GiVU3PHZXAnX9731shP/oVriTOZcRh
         4BPcO7xQgZ6a6Sa5t0JklrGXiA69P3m8pDe8+OHgYrWWMxyaD7i18kMW+Nq+hOWFPF
         p2jdpDuJOm253FpBaZONFXOvZ+3pganC2b7WWcBA=
Date:   Tue, 1 Jun 2021 06:50:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Alaa Emad <alaaemadhossney.ae@gmail.com>,
        Brad Love <brad@nextdimension.cc>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxim Plotnikov <wgh@torlan.ru>, Sean Young <sean@mess.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: sp8870: move it to staging
Message-ID: <YLW8rkDRNp1TdWqY@kroah.com>
References: <5e694bc1b0670b58b93a9fea5712ed0f306e6050.1622493461.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e694bc1b0670b58b93a9fea5712ed0f306e6050.1622493461.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 31, 2021 at 10:37:54PM +0200, Mauro Carvalho Chehab wrote:
> This driver is used only ba av7110, which is preparing for
> its retirement. So, move this ancillary driver to stay together
> with av7110.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/dvb-frontends/Kconfig           | 12 -----------
>  drivers/media/dvb-frontends/Makefile          |  1 -
>  drivers/staging/media/av7110/Kconfig          | 20 +++++++++++++++++++
>  drivers/staging/media/av7110/Makefile         |  2 ++
>  .../media/av7110}/sp8870.c                    |  0
>  .../media/av7110}/sp8870.h                    |  0
>  6 files changed, 22 insertions(+), 13 deletions(-)
>  rename drivers/{media/dvb-frontends => staging/media/av7110}/sp8870.c (100%)
>  rename drivers/{media/dvb-frontends => staging/media/av7110}/sp8870.h (100%)

Don't you need a TODO file for these moves that says what is wrong with
the driver and when it will be removed and to not send cleanups for it?

thanks,

greg k-h
