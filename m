Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17584D2F69
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 13:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbiCIMtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 07:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbiCIMti (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 07:49:38 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990C84248B
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 04:48:38 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id s8so2165842pfk.12
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=A7SqxPeuATRIawRLPRXdbXUmc+x9RhbBGbJAJobYDWo=;
        b=mSf/4izrPMaVBNQSdKcItyw5RFJ9/wGumHUy9FGsToQ85QENMRvn++bqM1NjSCx6Sg
         SSO7WhTwlTJhSFq6A0isIMYmIYtHGsNPRAqEn6HfmhFcapb5+blLm1iOTxQVETCIY5Hn
         UPOaPiBLTEGfkLLQA7HjGkSu9sdDZIXFQjM6PRx3hfKe0+lMHc086/F71ZXgijjy9324
         F+AS0lF6uvdtbVzQ/eGlsiq+yAc80ywjPbtFRiuC5VXlADSTrySMcmUlXTMdl/Mgn5gT
         /Hv/wIbO8CNvhjwUnPwpE5m2PB5I0QdO3WDRIzDD9CT3OJbBABZ0e/52QmdnT7UGy4mw
         pkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=A7SqxPeuATRIawRLPRXdbXUmc+x9RhbBGbJAJobYDWo=;
        b=Yat5xYPmAq229L7ewwE0LO6nRKJKl94CsRsX7dewt9uY9gn56Tg05IwWBjGyNdk+6Y
         P05GG09qXnyfbqdmHyyx1w+pp6qmjl1bqClBshb1v594ivEEWs7KfygcYqoO30/gratN
         K4KTU0cakNGxSx9KsU3cesxjtjN/OkxLLsx3Fd1TnN4yw8ZSLM8Ap9hibP4ZRtNImxIY
         6p2gpJuDL5dc5cuzGT2cLl936/qqg5XUZgciXlzxeBtqPAV8MzX9Xuap97r1cn8eIN6z
         eGWV0HJga/6xYb9yW9JTiEWqwqHZPyAfnry4IJs86jgrmiRH/+9c/pvC8chNwUWpctia
         eHmw==
X-Gm-Message-State: AOAM531iZJOLyG1RQVilwFp8TSHXy21YJ342f1RRqNRPXcalD0Dg3qPb
        29HVI8hp6awFlzt9zo8HWVNU7C69zxhPbdWK3g==
X-Google-Smtp-Source: ABdhPJyo88Pi/ZrH7pQVYkXk9pnNIaOd8mPX9DkZ25y7xcLZxxICNtGFQFl8ebLnTOEqMd9uS6XpWOrLg+rr+DSCr2k=
X-Received: by 2002:a63:4756:0:b0:373:e14b:5848 with SMTP id
 w22-20020a634756000000b00373e14b5848mr18316740pgk.337.1646830117468; Wed, 09
 Mar 2022 04:48:37 -0800 (PST)
MIME-Version: 1.0
Sender: alamsalman2000@gmail.com
Received: by 2002:a05:6a20:3e1d:b0:76:760c:e92d with HTTP; Wed, 9 Mar 2022
 04:48:36 -0800 (PST)
From:   Miss Qing Yu <qing9560yu@gmail.com>
Date:   Wed, 9 Mar 2022 12:48:36 +0000
X-Google-Sender-Auth: K06cR5caJUWSVG9NqYCpKvAeopY
Message-ID: <CALH+dLDsvpncZm2Y7C53p=SeSk1E47NBPvzp6AK9_yeUrdVcmg@mail.gmail.com>
Subject: Hello!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_NAME_FM_MR_MRS,HK_SCAM,LOTS_OF_MONEY,MILLION_USD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor said I
will not survive it with the critical condition am in because all
vaccines has been given to me but to no avian, am a China woman but I
base here in France because am married here and I have no child for my
late husband and now am a widow.

My reason of communicating you is that i have $9.2million USD which
was deposited in BNP Paribas Bank here in France by my late husband
which am the next of kin to and I want you to stand as the replacement
beneficiary beneficiary and use the fund to build an orphanage home
there in your country.

Can you handle the project?

Mrs Yu. Ging Yunnan.
