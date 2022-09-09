Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75EB75B3B44
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 16:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbiIIOzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 10:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbiIIOzn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 10:55:43 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAE4133A03
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 07:55:41 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 11so3107731ybu.0
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=IGtLzLNX8sXErALPvPRNWSto8UMgqJBw2M4hoaFD0kw=;
        b=jSpTKZX9Mxd7tQVjmUMoPjIdHgpYxJuhirFWA79EfyeQioLgQcxkLbFkXj+8YN6YLV
         h8DO1424acjb/UKwWWLow0SVMtTLkIwKyPi2CKhUMObFHmTHyfRdDoNhpL7lbDtpuYOM
         tyWJIq1vRuwsDg+tIt6Nin7XI1NJCvKcQxN2BWDU1jQJFsWajWQo4AETwliGr22rRbUV
         34+oyfVg1QZvVBux2etoWwBDWlCOyVOcwIAIi7i+QdixKJjAFdkPdo0v+qo3ry02sxox
         irtc3t5EwlSSaRBdAOFem6eHijiyWWBsLc5DpXx5UlC1J6Xdl/70/zPjYFS4VGT4RFeI
         Qepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IGtLzLNX8sXErALPvPRNWSto8UMgqJBw2M4hoaFD0kw=;
        b=pzvDD/cjzm/nLcz3PGr6+xYesnb6yl1TKqACsM08Aq0Qh8YongqwB78HmZCQRLPBP2
         LUvmM6cPOTsoDlw8NHcJpW9pN3Mzg3xJyrKazW3LvmcAOcKsdthaK21ub2jJiuESFPJY
         LqIEWqRipYtq3oPmP3cubt7s15Oel7S5C6cQetbSQtOBH5Y/Nlfw8Ipya0LPS5b4k/zf
         Njh+rp7cXnjIKvQJuacc9WY9Yp7D5/KRMC7tv/KInyHgsZlu+G0LSD5BILDWuH1UBH6l
         sKSmpAjUmjG97JMjP59cUrTbNNFVhLqPCsUCRGjxmt5uLffrVwGC4xmym5Ptr7Lrp2SG
         497g==
X-Gm-Message-State: ACgBeo3N+F85QXCOimJtTn0Ly/b0PoRIxb9RBirOAgYMDy5H4dQe4c6r
        8sxckeZrGFdF6ghKpcPd1qppYEpT1e3VpXNqdMU=
X-Google-Smtp-Source: AA6agR4Rk0zw4dirz9/zb0Vwfh9VjMjR3JgIBzYkmhYTZ8FdFjRGRa6PmLYWnrmHOVRNMU5idY5qEoZy6DdXB7J+Uyk=
X-Received: by 2002:a25:ab2f:0:b0:6a9:a222:e971 with SMTP id
 u44-20020a25ab2f000000b006a9a222e971mr12856651ybi.313.1662735340371; Fri, 09
 Sep 2022 07:55:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:1243:0:0:0:0:0 with HTTP; Fri, 9 Sep 2022 07:55:39 -0700 (PDT)
Reply-To: orlandomoris56@gmail.com
From:   orlando moris <oliajeremy@gmail.com>
Date:   Fri, 9 Sep 2022 14:55:39 +0000
Message-ID: <CABz_VOAyOTgQ2qmzD4+abEeX1Wx9pNHYj__aP5VKiBBv71dDfA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dzie=C5=84 dobry, Uprzejmie informujemy, =C5=BCe ta wiadomo=C5=9B=C4=87 e-m=
ail, kt=C3=B3ra
dotar=C5=82a do Twojej skrzynki pocztowej, nie jest b=C5=82=C4=99dem, ale z=
osta=C5=82a
specjalnie zaadresowana do Ciebie do rozwa=C5=BCenia. Mam propozycj=C4=99
(7,500.000,00 $) zostawion=C4=85 przez mojego zmar=C5=82ego klienta, in=C5=
=BCyniera
Carlosa, kt=C3=B3ry mieszka=C5=82 i pracowa=C5=82 tutaj w Lome togo, przed =
tragiczn=C4=85
=C5=9Bmierci=C4=85 w wypadku samochodowym z jego rodzin=C4=85. Kontaktuj=C4=
=99 si=C4=99 z tob=C4=85
jako jego najbli=C5=BCszy krewny, wi=C4=99c mo=C5=BCesz otrzyma=C4=87 =C5=
=9Brodki na
roszczenia. na szybk=C4=85 odpowied=C5=BA przeka=C5=BC=C4=99 Ci szczeg=C3=
=B3=C5=82y tej transakcji,
  skontaktuj si=C4=99 ze mn=C4=85 na ten e-mail
(orlandomoris56@gmail.com )
