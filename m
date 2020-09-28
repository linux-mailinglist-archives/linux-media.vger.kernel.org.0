Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C831827B15C
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgI1QFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgI1QFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:05:31 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F98EC061755
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:05:31 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id k25so1474679ljg.9
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=DAiDcX/e96Y0O6GpPPn9vJ5ylAzcQ1h4j6Nv1AG8Pj4=;
        b=ix+R30FendGN8rWj66uC9zbA6ezW0e8DfJvgq0rulh6f8s92oB31P26U9kWDy045o7
         uX4TkY6poGwAoEQR275Twyv7FEpFckr+CTQTon3sDycmcgZsdTzgS+UHLAuPN1cktzTy
         UWHnrgrcs+ZoM/gUch0UmI39UrhncsFAcx0PVYJ+//VRxV5mNRBg6e/Z0BBu6qnooiCW
         4q2djX/NKlhPivQODaISInGhgvyuUtE/UDsqeLoul0tBTsPLIWfTJvoD0bswMgW9FArN
         QKdhw7Z+QuiM52d3f6F0FR3tm4XUbVmt3SOmCwM+d9hf/g5f11l8t1BGDzsoUcocxs1l
         3uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=DAiDcX/e96Y0O6GpPPn9vJ5ylAzcQ1h4j6Nv1AG8Pj4=;
        b=KXV7g/+LfWGjaPlaKz3Oei1Fjsk1WakOXzhhgb2/GLhOgQlm2OtEkFswP3UUAt4ZlB
         Q68qA+hVjn4Pg5sTc4h8q80Ce7uGAcmy9usj6jENDweR5tONc5aqvH8e1hh4RXXhSP3g
         Ix09eVI0ZX2KLkJoMxT/Mv1wBMawa/Qn5UOr7ZqYT9T/1YXhJazDon1Pwb8H2mI+OYH9
         tFqIHMltKD9EcspwCHaE0TrRvvffjjP46QjAKsZ1NeVxQjfVnoLfGoVb4NTbNDv9IPZP
         ZpKgU/kpj6ccI3+q/gY3hGid5OuC1xPACnOHiaIO4tac3qVMdTWBzYvlXHNP0Vwge4Ec
         cZnw==
X-Gm-Message-State: AOAM5335q3W+HtL0b/UGFBw6OZxXHy7SIRGmjKRn5DlKCfHVNFHw6Dlt
        hzNzFwXcVzX1T6KEWS2PmsnQTIA3U71iVQ==
X-Google-Smtp-Source: ABdhPJzUlhmFC7ogwWvHeP7B7pqZF+ks72w5xnMAad6Stoz+lqQ47R/fy7+pCKq3OkIadCot4Hw3Ig==
X-Received: by 2002:a2e:5849:: with SMTP id x9mr704691ljd.194.1601309129523;
        Mon, 28 Sep 2020 09:05:29 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t15sm127374ljg.139.2020.09.28.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:05:29 -0700 (PDT)
Date:   Mon, 28 Sep 2020 18:05:28 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org
Subject: SPDX header for rkisp1-config.h and headers_install.sh
Message-ID: <20200928160528.GA996397@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm trying to install the rkisp1-config.h [1] header using 
scripts/headers_install.sh and get an error,

    $ ./scripts/headers_install.sh drivers/staging/media/rkisp1/uapi/rkisp1-config.h rkisp1-config.h
    error: drivers/staging/media/rkisp1/uapi/rkisp1-config.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier

Appending "WITH Linux-syscall-note" string to the SPDX header "solves" 
the issue but as I'm not the author I feel unqualified to propose such a 
patch. Maybe you guys can look into it and propose something that works 
for you while keeping the install script happy?

1. drivers/staging/media/rkisp1/uapi/rkisp1-config.h

-- 
Regards,
Niklas Söderlund
