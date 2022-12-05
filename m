Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C49E642641
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 11:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbiLEKAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 05:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbiLEKAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 05:00:11 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2D4E02C
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 02:00:10 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id f9so10037677pgf.7
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 02:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ6cAl+86TDUB9cUa1/EWsCMl2DdMF0dDV8o8yg5Vqo=;
        b=Dbxfud1EIQCczeM8D9qo8COwwUq+htWEyYt1aSASCGolP60aSlSkGvfIRY3Rermc9u
         X5GRzZ7JcDLi/ldCbMiflREi3JaZChi7ELkotb/7nyPofwcTUp4G6zeIoao9gbEhpr8q
         8c+EUEW3AMqohdDWA3ZEJV+vyQzGcqjM7qQu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQ6cAl+86TDUB9cUa1/EWsCMl2DdMF0dDV8o8yg5Vqo=;
        b=PbqZQAOTNoBNDGjqhcjcm9rcEguLVEO0o7MP93z6Qq+rlpq2iqyVUkIFQGkOht+bTE
         TaJNpKLIwBcZZQ1QGYSlzp7NRd4v0dve4+ZACmz1K4hx/kANM5Espd+Hsqgc1vZn6xWS
         attJfJTeODO273QES03pEzLNXM4ANvn8sf5pVgIHqtyYGmA5IPJ2kFEu3GowgXfFX/0x
         Nh9XqV9Ruk6dcWBAY8gV5a1+flqOrAcSbGYnSNRsKyc+71X4VAY54nKYY7AF79W0YsO+
         7CFliMMncap4A6alMnTkp/UdGf2o+hlB2rq3fZ/1+aHEjoAgG2VnBSt2t5YU/1p3Wx+i
         oWww==
X-Gm-Message-State: ANoB5pl7IbaU3b5orMEmc2JQfILYQZJomyRL9J+9CQ7/LiAziGdG7EXk
        /QVv/Gu/SxqFW0ggpXnwp7s37VGLlV2BLGZ5
X-Google-Smtp-Source: AA0mqf4cKV49K40kjNLU9n9tVgeS5U91wkgdSMuW1Kj00uOImdE5HvtdrsqAQSZOlpTL5ZD7EXJT9A==
X-Received: by 2002:a63:1761:0:b0:478:18d6:2cf2 with SMTP id 33-20020a631761000000b0047818d62cf2mr32334665pgx.442.1670234409695;
        Mon, 05 Dec 2022 02:00:09 -0800 (PST)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id ij19-20020a170902ab5300b001769e6d4fafsm10142503plb.57.2022.12.05.02.00.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 02:00:08 -0800 (PST)
Received: by mail-pl1-f177.google.com with SMTP id g10so10295997plo.11
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 02:00:08 -0800 (PST)
X-Received: by 2002:a17:90b:944:b0:219:33a1:d05f with SMTP id
 dw4-20020a17090b094400b0021933a1d05fmr40319988pjb.116.1670234407771; Mon, 05
 Dec 2022 02:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20220921-ad5820-v2-0-3e5cabb04786@chromium.org> <Y43A1WbaLSa042EJ@paasikivi.fi.intel.com>
In-Reply-To: <Y43A1WbaLSa042EJ@paasikivi.fi.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 5 Dec 2022 10:59:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCtBk+HCzd6bc=WS8KQWjB8HrsoUBaS_CsJRDAdqp4z6Gg@mail.gmail.com>
Message-ID: <CANiDSCtBk+HCzd6bc=WS8KQWjB8HrsoUBaS_CsJRDAdqp4z6Gg@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: ad5820: Fix error path
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pali Rohar <pali@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 5 Dec 2022 at 10:58, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Fri, Dec 02, 2022 at 05:35:59PM +0100, Ricardo Ribalda wrote:
> > Error path seems to be swaped. Fix the order and provide some meaningful
> > names.
> >
> > Fixes: bee3d5115611 ("[media] ad5820: Add driver for auto-focus coil")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I'm afraid v1 has already been merged. But I understand patch content
> wasn't really different so that should be fine.

Sorry I missed that :)

Thanks!


>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
