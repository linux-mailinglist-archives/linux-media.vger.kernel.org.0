Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1035769EB
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 00:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbiGOWcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 18:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiGOWcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 18:32:19 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7346F6A9C9
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 15:32:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y8so8017821eda.3
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 15:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=d5bRn6WlQHk3k3s8FFEhqrYK4Jfw4+wJUMV1l5fLufOxQbfyPfWIhCxJCXnsg9VhOS
         GJ8xwvE2tH/kJg7LcisfhrWndOosum0g20BksCT2NmLeBoT9Mtf0o3xwqmrhEb8pekUM
         24lDsSehfmMf5CeRCLYrIBZBYJG9mTA+r16rVQ9n8Da1OkNqDI/5dxfU/yQRkC5qBIcH
         okLo5kpiavtiaZE0rWRGGLg4FcRDxO7RGIickFKABXxieDFIdPPUxD5+53J4ZiehjY1I
         BWA5hsTW/lBA5YYmBEGWkI6scBbFmolZOz/SaHbPaeTW9vNKdwXEzD5hIHJfDv81yrPf
         6ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=nz/Bq1opPqlC8hdi0lheHRkkfbiUjA+KZ39nVB2ffZ5san0jrISxt/ukpKm3AzX8ip
         9R2xh19F2FCzphKS+jiFJdiA3QtYVFE2tgIUnil9dO2DotnD0/LRr9Qo33NK4LJAWahe
         duC1af7XWbM9Aip947e/Dmy3dqggRzPJOwJ3pj66Gkn2bC/qgz/8dztiWJOaYaw08YAm
         bnhYPZfS4MEyI0yPsaEWaavjLBwUP9lfK7zyWZMGy7R2rZLSHJ6WDro0Q0piBH9L5YqY
         SDF7knZrqM4cah7KFV9qx3TwS5JIVeyLwTs9O0yTI14Bq5ToDNMtVu+X+jp/UwPbFlPj
         sjXQ==
X-Gm-Message-State: AJIora9WigxGfcLum4vpmqOpqJpzdHrUmttW3RxIYmP3jl3H8LreX0hx
        HAgo3OaKH2yhWOsfwVoJcZKNOsQdN5Ti4xfySY8=
X-Google-Smtp-Source: AGRyM1t1CWIadRuUQxkeYJjNfqlanyAVCA5tHPA/goO3eZCoZm3HDAcTC1BFN0EZ2gpLnLtzGVRl3kbhdcEp9/I0HWA=
X-Received: by 2002:aa7:c597:0:b0:43a:473b:8bae with SMTP id
 g23-20020aa7c597000000b0043a473b8baemr21801321edq.384.1657924336839; Fri, 15
 Jul 2022 15:32:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:fc0a:b0:72b:3a8a:be95 with HTTP; Fri, 15 Jul 2022
 15:32:16 -0700 (PDT)
Reply-To: bkasyanchuk1@gmail.com
From:   Boris Kasyanchuk <adamj6854@gmail.com>
Date:   Sat, 16 Jul 2022 06:32:16 +0800
Message-ID: <CAKVsLmqxnpWR9=m+FiWPJ+gOYMNd+CdOe-eLSFwwKdtHy6eHoA@mail.gmail.com>
Subject: =?UTF-8?Q?Pozdravujem_Vol=C3=A1m_sa_Boris_Kasyanchuk=2C_=C5=BEijem_s_rod?=
        =?UTF-8?Q?inou_na_Ukrajine_a_tie=C5=BE_pracujem_ako_in=C5=BEinier_v_stroj=C3=A1rsk?=
        =?UTF-8?Q?ej_firme_tu_v_Kyjeve=2C_kv=C3=B4li_vojne_sme_pri=C5=A1li_o_domy=2C_momen?=
        =?UTF-8?Q?t=C3=A1lne_m=C3=B4=C5=BEem_pres=C5=A5ahova=C5=A5_svoje_cennosti=2C_hotovos=C5=A5_od_me?=
        =?UTF-8?Q?sta_za_pomoci_agenta_spolupracuj=C3=BAceho_s_diplomatick=C3=A1_agent?=
        =?UTF-8?Q?=C3=BAra_OSN=2C_potrebujem_va=C5=A1u_pomoc_moja_bato=C5=BEina_a_cennosti=2C_?=
        =?UTF-8?Q?som_pripraven=C3=BD_v=C3=A1m_da=C5=A5_40=25_za_va=C5=A1e_=C3=BAsilie_o_zaistenie_b?=
        =?UTF-8?Q?ezpe=C4=8Dnosti_mojich_rodinn=C3=BDch_pokladov_a_cennost=C3=AD=2C_ktor=C3=A9_b?=
        =?UTF-8?Q?y_som_v=C3=A1m_r=C3=A1d_poskytol_podrobnosti_a_inform=C3=A1cie_t=C3=BDkaj=C3=BAc?=
        =?UTF-8?Q?e_sa_tejto_ponuky=2C_kontaktujte_ma_=C4=8Do_najsk=C3=B4r=2E_=C4=8Eakujeme_za?=
        =?UTF-8?Q?_pochopenie_=2C_Boris_Kasjan=C4=8Duk?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


