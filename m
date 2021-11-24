Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C272345CED0
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 22:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbhKXVUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 16:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhKXVUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 16:20:20 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A36C061574;
        Wed, 24 Nov 2021 13:17:09 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id w1so16327312edc.6;
        Wed, 24 Nov 2021 13:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=00KTYtEVsB/JgICgL5+7F6xvknBL/LuJ0axCWD6ZE38=;
        b=YABQUa2sTClCdEKU4nDfoxB4kzih6LAkw1DAz0wdhwvX86nUDQi2m2uDlN/Ms4n6IS
         objjQ6AiUowfgp2AADmA5akYyXYW7TaK1E2CnONS4Pr7fZZ50J1uwJnPBFfoapCG5T4H
         U/WDILIcJ5StmFe28ItK+Sh6zrH2XDZ4gT4LBwvh613zFrewXw7+utEmMPJtcxzHyu9n
         lo8GAPVz86eg+vjQN/KK8KiDZZxgU/jymmvRPRjPM2JiXb5/iomX9n/YPhay5nCAju+J
         rgCRkWhrSyTGAqh3bTPmUHaud7qMdUtyr16NHEe0VnOoigwGA+Kp0rbfLJI/Nh6b0zRx
         Alug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=00KTYtEVsB/JgICgL5+7F6xvknBL/LuJ0axCWD6ZE38=;
        b=sVUoLr4b+56ew/wSlUFaMpq6SnokBsJ4Ta7bxLYVOIkJ0iSXSeGoRtAtqNRYWMREoI
         rE5CoSbBX71QNz0zmjTuVK2IY5pqJtTpomrDClIwX1Bw6xV93t7Rn3KrLyOa4IkIEqm1
         wZVI116oPTL2jECcykvyr0XEQm8HIipUljvFjdDNmvwd5qCSIM7epydmHF7CpvGeRI3R
         D4jlbljeWFjDfRwC6B3/pB9lO74k37b4xgNoKA1Pxtb1JyDCTQS7XrCYmiZY2FKHm304
         FwbnAcaJIYmEmAL9/kByrGQZdzGf/gfOkjg5SlsDklTV/knSzTxHluhr9GG4J49ZSnxD
         lxlQ==
X-Gm-Message-State: AOAM531oHHeGN8zt9fX12V4npC6wWkZFGNxifUcHdvdgOWVjijVa0iY+
        Q3VD5SuyrBlrrn8+TtyxnNM7e13v1WHBnDzyAHMJZhWGmPU=
X-Google-Smtp-Source: ABdhPJy5YC+xwZAOE+g84VovP/EOQKJZFftEpZ+x89MGpsgWp/PR1rmIydUIzFlwq5aUVb6ULo6f+PQd1wbGE5bTDk4=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr24856230ejc.77.1637788627944;
 Wed, 24 Nov 2021 13:17:07 -0800 (PST)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 24 Nov 2021 15:16:57 -0600
Message-ID: <CAHCN7xLncsxHcTirn+U1d_x08x=F+txhiJ+LF9GAi5rWnJMUCQ@mail.gmail.com>
Subject: LP-11 Timeout on RZ/G2 with ov5640
To:     linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        cstevens@beaconembedded.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am trying to use an OV5640 camera sensor that I've used on both an
i.MX6Q and an i.MX8M Mini (with good success) on an RZ/G2[MNH] board
connected to the 2-lane CSI interface.

I can get the media-ctl to show the routings, and sometimes I can get
streaming.  Often, I get a timeout:

     rcar-csi2 fea80000.csi2: Timeout waiting for LP-11 state

Looking at the various mailing list e-mails for the LP-11, it's
unclear to me if the timeout is caused by the sensor not doing
something correctly or the CSI2 misbehaving.

I was hoping someone might have some suggestions of things I can try.

Thank you,

adam
