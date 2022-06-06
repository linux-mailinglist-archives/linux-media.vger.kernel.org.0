Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C24853E9A2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbiFFJZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 05:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbiFFJZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 05:25:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5217DE1F
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 02:25:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a2so16216697lfg.5
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=DCTOHlnn9bgmau2O5B11dgpXKkwCcv7DNwv92J7STCs=;
        b=Fe24jRmVB8wf0EoN2JMaAHULLWYYo6Ma8WNnGqIzOB0kEMZVs3gzRe2E74cA8Yk08p
         3A/WXQh3oT6Me2UaXj0H8oGyqsZ/ins20lXm74aTGjCqYg3G6prd1uV24NwZMjnot1wn
         KzaJQAWYjHofC4QNMgAHoaTtILDet2rAfcExXhuI5ucQBUNKndELPeuKrN4NkVTCj7Hw
         busCADbirW1jMT0EEQfNSCek0u3kCc7HoB1ho+8Nl3YG4CK4oA10XuQ4IkHtbE2RxH2p
         Ho3wLz5dtYB98taRI5BeXS/kKhDa3onee3sOQMlVnn3kSCOFo9IOqCb4YWgNDksjLV1w
         VUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=DCTOHlnn9bgmau2O5B11dgpXKkwCcv7DNwv92J7STCs=;
        b=DRnd/9857IKjfZLZRbzsih02pVg/vnNoc43i0Ee1WfTA2l/6zPvi3S8DddMavyPptX
         JvKQm4aIYmetLAeXZ3kBrvCIeJHcNo/om6yk8lYfkxdG+2muKqdWeDTLA9wEyeJynD7l
         GWrDgY9pr0KoSgMu2wlPsgdi1pyzaWhPO48AdiQjAFxofpl6+ifi2i5T7UlXAW4NII0z
         /SS0l6il5+Iq3nShkMuUnBFB63uPulO+8aa5sAR7YViyTHGT2N3OxJ49GXWozxV97934
         L40a29iWSl/vMMVVLJ5F7Hu/ikhuGEya3EmA2GFj/tE9oeCDy4UeO00ZP/SszJWOYyIR
         SYNg==
X-Gm-Message-State: AOAM5306ouT5MoaPe4jM26lVwsc9UBeeCNwliMWCbhrpcLctw6puL7rT
        hOWdrx0/ECIbyzvMJnL/mFh33lDohNfUkFgiAKw=
X-Google-Smtp-Source: ABdhPJyPbHARf6EZ9D1yKBLzZvHEOyWeOLIIm1QQZ94Rp9cT8C0gE1I6A18PXHmm+BZ/4KYY4P6IeLLhkHpwn9PLxw8=
X-Received: by 2002:a19:640e:0:b0:479:5347:b86e with SMTP id
 y14-20020a19640e000000b004795347b86emr1160163lfb.563.1654507506890; Mon, 06
 Jun 2022 02:25:06 -0700 (PDT)
MIME-Version: 1.0
Sender: avrilharri612@gmail.com
Received: by 2002:a05:6504:2d4:0:0:0:0 with HTTP; Mon, 6 Jun 2022 02:25:06
 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Mon, 6 Jun 2022 09:25:06 +0000
X-Google-Sender-Auth: zjDZzG-yAZAWazPR4JEcmcNf-jI
Message-ID: <CAHnu19Lw=-G8AJ0NDWzGK84FHo+Mq94L4PQ0HjSFMOk_fHcZgg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, how have you been? I'm yet to receive a reply from you in regards
to my two previous emails, please check and get back to me.
