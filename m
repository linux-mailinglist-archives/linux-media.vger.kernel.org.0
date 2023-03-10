Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87C2D6B52EF
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 22:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjCJVkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 16:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjCJVj7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 16:39:59 -0500
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com [IPv6:2607:f8b0:4864:20::1142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2968512DDFD
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 13:39:58 -0800 (PST)
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-536bbef1c5eso122930267b3.9
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 13:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678484397;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EpO/hO75eHDJBQhNEtX/4ISkJpSrKiqdK9WnbD7lgfU=;
        b=WzYyO+T14B60nny/3y7g7x3gEpV7XylTHrpm1zD8kfZn+A9375cYrxkbM7tJ7RMBMB
         jbrToW571zOnp3N4S9Mc/hCRgZ3szbKeeISPOs5OFFhm+LAjWSYkfddSksmlqTwzR/in
         AhPVp/VQpw8EKqp8iVPKvSC9vuCFin3qKSafPk4H8YgVAvLK4Qt9C01squePLGlxs7KB
         kJMQ4nZFtPZqqcFHeC0Sr71aqtGbSTys1cs8Rsc7kEAAX1WvvSKWVKsTnqDRHlSAYsB5
         GIQcmEIc7Zhx1Zcfo1oPtpHwCYmBT6Me4bE3myb6xRX/QLWWBqf7BZzmhPsHkG7IIt6T
         fjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484397;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpO/hO75eHDJBQhNEtX/4ISkJpSrKiqdK9WnbD7lgfU=;
        b=0zSLUZ39E3DgfMWwvObCrXysqafcrHMW7nZW8WoAhgf8UwCbamx3fvXbz+kxoHJaDI
         mUc6+jNXJhOToZOnPbiJAg0lbowrNzg0DY+tS3Eegjn1nF7rnWSXmclp960kTrrqYoYR
         YqEcg5KZPMybAVP/SmF0FcezM/rNGu8gHrWu4BtxjWYMke3ZheiBr4wLdnESkteSLaCo
         laviLLy0YhCElSmegnsysWoOKHzi7w28JsAR5aC7RCMp1oqDowgk8BnaxJLpceAK5Ctk
         V9sKGBMnMMj0+jw1P5hyxmY8WzmMm7S0jprSMgFalMAXz6MLBltrnBkKUws4cF6fUdWl
         XQBQ==
X-Gm-Message-State: AO0yUKUy2ZkhJe6wTQ3Mj5aObgdpdtZ7tJfWfereAe41iebnHsxnWZGn
        cW1XV5kE/FMTtA5xcBFIDf7EUsSBagLPvwC1shs=
X-Google-Smtp-Source: AK7set/Yi8dExScoF+gxj8X8e1YfmIpI3p/2TjLZZMdCaLHDlf0r5qPQskfInl3Yyi9Uy8Bfyz1+RsK4xmxzu0ut7sE=
X-Received: by 2002:a81:ad0d:0:b0:52e:b635:5496 with SMTP id
 l13-20020a81ad0d000000b0052eb6355496mr17060709ywh.2.1678484397394; Fri, 10
 Mar 2023 13:39:57 -0800 (PST)
MIME-Version: 1.0
From:   Leslie lel <leslieb2bmarketing@gmail.com>
Date:   Sat, 11 Mar 2023 03:09:46 +0530
Message-ID: <CAH+i-AycY6rsq7Wh-Yym7UGH3ZvU=GdUN9i0zihZGM6GEfe4Cg@mail.gmail.com>
Subject: RE: ISC West - Discover ISC Attendees Email List-2023
To:     Leslie lel <leslieb2bmarketing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FILL_THIS_FORM_LONG,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Would you be interested in acquiring  ISC West - Discover ISC
Attendees Email List-2023?

List Includes: Company Name, First Name, Last Name, Full Name, Contact
Job Title, Verified Email Address, Website URL, Mailing address, Phone
number, Industry and many more=E2=80=A6

Number of Contacts: 27,639 Verified Contacts.
Cost : $ 1,738

If you=E2=80=99re interested please let me know I will assist you with furt=
her details.

Kind Regards,
Leslie lel
Marketing Coordinators
