Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232CD791683
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 13:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238901AbjIDLzZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 07:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjIDLzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 07:55:24 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB602195
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 04:55:21 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-490cd6db592so372389e0c.1
        for <linux-media@vger.kernel.org>; Mon, 04 Sep 2023 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693828520; x=1694433320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sSGdH7aN8yTo6ZaPJwceLOZ7XnBN+We7swViqH33ceo=;
        b=HYXb+TwxqR/0m5FFJXnPQCpzG/cZpdWjuY1LNPHTwznviX6HfM6jdlKrsJnNjy9cOG
         rdC5nv3vXULJDBZ69FU6Al/dXq1E6mbiEuuEoy9eQf0cbLRrlpA/dPL8D393jxLotycC
         dgBAbbIBJuqsnIldPXwoI8ngJkgPdN0pWEU+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693828520; x=1694433320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSGdH7aN8yTo6ZaPJwceLOZ7XnBN+We7swViqH33ceo=;
        b=B7gdhNa/rO4i/qmqrvQ3JuIyBxBK9oXohAR7VyhEuBcz3QlqjfhnaKcFj8asIfLfwo
         UMreVpm6R93CdRpOW8VrS8Yqn8zLbulIF551aia2XXGVm2Q+YHHHpFVi9acqB1GmRYHS
         r4K9zFCbXlOTjq0yZs0Yfw7kHdnaOaCIbcywrvq6ICxchhKQ2nm7e1fhzm6U+OjPsyXx
         IFK1vELLJkWfL5ICRkpkHPl8qL2/9cjSVbki7ToKtKuh4L0n0eRxuATsGJFxiaZooW1t
         1WdjPgEROuTFLgTprvF1yGt8IgNDVAvA0hpurL9vr7yiEYGQEEo2TPdI1MNyBT0koXtu
         Cthw==
X-Gm-Message-State: AOJu0YyTYYY5rppiig6Bb04ZsoMobx4xVBQWl8kytOxZBLgjSr4B4s5E
        Wffkb/IxEiVkCqerHf+aIn3RSZbf6n7Ri68ZVU8=
X-Google-Smtp-Source: AGHT+IEhUPFJg9AGKv7NVC2XBYqj51UrpDihXVicES+RPixlocNxG9QqQGbN2T1pfpMO/cE3xFSN0Q==
X-Received: by 2002:a67:f993:0:b0:44e:8b91:5cdf with SMTP id b19-20020a67f993000000b0044e8b915cdfmr8248714vsq.3.1693828520598;
        Mon, 04 Sep 2023 04:55:20 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id g20-20020ab01054000000b007a019cb1287sm1561522uab.3.2023.09.04.04.55.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 04:55:20 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-48d11d1a251so375691e0c.3
        for <linux-media@vger.kernel.org>; Mon, 04 Sep 2023 04:55:19 -0700 (PDT)
X-Received: by 2002:a1f:4884:0:b0:48d:1e9:2707 with SMTP id
 v126-20020a1f4884000000b0048d01e92707mr7816746vka.7.1693828519402; Mon, 04
 Sep 2023 04:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org> <CANiDSCtC2zOKtopkuuqJYqi6+FQ1Kav6LfMH5gGhKrnDeG7GYw@mail.gmail.com>
In-Reply-To: <CANiDSCtC2zOKtopkuuqJYqi6+FQ1Kav6LfMH5gGhKrnDeG7GYw@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 4 Sep 2023 13:55:07 +0200
X-Gmail-Original-Message-ID: <CANiDSCteBUraA0UrLM-cU_GqDSWcWERJNV_xhsi3LNQZNvX5dA@mail.gmail.com>
Message-ID: <CANiDSCteBUraA0UrLM-cU_GqDSWcWERJNV_xhsi3LNQZNvX5dA@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] uvcvideo: Fixes for hw timestamping
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn.chen" <hn.chen@sunplusit.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Again

This has been waiting from March, and it has been already been

Reviewed-by: Sergey
and
Tested-by: Sunplus

Is there something that I can do to help merging this patchset?

Thanks!

On Tue, 15 Aug 2023 at 13:26, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> Could you give a look to this patchset?
>
> Thanks!



-- 
Ricardo Ribalda
