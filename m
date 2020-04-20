Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395621B0B92
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 14:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgDTMoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 08:44:34 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43991 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728578AbgDTMoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 08:44:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QVmjj1GjW7xncQVmmjHMup; Mon, 20 Apr 2020 14:44:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587386668; bh=99Ly0Eh+cTwdb71NoygIFcYZRpxvSpXWdEEzrpxjpTY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BZ9BTNP2y6Y6juxB/z4EhhckusiAWZJN5mFUjIWcmNMb8o2QGqPjVMPivi9DVmVHt
         dZKmEbmzkcoPaAQup1mXnwrjTs6B6+5MXQdndPb/2KvBHdpeMW7QA1PvE82sFbUDx7
         twOvu015zlycVLmlizwYBqqcwzTetofx4zOu8OjBOvhpHVFlADaDwqrgSbtolkXukr
         QQ4uu2hz1Ufrw7RlntJi9a9lq+/9+P6eRwqgn6VVVOu2uYlYkpyRvZlLryOnZEGUx6
         pYtAMxmnjDtVc8zZS5ngbcXYtFWomawgVPDlbsG5PVvFX/6M7yji1NtA59hfFnYdw3
         rjhqY228q3uQw==
Subject: Re: [PATCH] toml: fix misleading identation
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200417211641.4689-1-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <08194043-cce9-e949-0078-ae9e12e0517f@xs4all.nl>
Date:   Mon, 20 Apr 2020 14:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200417211641.4689-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO/15qnmN6HljgNQAx+IFLRPgeZWUJFb3VtxyX5PDdVDG/0YG3FsnBnVfFrabWjPXA6Z87jveIVr4JGL5NG5CWDy9Xl/FFiHACjLVzDyEN4TfnrwCQMK
 dJ7ntqeZBj5jnyhZfCXiFVlc/o/SgcvVtqkrmsPYKkb6322jUc9gP1JFvNpPQ4xy1hSdDcLdCo54vswD/8QGD87rivvId0VVAPg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/04/2020 23:16, Rosen Penev wrote:
> Found with gcc's -Wmisleading-indentation
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

I've merged this with the '[PATCH] treewide: do not use return after else'
patch.

I'll still mark it as Accepted in patchwork, though.

Regards,

	Hans

> ---
>  utils/common/toml.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/common/toml.c b/utils/common/toml.c
> index dc9868a2..68cebef9 100644
> --- a/utils/common/toml.c
> +++ b/utils/common/toml.c
> @@ -1697,7 +1697,8 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
>          for (i = 0; i < 10; i++, p++) {
>              int xx = *p;
>              if (xx == '-') {
> -                if (i == 4 || i == 7) continue; return -1;
> +                if (i == 4 || i == 7) continue;
> +                return -1;
>              }
>              if (! ('0' <= xx && xx <= '9')) return -1;
>              val = val * 10 + (xx - '0');
> @@ -1724,7 +1725,8 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
>      for (i = 0; i < 8; i++, p++) {
>          int xx = *p;
>          if (xx == ':') {
> -            if (i == 2 || i == 5) continue; return -1;
> +            if (i == 2 || i == 5) continue;
> +            return -1;
>          }
>          if (! ('0' <= xx && xx <= '9')) return -1;
>          val = val * 10 + (xx - '0');
> 

