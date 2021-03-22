Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AA9343D90
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 11:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhCVKNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 06:13:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhCVKNO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 06:13:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BA1A61934;
        Mon, 22 Mar 2021 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616407993;
        bh=1GLMwOnQUjp7NQywkFUIum1DFGy9HJXnY0XttH395zQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hw276VewqFo5bM/PTcpDNK+jIEH0fr0ZyWwGzGA54yggnJ3RrMVY+jJjf6q5ivOOp
         VEPErL38nvjzd4I2doa2wVj2DuFa6wMxYTXeiXK3aHU3XicDXO3KAdrzVX0ivewgd6
         DGS4a9PVdBjq58bnEYtzShTw5enEhAQgBtEut+uAaV/6BFr1Ul8ar+eUlcZJUQ8gry
         Af/u1B4t+CUIG0eTnAojfSy+I412JJM3NAnrspbZbocaj2Izq3aRUTGgF0t5HN90Xn
         yO+Jo7fzCkrhenLSvMsXIylsJBVeZhBfaXHuQONNhF13H+MNjngt3wNOR9GdFZT83i
         FNYYyT0r0SRMg==
Date:   Mon, 22 Mar 2021 11:13:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.13] v2: Venus updates
Message-ID: <20210322111309.2b3ce16a@coco.lan>
In-Reply-To: <20210312085716.2435846-1-stanimir.varbanov@linaro.org>
References: <20210312085716.2435846-1-stanimir.varbanov@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 12 Mar 2021 10:57:16 +0200
Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:

> Fixed checkpatch warn/errors.
> 
> Supersedes https://patchwork.linuxtv.org/project/linux-media/patch/20210306162903.221668-1-stanimir.varbanov@linaro.org/

Don't do that. Instead, reply to the patch you sent earlier, or change
it at patchwork to "Superseed", as I handle pull requests in the order
they arrive. 

So, by the time I handled this PR, the previous one was already
merged, and another PR was added afterwards.

So, too late to revert it.

Please rebase your PR on the top of upstream and resend it.

Thanks,
Mauro
