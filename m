Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D30244BF530
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 10:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiBVJyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 04:54:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiBVJyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 04:54:43 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3F0D2072
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 01:54:18 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m14so23652421lfu.4
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Qxo4Ab12mYpicN5blAq8Bgj3Iswvz5GhprybAK1oink=;
        b=Y8JPlIfmzkGMlzlF629pfNQLYLxInRkxLbcgbIviItNAVpA6XOC+al6N/HzQmDqWjm
         nwgSYZjNroNidG4XuRKVAmh2E3xk/oJldOsDIhleKY99kaR7dge1RfosRB5frBemgWWz
         bU5QEzBWEMkplla5cSa8s2SO+F2PBo9thpD/GLQHmOzKZ3C4cM5sxeq5rSNhTkLbPNyi
         HBM/vDPhQKh8jfCgcHC2XIgdQZaFRLO6Qu81QRpl9ajK5P+KroRiOrrOzoMb3sm3/EQC
         xlyZMJmY5do1okRMCaRA4bYFH9sqbVMVw5MI046jOnHJg7bxRU0F4QO8+FOaPaLCrW5D
         yz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Qxo4Ab12mYpicN5blAq8Bgj3Iswvz5GhprybAK1oink=;
        b=h3fquWU6hffjZAefmH2K85uT5/00qedxh2f5leZTEbvVxTYCEwZdln/O5FGTt421L8
         uzZ1T5mGijmsYXtVEUX3Rw5vrsHSalOTHUlnPMCyrYuRusWI7xuNZsmyYUleJ3T/dhxA
         5Ir2Sz5JYUrRcmK6h4rOUfaVopu1Z8AoL4khSRkVIA9RualoC/+4IBpfZSvOPIshGoGp
         eOfUpob2tlN2Vu52z+DjR6Gsh9jU1OuVjkjXwbFieSIBOZgcBhtcNtlWPP0rtZOMz/QZ
         /wC1GUtS48X9/XJxhrQJJxRF6wbO0hrDfITKBIdrPSgI0qI09UC/ZYlzisJBc/3F9YMT
         ga1w==
X-Gm-Message-State: AOAM532Tu/Ka3pDV3Gei6VzPAD327DDcJ2d0Uq6XVxuRvRAtrKbBBxt9
        w1+8/pEGktXrpgRnKe+HH4/z0rYs1Suu5b77dU8=
X-Google-Smtp-Source: ABdhPJxDuPLpaYSuOqaDXSzkmBdrCc97i8PYfDO8vYyvBmfKsDVa8kVm1Dl8vBvX/NSxCBlVXz/Xw30MrtmEdd6AQcc=
X-Received: by 2002:a05:6512:2828:b0:442:bc51:d968 with SMTP id
 cf40-20020a056512282800b00442bc51d968mr16598025lfb.619.1645523656501; Tue, 22
 Feb 2022 01:54:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:aa6:c789:0:b0:19d:3904:bda6 with HTTP; Tue, 22 Feb 2022
 01:54:15 -0800 (PST)
Reply-To: egomihnyemihdavidegomih02@gmail.com
From:   Davids Nyemih <curtisdonald95@gmail.com>
Date:   Tue, 22 Feb 2022 10:54:15 +0100
Message-ID: <CAFnUQ=k_aDfV95u7toLUc_kyLsN97PSUKqSnMCtG7UXu7EFpow@mail.gmail.com>
Subject: David
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI, Good day. Kindly confirm to me if this is your correct email
Address and get back to me for your interest.
Sincerely,
David
