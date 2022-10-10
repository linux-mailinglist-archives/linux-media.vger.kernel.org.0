Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC045F9EE0
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 14:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiJJMxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 08:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiJJMxJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 08:53:09 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABFE55097
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 05:53:09 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id c17-20020a4aa4d1000000b0047653e7c5f3so7907100oom.1
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bTic9C5DvAmSEhSawWn2ytJB0ivnSnSWGuanuxoQGHI=;
        b=JT5HAEpPxwa4e+K4XZkEnWlnBzJis0JZLtic+sZu4QwqnKnWt5iuPv7ImPUT5Dl21F
         tMbTC4cFbFxpFPeMHFenBk7ujj+Oqd9YDVgmldQKTZgq/BSFwlr6fulK+g1pX29CMBOm
         1Y5oBIbayk7ZiJzXQ1TUZvK9kRZlwxF3eHiRAKkO9TPQLE9uzKcsuYaH9XtVczVmGMHN
         JaWQ1GY6VMhkPfv8bI6mzp2cR8mSt4H43KQnZHIxxRBh+4Cv1Pxfg3mRDbD8Jfl7QMpz
         eVY0rR13O2wETEIorD2hDv/62SAojdHdbs9JKlFlyZ8CTvZLLddqC0SoHaJXUL9RpPuB
         muPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTic9C5DvAmSEhSawWn2ytJB0ivnSnSWGuanuxoQGHI=;
        b=TL9i1Hq/5LypoAQL6pvxpSBttBRVkbj2NHLcy7S3w9Q4tDKNA8gKAjQUyI6B970/ch
         Cgi/89fffbRV/e2WBcC2fB2h1evaFx6KbCYRlgpc5DqAHcetJJWaK2u5Lw/xYJ73IFn+
         R3XSS3STTZt3tHVEnxPqGDaGUZDXKuov2zl/WCggi/Tfjt+kyOukwHgJA28ajIvGV3zV
         oFVdg6nTszoR712WxsxoFWnQ4L0/m/yi3CjyBR/mGejwiei9m10yZWWcBGW2NPgyLxlP
         Fc/quC3atpLJZLv2LNFXhWJHFE+yNJQKiNazRcm7K1ujRovXvm80hASLpwBN3A4GyY4x
         Qhpw==
X-Gm-Message-State: ACrzQf0ukYHRJ8s6q4NhvPsr11vYOtpHman7Xj1PQg1QNUCFQWeV+y0s
        QNafis3489C+EGVNkS5quZogDIoeBEYiO8j6uHw=
X-Google-Smtp-Source: AMsMyM4yrRj85vOB7wONh3LHyzO3JurPYKjdV+HE/q3PoO0S3nwcSYjHpFgY3QSYNxKM6uDQOZhJwoYfy4p/HeuxLGE=
X-Received: by 2002:a4a:e693:0:b0:47f:a993:7e45 with SMTP id
 u19-20020a4ae693000000b0047fa9937e45mr6808524oot.0.1665406388419; Mon, 10 Oct
 2022 05:53:08 -0700 (PDT)
MIME-Version: 1.0
Sender: guenimatoure@gmail.com
Received: by 2002:a8a:e08:0:b0:474:2f92:1c23 with HTTP; Mon, 10 Oct 2022
 05:53:08 -0700 (PDT)
From:   Miss marybeth <marybethmonson009@gmail.com>
Date:   Mon, 10 Oct 2022 12:53:08 +0000
X-Google-Sender-Auth: 9tdNpIt0PZShWqbic1o01EHXZSU
Message-ID: <CAK1f_T-_+SP=7_Q5ONPSU4vf59N1Ub-ap2KOPQqc+Ld2Ub3ymA@mail.gmail.com>
Subject: RE: HELLO DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Witam,

Otrzyma=C5=82e=C5=9B moj=C4=85 poprzedni=C4=85 wiadomo=C5=9B=C4=87? Kontakt=
owa=C5=82em si=C4=99 z tob=C4=85
wcze=C5=9Bniej, ale wiadomo=C5=9B=C4=87 nie dotar=C5=82a, wi=C4=99c postano=
wi=C5=82em napisa=C4=87
ponownie. Potwierd=C5=BA, czy to otrzymasz, abym m=C3=B3g=C5=82 kontynuowa=
=C4=87,

czekam na Twoj=C4=85 odpowied=C5=BA.

Pozdrowienia,
panno marybeth
