Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429841D6502
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2020 02:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgEQAzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 May 2020 20:55:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:56404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726295AbgEQAzJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 May 2020 20:55:09 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 525EF20671;
        Sun, 17 May 2020 00:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589676909;
        bh=gfIqYq0XaVd551sDhcvIAW11/hd2mVWmMREN3svukMA=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=yEdz1dLtjyTLRPZVMGpx0rg985byaRfxYse+KoZ2hrLIxcHaGAKGn0G6KFtaMcnm7
         aJ/hyO3C9C2AYUxY33HCQKWc42z6aq8u1PdAgXlCNjjgPSgZch7plzOMlE9TaJFK2A
         V1OM2pwTfyVkPOCDaqPOwH1+mP47Sn6v4uExNWp8=
Date:   Sun, 17 May 2020 02:55:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] vidtv: fix issues preventing it to build and load
Message-ID: <20200517025505.7a787e7b@coco.lan>
In-Reply-To: <973c14629d76e5fdae4ed470899b0cd28a2f22b0.1589676457.git.mchehab+huawei@kernel.org>
References: <A67F53F3-E285-4E60-B3ED-6747F60E11C9@getmailspring.com>
        <973c14629d76e5fdae4ed470899b0cd28a2f22b0.1589676457.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 17 May 2020 02:48:16 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:



> +// FIXME: just added a random value here
> +#define POLL_THRD_TIME 10 /* ms */
>  
> -#define POLL_THRD_TIME 2000 /* msecs */

In time, this change is wrong... Only noticed after sent.

Thanks,
Mauro
