Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594797AAE5B
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 11:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbjIVJjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 05:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbjIVJjB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 05:39:01 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EEB199
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 02:38:56 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59be9a09c23so23485127b3.1
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1695375535; x=1695980335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwNQ/CYeR/nBD7mWQbxqZyORQOanfTdsCvfUkINX8Jk=;
        b=Fkhk+ib9VibTK4DrHc1Cgt0qSQmw0ODMPR4ogkCHpwY9LDT1/AZFckviW7YN4/z1cG
         MeWQdsICfnqLZAOHIImvzYmBfAT27KZOvrDgl72R++O3inUMHN2AqCPUcvAlZe3GfGP7
         zvp+4oLzesfFBafNGuLtXhRInoaVYU4zZMA8MQWc2rjFQtBv89ZkjM0q6gcZAeVd0g/f
         8zKBtNTTiV4tGEs4Ts9YCwL74cU+sEH64FOKdCwVCN+yHiXdByzS2NAcpoMr7mwKblS2
         7Rcn40zy4Zon9zOB2eb9J1batCw4ZeqXrdVL7khCJ54SMXESEJ7G740ShdbnPMtDDnxI
         c4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695375535; x=1695980335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwNQ/CYeR/nBD7mWQbxqZyORQOanfTdsCvfUkINX8Jk=;
        b=ktJ1REmHPy4VZ2EHC+dzIjQuhqX/U6Jf8fU+s9zUFj0iS5Hrnwy0xxSnGAYx95t2sn
         zPy7lPPDtYjvjXAzq2PaPmSbsyoKMVVGNaZWr7qBqdQFfpJdq+lnnbIGW7XDXjIZ1S0g
         bqDfCUM0u8lxTFFTCncfdGkk1yWFVwkyAdQMKeLUHdVO6iOKIWwdLy7wePB9tup6t9er
         cEcc4wmgdBMLXt++7Pl5gVrb9XYydh84hWbsgNv1k8kcUtmjH5JtGX1F3Cu8+aVLiORC
         MxjlUdUCZ0FEiyluonbYE3aA2Fl0DXwZWarEtskFU+g30oN3qw0yyZQvnVwReP8FcpCx
         itxA==
X-Gm-Message-State: AOJu0YyBps1QEn+CUHQvt1waWUxjGBnUKAHLprPqIMjzbYt4w4emLAr/
        b4x9EYVvV56TWRECWSwcs6LDIUE0L3e6RUXcHA8zVw==
X-Google-Smtp-Source: AGHT+IGCviUFRNTNlBmQpjFFVbwhGWnPpRQNyvwuSmBs8kTiPoJBFEGggeTFnWVRC2IQcGVXMWgAXd5rWViC+sO0gqM=
X-Received: by 2002:a0d:d9c8:0:b0:59b:fe73:debc with SMTP id
 b191-20020a0dd9c8000000b0059bfe73debcmr7879297ywe.0.1695375535376; Fri, 22
 Sep 2023 02:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <SEYPR03MB704641091854162959578D7E9AFFA@SEYPR03MB7046.apcprd03.prod.outlook.com>
In-Reply-To: <SEYPR03MB704641091854162959578D7E9AFFA@SEYPR03MB7046.apcprd03.prod.outlook.com>
From:   Jagan Teki <jagan@edgeble.ai>
Date:   Fri, 22 Sep 2023 15:08:44 +0530
Message-ID: <CA+VMnFyhp9D8cjtvLVzdKGETouOuH=MKgjOu1pn00WDRB=5oUg@mail.gmail.com>
Subject: Re: kernel.org 6.5.4 , NPU driver, --not support (RFC)
To:     Cancan Chang <Cancan.Chang@amlogic.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 22 Sept 2023 at 15:04, Cancan Chang <Cancan.Chang@amlogic.com> wrot=
e:
>
> Dear Media Maintainers:
>      Thanks for your attention. Before describing my problem=EF=BC=8Clet =
me introduce to you what I  mean by NPU.
>      NPU is Neural Processing Unit, It is designed for deep learning acce=
leration, It is also called TPU, APU ..
>
>      The real problems:
>       When I was about to upstream my NPU driver codes to linux mainline,=
 i meet two problems:
>         1.  According to my research, There is no NPU module path in the =
linux (base on linux 6.5.4) , I have searched all linux projects and found =
no organization or comany that has submitted NPU code. Is there a path prep=
ared for NPU driver currently?
>         2.   If there is no NPU driver path currently, I am going to put =
my NPU driver code in the drivers/media/platform/amlogic/ =EF=BB=BF, becaus=
e my NPU driver belongs to amlogic. and amlogic NPU is mainly used for AI v=
ision applications. Is this plan suitabe for you?

If I'm correct about the discussion with Oded Gabby before. I think
the drivers/accel/ is proper for AI Accelerators including NPU.

+ Oded in case he can comment.

Thanks,
Jagan.
