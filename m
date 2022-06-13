Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B5754A079
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351186AbiFMU4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243550AbiFMUzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:55:14 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6809FC5
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 13:27:29 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id h21so1232837uaw.7
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 13:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=f/v1gZW2d1xf+y6gXLTGdOPEOS7UDztcZyURQzQMDp0=;
        b=OdrDmXqTVaEbKcbTjD93surbgAVobFR9a3I9MeN4fRc5obpOYLA/G7GfEB5WFowb8h
         XdRsLcqW7XIqfCH+isAmT75z5hl/HZxm1St9/GA9XMrLtzLbb8jGzb8DWdAstivj5YtO
         v00D+S/b9wk68DZLb6hJErkewgMZGK17nK/lMoDllJr2v11w50S7JTmtJEeLSnJOEka6
         OECmoc2TH/Sd8h9FNyTKTWCAI7gpMwcT/8XQfDOECJaeHw50dOAl5k9XJEjJrzl/1LtK
         UdU4n5L/u4kNC0tGXPIkgPO/R9cAbS5Dp4aLhYu2iTjcF/JrrIPiwXPxJe3+RU+id1IJ
         GSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=f/v1gZW2d1xf+y6gXLTGdOPEOS7UDztcZyURQzQMDp0=;
        b=auQPB3AWUMd+Tb+CsSYpT2wJpklU8IUG4XQYMpemiC5tgYNchDqCbOvcfn36iET/Hr
         F7xC/O8Z9BJKME1+5haxMDfl6zLfQC9iCMeBm3OoLUligJ/oB2xKBfsj0C/yXZMBKINb
         vUBy2kzvJR8KmAsk4uAja9R5Qm1cjJk7CYx8dmX3HbC+Rs8SrrjWaaTBwX+wKJxW3y1h
         IQ6dWnwLet/ybSh/Kr9qqTndo8t20XRLTU48TDBUL41NYIzrB4toRnOkbyoLo83qstRO
         ezhx40VZ0be8LCnuvrjl8yJLufnVVbSjgZ/epmHZztlrGEAF43mHTAdSHPKBXjKddkxx
         mGIw==
X-Gm-Message-State: AJIora/9JDfkRyjmYN/9jcHhGMR/FFtcuDQoJc7zlqJ3/MAAkDz3v8Ab
        5xEVBlNHmMdhiPpsLTmiWk0iDGiGgpQsZB0ezUM=
X-Google-Smtp-Source: AGRyM1vlUx8WCvfTFwc0l2UwNQoC52Qay1JID43h6Lwj7EfAxiXQd6uzVfIzERlunthWMzzAAT3c9eTduXZ3DW4jxm0=
X-Received: by 2002:ab0:5a85:0:b0:35d:20c3:5463 with SMTP id
 w5-20020ab05a85000000b0035d20c35463mr719740uae.103.1655152048706; Mon, 13 Jun
 2022 13:27:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:bf8a:0:b0:2ca:3b5c:ca48 with HTTP; Mon, 13 Jun 2022
 13:27:28 -0700 (PDT)
Reply-To: nikkifenton79@gmail.com
From:   Nikki Fenton <gustaviagrowe629@gmail.com>
Date:   Mon, 13 Jun 2022 22:27:28 +0200
Message-ID: <CAEmpkiAvAF6YR3E1DnukQzAj+5ibPOvEG4TM+XcbhkRyf1Ve9A@mail.gmail.com>
Subject: Please Read
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good Day,
I viewed your profile on Linkedin regarding a proposal that has
something in common with you, reply for more details on my private
email:nikkifenton79@gmail.com

Nikki Fenton,
nikkifenton79@gmail.com
