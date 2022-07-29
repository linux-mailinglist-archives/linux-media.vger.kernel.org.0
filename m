Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3735856D0
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 00:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239039AbiG2WTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 18:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238953AbiG2WTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 18:19:47 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23251747AE
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 15:19:47 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-31f445bd486so63571227b3.13
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=44DDICayHzvxFc3DSDI4bxCK+quWcnGQ6MUQUy4o1U0=;
        b=pvlwAKod+flmyStG/wwHZc5IEhG/4/24pstjKN1UypTDAOTxwRUka7p+tMMHbTnpR9
         ltoUOwesNoT3jgUS6a1KQ9LKLJ/cVOHs8HofM14cb4a55aePod9dj6cpxqqUZQ4d5nTH
         MaSWv+DH/+NUFll+rt9WGP4x/I6Xuv/DHdyhRm1eR0vvhGzMw8dok6+6hHoiq9gZ5wm4
         vQ11sqMzlzQZ8Tjbj9uqxrgNr5fSpP7YB8+zFIWrOwqkKBb/ymOotzs8p7QDe5vmlUod
         zGkJbSfbZlHqMFj6dV7ROzQmvIh4J+FwPotasVeU2cVU2c6rjLbus8JfiNOMY06Xx1fC
         qqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=44DDICayHzvxFc3DSDI4bxCK+quWcnGQ6MUQUy4o1U0=;
        b=N4xKqwvlBdYgXn34YA6KJvd8gR5CnSOUX9hReYyhpbJQE8euHXgGx6YrsAi8s4bNNL
         RZ2lvXRGcUCKvWFOQ16g/8GLP5n5Nlw3wF4omT09eMzCNQ/u8P4FHP9mzIdVNbFUgbxo
         D0FsN1q4W6tUi77JegrgF4CuSIqVph0ecIUgSe/zYeB/RDPk6JQUyoyOpVEp9yOukIc5
         IV1Zbc7y48RGJLjS3RIzJsEguge0bbqB/uRRhMxvmUdmQxwiyK/EmVBAV7XMT0pYV25C
         SXg8AnQGdlKtmeQQrJwUnEp9fdEgI2BdUOwDmZRCSIpt/FVyQaenZ39em3ggPD6eqnCx
         Ts5w==
X-Gm-Message-State: ACgBeo2J1z9q7cMQFG4GGQNx3asIJVXxUdn+46KrnnWJZzexCfLwKB80
        7hxMb9l6UHqWpuIyJU34tTQ1th6lAZpxAKbJi3k=
X-Google-Smtp-Source: AA6agR7whhp/e+ECvcUnC8tE84MQ1q73Ex+kDV9TDPY5FsMmwT1vLhbGHULBvD3/2VWSDI/RXpEs2wacy5QMNM5HABU=
X-Received: by 2002:a0d:d655:0:b0:31f:417c:2187 with SMTP id
 y82-20020a0dd655000000b0031f417c2187mr4967989ywd.385.1659133185773; Fri, 29
 Jul 2022 15:19:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:5a45:0:0:0:0 with HTTP; Fri, 29 Jul 2022 15:19:45
 -0700 (PDT)
Reply-To: mauricepeace864@gmail.com
From:   Peace Maurice <herveouedr84@gmail.com>
Date:   Fri, 29 Jul 2022 22:19:45 +0000
Message-ID: <CAGzYa79WazgMd3Ge1ZqJnhvBy+0BGaTzqWL0j0F31JaNvRJx=w@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1143 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5008]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [herveouedr84[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [herveouedr84[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mauricepeace864[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ich habe Ihnen vor ein paar Tagen eine fr=C3=BChere Nachricht geschrieben,
aber keine Antwort von Ihnen.
