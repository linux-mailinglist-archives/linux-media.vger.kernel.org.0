Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29AC7538D0F
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 10:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244938AbiEaInZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 04:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238352AbiEaInT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 04:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC0B66C574
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653986594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9fPaBZDsV84kO0IEmLkMM+G7p0afLOtSjYZX9TssTp0=;
        b=MOEenxCBRkxv3kNinQ6gZ+jKu7wQGbSN2LCeDGgcEmWfXFuS7UDU5xWv5Xd/7A50D+2/z7
        liJmbgFPuS01ZW+XYCbSKKB2HM6GumD/wIpNDfSm1/PP7LAAfdAOik8u16dlhgChRuSFlN
        kcHV/bFJvsSfX7GgZsinHJS9z0nDsTA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-C2fC_yMSO0CwRs7Tw8xcxA-1; Tue, 31 May 2022 04:43:12 -0400
X-MC-Unique: C2fC_yMSO0CwRs7Tw8xcxA-1
Received: by mail-wm1-f70.google.com with SMTP id u12-20020a05600c19cc00b0038ec265155fso1075682wmq.6
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 01:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9fPaBZDsV84kO0IEmLkMM+G7p0afLOtSjYZX9TssTp0=;
        b=AVUsXuOW7fP/V1R6sDDDWl1sIOVc/yedQ0gr0D9PKXqmACSOj9tdDmI4jc3iGI4bWX
         C24I6/uaQ5KMyqaY+j7w0it0rcUl6EW2Lsz2UlyQwBK5jjKTW5x/snBdIyVe4k2Tamsh
         U3Ni5IhBLGxvIzuDNOuSKIxoo/541J0Sk9EhLU7KqPg02uP1ld5QQxazI2xgcUiOe2YN
         FYNPVaoHsZIT3cu3N53KlOcmpgUDQkfT9/UpFJI1Q5D6FpYTJPV1XAV3DQSnLPr9D8Sg
         9UC3b6vy2P7TQE6S11JBuYnO5VPToF1AKtr/NWCS1oGOBbEOpfiULB5RkLfdFbI6cz0y
         Jg3w==
X-Gm-Message-State: AOAM533v8FnOLT5N/cUVZzOmmEdQlOfUhI7G/2iJ/Ghmptgh+9sJcZCY
        LE8c53UN7WNx9Ryv+UKCrgW0eTW12wKbD4mma3G2sl1xgMueQcdHB00S8SRGKrvOxFNvE6THNvt
        SC07LWd5gqYdkX95YP/djxuM=
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id m5-20020a05600c3b0500b0039754ce0896mr22494783wms.3.1653986591070;
        Tue, 31 May 2022 01:43:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfshR+I/hDPQmtoECOmlS+FrzrfxKwqTinLxQRa/ZAYNB2+FaUFLoMjB75XtGMJIFbhKjijA==
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id m5-20020a05600c3b0500b0039754ce0896mr22494767wms.3.1653986590859;
        Tue, 31 May 2022 01:43:10 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it. [146.241.112.184])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b0039c17452732sm1554367wmq.19.2022.05.31.01.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 01:43:10 -0700 (PDT)
Message-ID: <e530dc2021d43a29b64f985d7365319eab0d5595.camel@redhat.com>
Subject: Re: [PATCH 1/6] netlink: fix missing destruction of rhash table in
 error case
From:   Paolo Abeni <pabeni@redhat.com>
To:     Chengguang Xu <cgxu519@mykernel.net>, netdev@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Date:   Tue, 31 May 2022 10:43:09 +0200
In-Reply-To: <20220529153456.4183738-2-cgxu519@mykernel.net>
References: <20220529153456.4183738-1-cgxu519@mykernel.net>
         <20220529153456.4183738-2-cgxu519@mykernel.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Sun, 2022-05-29 at 23:34 +0800, Chengguang Xu wrote:
> Fix missing destruction(when '(--i) == 0') for error case in
> netlink_proto_init().
> 
> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
> ---
>  net/netlink/af_netlink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index 0cd91f813a3b..bd0b090a378b 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -2887,7 +2887,7 @@ static int __init netlink_proto_init(void)
>  	for (i = 0; i < MAX_LINKS; i++) {
>  		if (rhashtable_init(&nl_table[i].hash,
>  				    &netlink_rhashtable_params) < 0) {
> -			while (--i > 0)
> +			while (--i >= 0)
>  				rhashtable_destroy(&nl_table[i].hash);
>  			kfree(nl_table);
>  			goto panic;

The patch looks correct to me, but it looks like each patch in this
series is targeting a different tree. I suggest to re-send, splitting
the series into individual patches, and sending each of them to the
appropriate tree. You can retain Dan's Review tag.

Thanks,

Paolo

