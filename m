Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDF83AD891
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 10:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbhFSISE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 04:18:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:32873 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233586AbhFSISD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 04:18:03 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 87708C64CE; Sat, 19 Jun 2021 09:15:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624090551; bh=6uWZ5D/Vfe+loYwha1/nll3IHXXspVs9vHhejVISxO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mY2yXOYBSAx6pjBRMPVlMQyHzX2DGqmOL/4I0b+xcevpO4FZT73ZmTc6oaOzZ/t2M
         R+3e5NOD4SwjUduSLcLauUyiNJvfqbFP175kE/qJLj7/WcyfjXgsO5D9Ot1RZpKdPf
         OUzYvpil7DEsPhZ9Y+7fe7dgJvuOz7cs7THnD/TLB2BefubktvGvpCwOqHQ3Hg5hWd
         B4aHSThpGi6Wd27fNupk6KHKfC54EMK9LDC7SgjUIKk7XrNueebeWKAo7UFpgu5Nt8
         YlN+P1LyUHOxwOyUzmH8VyXLi7KQahiCIDGj85UcoafMXOEqIs+zg4ORTPK6JLFrcW
         JzUE2ePKV35ug==
Date:   Sat, 19 Jun 2021 09:15:51 +0100
From:   Sean Young <sean@mess.org>
To:     lijian_8010a29@163.com
Cc:     gustavoars@kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, lijian <lijian@yulong.com>
Subject: Re: [PATCH] media: dvb-frontends: dib0090: Delete 'break' after
 'goto'
Message-ID: <20210619081551.GA6887@gofer.mess.org>
References: <20210618070707.4731-1-lijian_8010a29@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618070707.4731-1-lijian_8010a29@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 03:07:07PM +0800, lijian_8010a29@163.com wrote:
> From: lijian <lijian@yulong.com>
> 
> break is not useful after a goto, so delete 'break' after 'goto',
> and delete reused 'goto identification_error;'.
> 
> Signed-off-by: lijian <lijian@yulong.com>
> ---
>  drivers/media/dvb-frontends/dib0090.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
> index 903da33642df..9179fe1bd713 100644
> --- a/drivers/media/dvb-frontends/dib0090.c
> +++ b/drivers/media/dvb-frontends/dib0090.c
> @@ -403,8 +403,6 @@ static int dib0090_identify(struct dvb_frontend *fe)
>  			break;
>  		case P1A_B:
>  			dprintk("P1-A/B detected: driver is deactivated - not available\n");
> -			goto identification_error;
> -			break;

Removing both the break and the goto introduces a switch fallthrough; this
would need explicit marking with the fallthrough keyword.

Having said that, fallthrough isn't needed here. Best to avoid fallthrough
with all it pitfalls and just keep the goto.

>  		default:
>  			goto identification_error;
>  		}
> @@ -493,8 +491,6 @@ static int dib0090_fw_identify(struct dvb_frontend *fe)
>  			break;
>  		case P1A_B:
>  			dprintk("P1-A/B detected: driver is deactivated - not available\n");
> -			goto identification_error;
> -			break;

Same here.

>  		default:
>  			goto identification_error;
>  		}
> -- 
> 2.25.1
