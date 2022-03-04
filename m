Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1FD4CDB1F
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238712AbiCDRmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbiCDRmN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:42:13 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5E61B98A8
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:41:24 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id r20so11994572ljj.1
        for <linux-media@vger.kernel.org>; Fri, 04 Mar 2022 09:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gnW213AwC9ZFaX4TwovWIVI70m45ehAojubOFyKSXY8=;
        b=pZBmZfDRissn5gRMkWdUfkJu65BED/uTv5jeiwSehDshxelf4IChIRp5RtR2MQWW3Z
         aoylMAh7Z7eA2+vBfsuf5YUCjimtfMAqgfxTru2MsbeRw4+7r1p71ErcsjfFmh2j+b7L
         /dasfxXhpD14v5QDraSGQYHzerrZzi0SMbsFPtCoXFXWzr7LS2dZs6BQIQlBRmqaIOOR
         I3rMlHhG0JrwdOrXMikLIo6Rx3JrCMaIT0++VO6+TuMX5y8+zCbSIG1F2VwbgTz2yv4G
         47mkAtRouR5qswewV4Aa5RW3/RGsE1kC5kUMuGCsQKq/yAbxL2irTd+2KCfWpu6ZwxCy
         8BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=gnW213AwC9ZFaX4TwovWIVI70m45ehAojubOFyKSXY8=;
        b=xP4Q5vKwEBxVsa9OAuPaEEAXnmViHtbHfv9jz8tAUh4XqT7/NAACBFE9OZOpVgsg0/
         1FfJgHJy3vv5mqQsdM633z4CRMLsvUq6oKN7cWwFzg3Z6zDUfavBkRRHN3j9fb3KV4XB
         rL7yrS3m9cVjkuCpyPFNWLYr5tMxJ2okvRNvyLsBFJyVeAegxSCy4unlk9cbAd2qNLkz
         qTy/9gZg5F6XikhqJDKaXlJn03zRmONlr+tKYr3rIJTZBqHPgTzXHh+z6rziYFSI+K4G
         UB9Ql3EDTfG8Gy9Nzp1+XklJq0LGLNO98LZ1/S2DBPQiRxnaVmuXAOgZLPyDtv1nKz1Q
         +YQw==
X-Gm-Message-State: AOAM533cfUmoLX4TotWXWpKKTUfoeEY1viLg3T0NXxjM4FYUUWBcsZ8L
        ySm5RTxS+qHQp1l7cBCmc3dQ7BFEuWtYjCv10ko=
X-Google-Smtp-Source: ABdhPJzzUNgboFR3m6vZb+l7+7+cyyHFGEolgVKKCoV6TMvI3urY2Dj7BLfWUaA1vkLCL6tBgF7dizVFf1dUCUH6pp4=
X-Received: by 2002:a05:651c:a06:b0:246:71a3:556a with SMTP id
 k6-20020a05651c0a0600b0024671a3556amr15292750ljq.5.1646415680751; Fri, 04 Mar
 2022 09:41:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:aa6:c46b:0:b0:19c:e32d:4c9d with HTTP; Fri, 4 Mar 2022
 09:41:20 -0800 (PST)
Reply-To: douglaselix23@gmail.com
From:   "Mr. Douglas Felix" <legalrightschamber07@gmail.com>
Date:   Fri, 4 Mar 2022 17:41:20 +0000
Message-ID: <CALi75OoQdN6TGw+jH7C0SwrAr3sAYysHAtr2WWBW0YN0UvqLWA@mail.gmail.com>
Subject: =?UTF-8?B?QnVlbm9zIGTDrWFz?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [legalrightschamber07[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [douglaselix23[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [legalrightschamber07[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=20
Se le envi=C3=B3 un correo en alg=C3=BAn momento de la semana pasada con la=
 expectativa de
Recib=C3=AD un correo de respuesta tuyo, pero para mi sorpresa, nunca te
molestaste en responder.
Por favor responda para m=C3=A1s explicaciones.

Respetuosamente suyo,
Abogado. Douglas F=C3=A9lix.
