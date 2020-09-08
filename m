Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7107C260FB3
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 12:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgIHK1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 06:27:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:37162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729228AbgIHK1W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 06:27:22 -0400
Received: from coco.lan (ip5f5ad5ce.dynamic.kabel-deutschland.de [95.90.213.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BC9D2177B;
        Tue,  8 Sep 2020 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599560841;
        bh=98uqJvpNFRRmztCSHPipazrlYRl/HX3TWgGmXTvF4iU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U66DiOtCOmRyrxx1i/2Sq9Q3zt+MIZQEckcbSH3hXI68XJipOrOJd8BnhSlrxYz0W
         NMyVQUztG2J9rNZeC/b7EVRUxy8RaDB5xy+My8XQhYHoYcFCeoeT9DoW1h6L3267vw
         VOPjzaQQ8AAGsu9QXF6HkRk+5+ZYEKkWti7pCZgA=
Date:   Tue, 8 Sep 2020 12:27:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devel@driverdev.osuosl.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Anant Thazhemadam <anant.thazhemadam@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] address W=1 warnings at staging/media/atomisp
Message-ID: <20200908122716.09562b43@coco.lan>
In-Reply-To: <cover.1599141140.git.mchehab+huawei@kernel.org>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

Em Tue,  8 Sep 2020 12:12:21 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> The linux-media policy is to have zero warnings with W=1. However, when
> I started using a Jenkins instance at https://builder.linuxtv.org to automate
> such tests, I didn't notice that a bug at the scripts were just ignoring
> warnings.

Please ignore this patch series. It was sent by mistake instead
of a completely unrelated one.

This was already merged via the media tree.

Thanks,
Mauro
