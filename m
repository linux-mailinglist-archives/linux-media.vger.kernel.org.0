Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD55A75489B
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 15:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjGONHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jul 2023 09:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjGONHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jul 2023 09:07:35 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9037B3A81
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 06:07:34 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55be1ce1669so1829915a12.1
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689426454; x=1692018454;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+GjSl8O12Td8YnKfGOdIwzIbnxBu6tpmFilTH8epCA=;
        b=EmexBsJX+3aUPPrHk6EH0qMbs/jep+LdXw3spbhqHP2oE+hwCpAM82xKLJzNUTLvzX
         jAzS2pxvYwBQPz8u53TlN02/jtXtkurLn4Pc+rYsiFcZbjLjnSwbMUq0H+mDJbB/RgfX
         thvFV+8ungi0QTD8k3gBtz+pQEqTDrDUyz3fpq+E4yij5JoQ0T7FmsBSnFbk/iMCiW3J
         Q7R7Z6wdtjtQk/nb8ltMIKbpfrLTdmwpbtYSeV2oaTPj7FPfcYAdTsgMlrYxBQmcDUi+
         g2+Hv+BLvtmje6BFfNZwzTX5rBABndbpLYiQTBdDtoGPaYk+zvLkYpwU6z531kG/hkHX
         ZgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689426454; x=1692018454;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+GjSl8O12Td8YnKfGOdIwzIbnxBu6tpmFilTH8epCA=;
        b=CEFCmi8DHISaKHxjpWEW4kLw1UWmBMZS6gCc18AcgD+j6UjVdX5n0eAD8yc0RFXO0V
         Xb8bX7XYVJn/N3aUXGoxnl8RRNu0nXXdGzg+rO51hzqYq4io9Fdg4v0YUwEwrTLc8/ky
         xiWTgdbwu63VSR80GueXG/FJW5yELcrx88nqZgmz1y/07PtA4QtUUHdiQqOXtmU2ekYj
         CqAB4pwIzTizO8Bya+bRszMmkaqJOIaTLYG/v0uDxotUCTg9AWK6IQJ5QG12+yctw4aB
         MCOYgmmInxqqWPTypRcZt+kQZYXhqOppg+2vaj1rZdAPtcrRHAK78gVnNz0SBck6Vc2+
         u6pw==
X-Gm-Message-State: ABy/qLZP8khpePodIapnaCo4cUtQGHdYZPoqnluX5NMUpu57GnTk0E6E
        iQpMEmJJHmR1qC3uyVvb4JgrKbzun7eyhEjABRI=
X-Google-Smtp-Source: APBJJlGIS1xxJfG3Z5wHdIFUa086tHAd57GEyn2aDEyzDwcBj5CWTuXvSyXybDnadbDepRjuzB0CWbh4uOvzxkoNCRI=
X-Received: by 2002:a17:90a:760f:b0:263:e122:1bc7 with SMTP id
 s15-20020a17090a760f00b00263e1221bc7mr6264607pjk.23.1689426453643; Sat, 15
 Jul 2023 06:07:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:a509:b0:d5:1aec:540a with HTTP; Sat, 15 Jul 2023
 06:07:33 -0700 (PDT)
Reply-To: Jackkssondavid@gmail.com
From:   David Jackson <dabiyadigo01@gmail.com>
Date:   Sat, 15 Jul 2023 13:07:33 +0000
Message-ID: <CABJnaVinsBJRAMovcP0m6E_cuz0baTazP-K+v_HLiCHzk5zxkA@mail.gmail.com>
Subject: Hello!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:52a listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.9179]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dabiyadigo01[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [dabiyadigo01[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I am still waiting for your response regarding my last proposal.

Sincerely,

Jackson David
