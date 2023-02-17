Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DE869A5B4
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 07:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjBQGmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Feb 2023 01:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBQGmD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Feb 2023 01:42:03 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CD055E62
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 22:41:57 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id bk19so187600vkb.5
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 22:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+3r6Lwvhms6XJ6bo2c6l90xkWazMwajl6iI1ojTsco=;
        b=MZN1hnRVVqw6S02YR9BFZ1XIx034Snwz/Cn2OZs36LCZwUC7Xhfw+YsdhYZeWKd85Y
         BPnse0qWqhCec4Qa0Gnz2zKyl/M+nrWmC9C75n3rWxyckxckb1fArc+5/n6nmh16n6bi
         YQUOAaPSfI6AQP2KOMy6yoUTY8tNGOZE5bgpMVFjQi3HVib5GzUZjLRJnatjMln9CwNy
         Fz6yC7xcDDPtmO2j/VtLfCBe7/uVRhSVNYo5Y2Xyj1GEN7PK1502JSC/l5NlQ+x6j+PR
         8OhtvMZ9ss81cskrQOM8toEEp+1c2DYuMZ8EjBnu+bZJPZe/E57080u0zkdJPxva4SlD
         7y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+3r6Lwvhms6XJ6bo2c6l90xkWazMwajl6iI1ojTsco=;
        b=Fbl7F+IQMATzjaPV5aobR/R8M4QtrIiyrm4SweUGkfmeqgPn7Wrvm4+QJP7ffVJxyh
         FuqWAE98t5bq4G5mimVOeK9opQY9Ll9qIf/fkxser/ekXYXc5d+yF50QjkeB1/VzFV8G
         Cuidin7M/vGfuL1KxOWy+ugQNlT//CG2QZZ8GSr/0+8xNYSTcou9mVfaZeaAybWob6k+
         FNKLF3lxtIZgfdIceAqcNsPss1Me8KT6ZkDD5mVWOAKR+KcaeXGJBpKw3/iD5Okqmqu7
         UuvhuiSnZwH2XxmIDtEt24Elmo/5QMpuOsHuB5GebYyXOyz+r0J7pOqv8G0fg6YYUWBT
         WB8A==
X-Gm-Message-State: AO0yUKUHizdY42XKTH/cqWPAyZeLtWFvtJiOlYe4So+ILrjY5cV9LTgI
        YCEt+63W4+xc+ozP4arz0H0QHA8Ha105YYY2Oew=
X-Google-Smtp-Source: AK7set8T23btIryZWkVhuq3unfRZ1y/qWOgjeFkTzeONfKsB68vNpviltx2TNlhaWNNI2QrEoY1efH8u429LjqEapoI=
X-Received: by 2002:a1f:9e0f:0:b0:401:355e:e0be with SMTP id
 h15-20020a1f9e0f000000b00401355ee0bemr1340450vke.17.1676616115815; Thu, 16
 Feb 2023 22:41:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d8ae:0:b0:3a3:49d7:7bd0 with HTTP; Thu, 16 Feb 2023
 22:41:55 -0800 (PST)
Reply-To: zongjianxin14@gmail.com
From:   Zong Jianxin <majisamuel02@gmail.com>
Date:   Fri, 17 Feb 2023 07:41:55 +0100
Message-ID: <CANV+rvwyKObzQL=Mnozu7TV_k2kADXb-gJXcQBximwB3kFDq3g@mail.gmail.com>
Subject: Urgent
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a32 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [zongjianxin14[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [majisamuel02[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [majisamuel02[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Did you receive my previous email? I have a Profitable deal for you.

Thanks

Zong Jianxin
