Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23AD86EE49A
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 17:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbjDYPRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 11:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbjDYPRG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 11:17:06 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A9C4EC5
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 08:17:05 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-440445a48c7so2233612e0c.1
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682435824; x=1685027824;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJVJ5dnNAnzZeM2Nb3aK3AA1Pstz/NNRaH6Qyz+4Yms=;
        b=QLdUBadz9BEGrDz9D071jmkpuvlXCbdGartCrSiqkegJFwkb0Q3a+EjCJ079r4b2VS
         Sk83vjdXDEt0svGU4mWTN2i54Tx5f20f8WYnwnR6hkQNO+WvuMFKmizA0FZrW4hTjm2d
         VlYxa0Cc7/38/Rdyn7BfBYNYnp0RyLDUjuTmXGXjJ53yIZ1BLDl4SvmskDh41ZVbFrQM
         MVvfUT5nWlfudgWhWS4R6MR4D+PbZ++B5rCeQCToIrQoNBKZ9S+PBzX51yxh1+I3ngc8
         DuiKBEKn84CdElICWnWx59tqmhSroYBdfb+dSLBXQMsoRta+n1DKYy6+NV0j9JAXKfw+
         4l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682435824; x=1685027824;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJVJ5dnNAnzZeM2Nb3aK3AA1Pstz/NNRaH6Qyz+4Yms=;
        b=YIQPTN/S6L9OqlMIjxOtmtyS2egj8CuvTjNMnU5q31xxTqQLVPqFkx0CLHQ0sgr5Fh
         1ZPOi01i8Cg4vvMQNCEfErKHwMVHa0/OijEaSmJZ7FkfdDUoZY0ubornmihf78G5xGop
         t7NJ0zlswYN02in9Qcx9hHhju7ehIaK7C/bZw0fTAa/fp1h4FrAxN6N0u+M3+G4cRQK/
         D29YVVjngDE6CqLmzXtxJOzTkbb/WF06ckWaf/k3iYG3GmaX300LOD4XDTNlKVbWnNG6
         1OykrVPX7mhNkef0oKzKW2i5V3b+ugoceuf39eIyBXs6H+P2gzm+mwAT2VjjOqzklWGK
         5asg==
X-Gm-Message-State: AAQBX9eE8HEtule/1hMsxbmQORL7bOqi1LF1uJ+/tXgjme9j/ADejYYo
        mcQz0E2wsdYEnhqrOMd0jME70mU7F1gitmap6UQ=
X-Google-Smtp-Source: AKy350Y9J55xaklWjuZG3nyUBvnFBJ2DNVA+YOH1dQFWMGofu1rVOLy+qYxOejL/jdI75wuygK6K8dGVipY6GzjD8xk=
X-Received: by 2002:a1f:43d1:0:b0:443:ddb3:1512 with SMTP id
 q200-20020a1f43d1000000b00443ddb31512mr4809942vka.3.1682435824281; Tue, 25
 Apr 2023 08:17:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:d9d0:0:b0:3c4:de51:d8bf with HTTP; Tue, 25 Apr 2023
 08:17:03 -0700 (PDT)
Reply-To: chiogb00@gmail.com
From:   "Mrs.Elaine Lam Su Yen" <davidkjn1@gmail.com>
Date:   Tue, 25 Apr 2023 17:17:03 +0200
Message-ID: <CAAfY6sya0nE8JqXE7ia+rVxEJ2ouGpZtgrZR+OzpteniG1_nbg@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a29 listed in]
        [list.dnswl.org]
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.2346]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkjn1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [chiogb00[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkjn1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I Still went to hear from you thanks.Mrs.Elaine Lam Su Yen.
