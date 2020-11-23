Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FB12C18B0
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 23:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733087AbgKWWon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 17:44:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:49246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731299AbgKWWom (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 17:44:42 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97CFD206D5;
        Mon, 23 Nov 2020 22:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606171482;
        bh=HeypmxDNR6L3q3yPOiMFE+m7MMDXEWetGefZCk3lrUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pbf303fQ/pow3trphB87e+wYtDC3uiKZif+Qudwu2lnvWd0k2b8uwc8l9X32DM623
         VgceIkwgsFbJAX9zXeKcEOrNQYt8BnfQMpqHgef6IOLqvCcvVPIFqHwkypl+HP2Fsy
         NIwinhR2MpxN+hMCtuqTLMmTvpNGyLLtx+KPmEKI=
Date:   Mon, 23 Nov 2020 16:44:56 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jemma Denson <jdenson@gmail.com>,
        Patrick Boettcher <patrick.boettcher@posteo.de>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 013/141] media: dvb-frontends: Fix fall-through warnings
 for Clang
Message-ID: <20201123224456.GD21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <4e82e61c94f320aae692aaa0e55350049e17168f.1605896059.git.gustavoars@kernel.org>
 <20201122173116.1eb9f195@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201122173116.1eb9f195@coco.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 22, 2020 at 05:31:16PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 20 Nov 2020 12:26:09 -0600
> "Gustavo A. R. Silva" <gustavoars@kernel.org> escreveu:
> 
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> > warnings by explicitly adding multiple break and a return statements
> > instead of just letting the code fall through to the next case.
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, Mauro.
--
Gustavo
