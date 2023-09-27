Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB4F7AFEBD
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 10:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjI0Igw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 04:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjI0IgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 04:36:18 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60009CD8
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 01:36:10 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-405621baba7so76556695e9.0
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695803769; x=1696408569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RP4NFLi1nTGuMaBbBhxBM0a+Xsqfu8L1EJzzk4FIXJw=;
        b=ojBZ38uOJHR06T/D7UWJ1HsKil5rjwK2iVKDUh82LjLb8HLItnftDR8n3WyC9ArCWo
         G1p+zJb+C/Is4XqoUltfbA1fGLFRzKtQ0hmSgCnxWRim5IWEQRVTXjfTfj6eh6tM+sjD
         qPkKC977zz7vXYz+8T9pdb3lwagfj2RMswzaqWAi3Tr9cJaMxeaVcLcjnVj1hNCCRW6x
         V3IDkqnO0DlnzDgoYbln+97makiXweZ6UIWrsxeObN0kRi+KgscYJhlgifWqw07eKYCU
         PUewZMpJNN4JW56YRSzYshfGOV0+T0qMo4jum/Um5i4K/BWi6LZbo//+hsYJzqM1uYrJ
         VDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803769; x=1696408569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP4NFLi1nTGuMaBbBhxBM0a+Xsqfu8L1EJzzk4FIXJw=;
        b=qXj0asgPjvcgshjIki23hL0lwFFtL2LyGKUx1jB/ckQrL+k4ZSgN9dHGc4QcL2HQnq
         oKWiq9j7gCfBc4qA61nPsg1vQ9yQkatxEKbEdFybS739BZqpqgcBLqyxmuoGykN76dFP
         G9KX60LOJSiB/xMT52Ax0WiZLKb2/kkuxVc3TEachndLEeyLoL9maweKzNk8/lfsKvmn
         ljLyh8BMsxxDnnVM6WIIGAb3ym316XoZnEWDeBjhUWr94BLfI3DENAKP3LaO0eXUfRUZ
         xRPGrpQr3cE+cu2r4tHMwQaH7FDX7i01m0loCLVHdKL7uDHJG3hsodd2Bkkew5qwJJ2d
         WHKA==
X-Gm-Message-State: AOJu0YyXTLW7xkAn0Dv7zI7mP8gTdZjYuxu7v/OEGxSN5Kjc6jw24qE5
        Mxce/QuFHc3pVgoW3hdnKkf9cA==
X-Google-Smtp-Source: AGHT+IE+mnly4WGbql9i2+vMbD8YM5WK4IFFUoPHInOBqXn9QewjEQFn7gUvIdsmbUU2zlTnGqS0LA==
X-Received: by 2002:a05:600c:ac1:b0:403:272:4414 with SMTP id c1-20020a05600c0ac100b0040302724414mr1509992wmr.0.1695803766941;
        Wed, 27 Sep 2023 01:36:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o7-20020a1c7507000000b004051f8d6207sm17182075wmc.6.2023.09.27.01.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:36:06 -0700 (PDT)
Date:   Wed, 27 Sep 2023 11:36:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     milkfafa@gmail.com, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: Re: [bug report] media: nuvoton: Add driver for NPCM video capture
 and encoding engine
Message-ID: <88c78401-a3bf-4996-a703-c2869d3d7d23@kadam.mountain>
References: <f794bf89-584b-41ff-a021-ab973cae89f8@moroto.mountain>
 <ad3feca0-94da-4b81-b52b-6a893bd07e5c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3feca0-94da-4b81-b52b-6a893bd07e5c@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 27, 2023 at 10:04:01AM +0200, Hans Verkuil wrote:
> Hi Dan,
> 
> On 26/09/2023 16:23, Dan Carpenter wrote:
> > Hello Marvin Lin,
> > 
> > The patch 70721089985c: "media: nuvoton: Add driver for NPCM video
> > capture and encoding engine" from Sep 22, 2023 (linux-next), leads to
> > the following Smatch static checker warning:
> > 
> > 	drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
> > 	warn: sleeping in atomic context
> 
> Hmm, why didn't my smatch run see this? Does this check require something
> special? Does it rely on having run build_kernel_data.sh?

Yep.  It relies on build_kernel_data.sh.  Otherwise it that code is all
released.

regards,
dan carpenter

