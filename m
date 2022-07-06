Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED38568F46
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 18:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233265AbiGFQfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 12:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbiGFQfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 12:35:44 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1221C128
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 09:35:41 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so12235349otk.0
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=YJKB5C3B+x1QVqxOvu4ZEuub9YHmbaK6VTNdRIVaG4j11rXHrsGru+2ZdvBcqIcRor
         AfENnfpnfwPkKG0JE+Tb0OW47lQ8LR4lvqxt/6YYyM1IqSdKFIQaJ09tPExxFFzXXqSg
         0bLp28tElsJcFM9fcr5TCzIrwh8CvNtZ2p3ukUOnTmtz88x8454kFO+wm26p3wTR9XT4
         g4ID060RRkxEhQP1BbLO9uzenBnSczHm5ZenT0IDY9NuTrCh5uhOpnXPy4pKYSeNcd5G
         otsYWRRE2qEDvWI8BeI+AndgKu5mS2QpYjkhDo+r29CpOxp0fuP9p2smoNBSPEItMNtb
         2Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=PeP2hy/fwHNxWU2CtUoeETxredoCfxU4XHIBvqc0+LOlWlsukPYrh3wFuUJ1tLPmCa
         y0ADAwvFbLFGpZSPbTGRpYa1bg44Vc77X7GsGXLLS+6XWASRwqhNanWYbRPbHxlPJRmS
         2QnPHeqkqAjbFEgEtFwnTJv42GjTd/LVssJSSg/UfaSVDZpbChBKxkT2B0P6pGHYZOIy
         cNsSA5eqqSpYiXmc4RGp2JdjV96+FOhV+xYSOb4dj67bC0aJ3qiY05NJakRVkCbPsP46
         KwrD1+3XBSWQ2ZjqZVdTeAVW3jn2WN5A+5c4n103SJUnOsV3dPJOB8nJ3ndZZW0N3Ko+
         58mQ==
X-Gm-Message-State: AJIora/fBFDbsiNQjt7mU5/wof4Y1iQosqJB1Onqa++RULNvIZZfA1zs
        CFbAe7C5I9b9AosXnZayOLiOAllLIR8iVT3r3eo=
X-Google-Smtp-Source: AGRyM1siBXyrfTNOvJeEopCAc1iebbkqBPyuLgJpLyAg5DlJRsNwL8MxhVa5zJEcn04SSdtRp46aFzUkw0s/b4jFfFs=
X-Received: by 2002:a05:6830:18e2:b0:616:cc95:a2b3 with SMTP id
 d2-20020a05683018e200b00616cc95a2b3mr17761807otf.280.1657125341354; Wed, 06
 Jul 2022 09:35:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 09:35:40 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 16:35:40 +0000
Message-ID: <CAFSKFDbjJwCryRpWuGZmjqwjjbrEqORSnYsDHOUtZn8b2TUtrQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
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

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
