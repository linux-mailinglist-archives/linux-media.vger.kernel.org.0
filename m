Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B47784E52
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 03:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbjHWBld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 21:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjHWBlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 21:41:31 -0400
X-Greylist: delayed 918 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:41:29 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337C1E46
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 18:41:28 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-52-64e54b4a1590
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 49.6B.10987.B4B45E46; Wed, 23 Aug 2023 04:56:59 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=a/QwjrDNR9ehH66+C9gS74w4Ft7NFsB7H1kNrrKlCEXOSDhuhSMcOeFhsW8DZJ41T
          Uq/GC69ttSnd7s6C5qhTcoJsbHSxC7OJdX/kx3haELwjAwzazjPY3am1WUXq2WDPb
          cWfsf0uI1PDUnQfw84t0kPP6Hn/H2KFrskHg1ECSE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=YbgY87UbjLMPTq94ZQZw9HE1a92yDfQhQKvIZJHp5+oFtQtIiVEbHjZgDc4cNHFbM
          mxftryZ8vv56E5RDwiQXgN9ahYqMW2h555eOuRy0dFLYIABpk5zkgN/KtaauwACTy
          3gUI9C/va2X0fIhOeZKhcrLPeGoYr5sYBWSyhOYeU=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:04 +0500
Message-ID: <49.6B.10987.B4B45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-media@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:17 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGW9fb+2mKwc/nnBY9G7ayOjB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhIfN94h7WLkYtDSGAP
        k8SSj73sIA6LwGpmif3z30E5D5kldrW+YYMoa2aUeLlyHjNIP6+AtcStQ28YQWxmAT2JG1On
        sEHEBSVOznzCAhHXlli28DVQPQeQrSbxtasEJCwsICbxadoydhBbREBe4knvDbBWNgF9iRVf
        m8FGsgioShzc9J4VxBYSkJLYeGU92wRG/llIts1Csm0Wkm2zELYtYGRZxShRXJmbCAy2ZBO9
        5Pzc4sSSYr281BK9guxNjMBAPF2jKbeDcemlxEOMAhyMSjy8P9c9SRFiTSwD6jrEKMHBrCTC
        K/39YYoQb0piZVVqUX58UWlOavEhRmkOFiVxXluhZ8lCAumJJanZqakFqUUwWSYOTqkGRrOg
        /vqn+beeZzCfSl8WZ3H0mPeCzYZvV8tPkTOp3vGkaW5udUHulaCP2w+begsIzb+xco0FQ5PC
        4QnV3zNf7Dr+ofBz4B77y+l+UguTnsnNnM+ltmkHx0aGXt1Vp3fwLTznu/rTlObJP3bnLPn8
        yeWqi9J94VM21QUHDut7TFuwa97sN5fsn/xXYinOSDTUYi4qTgQA6hlNIUACAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

