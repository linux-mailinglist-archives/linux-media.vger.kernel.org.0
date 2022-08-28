Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6755A3CE5
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 10:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbiH1IwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 04:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbiH1IwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 04:52:01 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1F330572
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 01:52:01 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w10so6851197edc.3
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 01:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=js8jdg7UWifkhRoiGZNtqX+ncfiv/MFe1dhMSWZmt4I=;
        b=o6tFguuz2McUzKIZHUFphsIjY8mfeW3HwgZeMWg+nN9ouBjGTpw182fzW69/0Xg+7+
         KaiGNoMz0+fbwhx0e6/nLp9RD7ZMsL+tZWWzCHSmHCYV2duzTGnlIHTm5yj0c4Yl/4Lk
         xMUmGfv+cSTW81JJfJIl3pQ+WlGD6uYQiEp4gotA7YAI8NB+xOt3X2Tr6qp+pX0HyUry
         W2Kih9YWTU1rWkLhpqRq1ThhyTqvAuWyKEzgtWTEl2a1aMNq3sqtE/+4c03aDbMtyxc7
         GBzIxMPatLZD0ThiIZM79/2YQiavDOhMcnanffzjkG9uLJaRQAliSbeE5QULW2vTU38y
         rnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=js8jdg7UWifkhRoiGZNtqX+ncfiv/MFe1dhMSWZmt4I=;
        b=UOfwkz1u89QHpjNbE2GmFQAir4gGPsVJOPmQFTvFDvFOBH/2N3Wnnq2xCP2/rrm+OM
         +fHabjlRR1ZVD+gQmgQNQxdQJ5XfdN/sPuaH7KC3TNPUxRlcomW+kV87fxAAEPGmsHUx
         VUd0XYYx3UzoGbQfA3DpmXqyiPUncpF/X6feiELezBP4rVMp7pYy1rayVwkxS+PM+Vfi
         1vy4FW5spayMlbmYZAXnjhInDuKAN2YmVoqdcCI9QQXJuqH1WvUBryQkHBr7HxZNPoXP
         ihUPeRhgIJM4FwcHBMeCi4eOo/ZP4DDoooXIVTUKxdhgWI+3GhXlws9hBdg2ILKSkDCf
         KTXQ==
X-Gm-Message-State: ACgBeo15EHbP5eNqd+1h6rxLli7ENc5vdadq8KexalBXRRYok+etd/Kn
        ufGNscjoHRUoJeRueXITZOS3VOhTB8+pLr+ZhZ4=
X-Google-Smtp-Source: AA6agR4+jY/Pjp/IA1+BAqukui93B+7ZoY2692LvT7VIL6uJwNoHKntPCMpYCDVA6XqKu99RNiBWtJmINijDEN5NcTA=
X-Received: by 2002:a05:6402:5193:b0:43e:1d52:fd70 with SMTP id
 q19-20020a056402519300b0043e1d52fd70mr12618479edd.150.1661676719468; Sun, 28
 Aug 2022 01:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6402:1941:b0:446:f42b:1974 with HTTP; Sun, 28 Aug 2022
 01:51:58 -0700 (PDT)
Reply-To: sam1965kner@yahoo.com
From:   Sam <l.biasiolamperauto@gmail.com>
Date:   Sun, 28 Aug 2022 09:51:58 +0100
Message-ID: <CAHPnz9G0QLB+Pk8LA1JQpqQjx-Y0V0OPd4ChCnUpziG8kpaowQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, I am aware that the Internet has become very unsafe, but
considering the situation I have no option than to seek for foreign
partnership through this medium.I will not disclose my Identity until
I am fully convinced you are the right person for this business deal.
I have access to very vital information that can be used to move a
huge amount of money to a secured account outside United Kingdom. Full
details/modalities will be disclosed on your expression of Interest to
partner with me. I am open for negotiation importantly the funds to be
transferred have nothing to do with drugs, terrorism or Money
laundering, regards.
