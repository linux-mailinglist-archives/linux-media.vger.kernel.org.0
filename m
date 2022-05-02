Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B356517847
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 22:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236153AbiEBUjv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 16:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234868AbiEBUjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 16:39:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D66A1A8
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 13:36:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bq30so27252887lfb.3
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 13:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=BEt3SSft7uPZK1W7e72QNd9rpHpdRKlCajM1r90Hs7rRw/IgWRpd80tOotYd3rK94h
         M816XqF1H+na/3EXhti63qQvvdmu1hLxz6LHFVFXOoMJMIxNGR8yroM2O5C3aFcgqCRc
         UvXXCp1AxebtF6PPp4Oe5YHqTWp2ExsZXz+gAQi5IDszcheTjDnlbhrMeMvWPIvC7tMf
         6ROm05AoCKxy/nUO7bqAqHU5zsnWPlSOZiqnaDzFp77fAFdyT40T2U4BPvz+H0XoR9bA
         qSn3760oO0Z562r6fngVPfD2v9adUePvZZVCfjpMw1hCALM5m8u5VcNKjL/FphY7kFGD
         +Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=pLty3BfYSjwBSaTSsBe5svIvJEixefztspI2J6DY2hkywL+g0BQcP8h6MThyU4UfHJ
         nF7dPE8scOkJuGo++ehlwQAt00yp92cYnAk7lfDLwtw2X/gZ691pyA0at/DuIO/nwUui
         oNbNG0jykhFAW1FSEHa7Eujq4ZsUO4p2oGM9xAxbUKiHVZLg4WAclwUEIwMpTx4siDya
         czC4c+GZXO7ykLMrJWFNPgYajiPwQZa/tY+e3SqLX0h03HXl52ul0Wb9hpfHI4iIjGfI
         3ECnbvgSh6N7tzGtJqyEvjJHpyhbw6ODEow1yY3XN3Va6WAxbPHNy/sCU8wL/2lZ2KLo
         /bCA==
X-Gm-Message-State: AOAM533CtyfggKPTK2v2tahdDsmbroUmZQxrrPOtr517l2AI8i1IOLi2
        T5MDX77/VapV3VP+2g7cwP5rvspsCQLsl8hNrNY=
X-Google-Smtp-Source: ABdhPJwK3BovYzOVIlDSFqlSVssRd38uyY4bHggzpG0VT4bqMMlW3Nl9w6oIeCRILcLZcwN1kq1Ni8nnWu1c6/AVCHk=
X-Received: by 2002:a05:6512:b11:b0:44a:2ead:daf2 with SMTP id
 w17-20020a0565120b1100b0044a2eaddaf2mr9675499lfu.642.1651523778200; Mon, 02
 May 2022 13:36:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:688:b0:1a8:2581:64e0 with HTTP; Mon, 2 May 2022
 13:36:17 -0700 (PDT)
Reply-To: johnwinery@online.ee
In-Reply-To: <CAC0r5QX7sRQ=4GTONtqGWGJafgQ9=hSsDp2AvRhYCXr2WDvigw@mail.gmail.com>
References: <CAC0r5QWWDUOxkF5zY89ezmcNpvZPWHGS01H21+id9UM783h_5g@mail.gmail.com>
 <CAC0r5QVyPEzz8Vkw_jPQ_ktQFFpNrnfFnh0-GgUntvuJrYU5CA@mail.gmail.com>
 <CAC0r5QWRuAc6Kh0fuhMGVseWNQW432VU5HXpKY-T8izLaVvZeA@mail.gmail.com>
 <CAC0r5QU+=9Zf3rTpXd74yVnyeAfjJeo2jYnFZyU6PxPq+wSSnQ@mail.gmail.com>
 <CAC0r5QUL6atosYDvPz8qVi-o5cTHCU=-g1GTU92Oe+KtTWaSoA@mail.gmail.com> <CAC0r5QX7sRQ=4GTONtqGWGJafgQ9=hSsDp2AvRhYCXr2WDvigw@mail.gmail.com>
From:   johnwinery <humghrysking@gmail.com>
Date:   Mon, 2 May 2022 13:36:17 -0700
Message-ID: <CAC0r5QUqpXTfypGCUGX5mEbVrWPryY9c3AqeLMtVF3pjaqm-Ew@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
