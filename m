Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D16276D916
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 22:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjHBU7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 16:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjHBU7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 16:59:09 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10D22708
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 13:59:06 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a74d759bfcso154000b6e.1
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691009946; x=1691614746;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=Mj8scjNczgT4fstO6VpWd7kiUfBU2zh7D1pDUhdjGZyrhJVr3szR6C4/55yS19X1AO
         4nyXxycrYwfaRA1lLbLHn9szVJerHG6dxhWTfLdsHZTrXH8kPIVyjiK/Gd/slnfMk2DP
         cdkq+Q0RvTCewPvqBFGdyOu54Z2LscLYpEPTMCsN0vEctJhp0kz3WegV7BAO7eUvICfD
         V83PnCXd09EjZYI/n36sX3Nc2aEKBpMRUCryp9IrMGBqmmTduRrGf97M3LSY35PYX2xl
         rfJXCCOzBgFsYb7pabq8dzuXFp5dKZ5gCgD0EZ1XCtL26JTWC9lt7YedX/yKPqcdl/uO
         7bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691009946; x=1691614746;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46Qd00mqgwhkkW6amCqEXLEzCc/q28cqM0GW7xvshDA=;
        b=e34WmDRJANJAjoujAwTpKwa4X3GXH+RcKRQcAWY7k19U8BxufprT1dW4i0KVUQE7YR
         ncFpSgqWsWCgSf2OdB6Y8u++Wg6RUJimaF4o7RVmHXgWdIQKmGRfrCYTu5UM1k+7sC3L
         GTQdN7S6DIAg02OzLc3lx5QieJwAaTNvOWkf+Jm1KizXDHfrb1CxOHAJrLBivhYgxkda
         BIH4W4DcLJtaicdmgUJS9VNTuTpyppNbg9TbIJTG6PRTAZWrp9ckFasQxNDWzoB/7jh4
         xbMG1ISiiNjYW6t8FtbQhCT2qNL2NHLnuz5zPBwF21IKWnYP2vpg9p3Iw+fhT7yC36ZD
         Cjdw==
X-Gm-Message-State: ABy/qLYJPOualYgQVwveG+sglXPiRkVZTjIzVfZ7VT/X/OHxx/IcK+Qp
        n+B7DUhAv4nZeBiF8R2iCmw4KxqvdF0hkzJzoJI=
X-Google-Smtp-Source: APBJJlHBu2gL2WHIt4K24jnZFlnEg6fRdLj73d8r1bHDO208UqFXqKonjm2GImYbSnGa+itQ746tkRjKpbQTrvBrFto=
X-Received: by 2002:a05:6808:13c1:b0:3a3:7d62:ed8d with SMTP id
 d1-20020a05680813c100b003a37d62ed8dmr20236036oiw.15.1691009946058; Wed, 02
 Aug 2023 13:59:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:238b:b0:d1:4781:4069 with HTTP; Wed, 2 Aug 2023
 13:59:05 -0700 (PDT)
Reply-To: saguadshj564@gmail.com
From:   MS NADAGE LASSOU <muhammadgarba972@gmail.com>
Date:   Wed, 2 Aug 2023 21:59:05 +0100
Message-ID: <CAEith-z+DKqzFNFciL198_UePkWWp+7w=PTfgZrxYL8-gPuXLA@mail.gmail.com>
Subject: REPLY FOR DETAILS
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:22a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [muhammadgarba972[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [saguadshj564[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [muhammadgarba972[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings.

I have something important to tell you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou
