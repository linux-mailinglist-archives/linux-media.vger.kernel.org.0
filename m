Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17DC552A343
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346879AbiEQNXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347650AbiEQNXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:23:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D82843491
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:23:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0554FB818A0
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 13:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59DCC34113;
        Tue, 17 May 2022 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652793817;
        bh=1Peo2IfHrEZHLPRKcK4ooPVhwOJ1qJqQeMrF1kJiuAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HGIQ+hqon6GgX41jY8x6Ki6GwtFMgXH/23QaCfnmevVVffTg0waNj/R8as2VUhGP+
         /e8oqQEk9wyk8H3/bGPn/g6YWD/2yYhmrF7fqVw5DZWvNhSV9bOd8uaucl/LYsCX8i
         4+BIP1EbxGSCqIg3IsIXjebfdfYXSX54e80zFhwf7JlWcTUs4/XZkERrKWa+PVJ0rq
         wWcHX5hvf9bjvCJOvPMnN0WRgKKDx/qKs7aM8JxmW7svQnmQknE8y96Qi+yIqBqWom
         uef/gaWR5aabhg8t89BRheH8f++5CdCT+U9nd356ql57tTNphnVhnyGNaxm1jx7j1q
         0a2pXoe9b8sbA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nqxAn-0000LI-I9; Tue, 17 May 2022 15:23:37 +0200
Date:   Tue, 17 May 2022 15:23:37 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, gushengxian@yulong.com,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Subject: Re: [PATCH 2/2] flexcop: allow for modern speeds
Message-ID: <YoOh2TC9RMOjx/ps@hovoldconsulting.com>
References: <20220517131109.28371-1-oneukum@suse.com>
 <20220517131109.28371-2-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517131109.28371-2-oneukum@suse.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 17, 2022 at 03:11:09PM +0200, Oliver Neukum wrote:
> High speed is no longer the ultimate in speed.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/media/usb/b2c2/flexcop-usb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
> index 98d9912a4efb..52e9964c2e59 100644
> --- a/drivers/media/usb/b2c2/flexcop-usb.c
> +++ b/drivers/media/usb/b2c2/flexcop-usb.c
> @@ -525,6 +525,12 @@ static int flexcop_usb_init(struct flexcop_usb *fc_usb)
>  	case USB_SPEED_HIGH:
>  		info("running at HIGH speed.");
>  		break;
> +	case USB_SPEED_SUPER:
> +		info("running at SUPER speed.");
> +		break;
> +	case USB_SPEED_SUPER_PLUS:
> +		info("running at SUPER+ speed.");
> +		break;

Not sure this change is warranted, though. These devices aren't going to
start supporting SuperSpeed.

>  	case USB_SPEED_UNKNOWN:
>  	default:
>  		err("cannot handle USB speed because it is unknown.");

Johan
