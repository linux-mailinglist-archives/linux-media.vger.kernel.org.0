Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC8B5BBF03
	for <lists+linux-media@lfdr.de>; Sun, 18 Sep 2022 18:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiIRQuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Sep 2022 12:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiIRQuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Sep 2022 12:50:05 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7790FDE9A
        for <linux-media@vger.kernel.org>; Sun, 18 Sep 2022 09:50:03 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1225219ee46so58902230fac.2
        for <linux-media@vger.kernel.org>; Sun, 18 Sep 2022 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=/h9gKnMfrpB8UgQ8t9enyoIllg4YKOK1P8hel/POVkQ=;
        b=UNU2p/hrbCw2/NNR01sPe5VjaPu1RGePKoJzGi95DZCUZGzznhAjpmPCop2pZJlA8B
         ZhgoU3dsrKxjo5HGX13DHaCAoQQOA1MJukvnjbnsQHw8Ot0LL4LcRA5AVeayhPLOgrhE
         ehcTdd3Ft61UoCTW90srYmugpUGo3p2lgpttiXTCJgZBlUHAT+sXTicv+z+XYqW9Cx5P
         nQY9WgzcHd9Ek91UZ4d5tN3jK7BYQUmkP/NkZTj/JGvlkpfVET3TQ9hRCdfms/nTwOfK
         h5cwjIzKSyZSD1VnvV0TeEOdYa8vjo8ZAQPX2jH/swIGJHioDFm290AJftEqwjFpgJ5o
         011w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/h9gKnMfrpB8UgQ8t9enyoIllg4YKOK1P8hel/POVkQ=;
        b=0tRjwd3teuA3hvmwLzFMxwmlzvXn9kNxqn65d/qPgyYSmA7YtrTb9UwQPPVdgA2xIy
         M2Hz/50MYyV4zeiDyreRr34g8pvd3O63cZR1FXirWEatEn0EminoievmWs2132jyawtw
         0CZToX4v8N1lMMJekBDKoi/EBYFRP6m8Ss5ymP4tKjgbR6yBe/oPEYY+iFLkP334I1MC
         nh4p05RuYslZ197tU8V/LElzsZWy95ciViF7pmXBHNk/oUjn4+k5SSTtVtlUUfX1gWNR
         h87obq8P+Qp/gFECnos3U4Avkwb8FetddboWo1CCX0UMGLPuVZSmNCG/A1R5OZXxoZ8u
         JqHA==
X-Gm-Message-State: ACgBeo06OWF2V1lpHDrBgU2ecQeYy+xXB3hizbEXA89DGx8g/6dEvrwE
        uACMQzgdK40Q/7mjhuyVGARPgKTP5vjL+n6nEvg=
X-Google-Smtp-Source: AA6agR6Lw0hX8lCNOPZRzDGyF08J01wUBW3MjkW0Ms580f0QwTJAw41b0/UEECmsGLG6/7opeIiFoGKisg+Kk/ZTItk=
X-Received: by 2002:a05:6870:168c:b0:127:c627:3bad with SMTP id
 j12-20020a056870168c00b00127c6273badmr13031812oae.93.1663519802492; Sun, 18
 Sep 2022 09:50:02 -0700 (PDT)
MIME-Version: 1.0
Sender: onosetaleelishevaunuebholo@gmail.com
Received: by 2002:a05:6850:7ad4:b0:32c:d8e3:2685 with HTTP; Sun, 18 Sep 2022
 09:50:01 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Sun, 18 Sep 2022 09:50:01 -0700
X-Google-Sender-Auth: x9Kde0_3TwV-UrYwNklAKbat7f4
Message-ID: <CACBkC06eJ1EdbYjR1FsVrrCZh-Vjr5wSdnE70sTsw16C3QGjFA@mail.gmail.com>
Subject: Hi Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dear

My name is Dr Lisa Williams from the United States.I am a French and
American nationality dual) living in the U.S and sometimes in France
for Work Purpose. I hope you consider my friend request. I will share
some of my pics and more details about myself when I get your
response.

Thanks

With love
Lisa
