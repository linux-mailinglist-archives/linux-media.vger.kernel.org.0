Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB70669A33
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 15:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjAMObg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 09:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjAMOaq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 09:30:46 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCBC848F0
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 06:23:42 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id d22so1733752iof.5
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OF3VMKCJX/ixRNA7KETCaEsWyEBkIDVOlKWye/O0OA=;
        b=MK7e6Vy0okniHu3Q9+oSRGxZAwtfUcCw709gjtpmGqYm4W84IZvw4tBwf/JeD4Sz6H
         3KURCQ1q7FJNLx+GLRWt1AGelsjK5K90b9GlN0sKUA6ZUg/qpGAmzhVkYIMi1e8GW14O
         cFtXxDW3U7HKPR1h1QucXhqmNKCsZMoObgInYsIcK9GV+Q1SmTW3TNFPjIiYngs//Zw8
         0a/3E2iFbnIOhj7mPg7o55ip5AqJcSu4cmOrbMNeUEYXVxQDLd1kY3ucGjxruvrrHS7M
         XetQgLqP0j8VlFQPDJPkXr0ojEVpUsKfNGxzo9W4EnGlfHoCwYlTt4oOdX6QabpPSrPy
         sowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OF3VMKCJX/ixRNA7KETCaEsWyEBkIDVOlKWye/O0OA=;
        b=pUc7HC0bJ+V5b1ZRocOYoAxLzzYFEHU1auxb4574TOMubwoMEpQZlbUbpPXXpVxmX9
         DjMwuUvIZAZ1Bixbka8WtO7bhX7nsQqPqVW4Wmqs+3/XUjG7S+bmjlyX1EV0GVuaGtjm
         ZYpga2AeJuFeSWqOplUUfeaqaznwepyNYEjlrpDpq1UcHvD1d/iU2WimeD1aTIPl/NvM
         ewfQs7Kup3MBMv4GBxYrteYIKsNDv4evoyErZqvM7cTx+8fOymsNccj4A70pDoK5wLm9
         6v4uMo82huxgtO7noXkARZ6oeViYDOJAbyBGp9aswBs6F24r4JKCUiAp7CMlCCcJNGQH
         pnTw==
X-Gm-Message-State: AFqh2krRbUhJchSY5H1NKqwrIxJNryjCl6X5Fe9Kmahiu4T+sdJhEfI4
        9qbyS4mDF9TKocIUA+p3rAltG+I9WHPyjOOQiDU=
X-Google-Smtp-Source: AMrXdXshiBnmfviu9GpNb0RTPGnCcyaimsk+bKcdbNGmrDubcSeViaijlgxCq2yePIP/Xii+kaUmkoerHpw3FkTn4/M=
X-Received: by 2002:a6b:7f08:0:b0:6e2:ec05:87c8 with SMTP id
 l8-20020a6b7f08000000b006e2ec0587c8mr6674474ioq.144.1673619821627; Fri, 13
 Jan 2023 06:23:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6e02:1282:b0:30d:c36b:403c with HTTP; Fri, 13 Jan 2023
 06:23:41 -0800 (PST)
Reply-To: hitnodeby23@yahoo.com
From:   Hinda Itno Deby <atidigahcyril@gmail.com>
Date:   Fri, 13 Jan 2023 06:23:41 -0800
Message-ID: <CALHvQ-i=c6i56KKAWCU6YHCKu56RytXe0C3_h_MOPvHa0vgPTw@mail.gmail.com>
Subject: Reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d32 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5009]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [hitnodeby23[at]yahoo.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [atidigahcyril[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.6 URG_BIZ Contains urgent matter
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
My name is Hinda Itno Deby Please I want us to discuss Urgent Business
Proposal, if you are interested kindly reply to me so i can give you
all the details.

Thanks and God Bless You.
Ms Hinda Itno Deby
