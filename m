Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED925405E8
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 19:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346949AbiFGRcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 13:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348137AbiFGRbg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 13:31:36 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17B7115A66
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 10:29:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 1so20003067ljp.8
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=BDMZXn5EwkkjzattiQmbMtk+ukpDtFZQmQdzC1/Dn84=;
        b=ML1wFOranQSOkO7Gg5qpjOsCD41X4reeJtqNl5SL8COjdGwnDzTlAqNMwU1os3DIiD
         le3tfJNcS7vGCuR4BNaV0j8WX6P+mB0HATCG+Gy9sXkFCQKSPohxi1ZHGQUsMJpVEppR
         CqXoBr/CwrLRMJxCue6C/R+obcgQ4MX9P9DFpFUxxEqUDK8DPEUMBa0yuSAhRDETcWwA
         8kE/mEvTVuGp9Kh10qWdu38OA/Lw3vALzygofMLTYHRmmMkQjQl35l7LvUPZpsB6raRe
         MgCWePKtVo4Rcu7NgtuCRwtqYr1jb6N7cz47w3y/K3tjldW5wwoR1YKw8V7aaSSVJcip
         VqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=BDMZXn5EwkkjzattiQmbMtk+ukpDtFZQmQdzC1/Dn84=;
        b=nIUnW0TyMTOmyNrZr5zyQeD26SzvMM3pCxmXzul64RhOhqChXt9pgnrPiuA3iNsQQf
         JZpMXwBie6tq6PAs/JwtNZJUBn5NCtyqFJlcT/Gi6Yw3asPqzeftmyYjO43lEODw2wFR
         S+7dO1v28xgD6NfLBeATkHwne6ybygnh9CGsqntQ1McwwWKDphlcIeBX+wwXVJO4NVJ9
         XVyn0ANPrdJgigQiujbrE/NVg1sEKCPnp19IVjYJWZDwOEdy90o9iBJxez6OvMoSrKt2
         7UPT0xhk9XLzxxMLBCsP9cnhfJ0T6Nk3KHNVS+WFjm1kaLhKEQy4jMprosopcRY6/YPs
         LfuQ==
X-Gm-Message-State: AOAM531RUCGmuOdPZ3Dtaf/E7M5291fEd9oWqrWQgu1lQIvN0SDDnd5E
        nhYzVB9FX76y5i/tjiv/LaJF1hkeMNed2L/r6m07TOlb
X-Google-Smtp-Source: ABdhPJywpMvvXTV0MURqmcnaM2UmPN2IRch5ZzOIhp/pyg1h3xcip2d3Uk7D3u8X6DP+XGBhYL+NRKCIe3OCTIGG+Hg=
X-Received: by 2002:a2e:9107:0:b0:255:7e00:b941 with SMTP id
 m7-20020a2e9107000000b002557e00b941mr12568710ljg.412.1654622974444; Tue, 07
 Jun 2022 10:29:34 -0700 (PDT)
MIME-Version: 1.0
From:   Karthik Poduval <karthik.poduval@gmail.com>
Date:   Tue, 7 Jun 2022 10:29:23 -0700
Message-ID: <CAFP0Ok_DvJo7KM4YSsT2s3SAzDQdSy-8HrQoky6zH5YE4sGypw@mail.gmail.com>
Subject: Attaching an I2C VCM subdev (media entity) to media pipeline
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I had a question about VCM subdev (media entity). The  example VCM
drivers have no pads. How do we attach them to the image sensor subdev
in the pipeline ?

-- 
Regards,
Karthik Poduval
