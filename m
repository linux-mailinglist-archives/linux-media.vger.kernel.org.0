Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CCA364CE2
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 23:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbhDSVLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 17:11:13 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46661 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234022AbhDSVLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 17:11:12 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id YbADlTPrho2ggYbAGlhWlZ; Mon, 19 Apr 2021 23:10:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618866641; bh=8PkbTnPUpMsi6npMBfZfbeaUkwP6jQ6Wu5Og+CNQBSs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kutMfO35E2uyZ1NngGsIYF95kmCyiLftjR6+QkRQTmgOgPiIhI2VBK1xYPpI8NKtt
         XSGvZyr9hf60YqqCTi3HRNg5XQ+Bk76gwpFnsGyu4lno7C/oFAcBZAqPtbbkLNv273
         VF1QpFn82cWvgQVPVh6tYAzvgnd/Q3kUMfFElQi8kZzCQ96KhF6/Cw5YTuDcg1Quwm
         7Qc1TKVaAaIyTqAMvAdV9t9OM1ggyJLY9SQXBliQ0kduQrDWs4bllnUzCZTAWFbSUa
         9RoBb0CuR9ViwdOisn14e+baqb1ZRUHKTbsb86IU9hXltJIV7f/MVLkjiu9WmP/gi8
         dCgTdEHbtK+IA==
Subject: Re: [PATCH] configure.ac: Resolve GIT_SHA even if repository is a
 submodule
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org
References: <20210419182832.577010-1-niklas.soderlund@ragnatech.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <dd9a9dde-2c39-1472-a71b-f6039993fce2@xs4all.nl>
Date:   Mon, 19 Apr 2021 23:10:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419182832.577010-1-niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI2Dpfjv9eGZIqg06AGI3W+eX1UH+Ftne0tBBoW2oH8dn+qjpGGhT46DGOX/eTRmPwnzvfUJEGWDy9efkoMhpdgdhtvqyWm120UT76WgUy8QBV/HdQth
 fIrxPWk0/M1AVjWPMfJA8XYH5z61Svh6kuGsnGH6oKpMDYB/mtYIZFeOJ90xaEJqS9HywW/uTTwFwIneKix3td/LNHbdsPi5QyWetTQT7D5KHcfDhj0hXU+D
 +6WPa4JVMJuhaHT+pvvwFA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/04/2021 20:28, Niklas Söderlund wrote:
> If the v4l-utils repository is a git submodule the $(top_srcdir)/.git is
> a file and not a directory. Update the shell check to allow the test to
> pass in both cases.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> ---
>  configure.ac | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure.ac b/configure.ac
> index f144a50d034fbda0..4ac4195cd6e4747e 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -588,7 +588,7 @@ fi
>  CPPFLAGS="-I\$(top_srcdir)/lib/include -Wall -Wpointer-arith -D_GNU_SOURCE $CPPFLAGS"
>  
>  # Obtain git SHA of HEAD
> -AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
> +AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -e \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
>  
>  # Obtain git commit count of HEAD
>  AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])

Isn't the same change needed here and in GIT_COMMIT_DATE as well?

Regards,

	Hans

> 

