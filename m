Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C223F4E2294
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 09:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345374AbiCUI5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 04:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239388AbiCUI5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 04:57:03 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A8257178
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 01:55:39 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id i11so11435965plr.1
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7giopjWTyujn3G/xgAOAojss0g1xOFmKeCsas97kVGU=;
        b=N2iGgrfbd/TSKXIYR5sn4kleSg0uPl0PoxdRAq7Cf7GRRAGBd1o/OCgF5dyul80aIT
         9TvVEqclrAbE7cqwd16hAij+s33fkReIBWx6KBn7Yjhior1LNhFsTYy+4Ntou1ubS0LJ
         M7dWSkKv0NkZsbN9shk7VKZUaM9dFIvNx+zuRsIfIqEfhBefzq2O++NFTHxR33JdNgF7
         GeoZ+6VMHbk4Otb4etWSj8XJxA++3MDoHhEeiROGO20BKSReSISWqmWIfSGttXyn/463
         nIV+GPK/NSR+Zkqb70CoId7tM+e6CFGsmZWTvB0pEteeN/zquBL8TyxojFjDLlCTrElt
         IcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=7giopjWTyujn3G/xgAOAojss0g1xOFmKeCsas97kVGU=;
        b=Kj1TRK4O8hb+1Iejdwlb6aelYGiG1zqpmjRU285zYrAxZXmHOn9P1g8J43g2PjhBjD
         snbyUmAIWo1V6cxKkKutNqAKxrflvbu5qZQ0k8PB0o1UfQnvEy7pOa4SzcQBT+uxCyM2
         FQObuI1CGtizGnI/fZV6xjUfxfaqGJD5WAMikmPRWN79sfV9DIDHaYJUzIzz0FsI0Qft
         DlEDhwfLNDUwFFEPw8CtRCPKs/+nHzMdLS/hZuPdQP3XR4ZvsgAt8Eb73iMq6GzKIva7
         u2/XCZiPXhvq87K6yFz0bo2ZRoUEyISsEcm9Kqakk8g87BWJHhMQaZZ2mLlblloiQfPS
         i7ew==
X-Gm-Message-State: AOAM531Ys1etnZcIb/6mj53j9c8V3fVy5GAXSJhq7/zuIYJcs9L0XB/U
        2E4w9wFEcTnaTWaNwO5knBlwnSXamlYcoTPraww=
X-Google-Smtp-Source: ABdhPJxsWiZkV+/6fsKWYn/lUzQhYAL/Z6fyyqizG3TznZlMsEeZpDdqgvR5cUcB2zvcgeUytYr3QkZ3BLE29OUneGI=
X-Received: by 2002:a17:902:c215:b0:153:8d90:a108 with SMTP id
 21-20020a170902c21500b001538d90a108mr12122835pll.172.1647852938700; Mon, 21
 Mar 2022 01:55:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b02:0:0:0:0 with HTTP; Mon, 21 Mar 2022 01:55:38
 -0700 (PDT)
Reply-To: susannelegitfirm155@gmail.com
From:   Susanne Klatten <usmanabdulaziz8812@gmail.com>
Date:   Mon, 21 Mar 2022 09:55:38 +0100
Message-ID: <CAPxMV8kcTnLef-CAyizwaCmvQCOQTvDUD61qMSoWEe32Mwc6ow@mail.gmail.com>
Subject: =?UTF-8?B?UE/Fu1lDWktB?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.3 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,FUZZY_CREDIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:635 listed in]
        [list.dnswl.org]
        * -0.5 BAYES_05 BODY: Bayes spam probability is 1 to 5%
        *      [score: 0.0301]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [usmanabdulaziz8812[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [usmanabdulaziz8812[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [susannelegitfirm155[at]gmail.com]
        *  1.7 FUZZY_CREDIT BODY: Attempt to obfuscate words in spam
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cze=C5=9B=C4=87

Nazywam si=C4=99 Susanne Klatten i jestem Z Niemiec, mog=C4=99 kontrolowa=
=C4=87 Twoje
problemy finansowe bez uciekania si=C4=99 do Bank=C3=B3w w zakresie Pieni=
=C4=85dze
Kredytowe. Oferujemy po=C5=BCyczki osobiste i po=C5=BCyczki biznesowe, jest=
em
zatwierdzonym i certyfikowanym po=C5=BCyczkodawc=C4=85 z wieloletnim
do=C5=9Bwiadczeniem w udzielaniu po=C5=BCyczek i udzielamy po=C5=BCyczek z
zabezpieczeniem i bez zabezpieczenia w zakresie od 2.000,00 =E2=82=AC ($) d=
o
maksymalnie 500 000 000,00 =E2=82=AC ze sta=C5=82ym oprocentowaniem 3% w st=
osunku
rocznym. Czy potrzebujesz po=C5=BCyczki? Napisz do nas na:
susannelegitfirm155@gmail.com

  Mo=C5=BCesz r=C3=B3wnie=C5=BC zobaczy=C4=87 m=C3=B3j link i dowiedzie=C4=
=87 si=C4=99 wi=C4=99cej o mnie.

  https://en.wikipedia.org/wiki/Susanne_Klatten
  https://www.forbes.com/profile/susanne-klatten

  E-mail: susannelegitfirm155@gmail.com
  Podpis,
  Przewodnicz=C4=85cy Wykonawczy
  Susanne Klatten
