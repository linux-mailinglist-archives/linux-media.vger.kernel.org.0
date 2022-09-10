Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32DB5B47F2
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 20:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiIJSi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Sep 2022 14:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiIJSi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Sep 2022 14:38:56 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF5F481D2
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 11:38:55 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id 62so3904547iov.5
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version:message-id:from:to:cc
         :subject:date;
        bh=VLhKZ91YRScv3AQbhmI9wfdqSEGPvlVgRwjeCn+4ykY=;
        b=e5aXm6S5kdB8KffhMCD/EafU+wQmde0eJg1rGX5RdJi1sLDrhu1vtyKerpnk3gmycA
         ztCQkC06YeuZXHqN2+EL0pteVCR29ibsXxdrJPb/oZ8YxtBdPkoh5+3sZU/Mcd/+ppzx
         EWhnnQrf7lGjMV6yLA5YRI2uuJQ/cTTlTqFHsqHOu4lPDdHdoXe6p2qROgzxLyPzI5yc
         T4qqoUODhT0rkeHpqD2N6Mixz8frWE6zlW/4ZkrUI4mxiqSdaThs500xHCEIoP7SfDSu
         942cxKCCnfTkOVE7bfc8pRlnDuwIllhDrRsGDB3/RI+jzzF8Mug3ZM5kuGBsVCaKPxj0
         orZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VLhKZ91YRScv3AQbhmI9wfdqSEGPvlVgRwjeCn+4ykY=;
        b=C44nPNE4BK5mLixuKP8UXIz4ok/n4UoAEew0sJFAOK+diJbSD8tzCuaE13+LpF/4Wx
         lLYangIU2qKypSVMdsCymWc6aKiGnXEktqvWtkiCtt14RJc+IZFbMB/aJ1GF4H4fahPP
         bys4LzYcdepCWqOd+BUmf6t4B6TyPw/axMYd7oR++hdEJ4GrSgYBwiuo09yososS600v
         sBBS2AbnkGAZj9NQjTuUFSl3zu4YpS70DDlHXjyDjlQ1KcazMpGysTgicSz4VqjxQkgi
         h968CNQ1B9yXf8kY8z47hi6ETE7l6wTot2QRABHQICMFIB+nSOhv8o1TpoIr71EI5/Yf
         Y4qQ==
X-Gm-Message-State: ACgBeo0dYP/pGSPOd1yerw8ECR1LDRi1JdG6nhFEe+oyaZBPvMZRbhJn
        sOmlT6+4vi8o4Nq7n40Pvpg=
X-Google-Smtp-Source: AA6agR4fUT/1j4i/pRQh92OWbNYZyYPOON9sKF0LT6OpMapSziy3j1/Avj3mjdS8YIv73DhBE0fgAA==
X-Received: by 2002:a05:6638:22d1:b0:358:3ee7:70b8 with SMTP id j17-20020a05663822d100b003583ee770b8mr6697914jat.80.1662835134845;
        Sat, 10 Sep 2022 11:38:54 -0700 (PDT)
Received: from EC2AMAZ-6AE24NQ.us-east-2.compute.internal (ec2-13-59-125-75.us-east-2.compute.amazonaws.com. [13.59.125.75])
        by smtp.gmail.com with ESMTPSA id n43-20020a02716b000000b003583deab256sm1472146jaf.18.2022.09.10.11.38.51
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Sep 2022 11:38:53 -0700 (PDT)
Message-ID: <631cd9bd.020a0220.1fe91.189b@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: Your Financial Contribution
To:     Recipients <duruerol70@gmail.com>
From:   "Sigrid Rausing" <duruerol70@gmail.com>
Date:   Sat, 10 Sep 2022 18:38:47 +0000
Reply-To: srausing57@gmail.com
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am Sigrid Rausing, a Swedish investor and philanthropist. Your email addr=
ess was randomly selected by Google Inc. as an active user on the network. =
This year, I have decided to donate 5% of my wealth to charities and privat=
e individuals due to the coronavirus pandemic that has led to the closure o=
f the entire world. I give you 500,000 euros and encourage you to help some=
one you love in any way possible. Contact me via: srausing57@gmail.com for =
more information
