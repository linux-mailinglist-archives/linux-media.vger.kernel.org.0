Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2555F8A06
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 09:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiJIHrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 03:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJIHrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 03:47:20 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075E7EAB
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 00:47:20 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s2so12181652edd.2
        for <linux-media@vger.kernel.org>; Sun, 09 Oct 2022 00:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=GogQGOwAB20v0/QNobPizUdEmSSuo/vPnEUhbNAwbapB/elMSziOqFdgfrUoObYqUj
         oNtkna5EB+fqiIJ/6XN0W8+V0JmBL2Qqy7/2ee/zBk3AUD9O5rSJTuHw7ZfrpE2dHhhR
         UBrvxD+4ZQpQaZxizKxObU4R9BLzGqQ5pm8cWqGNyUnjHa01Bx1UuP5Fqa6s1+r80aZM
         gjlTfX/y/QN99zlKeAjxe6kB8s9sQV7fO0Un6jyAgd42Txrj3Xi8s5S5hAx2XOjeaspp
         9d7Y+UsWo903CvPuWV5R13+jiBsSshutq0lI4hTv1sL3memQtuOVhnOz4fW3JTrJNnou
         4qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=I9vlUsOUbUTKKuN+rGXX0jBgo+E1nCUF/VdUgk3S9WxHaViJxGtd3NwFxnqf6JmS8l
         hcOkgOFyntlc3HJ417BllbOu9lYvncYj40NFvbdb/u9esu5v/WKjb0tlsozoX2OafxeB
         0OiUwhNx7HRTPECY8ndMa1fvxTWmZslFslRl/5hx4pY3hoM+GSItFxac1UmPyyECR7Rg
         69iDZE7gHZBmLAwmPphARsa26tWHjRCyEGYxefZ21tvUB6leSiBVuoocg51pFpEmhZte
         eWH43aaxrfPEiCAyjUbZ78jWZihK58FrLlBGMefJIKlIk8y1jGINQvXSB+ELB2RCvmpC
         Y+ag==
X-Gm-Message-State: ACrzQf0rZlG2T9n+wVnoUPouP4MKiLncpb7MIvQYt95l0576z9R7pjc8
        fZInHTxmHhdKFraNfoyCosJucLRiHNwshvzmmQk=
X-Google-Smtp-Source: AMsMyM5tSDK88825ugrN4Lc9/PNvaYVS6ttoMnca6lF4jPX/wpRBmoSZiKUtMYqN3NTaviklL2SgKM/5Q8xk2j5jj6c=
X-Received: by 2002:a05:6402:3206:b0:458:c6ef:a5aa with SMTP id
 g6-20020a056402320600b00458c6efa5aamr12251977eda.127.1665301638417; Sun, 09
 Oct 2022 00:47:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:39cf:0:b0:1de:957b:c80a with HTTP; Sun, 9 Oct 2022
 00:47:17 -0700 (PDT)
Reply-To: paulmichael7787@gmail.com
From:   paul michael <westunion.1960.info@gmail.com>
Date:   Sun, 9 Oct 2022 08:47:17 +0100
Message-ID: <CANyM=nkpp1vEAEAFnKtd8gnMJ34MnGP0bE1aykQ-1ksG+4Tk=A@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
