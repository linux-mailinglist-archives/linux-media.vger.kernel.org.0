Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C537E15DC
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 19:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjKESe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 13:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjKESe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 13:34:28 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0023EC0
        for <linux-media@vger.kernel.org>; Sun,  5 Nov 2023 10:34:25 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-da41acaea52so3012864276.3
        for <linux-media@vger.kernel.org>; Sun, 05 Nov 2023 10:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699209265; x=1699814065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvGayJ1BF/k1YJFGC7YSBXZCpRxwJaGXYRvYu42m8y8=;
        b=P+pi1lGAzFOEAm00HPL58ljmVrbsPT9oBZgMFodbEQJOC0M87K/2Ta57SmAMUOgsXo
         N52MC73JgcQwDD70Row2sYEQHUb18+pY2L+i9Dp+vSWosEh/tJjhxpmO89lEvyXPhQ2w
         6z2PCeJNGgJeSVO0zIr6xyBdgKUaz0ftzJfw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699209265; x=1699814065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvGayJ1BF/k1YJFGC7YSBXZCpRxwJaGXYRvYu42m8y8=;
        b=ak4ZDOfQUl8Ala3i/jD+PWodwPEoxWJjioq33z5jUCNmk00wZnloO2k3Hz62ZA724j
         vSXO0CpiEW6s5j2GsZx5bKwEP6zGNI1VYQIYOJQYIOyc959nGI4xQC3ZRm5r1r677bhi
         DuZoCMiChei9IY7LeyGW055AuTNtCgrqq5fRtiRrd1FPyrcNZ3G4CHqoAAj5fXbqoSCs
         y6/mm3m2vdsP4rVDaUEuGJo9aJ7Fsup973kPo6f9hArcNugguIfgPin26Ec0GJjhFIAf
         57IyVybh8U8DUvNzahVKl3QH9baIsAC2RwlFtH4fkECMMdz3TuzImDfHwV0IWeUwfeWE
         ESaQ==
X-Gm-Message-State: AOJu0YwAzxwSLSUczzlQIlYXqybW9C5kqtwPFJsOzVwQw5F/UZTB84jP
        lUzPqjMQR22abXPqd9amEEjBV8J4mZnmUdw6R/Fgkw==
X-Google-Smtp-Source: AGHT+IGPwKHlVJ2W48IqAhnwCHKOi4Xa3cjZcd6vA13AIuaT0r0Rhip6jV/ByXackNbBzth83yYvxw==
X-Received: by 2002:a25:d113:0:b0:da0:3938:7ac6 with SMTP id i19-20020a25d113000000b00da039387ac6mr23575745ybg.15.1699209265078;
        Sun, 05 Nov 2023 10:34:25 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id o62-20020a254141000000b00da034601e2esm3149253yba.52.2023.11.05.10.34.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 10:34:23 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7afd45199so45190507b3.0
        for <linux-media@vger.kernel.org>; Sun, 05 Nov 2023 10:34:23 -0800 (PST)
X-Received: by 2002:a0d:d692:0:b0:59b:c0a8:2882 with SMTP id
 y140-20020a0dd692000000b0059bc0a82882mr8910647ywd.46.1699209262854; Sun, 05
 Nov 2023 10:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20231020-uvc-event-v1-1-3baa0e9f6952@chromium.org>
In-Reply-To: <20231020-uvc-event-v1-1-3baa0e9f6952@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sun, 5 Nov 2023 19:34:10 +0100
X-Gmail-Original-Message-ID: <CANiDSCt6kf6eJJ-9Cv8BB-=_ib4iYi=ekFG+D==6HvBmhOkSRQ@mail.gmail.com>
Message-ID: <CANiDSCt6kf6eJJ-9Cv8BB-=_ib4iYi=ekFG+D==6HvBmhOkSRQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Esker Wong <esker@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Friendly ping (in text mode :P)
