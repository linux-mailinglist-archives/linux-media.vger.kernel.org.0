Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51B96CA195
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 12:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbjC0Km5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 06:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjC0Km4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 06:42:56 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF17F3A94
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 03:42:54 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id f23so7061050vsv.13
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679913774;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5q6u+/en5W/OizPNApBtoGQskHOefpjtyQjLNoH8Vpg=;
        b=a2ZMq6hPU6Cmp+qWcj15wjuuAxhwwqXFCAyTcdjA26vnbqKUC1lo+Qj3g60CftGOKS
         nFPgbBOAYqL+IS+KbbCvC9uZywCIeTcolZvyOhpc+OYPTQ2/XxJfchpVQdxcp1Tmx6nf
         iSIHGsbuZXEVfowcJVRBaNVgkIYj8V9nyunJkosa3aLI6FiQgH430oo5HA7SrCgIhXg5
         62uR083l/1T9R26hIH0lz3xAlTcdmunS0kH8w8fggorNgDDLOVjOAaBldwcU2oCalbI1
         pCHQD/ECyBRu0eHpfxRiwlJxebKaxWrVgP6CvvxXrZr/QB/h+fGa1AGHs7ZjhNWa+RVA
         sJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679913774;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q6u+/en5W/OizPNApBtoGQskHOefpjtyQjLNoH8Vpg=;
        b=VZxOH7nW96tUUDkermKnVpfmumbHvBIQrIuhQHr/UZ9vZkZnUXrJY/n7rEGVAwI1f4
         aQv0Hl8Y0DD2xdNwuL32rWl85P0Cpu9INxfjvsssxx6wIRTORdvAlFX+oVbpXBKVcBOF
         fY2mC5kJGg0f/NOF2UcGoDcO9T7GPLoXZhzyf1UG7cX2w56hwLVpD9apOIRUARHhv73n
         VY2AOHtzsvPlkROBIjqFymh1q4CSWFM++G1QAufc5xfDj9p2eb/yc8fRre4IZQG00LBj
         9aJZJrmj1zBiWr9oW6khPk5rJpKuD3Lig8o43nuPhIsCtx3owdWirRL9K7clmUUUr8qE
         7YyA==
X-Gm-Message-State: AAQBX9f58uuZhPZwonh6k6deJ3yRF6MWhDEVvSoqIwvlyBuHFf0KGdtS
        NlsP/Qc9qdGZHoJe5dV9GXBOF7XTgfGBtwdp4J0=
X-Google-Smtp-Source: AKy350aZfIIYBBgddNSTDxXjKCvTVcOjvgVqTNyM9bCHlLariEbxG8BMxHDWRn7v7YcXuVEu3KVYoJZ10St3QhU8yOE=
X-Received: by 2002:a67:e019:0:b0:414:4ef3:839 with SMTP id
 c25-20020a67e019000000b004144ef30839mr6248616vsl.7.1679913773849; Mon, 27 Mar
 2023 03:42:53 -0700 (PDT)
MIME-Version: 1.0
Sender: guillezakalik@gmail.com
Received: by 2002:a59:c1c9:0:b0:3a6:dbf3:3877 with HTTP; Mon, 27 Mar 2023
 03:42:52 -0700 (PDT)
From:   Ibrahim idewu <ibrahimidewu4@gmail.com>
Date:   Mon, 27 Mar 2023 11:42:52 +0100
X-Google-Sender-Auth: MxYcv_IAAFhd6kwwXvcysRWckSY
Message-ID: <CAER-mvS4pCcp+mOXpcOSKe1LFRJNbJZcw8rfPiUo7v_mGt-+PA@mail.gmail.com>
Subject: URGENT NO RISKY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.5 required=5.0 tests=ADVANCE_FEE_4_NEW_FRM_MNY,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_USD,MONEY_FORM,MONEY_FRAUD_3,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_MONEY_PERCENT,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have a business proposal in the region of $19.3million USD for you to han=
dle
with me. I have the opportunity to transfer this abandoned fund to your ban=
k
account in your country which belongs to our dead client.

I am inviting you in this transaction where this money can be shared
between us at the ratio of 50/50% and help the needy around us don=E2=80=99=
t be
afraid of anything I am with you and will instruct you what you will do
to maintain this fund.

Please give me this as we have 5 days to work through this. This is very ur=
gent.

1. Full Name:
2. Your direct mobile number:
3. Your contact address:
4. Your job:
5. Your nationality:
6. Your gender / age:

Please confirm your message and interest to provide further
information. Please do get back to me on time.

Best regards
Mr.Ibrahim idewu
