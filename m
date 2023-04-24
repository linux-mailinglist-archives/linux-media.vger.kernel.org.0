Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1EBF6EC481
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 06:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjDXEs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 00:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjDXEs2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 00:48:28 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611122D48
        for <linux-media@vger.kernel.org>; Sun, 23 Apr 2023 21:48:27 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5144043d9d1so2869216a12.3
        for <linux-media@vger.kernel.org>; Sun, 23 Apr 2023 21:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682311707; x=1684903707;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=S4MWetVyGuJkR+d2b+kETuR4GYLUQPumm3RGwW47pRXQFQOdLJT3+LLUxm17PBTJXE
         C0bYbI64FWeQ/yT8FygGREvqUm3QQ/zjWDMJs/4QE55jDPon2nR6Nm8Q08UAzIsXw/iy
         A/qMAu/+q0J/Jj4CLpdC8yjnSEIrFk6uQubGvqbgjDsruaSeaew6Ap+UhqZzmjvWjk9I
         aCRnfVP5fiGGdWRV6fRFx/WguBhuFsOg8/MvvMIjS6c+gOuOqluL12bzxAU2Ac+9O2to
         5/T6O+opC5niw0hh8v4g2B2MUz+/R3MBW5+5ANBM7s6tqFzymT0BkiqtRaTXcfymPbnt
         tQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682311707; x=1684903707;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=J+WEFRKh96iw3qvkIR7fBM5XFwbbFmZnZg/BfhlSNucj26JyHub8ibIDrKkeggby8A
         UVwIo/t9t9+qiues6oPycboXUoBeDeIdrLbgZmHqi61vWZNccE1Kfaa9eehCdWv1kUsr
         ZnV2ESOHh3REf7DMhfK5SByKhKOYW+eTmEjOK1gPH1E6aLevZVUv8ZM8TfG42Kop2nMj
         sPfkPxsVBESQaAll1BI+ELONN2j0fyMlNTVcpdk2TRjZAqIBBWtwdysyRcQkwyXDg6Rw
         OmhhJAGgWifl8nww90UzlRi+9UG1MEJbmrvJsOa7pLI8tqotJhB45QWjYOARJ92QH/eA
         WlwA==
X-Gm-Message-State: AAQBX9fhUScW5HsPERaWqVkUkTCYOXmdTYgNPnHdlDbxOLTGdzZzlLmV
        AMGsgam2P7/8nUVPcrNBn29+KHJCKuT41qyOfo8=
X-Google-Smtp-Source: AKy350ZoU4KjhhZ9bPPVymKEBwfYeN78cJHFsMrwLq87pewV4tMsahjBH7xnnM/ELOxol9uZPb8MmhASER0FLWBXiek=
X-Received: by 2002:a17:90b:4d91:b0:23a:333c:6bab with SMTP id
 oj17-20020a17090b4d9100b0023a333c6babmr11588222pjb.23.1682311706870; Sun, 23
 Apr 2023 21:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:234e:b0:49c:a5fa:37b5 with HTTP; Sun, 23 Apr 2023
 21:48:26 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly004@gmail.com>
Date:   Sun, 23 Apr 2023 21:48:26 -0700
Message-ID: <CANcht-S5UB0CB3nXVDvrxwLeZv1bWbFSPSDtZ3uw_3kPuoq9BQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
