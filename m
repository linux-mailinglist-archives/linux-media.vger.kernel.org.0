Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD7175B37F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 17:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbjGTPxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 11:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbjGTPxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 11:53:08 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949D0114
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 08:53:07 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6864c144897so202378b3a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689868387; x=1690473187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79atujyIAePkjssFt6F1DQY6dRtcAglZAWaG3FWufgA=;
        b=pSDTILb/0ljxdjnrkoERh4lMs+I0qvOfIAeuwK2gFbOfpm6HR+PO0Lw9Od6A7/kG27
         /q0/CCiVLXlrXRBpeK6XT2JgXVfLmPE8OCZ3GOPOIAgqz0xZBMgstTMkR8Aa2VK/N2zk
         I69YnfYMPr4SHfj7CAGJrol/E2WOGVBPDDb/HhO/QBCHZvaJEyeZefdf3v+fNTAltyhv
         2vKg2KRRr7uqNuUqS5MeNd8gWH8Ld3KltZEiQJ1nvA7n1fELaD1W9WKTTeqWfUPNCOes
         wi5YB22f62sa8YEjuvptBM7cMuaAeACJZicfT1f4pS8GdaytvfhoEGz9ZBFvhaZ+BJ9j
         QbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868387; x=1690473187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79atujyIAePkjssFt6F1DQY6dRtcAglZAWaG3FWufgA=;
        b=K/LVzulTI5mAB+gBRnX7P2riyGenhU9UaHhSbC/U5KbbE3fOAixzHHkpGm1xSVMn+g
         FMQknDtRgXisJDX/CSqXCBSNjLKzlWuvZfvNZDvkVgCcFak3fve07NFwFNgXobTJK+C8
         sB85Bm85UrFJFsRu9oWGkjCluxVk5caBqliI7yM1uWBbpDhN2tp0X0v5ME1IRtU5t5ZS
         aZFkyup2NrEvTnBeVXM+5RQ6RBtbyVpNQ3jg3z75RdCDhCI2gYNLnDBHM9DsTzmt2zMN
         QboMBb/iz0Jeesg7BfOGMcZvwTPpvhXo8yZu5v3R5NY3omXGLJ/iWTKLgnIHu/x/Du7P
         9AFQ==
X-Gm-Message-State: ABy/qLbmdxdi8Y6sireTzxxUDDj9rK76vuSG2bjTa5kwqWjLpaYMu3y+
        5cRQujMN6NVTgN3Y+Y4FrxEafw4QhecJ+yLB6NM=
X-Google-Smtp-Source: APBJJlFeV2HgA485ICasy/bLECVTRUcN6eih8nRR0wz0HoQ442DMbTnK1fWx7i+lzAus4rC3Hz2QaQfGo1rN7tQroa4=
X-Received: by 2002:a05:6a00:1d2a:b0:676:2a5c:7bc5 with SMTP id
 a42-20020a056a001d2a00b006762a5c7bc5mr3525833pfx.1.1689868386998; Thu, 20 Jul
 2023 08:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
 <2290635.ElGaqSPkdT@steina-w> <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
 <844922189.0ifERbkFSE@steina-w> <CAJ+vNU21HytYLDojnPqLu8a9BRGRbMNgmGzdqbm67_5TYZT2tg@mail.gmail.com>
In-Reply-To: <CAJ+vNU21HytYLDojnPqLu8a9BRGRbMNgmGzdqbm67_5TYZT2tg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 20 Jul 2023 12:52:55 -0300
Message-ID: <CAOMZO5AT=U2EDqEm2QEK-DSqCMd+=xMa_AAaYaog4-j77h46gA@mail.gmail.com>
Subject: Re: media: imx: imx7-media-csi: Get rid of superfluous call to
 imx7_csi_mbus_fm t_to_pix_fmt
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
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

Hi Tim,

On Thu, Jul 20, 2023 at 12:12=E2=80=AFPM Tim Harvey <tharvey@gateworks.com>=
 wrote:

> have you tested mipi-csi with linux-next recently and observed it not
> probing? I assume there is another issue awaiting us when linux-next
> gets merged.

I tested capture on imx8mm-evk and imx8mn-evk boards on linux-next 20230720=
.

Both of them are working here, so I was not able to reproduce the
probe failure you reported.
