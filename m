Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE81F6316A4
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 22:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiKTV5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 16:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKTV5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 16:57:48 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39635101F8
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 13:57:45 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id n20so24810634ejh.0
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 13:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e1AoTlJAK3QOFYfEmMhg1BA7nUrOPA852HOGrTdWcGU=;
        b=b+jiQKg+Z0/DyLUCnkFCKKKrp8bhbvjO/p41Qg3tom/24Ob1FPaWnlgvd72Kibt5Ed
         atQVOHg8RUJG/cs7CFHgWL0aPmNiNoevnB7casi1ogzM0z4bZhMJWrEffIL9vWex5DqW
         1KQqtKNLtulRBMRISU5/wzIab3R5M0gPoS9xMxS01U3D1qT/srb0lqZYRi24LnpBt32B
         pamgcwsxjQasF9OWgHIkjXfgdeMF4KBPAvrrUtnTjYdLWrXuvwFZ5+YH9z8uoKjaFn2P
         q397yTpoCrOifbCLcgpT6/djUqrnUfbx5Pnc140oIQcmvwRu4Q85I3KGXHbhzf3onKfz
         K9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1AoTlJAK3QOFYfEmMhg1BA7nUrOPA852HOGrTdWcGU=;
        b=u7yTYJaYnHTFnwHgS0AUO4WjWZkWwP4lGCFcK9N9Q0sGiQ/aYKwAqlVEUKJk0sLZUw
         EmazSgbL5pAjGM2fjb9+VrMe4XQiX27IpBBiUeNAROo9Jfr5pmk2WYp+XzZRRGvWaX2l
         0feusLOQVs5ECdfvzMRVWe44iWW2wYy8NOIfSiFausy5qhdjMxg2SnX+CznyhWZuGie6
         UJ3yESVwjRRLETuHpILhZS6T2NXXppXa34WnU//hiZMT0N9XlCxeiVx8HQBWI1dzcrGI
         xYrIur8YIT9SF1qAkRPwYY/EP2Xi2+3Vgv8NIqSvcch1lmWsd5269yLAfwVHOY4/dRsg
         mhag==
X-Gm-Message-State: ANoB5pnDmkqGpe+r7Pek62NoOOA5cuS9rMBSxmFdEaLl5gGelniPuwHg
        ZCbTqd13bPZxMtkQeghqk4dFudkd5DUUA/6BFgU=
X-Google-Smtp-Source: AA0mqf7BshE8PuNQG7Pw2bqlAKp+NnYa4MtkHEh5n/rOql/mPW0+nWPe5bL9Dl+sme1z7BsFz9bvenUCoDkiIrhr92U=
X-Received: by 2002:a17:906:4a8d:b0:78d:a4ca:32df with SMTP id
 x13-20020a1709064a8d00b0078da4ca32dfmr12746328eju.686.1668981463917; Sun, 20
 Nov 2022 13:57:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:d046:b0:5d:44ac:25cc with HTTP; Sun, 20 Nov 2022
 13:57:43 -0800 (PST)
Reply-To: davidtayo2007@gmail.com
In-Reply-To: <CAN7LwtH+DvPsWDn-kdcTohHZtaUO6BaM9KZVC=0mA+R-E-jdWQ@mail.gmail.com>
References: <CAN7LwtFHhewN0Q2hoz0i-+UhbUCTThU2+Aqmt=y2J+hpK_BbhA@mail.gmail.com>
 <CAN7LwtGCc3qL5AsMAA_V_BAZk-JNA1GJ8a-vnQwW0Xc+ygi6KA@mail.gmail.com>
 <CAN7LwtHMRHH3nB95WXmyff-whofbW3SMMigx8o2tpuN5ksLjaA@mail.gmail.com>
 <CAN7LwtE=Qx9TeHXUN+PA9RuKK844EmCmSaJFP2GZZ5H5tN-xHA@mail.gmail.com>
 <CAN7LwtGacf_mbJY3gMxS=aQvjet5cHBO72jh2Y5fN28s5Ny0iA@mail.gmail.com>
 <CAN7LwtHdtt3wGfjZ2CkGWu+k+Yvn6cLWJ6bfmXBpZDp+d_d8ZA@mail.gmail.com>
 <CAN7LwtGyAaRMw7Mk_7GfRGaUqpYpw6DFW9aakoSGk3+f271Lfw@mail.gmail.com>
 <CAN7LwtEboGwEi=wTamOLs+SfNHVxuoyxZSi2OtiQQqEgSusVxw@mail.gmail.com>
 <CAN7LwtFSafFNek0adTtXzqyN50XwJJ_niQSv0oeEwxrbRBkT9Q@mail.gmail.com>
 <CAN7LwtHqZ4FuK-8FuO4=WH674YpPQV7VVwdsMYadBeW4xgrVGw@mail.gmail.com>
 <CAN7LwtGhqpoMGb3J18LtNzDGvWT6Thy01dgezfL6jKZACOjeTA@mail.gmail.com>
 <CAN7LwtG-TjC1ueDSN2T47Y8Pu3Rx3d4a=zGvPkqPge7Tx1WiYg@mail.gmail.com>
 <CAN7LwtH=gpAKRqu8QJ9dLOY-w+7180dgzfEjnu4hXtt7Pgym8w@mail.gmail.com>
 <CAN7LwtHZ9XPX8BJpvTP1jYt9BD5XPtbJghrEG2-nXSCuK07__Q@mail.gmail.com>
 <CAN7LwtGxt7Wh5H2iw_f7TqiY54Ln5ofJe_vC_-K_xnB9OdJuiw@mail.gmail.com> <CAN7LwtH+DvPsWDn-kdcTohHZtaUO6BaM9KZVC=0mA+R-E-jdWQ@mail.gmail.com>
From:   david tayo <larchermartin001@gmail.com>
Date:   Sun, 20 Nov 2022 22:57:43 +0100
Message-ID: <CAN7LwtE6MPAsVucpQHV4cOgQHLEngYM5YHS2WgsP-zheuuj4VA@mail.gmail.com>
Subject: =?UTF-8?B?R3LDvMOfZSw=?=
To:     davidtayo2007@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hallo, haben Sie die Ihnen zugesandten Detailinformationen erhalten?
Bitte antworten Sie mir, es ist sehr wichtig

Mit besten Empfehlungen
David Tayo
