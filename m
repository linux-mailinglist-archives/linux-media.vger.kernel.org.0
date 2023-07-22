Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAE775DDE0
	for <lists+linux-media@lfdr.de>; Sat, 22 Jul 2023 19:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjGVRdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jul 2023 13:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjGVRdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jul 2023 13:33:35 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C70268F
        for <linux-media@vger.kernel.org>; Sat, 22 Jul 2023 10:33:33 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-55fcc15e109so1547810a12.3
        for <linux-media@vger.kernel.org>; Sat, 22 Jul 2023 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690047213; x=1690652013;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XwQ9KTk0AvNg4YEGpLO6Mzd1tQ0NGTk2GH4qBYSzWYc=;
        b=VgzZMptrmZ8TWZlxmL7uj46LqGTn5bcQsDytmauMeEb7890xlnF7daq2CEEGMnZ9/Z
         2YeM29/AwkqHTH0jS1CpvSk9kZVtYGiyBT6f7RMo9cKuvHoe9kZi0PhVT9S16QwWl6IJ
         hKylPvfYWtUMI1hzwsNnorESKbmngUKjbDcVWCqohrvzxnrnZ1diQfvsyNAPN33EhcDw
         /D3WxcSxyY44lsDuJ+oKIB1HMNlws0smCwwol4ecOLZkv5tgkze8FDT79naNiVl3ANsv
         u8OnTj2mk9bfWSZSexMMF0mPnUX8wekGS356PXJXTSnIGQioil1IOh0CHgMKRQ/Dc5vP
         IDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690047213; x=1690652013;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwQ9KTk0AvNg4YEGpLO6Mzd1tQ0NGTk2GH4qBYSzWYc=;
        b=JLFwmHMRUoghSioEw7OUEvzimq6yQRjyfl4UgIou9lpdWlWbwpiFxqYSttIh1+pVgb
         Opf5yyDN5CkRBgalOKymuEdYix9uHzffqOZsafhImoJ65a64IppL3kuBeRVgu7FtewX1
         IMs2+x5Ywl1Z+0BaM5eWFtpkHB41wXFWZnLqLNoxfDqH7vDjArf92+6FuM9BNUJOjYGX
         Ck1NpuD0YrbVydFYT7N1g72a39fYQLfuM3XpwOCerKye6C8mNyRkViTB2sL5tob0onVr
         nOzrMHcLpvm2kCFPjT1cE5M77ak8cUuM+DCY4pXVEYUgtxmoYZhwbaM+kPPpnisF/E2F
         Cb0Q==
X-Gm-Message-State: ABy/qLbk4MlF6IdNg9So0rZolZPcNlRM0JzRygTdfEkxEB1L2Q5vblwV
        WGp3YqzqoaDSC9HElqHvq5g+Rxu3HKdGA+a9EHw=
X-Google-Smtp-Source: APBJJlGaafNiiHf9/1O0psWPRSU+7sNla2aMoOYF66iC/Xrx4mVCb4Rkkl5MrHBWY+m5yeh1LUIwdQAeleHpZGArl9Y=
X-Received: by 2002:a17:90b:d8f:b0:250:6c76:fd9b with SMTP id
 bg15-20020a17090b0d8f00b002506c76fd9bmr3433350pjb.38.1690047212899; Sat, 22
 Jul 2023 10:33:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:556:b0:130:f967:83dc with HTTP; Sat, 22 Jul 2023
 10:33:32 -0700 (PDT)
Reply-To: mrsvl06@gmail.com
From:   Veronica Lee <barr.freemanukoh@gmail.com>
Date:   Sat, 22 Jul 2023 19:33:32 +0200
Message-ID: <CAB6WZPoaKVWPbmVCghccn8Ed=43UndtTt_gOWQ-F7rurprkDnQ@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

16nXnNeV150g15nXp9eZ16jXmSwg15DXoNeZINek15XXoNeUINeQ15zXmdeaINec157XmdeT16Ig
16nXkdeo16bXldeg15kg15zXl9ec15XXpyDXkNeZ16rXmiDXkNecINeq15TXodehINec15TXqdeZ
15Eg15zXpNeo15jXmdedDQo=
