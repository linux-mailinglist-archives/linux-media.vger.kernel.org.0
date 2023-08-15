Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8012A77CE3D
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 16:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237683AbjHOOiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 10:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237753AbjHOOiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 10:38:17 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E153493
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:38:15 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6bcd4b5ebbaso4769540a34.1
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692110295; x=1692715095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cAjN5VYYLu/zUPsz5SLD65K+s9r/2epOWr9SL7xLgo8=;
        b=bkMWMFbZS8ZqqGEqYJjheEvIdGbOb45G7/SEAPO8hD6Py8K3qwduxzer0etIps3Vgm
         qmJbobC9dXoCKLJ3+zi/OykoJzZmKa6LpJ1P0FvwLS5+L5eojVTUCanFFD2wOL2xIzZj
         6ZN6UIBoBS3VTrf7N6h3D1nqq5rkdo8/1Ywqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692110295; x=1692715095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAjN5VYYLu/zUPsz5SLD65K+s9r/2epOWr9SL7xLgo8=;
        b=YUn2znOVX/WJd+EQWKAbzmKRhfhTgxQQwcPyeWN6aD2Bkr47WgRZxCptgXY74P3arC
         urNTDO9G6BpESlXx0Za7c9KEnTdkL9xcWy+eeyXs3ztQJdKSUiD1Gy0plYdoYTQ0fXXH
         P5xvuSUbvjeUh7Xx1KFShB5ZlqzEoXQIH+wBOqWgBGJ0XgFcw39K05UPCJAvKafG+RwM
         zOQuyar9Dgf5Eu4TL6xPL3aRTQIpwLC+z+cRUBdU87y4ultW3OI0l7LLx8plYYDK8eFs
         DtRdYne7SkzgmE8sk2FUoWBo8dMrx+W/bDPYR4n5B4QqpUV6Po4An1VyUEtHNawPBKNU
         4VaQ==
X-Gm-Message-State: AOJu0YzOd/JWITFJ8YTPu06ObyWUeKJHtGOHwpZuYnk7L52TRX4Ei2m6
        ezWlf2qtscF2tqfEF7BXsdHWdBAvbBIGGHIhvDo=
X-Google-Smtp-Source: AGHT+IEBurOrfHyFPUrSiDIvo5h3IDF2Tg4tASanqFCy/XHMe8vPhn699zZUC0IG8eYZajzGfGvdHA==
X-Received: by 2002:a9d:798b:0:b0:6b9:50a8:1e76 with SMTP id h11-20020a9d798b000000b006b950a81e76mr13422555otm.17.1692110294870;
        Tue, 15 Aug 2023 07:38:14 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id m13-20020a9d6acd000000b006b466ed0484sm5213846otq.67.2023.08.15.07.38.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 07:38:14 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a3efebcc24so4668372b6e.1
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:38:13 -0700 (PDT)
X-Received: by 2002:a05:6808:1309:b0:3a7:ae9c:4d53 with SMTP id
 y9-20020a056808130900b003a7ae9c4d53mr18605920oiv.46.1692110293152; Tue, 15
 Aug 2023 07:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
In-Reply-To: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 15 Aug 2023 13:26:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCtC2zOKtopkuuqJYqi6+FQ1Kav6LfMH5gGhKrnDeG7GYw@mail.gmail.com>
Message-ID: <CANiDSCtC2zOKtopkuuqJYqi6+FQ1Kav6LfMH5gGhKrnDeG7GYw@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] uvcvideo: Fixes for hw timestamping
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn.chen" <hn.chen@sunplusit.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Could you give a look to this patchset?

Thanks!
