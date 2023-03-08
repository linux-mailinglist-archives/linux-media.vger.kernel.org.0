Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F396B0C1B
	for <lists+linux-media@lfdr.de>; Wed,  8 Mar 2023 16:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjCHPEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 10:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjCHPEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 10:04:07 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D44BCFE3
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 07:03:52 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id j2so15665585wrh.9
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 07:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678287831;
        h=content-transfer-encoding:subject:to:mime-version:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=km8AYClsgRL+l4X0k1bSrfqh+593Y4aFlyz7FmefBDA=;
        b=OYUREsIfxA0ZwHf0aAIMvhyLyLP7bYwLmaOMCyDuWSi4AUf47LTc1v4jdhSzscr4Wi
         Zhl0OW0LU5BS1acLm/o/D5KMjYOg3i06zDJnWhMt/pfJurWr7kqMFl28ZFn/bCiuIVdu
         brQc6THteRa3NP/OkQpdCnFVsmrk9CcVvvIUtBMz4FqfYSd3u/pb5xXnfIWApyLaGNhC
         l3qJGwrqX7j8feU/AhhO2CjH7Nt7/R6cot5f3XjwuL6Icl0EUEah2XS4OmWgWe9w8pd6
         LYVIluyktPXMddfR9C9uoTCm5BXbvk9RCVnK52D0a88rU5ozDNsyk66uJTtxqXZrq41C
         3LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678287831;
        h=content-transfer-encoding:subject:to:mime-version:from:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=km8AYClsgRL+l4X0k1bSrfqh+593Y4aFlyz7FmefBDA=;
        b=EM2G+OI+Ir+Ol8hzqUT+upROwi8ThCvkjw2PwpZLfs56ZIwpjgzy2SPOiutpj8Gt1L
         DYeSgbuWtykaGQssW4Ow1hTkOL4ERCKl6ExHBN9Q+otsxEEQzxAjCPC7wWnBhRZfmwuj
         fIfpBm3RGQ+TPHUxm7LZ/5WWVtsyAQuhASN4YMEbXKrb1UXTIgTAkx1Ml6c/LNqk63QT
         ZUaxNcUg+TGDofP77DyrdSThpRxb36FC2ZOEAOR92XhOgyUUPxH1PAPXttFWVReV06xL
         FOtfV1g/iJ+MlvL4mAHyrYAkeQ5RgxFKie+xqxH5wnPcB4BuORVFeY3iIyJYUNet6XhU
         MZ9g==
X-Gm-Message-State: AO0yUKWBsD+6dH6EW/OYVz/uDDqC56OPZSWLsLyy+4S0d7i0lke8gjiE
        KzdcjSTgk5wj2rmU1cQNJzti/gJgMBc=
X-Google-Smtp-Source: AK7set+FV2reqrTdqqGa4YsESQLnCV3id5BoGpUNkNpXlplie8Q759a6WXX+zncYKMtLaTve6oKUeg==
X-Received: by 2002:a5d:5548:0:b0:2c7:2cf4:baff with SMTP id g8-20020a5d5548000000b002c72cf4baffmr13452212wrw.70.1678287831221;
        Wed, 08 Mar 2023 07:03:51 -0800 (PST)
Received: from DESKTOP-8VK398V ([125.62.90.127])
        by smtp.gmail.com with ESMTPSA id q16-20020adfea10000000b002c559def236sm15337882wrm.57.2023.03.08.07.03.50
        for <linux-media@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 08 Mar 2023 07:03:51 -0800 (PST)
Message-ID: <6408a3d7.df0a0220.70634.e3c9@mx.google.com>
Date:   Wed, 08 Mar 2023 07:03:51 -0800 (PST)
X-Google-Original-Date: 8 Mar 2023 20:03:50 +0500
From:   amosjace274@gmail.com
X-Google-Original-From: AmosJace274@gmail.com
MIME-Version: 1.0
To:     linux-media@vger.kernel.org
Subject: Bid Estimate
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,=0D=0A=0D=0AWe provide accurate material take-offs and cost=
 estimates at low cost and with fast turnaround. Our team of prof=
essionals has been providing these services to General Contractor=
s, Subs (Painting, Electrical, Plumbing, Roofing, Drywall, Tile a=
nd Framing etc.). We offer both Residential and Commercial Estima=
tes and we cover every trade that you wish to bid, whether you wo=
rk with CSI Divisions or your unique classification. We use the l=
atest estimating software backed up by professionals with over a =
decade of experience.=0D=0A=0D=0AWe are giving almost 25% Discoun=
t on the first estimate.=0D=0A=0D=0APlease send us the plans or l=
inks to any FTP site so that we can review the plans and submit y=
ou a very economical quote.=0D=0A=0D=0ABest Regards.=0D=0A Amos j=
ace=0D=0AMarketing Manager=0D=0ACrown Estimation, LLC=0D=0A

