Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052E85930F9
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 16:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242992AbiHOOqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 10:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbiHOOqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 10:46:05 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5185624BD2
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 07:45:55 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id n4so9294537wrp.10
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=BP7N97YjVM4PMUACuppi4PcUKAj1aoOhRa9DbafFqaA=;
        b=Od8tS2k2L5+07MMiPD3I6aujrHGBD8FMTwqhWKf1OUw9RqOlgZd7OJvsdmF8l7etPB
         G4iXS8Sybl4fQDQ7iHyO+t7C2UyWhrgajxkJeuIY4FmDC8AXtklT/Fu1F1W0jrhtAZ7d
         myeOhc9LjhHvGfXtNz3HFWUmVpvakA4v3vaJZgTfwuOh+L2CmlVgsf21xhxRaWcgnGFC
         fxOOzzeuKQc5wmnG1iGKjQsQoYt/VepCjIbtHEl9n/+08KsXwaYdh4vdm+JKaQ767A80
         P2C2peST+xxFqarth45nDxpp9QqSPWo4AwdnbjHkiINurarLfzzIqW7kGrVw6kncJXsS
         ziSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=BP7N97YjVM4PMUACuppi4PcUKAj1aoOhRa9DbafFqaA=;
        b=2k8T4FoLlbHp/ZnPUebMIBYI9JkE9D1/5wBPMRVB3/tipjyXjyXkW4ANP9BVRE+kTq
         arpB/vMTWnwx+fAO2/uREiO6ECqTykIVktVYVC+M/7Rqd3j7a3O1BptkRN48MccoDk7n
         FoOYft/ZOyZPOwKDO8XbWQDM9cD4iMrjzlj1YrjgDI92I8fFcy6q2ufIZIMzxGL4hgdM
         hBlzoNl8+j/3mtP1GTXuNDKKRPScf8XOjhxPOCSpz3SzUbpRGeIwjqYLKxOIG1V/H1dJ
         L5X+ztnhzSoujTEAQiSHJ86riNCtfBLdfpYcpiftSrazNbuTntvd3HUREGh2j1pfzptv
         2dmQ==
X-Gm-Message-State: ACgBeo2E09WdcfUTjlRVqZsuHdM3oDla5rOsM8oAIkkM16VHOeKd9zdh
        0NIKSBjXXf31Y9s0cd7Rh8fY5RYg9u8dgiCpjW8=
X-Google-Smtp-Source: AA6agR4y414MfUXp7y6SuTr1UdgniBKka2/mH44Xdzh95SFZT0e5mT8VL5CCRxgRYVEshQukiFwXfuGop5ZQoxbEIqM=
X-Received: by 2002:a05:6000:2a4:b0:220:687a:cda9 with SMTP id
 l4-20020a05600002a400b00220687acda9mr8961633wry.187.1660574753410; Mon, 15
 Aug 2022 07:45:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:e4c9:0:0:0:0:0 with HTTP; Mon, 15 Aug 2022 07:45:52
 -0700 (PDT)
Reply-To: rkeenj7@gmail.com
From:   "Keen J. Richardson" <pamelamcpeak181@gmail.com>
Date:   Mon, 15 Aug 2022 14:45:52 +0000
Message-ID: <CADnBHHkCSJhtndZ5sqYsO_Koj-QR1VSzjZJazR5oRFZv1EUMcg@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:42c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4974]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [rkeenj7[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [pamelamcpeak181[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [pamelamcpeak181[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
A mail was sent to you sometime last week with the expectation of
having a return mail from you but to my surprise you never bothered to replied.
Kindly reply for further explanations.

Respectfully yours,
Keen J. Richardson.
