Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436B17AB016
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 12:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbjIVK7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 06:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbjIVK7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 06:59:13 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F341AF
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 03:59:07 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 117971000CC; Fri, 22 Sep 2023 11:59:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1695380346; bh=AcIJHA+j/ppCK0RXH8D+GztBz7MtJ9lI5LurCOK01Vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JUB8eph+v3ffZ9dbYMUiNhEML13yomxQ14ulqg5oR2Pd8uWLJAybFEU6iRis4PH09
         KJO4E1+byIishcHoDwWs37J8e3/ItTBPUfpAFxL574RBSGY0QLM66qMT/tNEaOK1E0
         LaDY3roSKLrpqtDNxHcc+BrbrABJw8/t39BIU1xzx8RNICxzKAKPMKwBzh+mA1oWcA
         CmoMGkv130ei18HekEaawOf/3jL8Q6dnKqccOGX040LgCyoemv92Kv8TUHhF9/sLIV
         kM7Mj/l8EwgRxv3exXiWXo2ru2BRGNVNML7rKFjZRO5F51c39axrLgSPoezRt9NJet
         0UNMz7sQIh7HQ==
Date:   Fri, 22 Sep 2023 11:59:06 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 7/7] media: rc: ati_remote: increase mouse_name buffer
 size
Message-ID: <ZQ1zetaBJAxd1Q5J@gofer.mess.org>
References: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
 <20230922105036.3148784-8-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922105036.3148784-8-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 22, 2023 at 12:50:36PM +0200, Hans Verkuil wrote:
> Fixes this compiler warning:
> 
> drivers/media/rc/ati_remote.c: In function 'ati_remote_probe':
> drivers/media/rc/ati_remote.c:876:21: warning: ' mouse' directive output may be truncated writing 6 bytes into a region of size between 1 and 80 [-Wformat-truncation=]
>   876 |                  "%s mouse", ati_remote->rc_name);
>       |                     ^~~~~~
> drivers/media/rc/ati_remote.c:875:9: note: 'snprintf' output between 7 and 86 bytes into a destination of size 80
>   875 |         snprintf(ati_remote->mouse_name, sizeof(ati_remote->mouse_name),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   876 |                  "%s mouse", ati_remote->rc_name);
>       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sean Young <sean@mess.org>

I was looking at this problem this morning - you beat me to it. :)

Reviewed-by: Sean Young <sean@mess.org>

Thanks
Sean

> ---
>  drivers/media/rc/ati_remote.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
> index fff4dd48eaca..d7721e60776e 100644
> --- a/drivers/media/rc/ati_remote.c
> +++ b/drivers/media/rc/ati_remote.c
> @@ -251,7 +251,7 @@ struct ati_remote {
>  
>  	char rc_name[NAME_BUFSIZE];
>  	char rc_phys[NAME_BUFSIZE];
> -	char mouse_name[NAME_BUFSIZE];
> +	char mouse_name[NAME_BUFSIZE + 6];
>  	char mouse_phys[NAME_BUFSIZE];
>  
>  	wait_queue_head_t wait;
> -- 
> 2.40.1
