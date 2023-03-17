Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415AD6BF007
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 18:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjCQRna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 13:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjCQRnX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 13:43:23 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940CDC8312
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:43:03 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r11so23407542edd.5
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679074982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juFDL1t+0yx3APjFMS4e9m1CxbDK324iou62xX9HrZ0=;
        b=DMPWYwSwJOx/3h/Ft9olRX76Zdr3trCvX2EztH/Rddv8E4hc7BhGyQbjtlwIvPkDY+
         +WzMkAZfwryZH3YZEw7i6Nmum1RjZM6Z4TFtFV8Peby003oF+qFhLH/m4Xfm15kUt6Ss
         aD4z06JvfSL0Jx3vjuXQIS8SNs9WGavspK8oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679074982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juFDL1t+0yx3APjFMS4e9m1CxbDK324iou62xX9HrZ0=;
        b=pWAOgOae7cS6QZIlUQHVSSRcAoNQ3HtJvOcFIbOLbunq2qdvCjKrxYPm57ROyRnTWi
         0AQOKiJF9ghPfLFB+df4+r14XpnyrNN++n8NzgF3aiY+Mo8htYhrA3PwLtrfe62/q69h
         duSRSNP/uozw61X+bQCtkKuPd6cpqvbUXMZ+OMZ9fcpwOMLj1a7D6cQc3Cq0U8zv4JOa
         NuTTrhtnalwwBIaBYHhA0Msu7dWPnTKJcmjk+dd2GDN/yxky1PONKPf045IVy4LUJuLz
         Gdjs6PDuM9AKTA/Y2o7l6Rf7Uo1Ew0PQSFRkmL5FeZ00/+8muj2W6KU5rcRNkUyl7xU2
         1iAQ==
X-Gm-Message-State: AO0yUKWNolp2R4itr8MGWubkAQc12YvjAEziyLX+BVdnwPgwAC0SCfHA
        kESbAsCIneYqQA8IA4hPVKs4ZEOmC0qAwyQwIR8XSw==
X-Google-Smtp-Source: AK7set//OyI1ioPpqQI6FVyGFYwTGzY48nPPSx+VdzvywLBn+L9BbCBeKQUqJJ4CfIfUR4eHb0H6wQ==
X-Received: by 2002:aa7:da45:0:b0:4fc:183d:ee18 with SMTP id w5-20020aa7da45000000b004fc183dee18mr4199711eds.35.1679074981735;
        Fri, 17 Mar 2023 10:43:01 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id v25-20020a50d099000000b004ad61135698sm1371317edd.13.2023.03.17.10.42.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 10:42:58 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id cy23so23288085edb.12
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:42:55 -0700 (PDT)
X-Received: by 2002:a50:ce54:0:b0:4fa:794a:c0cc with SMTP id
 k20-20020a50ce54000000b004fa794ac0ccmr2222273edj.2.1679074975032; Fri, 17 Mar
 2023 10:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230307212223.7e49384a@gandalf.local.home> <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com> <20230308074333.49546088@gandalf.local.home>
 <980021d5-09f7-9fc3-2726-44884a57822f@gmail.com> <CAM0jSHPf5u4=GGWm6x-zVkLA_LScAxq371ny2NoozuNjHfQefQ@mail.gmail.com>
 <2b7fe203-82f5-2726-cd64-01c7421560d3@amd.com> <20230315162011.351d0f71@gandalf.local.home>
 <20230315202133.7cb1a0fe@gandalf.local.home> <20230315202242.581c67bf@gandalf.local.home>
In-Reply-To: <20230315202242.581c67bf@gandalf.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Mar 2023 10:42:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjH83GOhjDaVnTUYfSf0XOLp-jpFACLSd8Uc59GzaCZug@mail.gmail.com>
Message-ID: <CAHk-=wjH83GOhjDaVnTUYfSf0XOLp-jpFACLSd8Uc59GzaCZug@mail.gmail.com>
Subject: Re: [Intel-gfx] [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Matthew Auld <matthew.william.auld@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
        intel-gfx@lists.freedesktop.org,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 15, 2023 at 5:22=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> I hope that this gets in by -rc3, as I want to start basing my next branc=
h
> on that tag.

My tree should have it now as commit c00133a9e87e ("drm/ttm: drop
extra ttm_bo_put in ttm_bo_cleanup_refs").

                Linus
