Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6657AD7C4
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 14:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjIYMNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 08:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjIYMNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 08:13:35 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09A8101
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 05:13:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4054f790190so46166765e9.2
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695644007; x=1696248807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+LR0SHMW4p0H4FjGzgjY9zgTtsyGifRyUl05vlzGrI=;
        b=hXvWphnQlrUMqYzmwEnyU0Ia/dRdVx/d4huP0FTyDIKxR2O1VHatt5ZVBYecIhFrG2
         lVn7vEEuftRVmFj8IYTMH4xFnzv383azpE+2IMhJTlnhkRXzSIQj7PXbBc1oYbZlRbc6
         wJkfRYeZONU73BjIwkSU8ey9T5yZLQR0QPiSCxGlM0XxJAO6/oREGMLNv4x8otXLuS0V
         wBLv5snNc1NTid1SXmhIOBg6WZueRp7kt6feyk1KtFWkzLpUIByocMtYJmWlynZzTaY4
         XBgDMyKGyDpWVxoZhIRwIfH1U11WeLIBNHIS57pvzhjK9ti2ygyI+iqGWV8MJl62FxJT
         xGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695644007; x=1696248807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+LR0SHMW4p0H4FjGzgjY9zgTtsyGifRyUl05vlzGrI=;
        b=kdEUJpKKwevg55Ulrtum60k7uBkYSjEgI6azvpeH3K/AJOEsz9TBZc6vpvLtTzjYqh
         MMoRMaWMMnVaUKT6+Hwm1c7PA7gLyTiXM56aiTcliLbcoLhxyx5dn4Z0Bvd2U66J1Dfa
         gy10PywZ54gZ1GLZJX7YStG5hYISYHIPe7ujzGn4Hut62zOyfsBZAGugliCPXQhwbsTo
         hWaJ7Q6frFiGxVQv5KlIxRtSPfDn2d5CeQEI8Vok7bOPysT9DkatcLQbwpsgJCsDJU8+
         jf2d+yWfCooPPDAv7ORQRj3RdvccsuAg3u8ekUBVtBpxlXkWVTE8BBJiVRP++6aZZ1TL
         d1kw==
X-Gm-Message-State: AOJu0Yyb8RGr+tp2TVxU+pR8EMYpzkj3D0fhmL5wLTaI/BG9pKuBrMni
        WSfjDQffnsw6+5y9V0JaAOdVzQ==
X-Google-Smtp-Source: AGHT+IG0DtPkitzxHkKrZpcA2UeQwWq9WhGVpyMMh604v1w1NWcpMWjO/+wjgnfUhw0MBqK0altx/Q==
X-Received: by 2002:a05:600c:20d4:b0:405:3e92:76e3 with SMTP id y20-20020a05600c20d400b004053e9276e3mr5897993wmm.22.1695644007105;
        Mon, 25 Sep 2023 05:13:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k19-20020a05600c479300b00405391f485fsm10793994wmo.41.2023.09.25.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:13:26 -0700 (PDT)
Date:   Mon, 25 Sep 2023 15:13:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Adrien Thierry <athierry@redhat.com>,
        Dan Carpenter <error27@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [RFC PATCH v2 0/4] staging: vc04: Drop custom logging
Message-ID: <fe6de4d3-3ca2-4519-b37b-afa55f961728@kadam.mountain>
References: <20230913185528.770634-1-umang.jain@ideasonboard.com>
 <1d54715d-25f9-4937-bdff-de0136c95fe8@kadam.mountain>
 <d8395455-44eb-6762-d978-e912bf2cfe73@i2se.com>
 <3f040e44-3bdc-b09c-58b3-ea3b0ac6d5dd@ideasonboard.com>
 <21893e62-2a93-af84-a004-5bebc9916627@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21893e62-2a93-af84-a004-5bebc9916627@i2se.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just so it's clear, Stefan and I are on the same page on this.  State
dumps to debugfs are fine.

regards,
dan carpenter

