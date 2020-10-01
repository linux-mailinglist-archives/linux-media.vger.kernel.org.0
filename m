Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16D2280348
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 17:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732415AbgJAPzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 11:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:59370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732287AbgJAPzy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 11:55:54 -0400
Received: from coco.lan (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9C2520759;
        Thu,  1 Oct 2020 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601567753;
        bh=vxyFRRU2qAS1XrbF1XrQWvqjNB7UV65Xf+brUtoe3do=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sfy54yhGbYa7w21zEIpJyw5KYnX+DBYKYS8+qD/0ftQfoiIJ0FflX6B7dd55p7dRr
         UoghXz8We5TiQj8k/pLvpKzBozSGk0mtpfATNpWs6mXqhB67opL+btz3nLkg0F3HFZ
         fnG5Q92V4Agk7IoQS8xUb28Yvf7cOfQeddVtQzvA=
Date:   Thu, 1 Oct 2020 17:55:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3] media: atomisp: fixes build breakage for ISP2400 due
 to a cleanup
Message-ID: <20201001175547.1eb58b26@coco.lan>
In-Reply-To: <CAHp75Ve3B_YzC3JpswDv_8sYoMmvh58q4iWxfx2090Nfk3+_Fw@mail.gmail.com>
References: <490e5002c3fea266524c31e1a94853dca9c3286c.1601551027.git.mchehab+huawei@kernel.org>
        <CAHp75Ve3B_YzC3JpswDv_8sYoMmvh58q4iWxfx2090Nfk3+_Fw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Em Thu, 1 Oct 2020 18:50:12 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Thu, Oct 1, 2020 at 2:17 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > A temporary var needed for building with ISP2400 was removed
> > by accident on a cleanup patch.
> >
> > Fix the breakage.  
> 
> Is this in any of your branches?

I added v3 of the fixes today at the media tree master branch.

If no merge issues happen, it should be at tomorrow's linux-next.

Thanks,
Mauro
