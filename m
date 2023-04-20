Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEEFE6E962C
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 15:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjDTNqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 09:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDTNqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 09:46:38 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE705B88
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 06:46:37 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4ec8399e963so574254e87.1
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681998395; x=1684590395;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIOo9/wELSNnnvyGjg119XABuEmbX1ppy/v2wZYamQ4=;
        b=W00iS5HC5IApfOHcl8GinYtik0Xmy62cw0dPZDst2Lo/Sm+XM1Q75kRANQBmjaQQy5
         O/YSrjG9AnvizTuxmfw80KAc6hNCSqyEBZcbh9GnLj4IWP/69WlUUawXQIR67ngjkBFz
         fp4Z8iU2r3vPiD9QiNMuNsaGREXsw1lIOf8H0CMt5IxJySSwF1HO8+Rf2U0dEmR9lkun
         4m5q+vx4+qj8/qwUixpk2Tt0/z3cms7NzUk1HtS2dQobcbcEEirupBvdRCqI+lcH+OBf
         WdPK0oc5aJC1tHPcgVZaUzAPQKloGL9ti/Rlfjnp1eyzUOSz/jxxfnP6k2xCbXUSOT87
         dBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681998395; x=1684590395;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIOo9/wELSNnnvyGjg119XABuEmbX1ppy/v2wZYamQ4=;
        b=H7ip6W4yzJf2+CezB6tY6ArvVWtbbduTrMKaFTtMUUnlRocOhWpy2b4Dugsbp7ZL91
         Uy2RvI3iwmlBK7ZjdkcYeS+3bOSlmyJZ8iyuAZI+UvBIupz41owRCRqTBnpIl3wsvujg
         Q+qgcMdbJRnVOl4r+XT1lQF/9px9lVkP2ZgBeZiKe44UgNORuD+ch3yA1/1JU0mlxoAK
         rWsT7sCtgW/17xGjMgpW/jlF/CfXmGmu8hO1PYXdk8srxz6ExIhBi4r55qa/s5sqkNgs
         XMZR24OMY/TsEmvTibHJotwdyrQ8wKVXZoCVxL7hBWiDpCBq82oYndpGYa8ogtRow4aE
         eCaQ==
X-Gm-Message-State: AAQBX9fnQpBoJ6jgwdK8nP8IZz1GOAiKJqVnjL82lB9HM2bDrTY4+cZ9
        H5l/UfH89XwcUmtBjJLVP2ixlTrT0cB3zTPzy5s=
X-Google-Smtp-Source: AKy350YcxnEFRIZuJaBgTZcdhF83ns55d35RTcO8E5MzACFal4l2tNzP1o4d3kOAuVQ5YoEm7gtnEtNuHuQezXPKKkg=
X-Received: by 2002:ac2:4293:0:b0:4ed:bb8c:5047 with SMTP id
 m19-20020ac24293000000b004edbb8c5047mr405315lfh.4.1681998395372; Thu, 20 Apr
 2023 06:46:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:651c:215:b0:2a8:cf83:9f5d with HTTP; Thu, 20 Apr 2023
 06:46:34 -0700 (PDT)
Reply-To: bsmyatee@gmail.com
From:   Grace Colbert <borismayor49@gmail.com>
Date:   Thu, 20 Apr 2023 13:46:34 +0000
Message-ID: <CADUYTALLAph=NhKUkkZ3NXzopWH0NowdRHzN=BOBj0ANqVHong@mail.gmail.com>
Subject: from Grace Colbert
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good morning from Republic of Lome Togo my name is Grace Colbert I am
an orphan girl I'll share my troubles if you reply my email ,I have no
mother no father No sister no brother .
When you reply me i tell you the most beautiful part of myself and
your help is needed to carry on my inheritancy to your country.

Thanks
Grace Colbert
