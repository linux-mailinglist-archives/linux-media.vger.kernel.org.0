Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABC560940E
	for <lists+linux-media@lfdr.de>; Sun, 23 Oct 2022 16:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiJWOqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Oct 2022 10:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJWOqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Oct 2022 10:46:07 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72D368CE5
        for <linux-media@vger.kernel.org>; Sun, 23 Oct 2022 07:46:05 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 101-20020a9d0bee000000b00661b54d945fso4586329oth.13
        for <linux-media@vger.kernel.org>; Sun, 23 Oct 2022 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ja29bSRlFFpxgMj1MOLeEWsYX8btuaCSJSBLKk2DVsI=;
        b=CZUHndngI9PJTYI03hbW06fn3LcopWAEGtg36xzkYRd/4hq5fXTkUiMFV1k/ZMfcvi
         wvzTo2QbBIQmyTMziNMzLbpXeq7Vfc9JYbfy2km8axZ7/nvjTE8eJLGX3OH2A+NBDowR
         M0YKx0em2moqX1JlNW5tjwl/9nrd905Ov8w0Z1AS6fT0DCK+mGiCsk1OcSSZ4E6tZJut
         jiU792njs4E3+IbBy6QkR7xj1KzT11P/ypVMS+hCjbL/uUlBxducMLcjXiWzwqapDJrv
         4h9V4pXS7eHprk1QETyOS90r39YwDAmIWeAzGQIDF+SyQ7XGqrutDa/BpO9ZrJh2od0f
         Au7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja29bSRlFFpxgMj1MOLeEWsYX8btuaCSJSBLKk2DVsI=;
        b=nz4U0Jex5HCtCBPsCuyYGv2AMLIS2z7wimQCIG8mjPJSNEB/OgkKW1RfgRBAKcSxk/
         qrI9tW/saMLcRuxL2di8RMO9bi012luxoVGLD6MrcJxvlpzxBQoJLp6H8BZpTPVdqJPn
         SXLTCbUsSl/uKLy8fVNih2CYr7lWObHTAFPHRZg1oRJq/oJsI+LkTmfr7WvSV2n8h9BZ
         59hDXab673nXypOIt3iqJwc39AVWOq0yFBtuFYq5EO+UJ7s1+FFdTBlDpLOceguMjWx7
         FOaW63XxUJWP446fuKZwXBnIodp2kc3ax1WmiGu+AEJeyTUy4GsNtlMofiNLz10JSbi1
         upqw==
X-Gm-Message-State: ACrzQf2wbOaMwgJtnDjrDpbQB1HmRJj+nLxPz23hqWVmWvhYMKD9DWbL
        UY2Zs8wKJ0xHs316K8b+eQBDfppFuB59Qlt/EJw=
X-Google-Smtp-Source: AMsMyM7g3Vw7v9QGihfByvDQrABZTDeisrSyudHxg6eZyx13rk4s04xNsbLnaIv3H1+LmRsiXPHW8jw3Xk4x7x+T9tc=
X-Received: by 2002:a9d:73c1:0:b0:661:9a8d:ea4 with SMTP id
 m1-20020a9d73c1000000b006619a8d0ea4mr14628859otk.19.1666536365103; Sun, 23
 Oct 2022 07:46:05 -0700 (PDT)
MIME-Version: 1.0
Sender: luisnedia37@gmail.com
Received: by 2002:a05:6358:1c5:b0:c8:a1bf:ef0f with HTTP; Sun, 23 Oct 2022
 07:46:04 -0700 (PDT)
From:   Rose Darren <rosedarren0001@gmail.com>
Date:   Sun, 23 Oct 2022 14:46:04 +0000
X-Google-Sender-Auth: X_zDmI6zAVPxvRM-V1P9rOLsaz8
Message-ID: <CACQHHOqdDkP2cRQNviqnWeO=zFfB3PHt5j2n+cup-np_fJpf_Q@mail.gmail.com>
Subject: azq
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

=C2=BFHABLA USTED INGL=C3=89S?
=C2=BFRecibiste mi mensaje anoche para m=C3=A1s discusi=C3=B3n?
