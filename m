Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307BD62C26B
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 16:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbiKPPYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 10:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233861AbiKPPYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 10:24:39 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7344FD70
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 07:24:38 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso10580235ota.12
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 07:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s6XTTZ+NrUCRZqrFnnPtlsztZjbXNjQi+1S8muccdxA=;
        b=asdqkFbQyJXCk4y3vuDWCr9V/2kF/oZBeNUr7AR2/hNrmluAVSoWqpLTAUbVMLKlaA
         w8YcMkPxdllLkia5psVlDevwZWtixzsWd7LKXJ/aZic/dFBXe5RAzru9gJ9LWJEeYhNz
         SmMNiEnL/O/8cUPMxQzoorPzqOsAJRx9YnCoFolW6Mt7iAAPy6kU+at9Cm+HiWXAGjYx
         hZKsNONnTbkNuF4g+YoTvZ6HA6k0YUQOEP1CxCTKoKd6XlM33HNWJtWLX7ntWCsBd4vx
         E/scnaKPc04dKnagK7vXjGe0Wu6yZHiSmJi+dQRTKkYpWNRLwu87bSElLkc/JsMnVQRb
         aOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6XTTZ+NrUCRZqrFnnPtlsztZjbXNjQi+1S8muccdxA=;
        b=4U/1SW9Dma5EiWDXadzGvstcKsEBVRxQep3f317uCXWYNr028nLN5jUjRKuJ623wLn
         IhIbNbGWKUsXiZvMh/sHqDHeZ4zHiaww1FScOoj+uIzQu8yVeTErgbju3+GXpIu7TOEt
         Zn23nL8bQA8hwXRGjc9kBBcBYB4FDDxuvsHzBJKC2reiJ7LxmEIuOY9aZOr6LfnL43wB
         0SYSqG+1nSitH1vKdnnSXp0pw1FtNT8Oa9mXo02L7zlhDwthLo6TKH8irDbYIQvU0Hom
         ulhlzd56ZEl5GP86ox8RD9LO1tMRlf1NaAhTog+9xUbdWX0ILzWQFjvIDwOSZcTJApNW
         ko0g==
X-Gm-Message-State: ANoB5pnnC4iwSA1qyJlWc2rMb1nijPZJqWEdPWJYG8JdjaWPG8HDoZc/
        D4fOksqPfYKJLZnEfavJgqZT/fj/GJI3BEs7Zn4=
X-Google-Smtp-Source: AA0mqf4zra9VCvf6+nvQeojqyPqn0e9ptd7Cwv75M2SscOKIgiXRaskySt4NT21jqMJPTXSxRbeFbB54O8M0CkIs2j4=
X-Received: by 2002:a9d:2ae3:0:b0:669:e1fb:874b with SMTP id
 e90-20020a9d2ae3000000b00669e1fb874bmr11352723otb.124.1668612277465; Wed, 16
 Nov 2022 07:24:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:12a6:0:0:0:0:0 with HTTP; Wed, 16 Nov 2022 07:24:36
 -0800 (PST)
From:   Michelle Goodman <michellegoodman45@gmail.com>
Date:   Wed, 16 Nov 2022 15:24:36 +0000
Message-ID: <CA+PxuvXWgs+2HhJH5k8rMWVBwCmF35UaB+U_PBOnNRcSCXS4DA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hallo, bitte Ihre dringende Antwort. Ich muss Ihnen etwas mitteilen
Vielen Dank
Michelle
