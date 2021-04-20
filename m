Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A9B36595D
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhDTM6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:58:21 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51897 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232174AbhDTM6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:58:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YpwllXwAa8K3KYpwolzgxn; Tue, 20 Apr 2021 14:57:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618923467; bh=5FPDARZPuzLS+K1xyf0rDFW7Kaw2QCPywrO+DTcE+mw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KoY3WLj2ZlVYkWbYdj5jhXuYliSIJbwl4o4uXZmgUIb4JFXhVBHYLz6nDXa7Vj41v
         FV6tUg+EO6P9hNBF/8wfhsCp9Ii3TKzMIGc8+vMbuQRX41h34LNMyoxtW2pUsvkMTL
         gF2IGPRd0NfDaLXCdH7Av0dqDkB01pj/fFFUvXxzm3cUPlNLczCnzgwBUNrbjO69bM
         SSRkeODdMdmkJ6fQZ3heTatrRvubnRWpgUiRPTExJ+c/tR6UVJrRKGJE78J83FpOtP
         Yckwu8XExyDjDhaCaYXQH21Y34SznCDAeMs4YP9DzZylKdmhfx2F52Zui5CgWPinsP
         7fmyJgJHdCTVg==
Subject: Re: [PATCH 4/8] staging: media: atomisp: Replace goto with immediate
 return in sh_css_pipe_get_grid_info()
To:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210419192602.498815-1-vrzh@vrzh.net>
 <20210419192602.498815-5-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1b0dc225-a62d-bbc9-6374-1c64bfc571fc@xs4all.nl>
Date:   Tue, 20 Apr 2021 14:57:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419192602.498815-5-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNgjplYAmpNK0s2QevqHXJJRh4N80au9KzRuKJwcwM1bg5M6+2j870FkR9pItd4vt05HHkiedszgt2O0ChGnJK2MnmvwvAB92pQlSY1KQzeFVwPCkBd/
 TMZHZIq+9HXhPPfvitFgOE0xV1voMk986+/3iWyF4DXPFzsjC79nOl/Kd+q2PtJc3pG63SGupGHcyJoUXUBvrhOI/iXluIsAlrE4b2EDSdG7MYB9isZCBqHZ
 ohQWWtUFDx8JFmWRc9FrNK5+xSe7hbrvQ0vY2/8amFWFe+oMz9QuPAo89OI5ax8c
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/04/2021 21:25, Martiros Shakhzadyan wrote:
> Replace centralized exit goto with an immediate exit log and return, in
> order for the log macro to properly display the file line.
> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 4d4f030e0fe0..87438b5948ba 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -5181,8 +5181,10 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
>  
>  	if (binary) {
>  		err = ia_css_binary_3a_grid_info(binary, info, pipe);
> -		if (err)
> -			goto ERR;
> +		if (err) {
> +			IA_CSS_LEAVE_ERR_PRIVATE(err);
> +			return err;
> +		}
>  	} else {
>  		memset(&info->s3a_grid, 0, sizeof(info->s3a_grid));
>  	}
> @@ -5207,7 +5209,6 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
>  
>  	info->vamem_type = IA_CSS_VAMEM_TYPE_2;
>  
> -ERR :
>  	IA_CSS_LEAVE_ERR_PRIVATE(err);
>  	return err;
>  }
> 

Hmm, I'm skipping this patch. It doesn't really change anything since
there is only one place where an error can occur, so there is no confusion
about what caused the error.

The patch is not wrong as such, but there is not a good enough reason to
apply it.

When in doubt, do nothing :-)

Regards,

	Hans
