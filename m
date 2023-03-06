Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B12226ACF8B
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 21:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCFUvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 15:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjCFUvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 15:51:20 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB9F24118
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 12:51:18 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id g9so5871836qvt.8
        for <linux-media@vger.kernel.org>; Mon, 06 Mar 2023 12:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135878;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZZZdjoB/M7aLHtUWeNwJwsyHFYWeUmbWoGEQvZrODI=;
        b=SzSY1nj8c+s8d7mP0abEKeqzNJgWmsrjWmIgvp9hFPGx1W4Os0aV3TzCSzmNH5xWSW
         wp4u53Zq8NW719CDb4R1W1Lf6YfzwSXMEQWt+7X/huwOVFDfM8ME/IhnoteDIX5UqYBX
         53LdP9B//UB2jljf53HuACLpo6jCJFiGqcPFU6GjR8Ijd1Yij8k1ZbNcsiUVD5RG0Y0Y
         +/gUq09GdKphxk6WE1IsaCEeZnjRlJcef8fWUWFbLW75BPlOudEMFJqLOjuMWuJpvbhL
         fLExweHjvBUuKe+8Vhbg8qSsaDGGRldMZeSgRpCV/pTU68ge9438WQTOSlliW8G51yOl
         Dl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135878;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZZZdjoB/M7aLHtUWeNwJwsyHFYWeUmbWoGEQvZrODI=;
        b=kGMdVrweiQVp6GjZpbePb2sJ+A+mT0FJtoB/AYjXBq8PvTnKooAA9JQGw0+1dAt//L
         5rSqodjkEEpKX+lsRSIysOntfASIw/98UjW/kfFDv/vwoR7xdqEAHVchmQEzmomQDAjz
         AfPGmzOWyB8Scv5MGvYt/5V4LtRgcDtpR9oMX3v2V9c2MuH39/eQYBDzeMbl8VYZIwoa
         1mI5CzF77T2nV0KpzmLZcP2PiXK5CTo5T7BSl6QGLI52GQEUd/FCs6/ViknxMO6VNuwZ
         0dFnNk+UqjptrcBlkdk5oNoVfnSMM059GUC0jFZdR2H9nOKDwmCONDm3U7a57lGcd7F0
         K+KQ==
X-Gm-Message-State: AO0yUKX5NGCJnDZ1wGiUSGxQavTK2vxN1p3ydVcYU38Tbp2QjzVsyG//
        srJ5yztq8qL3Tk+I6jBeAQdfoxP4qX+KUC+ES/Y=
X-Google-Smtp-Source: AK7set8GcbvRiYm/qhO6sK3ONk/RTOU2rxhAbm6K2DiDH34YZnPR0de0ew8qZtvDhcjGlZn+cRLv+D6xjZVcFIDPFXE=
X-Received: by 2002:a05:6214:162c:b0:56f:8e7:86de with SMTP id
 e12-20020a056214162c00b0056f08e786demr3245925qvw.4.1678135878094; Mon, 06 Mar
 2023 12:51:18 -0800 (PST)
MIME-Version: 1.0
Sender: un351329@gmail.com
Received: by 2002:a05:622a:5c13:b0:3bf:cfd0:95ff with HTTP; Mon, 6 Mar 2023
 12:51:17 -0800 (PST)
From:   Calib Cassim <calibcassim00@gmail.com>
Date:   Mon, 6 Mar 2023 22:51:17 +0200
X-Google-Sender-Auth: X4B319BzVBqrDc7PpOtHiMkvIoM
Message-ID: <CAN_tDt_bpvyHcYyOSaa2AgzhmtMyH9WR3WHk0HcAdRrP5+fBag@mail.gmail.com>
Subject: 
To:     calibcassim0@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,
        MILLION_USD,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:f2a listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [un351329[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [calibcassim00[at]gmail.com]
        *  1.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  1.4 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GoodDay,

How are you?

My name is Calib Cassim, I work in Eskom Holdings Limited as a
Financial Director, Auditing and Project Implementation.

I got your email from my personal search on the internet for a
reputable company or individual to assist me sincerely.

I have in my possession an overdue contract payment executed by a
Foreign Contracting Firm through my Department, which I officially
over-invoiced the amount of USD25 Million from the contract of
USD500,000,000.00 (Five Hundred Million United States Dollars).

Though the actual contract amount has been paid to the original
contractor, the excess balance of USD 25 Million unclaimed.

Since our Reserve Bank is busy paying our foreign contractors and
agencies, I need your urgent help to front as the beneficiary of the
unclaimed amount as a Foreign Agency to enable me to obtain the
payment approvals on your name for the transfer.

This deal is completely safe, secured and requires confidentiality,
and your line of business does not matter. If you are interested,
please indicate your percentage for your time and help to receive the
money.

Kindest Regards,

Mr. Calib
Email calibcassim0@gmail.com
