Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A965F3FC842
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 15:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbhHaNdQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 09:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbhHaNdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 09:33:15 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D66EC061575;
        Tue, 31 Aug 2021 06:32:20 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p38so38686628lfa.0;
        Tue, 31 Aug 2021 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=GeCDFSLFkHR5bfvtTUMyOsp472Ws5rrIWXodPm7S9WQ=;
        b=BHF7fxNGQJoaX8Br8UAy5Or2/hA8l9vQh6vYYRIALA/fGgAgBp3MlxMZjOOpfJC8YT
         hQrrpiI7T0NlM176HHUbzI7Dkh9HBnuEDVaGUOcTUO+OePoyVYn4YIQ4ko9Y7z79pwbr
         nItPhVh5IzD1unVWZrcXcvnG43RfveHWe4McFdXim7KBKLuwqxM6rnOE7dX60iJDVc1Z
         z9f5zZL85iPCHZ40WAfvcfae+cOy4HUKHvWpGcPkEMVFgvpX2NejIn+/QfXfEiK/L2UC
         RB4sOGwxoE78YneyeAMG1pOS3u3A75v1mDuMhIoPP0x2/Uy/1G+w/EHIVy4G0IS5BAsI
         16eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=GeCDFSLFkHR5bfvtTUMyOsp472Ws5rrIWXodPm7S9WQ=;
        b=idw9PagGL0ccce+iCzV1ROolHo+NziGevd7M9ir3Mn/SV0qq2FuPpdrqzAIRsY43Tx
         b56r8Sgc7ipvFaTz21gV8uZTN8Q3AOTirZhfgS56RNBUgcQ4ZWW/qCq6euJwwRgk0vSB
         tBZGeR/i4rHTINRoH1mDVrlvuvSuGrkgNREgbH9PloUTm16Qn1uI5dmvjgiPz1dGJ6qR
         I1UG/RocyHL8V3HHYXv6IP+a1+5ztCZgWvpC5h2BHmsY3Yk+WO0PJpMHEd770kgEnLqL
         I/9WcZuOczevssafQxp8fCNYAERxkY/h8tkVhb2/gKSsh6QurCMmxyB/0a14plgrNp0E
         qn1g==
X-Gm-Message-State: AOAM530n3I6Q8OeaUOy5XWLDSDo5hgpZE5VhSPimPIF2dnquZ3bz3Ylp
        3S/PJTBYA4GecqfJU8O9ndOHwCykAkb1Dw==
X-Google-Smtp-Source: ABdhPJy0zOkaHmnYGTwuWrKtaFfasl3BH9eyKB3YBjINYLVJ0qrXbQynCoPpUp5pVch7HLPqoW87UA==
X-Received: by 2002:a05:6512:4005:: with SMTP id br5mr15045454lfb.560.1630416738553;
        Tue, 31 Aug 2021 06:32:18 -0700 (PDT)
Received: from razdolb (37-145-211-218.broadband.corbina.ru. [37.145.211.218])
        by smtp.gmail.com with ESMTPSA id z25sm1726036lfj.132.2021.08.31.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:32:18 -0700 (PDT)
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] phy: phy-rockchip-dphy-rx0: add support for
 tx1rx1 rx mode
Date:   Tue, 31 Aug 2021 15:58:30 +0300
In-reply-to: <20210830180758.251390-1-mike.rudenko@gmail.com>
Message-ID: <87sfyp4u5b.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

thank you for reviewing this and sorry for me failing my prior research
and overlooking existing Heiko's solution [1] [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=71f68fe7f12182ed968cfbbd1ef018721e4dee30
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=68e0277204c733dff19073686e2ac48239b06fbc

--
Regards,
Mikhail
