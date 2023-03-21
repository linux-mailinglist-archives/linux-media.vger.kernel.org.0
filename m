Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDD06C364A
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 16:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjCUPzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 11:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjCUPzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 11:55:42 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B4728848
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 08:55:41 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id bc12so15889291plb.0
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679414141;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2cgb82Yxi7zlPOdjdBrAeazxEvIo86/rVAXoahWy39A=;
        b=cH9+DLIgSVdJo23sWCV01eruu+RX6yScXmvthy4Lf6ZSIZAYH8AD5GcBzvAR1mMkpF
         6sZ2PbArAxQBQrzxDtQZl6j+hjtiUnmDvSObu7Bl8AxUkEEttLuvPLs7Q0SxTWXi/VnE
         2JDoZt4lg/LsfAmBMr7bugJTeBlZxXJkI2R6Uobh6hgyMUxZx/c4PSV9vX+j4GbBFmvC
         fcECioCy8lT25JL6Akib5r9uM3kT+Yq0fnpj9VzraYpbfHT30bFt2lta6uuyP3wC0C+c
         9LypPu8oajCyNi/SglJIM+WO0vAKFJ3U59pO7owIBoTZlPvXdBEqYquRMTkvPvY3+dKX
         VwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679414141;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cgb82Yxi7zlPOdjdBrAeazxEvIo86/rVAXoahWy39A=;
        b=t0jhkv1k2UHvA5/cDeGWMzbeT17mbU5AdTgJ0mFLU2mnLvco+BIB63huMnJKN1vAel
         IbZNGGoISQ84lJ1JqQUDF6pTP93uTY99hgaG6BTFSna8eeKNFCGInQ9WalxlBzPOnwWc
         2n9JZsBZsfx12p/T0pqkjy1TVoeJ+VBMHmj+ZcS7mALkeB8oXprsL1BSAJjjTIJoj+qg
         3wTT7teVYgPr3DWAhlwWhAPiQ31emP10qlo/1c2eIpBc6N8klBBmCq1+tSIB7Z9gLA4p
         Xp3gokArke16zXVbDNm9DdLN9PiSki/Z+JuPWzPzl1Ixbqu2KjQn2t4AI1BZ6BWv4+GB
         NVgA==
X-Gm-Message-State: AO0yUKXENGL9mEM2Je/GNX9U7Fi5WTkqMy4jt7FFxBZ/hvgVg0IZuymr
        UR19wDQmYxwEHxxVV8UD34gdbKLx/cpWI33kKVM=
X-Google-Smtp-Source: AK7set++ZZ6wt8415wSyRYdRvtH9O7pm1G8as30KuEgK8XgUITs/GqrbJe63R8BqKxs3mgLLsr8jAYcbLAK175W7idE=
X-Received: by 2002:a17:903:1303:b0:19f:3cc1:e3bd with SMTP id
 iy3-20020a170903130300b0019f3cc1e3bdmr967935plb.4.1679414140863; Tue, 21 Mar
 2023 08:55:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a11:c8:b0:46b:ee67:e9d3 with HTTP; Tue, 21 Mar 2023
 08:55:40 -0700 (PDT)
Reply-To: osam93860@gmail.com
From:   Sam Omah <utb04391@gmail.com>
Date:   Tue, 21 Mar 2023 08:55:40 -0700
Message-ID: <CAG4fKzT2KhyragQ=Dw04g51vzf5bEKSYm2nkDSePF4wkHM1LDg@mail.gmail.com>
Subject: Hallo lieber Freund,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:62a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5003]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [utb04391[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [utb04391[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [osam93860[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Lieber Freund.  Was ist los? Ich brauche Ihre Antwort auf meine
zahlreichen unbeantworteten E-Mails an Sie bez=C3=BCglich Ihrer
Familienkasse (8.500.000,00 $). Bitte best=C3=A4tigen Sie mir diesen Brief
f=C3=BCr weitere Einzelheiten. Gr=C3=BC=C3=9Fe. Hochachtungsvoll, Mr. Sam O=
mah.
