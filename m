Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C0A4D931B
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 04:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344659AbiCODpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 23:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239264AbiCODpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 23:45:40 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8253980A
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 20:44:29 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id e13so15232895plh.3
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=8onAlWv52sOb/SxFxcP6hVZXcRh9F+h1pzqojCTvtfk=;
        b=Mw6jIlgCpR7Bm5actkLdVA90yO2MJAkFTNUSsGD/qjakumOffbBuvDtOM4nHsDRzok
         kFDbkEEdQRMK/D/u6KgTgc8/ECftqprWBE1PR9jADcaBAmZee9PL4EznzUroPyONthbP
         KT9JTI5Xlk5kkYMv38s6fio7L8ghmdt/OT+WlfYgDgSApuoYPL5J6i9ukruzpUo892es
         vyynCf8yRdtZWBRU3gF/AtbAh1otsZKLy4RCHIlc5IeLA7/uqQJzqNUpMKROnTOwZIE8
         PYSofLOaNsXKasqQMsaMVR8jdh13R7LmaBt40IOCahDO+fHwGr4xVkkmeSMCHEK73hyr
         f3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=8onAlWv52sOb/SxFxcP6hVZXcRh9F+h1pzqojCTvtfk=;
        b=bWNw77eyUdbXRwphgrJvmIeOzUBYtCluHman7t/ERkXAK0kjWV6CbNOpsOtEw3jai+
         ZZZqdEWbFYmRmdFCoSC+hYY1U0oP/uQ5vjIUpAQgIJbSZj5luzKL4YIKNsuIStVHPMN1
         fVDC+JeHCjJiGlW4HvWcFbl/zqUUwPYRYTj1uQ+ES9wRKq5rBBnrhofCb8qyA+wcbGOv
         DJV9/P3KgGz/IUpL3QgDnCGKBtcjypoMxujYKBZOqkPhiLcLiekLowBT1wFLPH3Oai5e
         CQ0OXOpxGcvoULr1p//1KacRluQ6CKOVlxMO0YZjcNUFjEGkWTGyNZIghz1F+azbryAD
         cKvw==
X-Gm-Message-State: AOAM532j54IljgXvDVW2w9OmG31/yi3wFRb83ixw/r3ZQjDjW+NAtj9K
        C1+gbPzpsOpDEPrv1rzeEZovCmzkerhbwhSXRGE=
X-Google-Smtp-Source: ABdhPJw01sFb31WXpGaNtZKqcX4A6hIX76A97wtbbPmmraA8QY/0eviICcqpHdm/e/gnTfP0cumk967S2LqXEv6tkW0=
X-Received: by 2002:a17:903:41c1:b0:151:f026:804f with SMTP id
 u1-20020a17090341c100b00151f026804fmr26692242ple.23.1647315868957; Mon, 14
 Mar 2022 20:44:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e20e:0:0:0:0 with HTTP; Mon, 14 Mar 2022 20:44:28
 -0700 (PDT)
Reply-To: douglas_joh13@yahoo.com
From:   JOHN DOUGLAS <sgtandelmiriam@gmail.com>
Date:   Tue, 15 Mar 2022 04:44:28 +0100
Message-ID: <CABR7uT2Vhns7raLm9idNiNcW4nJ07nsOEkaayjEyiWdO2i2DxQ@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:630 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4285]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [douglas_joh13[at]yahoo.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sgtandelmiriam[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

How are you today my dear Friend?
