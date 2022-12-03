Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322CF64166A
	for <lists+linux-media@lfdr.de>; Sat,  3 Dec 2022 12:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiLCLW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Dec 2022 06:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLCLWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Dec 2022 06:22:53 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FAA11C02
        for <linux-media@vger.kernel.org>; Sat,  3 Dec 2022 03:22:49 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so1635927wms.4
        for <linux-media@vger.kernel.org>; Sat, 03 Dec 2022 03:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDBDvmquU4Sh7C6evROv80w/w7pVyQPhZj9NdUuDhPA=;
        b=SqCDWRpaygTAnQgQOQQ+yxC4InjCqIXI+Tlek1wehlug9q1B2g7lD4gQcSbVe0CD/O
         /eI/QGyccamq3lo0EhzK5ZBNklidoNnLAbq55f51Vkt3To3MYF8WOI81qNxjkSGZZvcP
         ldDQ7btSv01ocJjPNdXw3k7dWhqVfVZIJ6W9+0hTk2lvAQzTBw78MiV1xGMFjNhQU4q5
         2sgRKzG/bYFGImSIBVNyod04wIEVnlFvhxMbrSN1RmPHoTqviQSXSsxThO+aHahRl7hi
         mXhNwvP3ookcsgLMmcBxyT6D6/LPL2EQdYEOqwotqCQi5jlYzSehX2G84Af5mlxYA5/F
         YQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDBDvmquU4Sh7C6evROv80w/w7pVyQPhZj9NdUuDhPA=;
        b=6G41VS8dmtqii2WPrHhG20+EtrgOosl6XPuo2nNZ1gcQk57PM7boHB2S8ec+BzqSSF
         hLLGPFzjqT6A4JIZ4iqQYiu45Aj77kXS04LXp8Ky0t7jijkQlqjzojAkvzu5gtg6obDN
         yv54D9NiTMDY+y5njyWCth7vXxYPBhDrQ79Ihz3/nfH/au2lz3yAFTKFPTxKeHN/25id
         A2rLvhKf/2dt9nks72ZktkNamVNfjmo5IDA49Wk/2v1cbsuqanMdVfoAzfr9NVIGNa7P
         DpiS2utiD/Slit4WVl/FRAJSgtjskBhv2L/e35YXnNG1FLiJSWg02RPSWse3cZ9btCsl
         ZAYQ==
X-Gm-Message-State: ANoB5pm285/Bto1fJyKaKx4co3b3gIhB/f0/AhxHKyjTPf930+wSOl0k
        8HvDXbaIBjEHiaFQu+KO1pT7yzJxw+g=
X-Google-Smtp-Source: AA0mqf5vi3g2J+GkS2nYNQ1A0t0YM6Kdye1Ik8hc5ZQpv7jQ3IVaW6jK62cSXe7OyAqcnqwEIQ8DTQ==
X-Received: by 2002:a05:600c:3845:b0:3cf:d70e:223c with SMTP id s5-20020a05600c384500b003cfd70e223cmr46054222wmr.74.1670066567105;
        Sat, 03 Dec 2022 03:22:47 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b002366553eca7sm9052685wrw.83.2022.12.03.03.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 03:22:46 -0800 (PST)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/5] media: i2c: ov2680: Set
 V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
In-Reply-To: <20221202152727.1010207-2-dave.stevenson@raspberrypi.com>
References: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
 <20221202152727.1010207-2-dave.stevenson@raspberrypi.com>
Date:   Sat, 03 Dec 2022 11:22:45 +0000
Message-ID: <m3359wohoa.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Dave,
Many thanks for your patch.

Dave Stevenson <dave.stevenson@raspberrypi.com> writes:

> The driver changes the Bayer order based on the flips, but
> does not define the control correctly with the
> V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.
>
> Add the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov2680.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index de66d3395a4d..aca76d7d674a 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -941,7 +941,11 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>  	hdl->lock = &sensor->lock;
>  
>  	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (ctrls->vflip)
> +		ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>  	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (ctrls->hflip)
> +		ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;

Since you will need to respin this series, and to be more consistent
with the rest of the code, could you move this flags set near the others
done after the check for hdl::error, the gain and exposure.

with that change you could add.
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
>  
>  	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl,
>  					&ov2680_ctrl_ops, V4L2_CID_TEST_PATTERN,
> -- 
> 2.34.1
