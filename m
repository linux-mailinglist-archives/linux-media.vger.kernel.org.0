Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C61609755
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 01:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJWXin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Oct 2022 19:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiJWXim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Oct 2022 19:38:42 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091335A3F2
        for <linux-media@vger.kernel.org>; Sun, 23 Oct 2022 16:38:42 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id mx8so5603648qvb.8
        for <linux-media@vger.kernel.org>; Sun, 23 Oct 2022 16:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ja29bSRlFFpxgMj1MOLeEWsYX8btuaCSJSBLKk2DVsI=;
        b=pmSfDbpkmxgPoL2xoGZvUoyNJsZ5PgHRHw0rC4FZzcB9/B1j4aYeiUI8Q/9UkIBOnY
         Lgk2gd4PirvMDCehY5VJVb+Kj5fXI7G4idoM47IA0umfMAMC2YT+gUVfc4dFSBVXQ8Vb
         Fod+QHebiqv0IKrMxpj5kPMCFvbqI3C4r5nKG/hqEc8/0cDo9yMwOBMwJzJHaTGe2hRz
         jKJ002OAjUu0ri2lZHzSh08DTsAqSidPq3Y4BeT7wfrAcsG+NJhRiFF7td9lL5KDak7X
         UL8IdvLaHSoveUG+fjfHetuwvP/lIvGAVWz7UlTiW55PcHf27s1i3yKiosL86wVmNj70
         wLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja29bSRlFFpxgMj1MOLeEWsYX8btuaCSJSBLKk2DVsI=;
        b=KnAqIwlcsOdvbm24nl5/VTJ0Qk0Ho/TKnP7nxr5T6ZquY3xnXOWXDZktc92EdWf8wF
         52Yiksx20LMQHMUbZZv2rXyYNfYc3yWQm4dHgl4VVJ7zA+MC5nXeESvhbhpokM0Y5nFr
         HTuaRsYCs9a48xUXHT3wm+V7SBw6lWyPvFqJxvOL/6bY0Z3BbvPiytCX3mQrAgf40d78
         Zs8zBhfX8JExw//XUk4g8YZQiUXSOmVWBu8dBKjfBngYYQG6Mc/dsGybkujHYCOXl6uc
         LDWqzY4bqZ5PPgnq1xmKcOLDsTw8KzVFLKQEl4bDjNeytKOc3/aMr0NFI2ctEfmN4CPr
         QnDQ==
X-Gm-Message-State: ACrzQf2Q9yjol+QVwoF4Kl0Wg7TcACtRQ3yawB2bFoQHGrQZfMGU9CmV
        TrF56qfFSc45U4xvSGHC5A/Sl8jSre4l6enfULI=
X-Google-Smtp-Source: AMsMyM4d3hSr95Pge8DMviiUCnL8LOQ6RS04ScoxsKVvAQFH+d3FgtoR2kfMbPmNmWk8yBxhsZi1Q9QKyOF08PhKylw=
X-Received: by 2002:a05:6214:2a8f:b0:4bb:6c0d:f2e4 with SMTP id
 jr15-20020a0562142a8f00b004bb6c0df2e4mr2842251qvb.18.1666568321224; Sun, 23
 Oct 2022 16:38:41 -0700 (PDT)
MIME-Version: 1.0
Sender: karenleo256@gmail.com
Received: by 2002:a05:6214:398b:b0:4b1:7247:9ffd with HTTP; Sun, 23 Oct 2022
 16:38:40 -0700 (PDT)
From:   Rose Darren <rosedarren0001@gmail.com>
Date:   Sun, 23 Oct 2022 23:38:40 +0000
X-Google-Sender-Auth: wU6gnsYT7YDfiTMV7tUvGwp7iBM
Message-ID: <CAJd+b8E1t2aHU8knkyCkDx0FaWimn1+Di-qpnAaZvwmrLYcKfA@mail.gmail.com>
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
