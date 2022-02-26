Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09FE54C52D1
	for <lists+linux-media@lfdr.de>; Sat, 26 Feb 2022 02:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240580AbiBZBBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 20:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240662AbiBZBB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 20:01:28 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44402036D0
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 17:00:55 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id bc10so4070301qtb.5
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 17:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=eSYnZ6PUV5iovuTH6dz79EG6pMqriqgNhlUvVUk8vBXJRpOB2Sd9Rl/af6SoooCN7J
         YfceXIQHg+1ZcsU3/bR8ZGoWx3pzODwpSo7+N0onjdGbp/VMUv8M531MNuRTTnF27f+i
         4MDN5vGqBq+3dqI8VQQQxSvPqpJTt1FJP+Un9SrW46kkSZ2QVqTxh2ZF0SkvSYDeO/BW
         j5oumikRlg63Gf6L6pE2vJeQ3r29HYP7jF/z6hGZAqe1gFmTAcgjbav6CfOjRqBBqTA1
         H/lU+Sk/wXZSas0R8ybklWwwdD3zfhhCMmizN+RtyF082lQIeG02bRlzsTUwOaKBcaOC
         6rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=2CkU40LY8gg/m+BbqNW7tyK8JfEywT9Jhx3d/BN3spBoO9v+PN6XME3RFrJgH9MK3D
         HuDKse+6E5KAzWKe44NP/WP66dHPOqA1lH++nBsfsKUg9LxTWOa/eLoP5lqgcUUw3sZK
         Quzld04P+HA7J4X9GZlNgQzBp5I5llVBqeEVXm//vDvHHy6gD4hb+SSvJUsIxtilkYpB
         e3Hw6jN/gFB10Nqw9fG8Ht69Kn8OhCizIz5tA9b/CPLzeeEUJKkCMcT3Yu5JKCjV0rK1
         vSP4hUXI4Ajx0emIJYZs/91rYHBTzxDafdP+D0vcxjSjQRlNdODlLMan+nJ0/tEcbZEF
         DrQQ==
X-Gm-Message-State: AOAM5337msF3QZxAX9K/MKEb9c6GwiauCXhT91VJhL3Is3xBYXNcIXsM
        oz0SvKa0MWDhZFXBJXHKFIh9jtYVV9b/3M1IYmU=
X-Google-Smtp-Source: ABdhPJztkQvP9pSHNNpPHzEk+7F19AsTJQLX9BJYf9HWEk4MuSrnahAD8PthLtGFipFRpzFEv0qAXC7aAImPDuUCsPM=
X-Received: by 2002:ac8:4d92:0:b0:2d7:fd80:8903 with SMTP id
 a18-20020ac84d92000000b002d7fd808903mr9190758qtw.294.1645837255158; Fri, 25
 Feb 2022 17:00:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:d62:0:0:0:0 with HTTP; Fri, 25 Feb 2022 17:00:54
 -0800 (PST)
From:   Miss Reacheal <zemegnisse@gmail.com>
Date:   Sat, 26 Feb 2022 01:00:54 +0000
Message-ID: <CANkd_0zjf=O2SXyu6p8a16ShZ7G1_k1PtBTQb1qcW-aT8+7ZnQ@mail.gmail.com>
Subject: Re: Hallo ihr Lieben, wie geht es euch?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hallo,

Sie haben meine vorherige Nachricht erhalten? Ich habe Sie schon
einmal kontaktiert, aber die Nachricht ist fehlgeschlagen, also habe
ich beschlossen, noch einmal zu schreiben. Bitte best=C3=A4tigen Sie, ob
Sie dies erhalten, damit ich fortfahren kann.

warte auf deine Antwort.

Gr=C3=BC=C3=9Fe,
Fr=C3=A4ulein Reachal
