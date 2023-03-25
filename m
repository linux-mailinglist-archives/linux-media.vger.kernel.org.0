Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EECF6C9165
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 00:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjCYW7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 18:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCYW7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 18:59:49 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B382EAF12
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 15:59:48 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id bm1so1449593qkb.13
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 15:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679785188;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=gAgd/2QsZAn1DL5Xs/5XRfOB9BsqHtucMJltyX3UBXDKulcCSnjWp6a6jVthtT7sxJ
         pBlTJzXM+xyL45sKBqD+lEzD2RFooKCU1r6O0bHdS36/MSCXA0FWk14wFnd92SM41CSO
         ejIxSJd4Jd8n1m4Dtq0+R7q8WQOny3nOwD9m+NpgzYKtaFvV6smzA+j3BYlAC5/pMPIZ
         +BoI4Vm0XhqpcInw9WQVXK4qTSdRkAjm+5op0lgKDgi+7Bx8N4zCwWq63Tbn1ePCNhHn
         biYyMih1/DSze7SWYw3UDrZAD+HyfJoyb/BYnGMJNYfH1RnB/d4LKRA5b7gN25jmWLgy
         GvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679785188;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=JamXGHLBTenmzNNAlwYSylIReC9hexC/kp4/Xbm3+r5lO51WvZI9yTgpw5ExmPOOdZ
         MTQyj/w10P/aJBNnx9ARTVRo4rmCemxdxwO2ttUMS16p+SXJS33LfDWX+/DURKKax8Xx
         chAM1/A114T3sNareS46p+G20Em3KYye7bWISWb6BtUb8WmxMi2fjRVY0Koh6LQEfX9f
         DlzuQ3vu3lkfTJGNxzGHsVWmh6ce5iHd9GPRlRq28IAnu6vYNggOKr9QTtKeyg0bgS/Z
         7z4HhoqJlGNau3LiIEAnMjlfYOtjENSpjwSh0fweb6wfy6JlAS/HI2OqdMER+7Woaaj4
         7cpA==
X-Gm-Message-State: AO0yUKVoxTBt1JNLvOzUspXPOTfdQnzPxZF0uRE+RbcHljxG8MsgTc8t
        +XssC1WY2Y5RrFQNLBiwKJzUMVBk+H5/05bO5CE=
X-Google-Smtp-Source: AK7set+NC6eRDdV3ZyJiKNEVj1Ehlydcf8piJK5OmOkGfqsQxzvvUatnh9lo506w3uYkZHU6uUzo70RIoJUK2y+IDTM=
X-Received: by 2002:a05:620a:24d0:b0:746:bd8a:37ff with SMTP id
 m16-20020a05620a24d000b00746bd8a37ffmr1541943qkn.9.1679785187635; Sat, 25 Mar
 2023 15:59:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6200:5a07:b0:4bc:e52d:b92f with HTTP; Sat, 25 Mar 2023
 15:59:46 -0700 (PDT)
Reply-To: ava014708@gmail.com
From:   Dr Ava Smith <smithfather20@gmail.com>
Date:   Sat, 25 Mar 2023 15:59:46 -0700
Message-ID: <CAJb3ZegdtY67XpaMz_3pNmYJR24XARx08-40srK4j5wmFPgAkQ@mail.gmail.com>
Subject: HI
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
