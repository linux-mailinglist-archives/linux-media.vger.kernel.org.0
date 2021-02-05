Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B337031117F
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 20:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbhBESGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 13:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbhBEPU5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 10:20:57 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B68C06178B;
        Fri,  5 Feb 2021 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=0/2zA/ADyjfnzZtoneWuo/iMnZWI+oIUh5vAI8TSf+o=; b=e6QN9UR8LxwF3qh1dohmBgkgqD
        ZOx3nOTe1bD+b5NtriH8rZd/c7sU/akXkoos3ir3JybpwITbBSLoaQo0cUjO6URDXqR74kHJl5xGN
        WOMU+zOSNkAzU2TFLUzgiZMK+lnZWmqubb18TSYHaVu1A4HfXxIxE1CLJGCXL6imYSr4yd1gBj27A
        hAsBi/6udbKE+DMfM+gIv+D+WndT27eNRZonLWqn17YQoVyjhQ2kdXxAVwVOymqOdZeu1ompBdaoE
        3+J6Jomoqztoh43sx3rujPOis0w/SNYBmgCzEJNjIVGZwNNcapq5bZqSVA+4BF1IkwR06cqr1c13S
        ByJ+7xmg==;
Received: from [2601:1c0:6280:3f0::aec2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l84Ux-0002GV-VX; Fri, 05 Feb 2021 17:02:24 +0000
Subject: Re: [PATCH] include: media: davinci: Fixed up few trivial spellings
 in the file isif.h
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        prabhakar.csengg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210205092117.551317-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <582f7b77-ba55-083e-9cd2-f4f0cb6dbbb7@infradead.org>
Date:   Fri, 5 Feb 2021 09:02:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210205092117.551317-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/5/21 1:21 AM, Bhaskar Chowdhury wrote:
> 
> 
> Several spelling fixes throughout the file.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  include/media/davinci/isif.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/media/davinci/isif.h b/include/media/davinci/isif.h
> index e66589c4022d..8369acd26e7e 100644
> --- a/include/media/davinci/isif.h
> +++ b/include/media/davinci/isif.h


-- 
~Randy

