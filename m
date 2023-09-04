Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7615E7919A0
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 16:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241739AbjIDO2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 10:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbjIDO2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 10:28:11 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C57ACE2
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 07:28:08 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68c0cb00fb3so1279629b3a.2
        for <linux-media@vger.kernel.org>; Mon, 04 Sep 2023 07:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693837688; x=1694442488; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOtQAgfRN5wcVtshz5ZvILTFmUrWKvgNVBGb1V8AVvY=;
        b=aXqwHoy64rYqjlW7ZbtMLS99ejKPDb3laR/RiqDEMGsv6AYx7MVdPM8eTijshzNZY2
         hLIAO2QPlsEi9psWCCqkDFldF0ehhzdk2an3gbZBsQYNRXf+F8u3u2nnJzRTTcxx2lkM
         /jDFrpZNEjY621kUStKInerKUCmXYNGN2l7/em9VxaNOXJZL4ojNliDLom3BurczMeLJ
         JDlMsyfFaXvp5lE6S8uwc0LNUkOHLQG+JnC5Mx0+/inEFBFnHOoc4kl3bbdElvqISpq9
         w8noZGYWDO81tFYWmtoM+bi27nm8mGJ+ldgXPCYzpJJup0xbXocy5RRlnmOrnMLCVQIP
         FmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693837688; x=1694442488;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOtQAgfRN5wcVtshz5ZvILTFmUrWKvgNVBGb1V8AVvY=;
        b=g748e6kJqlYO/kgCXJNDVdp8EILqXrETFYmhjVvC8xjHhszTi7UbwqaGpMGihSYBc/
         Vt4a40ojcF0ojMuIbnKoOhgDKQUDdnyddWQMi13G20TNgqZiVI2gEtYcs9RYxLC21ruI
         QY0N4DsuvunCRNIK0HeFEfy3euWXneJgRbp+05pReSDnHW0HbNWf8nOWPGWaZXktE5bg
         yx0lr9hmEq/8XAyBYHQwl79F0TkgGOgQOC6zyFr1NEIeqgbovKUtD8oIn1zqlI1k33lW
         UvzyjSgOozL+Zk8FmMFliFS3BNSuzce49iZwfwQAQoxGTs7kTh798hvEuprB5U0y2kh5
         vGlg==
X-Gm-Message-State: AOJu0Yz9Q7K8vtQLb83mXS/P+SR3zQzdyrJduS+9d0OBwg2mFvtXBAWM
        fnVugrxZfI3SISAXHiPzQySHd8XSTSYiWmsg0Zg=
X-Google-Smtp-Source: AGHT+IHXtnKpsw5NSxE9qXWfSUUI6wiMEDjmxdFzNnZH80aZCyOSiTYs0/XPotWPmJdNo+bh4mtRAaQhSTGUyg49z+Q=
X-Received: by 2002:a05:6a00:1ac7:b0:68b:bd56:c78b with SMTP id
 f7-20020a056a001ac700b0068bbd56c78bmr12466552pfv.10.1693837687773; Mon, 04
 Sep 2023 07:28:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:440e:b0:64:64bd:54e4 with HTTP; Mon, 4 Sep 2023
 07:28:07 -0700 (PDT)
Reply-To: n.rbaker001@gmail.com
From:   "Noel R. Baker" <demirkol.chambers01@gmail.com>
Date:   Mon, 4 Sep 2023 07:28:07 -0700
Message-ID: <CAPyJ9=4bJuQjSQiaRo-8wEkB_Ctns9=yNKfpQOb0ERL_Yh2KwQ@mail.gmail.com>
Subject: Looking forward to connecting with you please. Thank you.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello. I mailed you earlier without a response, please confirm
validity of your email and respond back to me. Thank you.
