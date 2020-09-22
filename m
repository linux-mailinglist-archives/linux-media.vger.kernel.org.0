Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36873273D04
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 10:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIVILt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 04:11:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:33480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgIVILs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 04:11:48 -0400
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44D81239E5;
        Tue, 22 Sep 2020 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600762308;
        bh=fWJzGI51JbOQ0EigOk9NkLRd/sd4iHc9gzBCY0IWYJg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sTwHb0LdUDdaYaz1WEoQs/WX+6fD1qwMMnIQnQ84Ny3q51nKAYYkZRcSCHFrMvPBU
         ZrwUNYY8j9VTCSbjGowHDps41OOE+BnEmorhYJghPDQJNFvPGDyHlSPQs5dgC9fW1Y
         7amqAezO/639kVfTGqF8SY/a4plgYXzAEfBgtGb8=
Date:   Tue, 22 Sep 2020 10:11:43 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] atomisp: Fixes and cleanups
Message-ID: <20200922101143.28779711@coco.lan>
In-Reply-To: <20200921215359.45003-1-alex.dewar90@gmail.com>
References: <20200921215359.45003-1-alex.dewar90@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 21 Sep 2020 22:53:49 +0100
Alex Dewar <alex.dewar90@gmail.com> escreveu:

> Hi Mauro,
> 
> Over the last month I've sent a few scattered patches to fix various
> warnings from static analysers, but they seem to have fallen through the
> cracks? I'm reposting them here as a series to make them easier to
> review. If you do have any feedback that'd be great :)

Usually, there's no need to re-send the patches, as we pick them
from a patchwork queue.

However, only one of the patches actually applied against the
linux-media tree.

So, please rebased the remaining patches on the top of it.

Thanks,
Mauro
