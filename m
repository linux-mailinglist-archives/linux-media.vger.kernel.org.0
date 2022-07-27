Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB02A58353E
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 00:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234671AbiG0WO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 18:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234171AbiG0WOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 18:14:35 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54029655A0
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 15:11:35 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id u12so2895qtk.0
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=aGoDJrYv/23a7xlVt3keHbO9Kwx3iNZ53WhEz8TdkfQ=;
        b=jqx7j9YVQ6bPJ9n6bJ6OBR2/rPsg3imxg63kHYpUDukx8nQQfQm/oqzOuDClTa44f3
         Qt+vHBTJfGydm/Ji5HSwGuryVG9C6eW7VPitQ1/8imXBxYWDlMWxsACQtBX3PJGz3GR3
         meS9VP/JKYfamQGg2NEr9XwRweNO3qISrS0NZpWxMP81wXcuX07P3efzWX7W+G6U9uF9
         oWTA1vD7Sm9sVfTgIzPA1OB0F3SVsguUtlMaPr4xncMKNMe7K1I0O8IfL1mZOBmEatO0
         EiIL8LevAii3sapm8ra3+AhFZx+A6nuHRRAW8JrYeZbzvAKKoNUYsEVwFzARGsaLvXu/
         BMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=aGoDJrYv/23a7xlVt3keHbO9Kwx3iNZ53WhEz8TdkfQ=;
        b=z0TmQPI7iRdlz5yOvaKO7p4QVXZLq26KMlI+QcfQ5apKaOdSt/3/5S3GfRWcF+cLUi
         Afym52H3By4ksa4ZAKK4I7GszldFtBLHHOzIJ0FPECGZd1h5Jh9DirfSlBH5rwaLqwaN
         9PBGVCVkiIjEQMrxA4eogHq1QzW8Wp68zMDG2xARSyWR5PmAiPbufiLgYEy7OfC2ByTo
         DxE9RszUof5vIi6DrRkbrWhzydtoZB5oDzLMQ/ncUcCsYrfyh5lvCBPRieHihjPSrWEm
         feWxyxRP0fBXFrLvINFlFE9xNcAlMcaS8DIUOl0jKbtY85Kl9+Kx4O4l+HLMHkYuwCS7
         TRfA==
X-Gm-Message-State: AJIora/b4X1jZI8Pz8RxMN0S0Jc1rs7gA0JdXsXAkhgJCycVa2I8qfEK
        qqU7gsXEc25eYdyFVXvKAVu4SDc9EuGzUQmQ8gg=
X-Google-Smtp-Source: AGRyM1t4RLfgLpq8DZ66XuoJg0iNXQt2pBsukXNwj21JYyfWMe4/3FXo8Wm+CX0woRHUfpXIb7DJtfy75BoZAGvgfNA=
X-Received: by 2002:a05:622a:608c:b0:2f1:e3fa:b603 with SMTP id
 hf12-20020a05622a608c00b002f1e3fab603mr20221457qtb.48.1658959891870; Wed, 27
 Jul 2022 15:11:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:19a7:0:0:0:0 with HTTP; Wed, 27 Jul 2022 15:11:31
 -0700 (PDT)
Reply-To: sophiaernest566@gmail.com
From:   Sophia Ernest <dors893@gmail.com>
Date:   Wed, 27 Jul 2022 14:11:31 -0800
Message-ID: <CAJuQ9hbKMdpL4wEQk2Wmo4XM42wNS4E7RPJc+cVBhqomru=OwA@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5189]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [dors893[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dors893[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sophiaernest566[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

I wonder why you continue neglecting my emails. Please, acknowledge
the receipt of this message in reference to the subject above as I
intend to send to you the details of the mail. Sometimes, try to check
your spam box because most of these correspondences fall out sometimes
in SPAM folder.

Best regards,
Sophia
