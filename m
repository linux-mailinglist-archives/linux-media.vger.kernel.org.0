Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB8A7619F4
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 15:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjGYN3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 09:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjGYN3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 09:29:45 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674B01BC3
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 06:29:44 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-268160d99ccso346563a91.1
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690291784; x=1690896584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnGnwNrTj18ziZnLtbDBIoSbkOpg4hidoMU+FBgQFcA=;
        b=W6ZrbC3MjmnlkzrPvEIWJDceXuq3MyIuhHEQL4ftvaYF+BzTNbm5KHV4iCcRf0Zx+G
         Ngj/24K2uxRCQN52coLCUt6QaJ/oRMul95VCEp2lwS8cERcDifBPpWbJhZjCPWHSulbQ
         gOytEJ+3ltjdS6g+xy/n90PIQ8Svd7SZVF8vACwoe9Ko1tJ3HsZ+hlndF4fBx0ZTUgOU
         63XPiVdQMxW7ekgrPmsjFqM9VNKirR6bAWfHNbZ7hfLFxr1k/hEvjGxS4w5C9Hf+HwAB
         aSLVd4D0H42LFTb83vr9kW2DwKO7EulZYKS+RsCIlRE3N80gPdcyb1rgxbz642K+JQZf
         5reQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291784; x=1690896584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnGnwNrTj18ziZnLtbDBIoSbkOpg4hidoMU+FBgQFcA=;
        b=Uk1ydCM1U7ECUb3r0a/To0PPKtegNO/2K2kXvyYuciaRw2yDRfpzKgbswF7X2IOfl0
         Yq+booMZGW9yn350KZX7Uza7sGyfDqw4aLNOt7eRb2Gt0D7s6TXnIqFouOqz5AieozfC
         9OjwhHtnLKIIPIZlwtDfFYjebK+bmfOS+MAgstZzDY729u1AuLUwS0k48JCahDn0SA55
         L3TkrGfn5vtd0wb7fvaecrcWG4nfrbm798OL9qA0i63Xg063k9InkkQITtYMZKMSHf7F
         V+vFBF45EXEIRFE5ZZyhSXBzQE96PZSXrl40Tpsm59sX2pYG7MflZ0Uz56w/3Fnjtoi8
         sVtg==
X-Gm-Message-State: ABy/qLbk0bPhbsj9Mx3ZwodSHQ2L5mi1JCH7WAU9vcar9DCL9n4Hpjc/
        HdbqEvE8aXzGFetpXACfm4To5AavYQWZrHZx7SM=
X-Google-Smtp-Source: APBJJlGBP3+sJUppV+uT+exlakqwLVesjH29MpwTu25ngDh4uIRwadTccUfGBUQa0nW9V1WC8YkitKXY3pCcv9hakTU=
X-Received: by 2002:a17:90a:1d46:b0:268:abc:83d5 with SMTP id
 u6-20020a17090a1d4600b002680abc83d5mr7129956pju.4.1690291783813; Tue, 25 Jul
 2023 06:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230725130024.568452-1-yangyingliang@huawei.com>
In-Reply-To: <20230725130024.568452-1-yangyingliang@huawei.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 25 Jul 2023 10:29:31 -0300
Message-ID: <CAOMZO5Ceb5fkYM5HA+dLV3MUvaWaG8EYhpx7gN=khvHAtP5i_Q@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: fix wrong return pointer check in mxc_isi_crossbar_init()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, linux-imx@nxp.com, c.hemp@phytec.de,
        s.riedmueller@phytec.de, guoniu.zhou@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

On Tue, Jul 25, 2023 at 10:03=E2=80=AFAM Yang Yingliang
<yangyingliang@huawei.com> wrote:
>
> It should check 'xbar->inputs', when allocate memory for it.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
