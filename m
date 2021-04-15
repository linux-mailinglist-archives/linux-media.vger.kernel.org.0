Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AD5360B36
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhDON7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:59:53 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56687 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233216AbhDON7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:59:52 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id X2Wjl3l2GsMyaX2WmlUOuP; Thu, 15 Apr 2021 15:59:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618495168; bh=M42Y1PXgR0/+1DrhsT1SyUGJ76Mk111ck02wraS/lQs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pu50NkuyaF39N+4M+A1T7gcnJV0vPWR/apP8zYN2Pt62bJCqIe9VKkJv7qaroKrTk
         nv1olxteUbPVlhKw2cHOs5Rj/Cscaslk7cfco4d+EFtJvnl37SwuthCcNJnSJtAgR8
         keah2uJ9HG4U7EPfSBmcHq2JniyOGqMlXPH4CeH7LXgoegL/kVtD97NI1qlJAX4NPF
         LOgltVUdPSqGc3n4w0NM5192lX9OydT+TR9uJWOFnhYrBpxHyIZgrtp4FwPzPx0Njy
         5u1W7weQfdAt8pXK0nrhkb1T31dvL5gm1ZLLQP0wELVOUDZ3jo7ICI51bnHYY1kmtO
         bAmhpVNRRN8MA==
Subject: Re: [PATCH] staging: media: atomisp: cleaning up sh_css.c
To:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210415005106.530914-1-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e7d21188-3f7e-1b8f-59b0-144713bd918d@xs4all.nl>
Date:   Thu, 15 Apr 2021 15:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415005106.530914-1-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKF3L6km6Rpso+QqXNIyPZn47YRvYpHIsht9mtm5pV4+VWkwgjjRIGQePQkBuB5vVOWJz0KiWa+pxvZ+TaJRTIi8MQLGbDtW5TxWevt5PJYzgtVX7vf2
 nTkv26QttBJY8K7YkKTho67WIm5isYFlEySlyWN5Ly/GJc4RfeGjPT1NlXki51igObfXw6iKmz1d5P/aZ2LSvItLSSz9bEnT6DPAvb6xbCqEWkNycCVEB35y
 Melq8NGN7j6gyG1JZqXDJEgvhro34dj/gZ1n6sRQOoJsG1JYaGhRm3yUZ5hp+W5A
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martiros,

If you look at other patch series, you'll see that they follow this pattern:

[PATCH x/y]

and for the cover letter: [PATCH 0/y]

It's recommended to follow that rule.

On 15/04/2021 02:50, Martiros Shakhzadyan wrote:
> The following set of patches for sh_css.c aims to resolve coding style issues
> and remove redundancies.
> 
> Martiros Shakhzadyan (9):
>   staging: media: atomisp: [1/6] Fix sh_css.c brace coding style issues
>   staging: media: atomisp: [2/6] Fix sh_css.c brace coding style issues
>   staging: media: atomisp: [3/6] Fix sh_css.c brace coding style issues
>   staging: media: atomisp: [4/6] Fix sh_css.c brace coding style issues
>   staging: media: atomisp: [5/6] Fix sh_css.c brace coding style issues
>   staging: media: atomisp: [6/6] Fix sh_css.c brace coding style issues\

Why split this up in 6 patches? Just combine it in one. It's all the same thing
for the same source.

>   staging: media: atomisp: Use goto instead of return in ia_css_init()
>   staging: media: atomisp: [1/2] Remove redundant assertions in sh_css.c
>   staging: media: atomisp: [2/2] Remove redundant assertions in sh_css.c

Ditto for these two.

Regards,

	Hans

> 
>  drivers/staging/media/atomisp/pci/sh_css.c | 266 ++++++++-------------
>  1 file changed, 105 insertions(+), 161 deletions(-)
> 

