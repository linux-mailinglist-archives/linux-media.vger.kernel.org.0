Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3157773065E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 19:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbjFNRz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 13:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234782AbjFNRzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 13:55:25 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C01C211F
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 10:55:23 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-55af55a0fdaso824389eaf.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765322; x=1689357322;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=VCXPNCraZYaTu7G2pWl4+xMj1l4Y4mQDL11K9iSvgOdGsNAHfuHyLjj8V4vW+9sJAI
         SajL1EFpxLSNeAT8tjhoryQ1i59otgLUMIBl+0+3JLfNTMWsbDYdrYhpKA5/30UpKxBX
         n2D+t/3BTp0GMr9jxVUNLq/yPERe9miXMvD/00bADfgA6Zp9zSEqSpGr19t/vJAIki9X
         +OjVADPsqB1VbM2+YxqMIL4yWp+s/JnCACZMmTS2sqPqHEMBu8rvw4ZDkBwzUIZOR7fx
         H8StQD2KLRvvEREMDSiuq6H53efasEwySKeAQtwg1zgWmreDb1sgoQGNuU0rUdtcCCvy
         jpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765322; x=1689357322;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=XOYKdzviAcHC69Dt93uqzNit8HjE+zYjtt5pM1+Jvv6wtftuOXeAXy4aUYmEepMzzS
         bvcqUjxaZL88P2oxn0nbLSXucduR/Dttpy/lR3FmNjs03R54VIlt9pGxNOocsCvoB5jq
         U4HGgI1y9UguH0EzLHsRG47jT6q5CsyNBgAMLPjEVBLEturN6YUH7zEC5T5XQ+ot7rjQ
         SuNVimZ816tsaHB5fwg8UcET+h41Ndirczxt+32uHEbbYqU4ybiHbB+mIcHhgPXr1VB+
         VvqM3wSwGilXWYawuGIVsDBf3EhGWpkAtk8joTGJ7mFKdKdCn6XTPNkLAVp78oZ2iqfT
         noCA==
X-Gm-Message-State: AC+VfDy6zXrHPYhUkcnI5nQKGzj9yT9GwuN+imBFBQrzMHehwajXm6dO
        8r2ZlcmWs32yhtjOO//CS5k906LSFq9yccuM6eM=
X-Google-Smtp-Source: ACHHUZ6UGFPXXI784rUSMFAGSLlxpr84ES9mILD3wsvvfuIbRnHm7KT7cxnaUJ1SUuE4Jyebch3b6+kaQDNHuerCAbM=
X-Received: by 2002:a4a:bb05:0:b0:558:b78d:8d1e with SMTP id
 f5-20020a4abb05000000b00558b78d8d1emr10506190oop.7.1686765322435; Wed, 14 Jun
 2023 10:55:22 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsthereseninna@gmail.com
Received: by 2002:a05:6358:998a:b0:f1:be9a:c0c5 with HTTP; Wed, 14 Jun 2023
 10:55:21 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Wed, 14 Jun 2023 10:55:21 -0700
X-Google-Sender-Auth: vmAb2NVlphKo8pDPEyDrOAbbRyw
Message-ID: <CAKVHDg9QnTTM9BZ=iEMEOq+CKt3056rmJg2mz1VtnN8BO1D1tQ@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
