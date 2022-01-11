Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBDF48AE36
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 14:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiAKNNa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 08:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239222AbiAKNN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 08:13:27 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EA0C061748
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 05:13:27 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id p14so17061680plf.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 05:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
        b=g6zwg//a9QU8vjOzOKacgn2iL5xpvHXnzvyoMJJqonQHGEilSNBXUqBTdNoO1aTYjU
         b8KuOsLvcB00fG7JAfXKPVJ1COa5NizMtapAXHBC73iLq7mdygnC1pQLX8+JI0/EjGPW
         UbufR7efyb7NWVALbe3gAk//P0jyrhnCgWwDRN4qGhxbJn3hfThUZtE2gvRd4BpTOtVD
         +ITvGaR6OJI2x+9jEe1bUDuK3M+257YvD1zk0mg3HLF0Il97cFEraY26TOpc+q23YeI7
         aaxXJE3P/6zANOZOVfS4CUdmndNJMgY/Xbm0NPd44G4qgiPWoxwho8kS+M8i+xABWtLK
         RiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
        b=xkzkG+WqoTF4w3FbqczuKWzn+J/S34fFFUafGlGAvz8J6z2ipb3UI25sgmVZFT1N+w
         DCIntvdBicEaBmu0d53IweyYE3LQ0VroGN4iWD+qvhIg6Pb6BjtFCWAaofccdM69pJOP
         8frts4lxEgZKtSb08L96UBEXk1shJqexAESO1zbj1Q1J1AEymd3SE+1BwNm/sw5nwE7w
         KRpfAyJNcoj9PAQ9Hi9wyWGCKld+RjaXl++gW/3ji5ZSrr4flxzEVe5ebxek7c/R/Ajm
         AdeGIBqG6+c2pJEV8kHiLc4yiWKE5yHfG0qnEO5SsFhv8lSCQnw21O833aCx6xt1On6X
         zP3g==
X-Gm-Message-State: AOAM5318A+C4vC/PUkJZjBf2YwxHjakXuiq2D3fj7BRFurMcu3Mp01kl
        CO3GbLLNwMivC3MzRbH3ANdDGSZ4PwC3JILR/M3N4Q==
X-Google-Smtp-Source: ABdhPJxwyMF6Tcvmo5uZdzwgEV+4XIb3H24TqD3Yn8Rz8eYeOQVprne/rnr0ys2qO3Yjqztj/DRjPOv1Kds7NiN1Vz8=
X-Received: by 2002:a05:6a00:26c9:b0:4c0:c8df:bc4e with SMTP id
 p9-20020a056a0026c900b004c0c8dfbc4emr733012pfw.1.1641906807193; Tue, 11 Jan
 2022 05:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org> <20220111125212.2343184-6-bryan.odonoghue@linaro.org>
In-Reply-To: <20220111125212.2343184-6-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 11 Jan 2022 14:13:15 +0100
Message-ID: <CAG3jFys7GdC2Un0zv2DjdhmOdWwQipYQm8nsTvKKsGsN9XudkA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] media: camss: Add regulator_bulk support
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Robert Foss <robert.foss@linaro.org>
