Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34C41D0DF4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 11:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387973AbgEMJ4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 05:56:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:59744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733061AbgEMJ4J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 05:56:09 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 319F2206D6;
        Wed, 13 May 2020 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589363769;
        bh=ayQIYBoq1/11f+SGXZ4WB5p1qyFYV0HIzGXCQ44ZZ5M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sQ04DAiTsUb9KSkYHof6mNg8BaWQFfNbebKNrZuHDl8EpsGyaZDNdShUPIlxN4t2w
         hX4urPGcGi7EwPrea4dROYxCiX51IBczD0DmSfFbJm3nhXo5oOUs0UyswrT9sSbHaI
         BLJ1SGnqsPlVwx8jebW1n+7lZZgU/iaikFG7iScE=
Date:   Wed, 13 May 2020 11:56:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200513115605.787e9079@coco.lan>
In-Reply-To: <20200512165644.6609098b@coco.lan>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200502190414.7ede79b6@coco.lan>
        <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
        <20200512122056.6ae3580f@coco.lan>
        <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
        <CAHp75VdDm+NLVdG7AfwO=FwmA=naqVwAiqbUyyUWc4hwHHSRHg@mail.gmail.com>
        <20200512165644.6609098b@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 12 May 2020 16:56:44 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> [   79.625858] virt_to_cache: Object is not a Slab page!

Solved this issue:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=c916263a340ef1c4cc187ad6267302bdd4298514

Yet, I'm not happy with the code inside the hmm/ dir, nor the code at
isp_mmu.c. There are too many dirty memory-management magic there, including
some forks from upstream /mm code inside it. 

Changing it may not be an easy task, as it currently uses three different
VMA areas (dynamic, reserved, and "normal"). Touching it without knowing more 
about the atomisp or being able to test the driver seems risky. 

Thanks,
Mauro
