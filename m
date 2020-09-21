Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F0A27353E
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgIUVyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbgIUVyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:54:16 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A00C0613CF;
        Mon, 21 Sep 2020 14:54:16 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so1080261wmi.1;
        Mon, 21 Sep 2020 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1e2+LFvtNs54bJO28h42rbrhZqmujvH9xIDpVdek6Gs=;
        b=ZUjpmkz90uzc0mOzSbfJeBueL4Oi94IPGMGmo3qTaczNgiBFIp1aiE/CAdCr6WkblL
         85sZg6DO2zAX3GUZ8cNi3nk0w6Z0jsjLjlD7//mhEQ26qawSWNRV0IauivYaGyZKhCmA
         oY7b99kUs65dPs7tDUBlYMiVMeRxBVsKRWtvtqL6ZJbRmoojU2i8tNZpPqK/CDXZUZMW
         KcJw2qIlaALk+w3NgUcPIuEanySvsJtMCJyPx2nk1le3dAB0WU3QGX5MhujjDbyRrAOe
         +dTWOJgo+hjazpkOXd9dsAbpLNF9O8qnxf7ZGVK4W//ZEMqJYZBq8bm9B8fHRiMT/Jmp
         p/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1e2+LFvtNs54bJO28h42rbrhZqmujvH9xIDpVdek6Gs=;
        b=JW8kXIyhtCWuYB7htiKtC1zGI/qAXR3bGnardvB7ZztND0Gv7LhXyFvzeaTJWzOr6w
         FSHsSTjWXgevY47fQ0FfA91rpu5rdkzn/yNP5sDihy0mgDi1uRFe9UhLxVQ6nvCKhxTI
         7ZqLDH20WEeqm8Ya52hbBL/BRLEIQvjVux8m9pP/SSbuA0KEiox4U694qIWT3em0Y++Q
         iXEBc4aNqK9bJZe6pS8a+xceMZzJZ1Y3XpuTOsieOHqplXgEvB4UTrqI4iIJY01mmSq4
         tlw7qy3M8uIyngMc/vtgZE2yHDRWhnZNsSWCd2dArkSsQsV2VnGni0MDy9EefKdaHrrL
         icEw==
X-Gm-Message-State: AOAM533ylPsVoWfNBM1amQSErfKTZmrcHz0x+e+7jpVTJnVjDsjacu9/
        kD/+nrPaMoVhXf/LkbI+kaI=
X-Google-Smtp-Source: ABdhPJyHePLFDLI5jbzVhYB8QGOYCkmS1RiKrmm/aDzZcSzswgFQO/kznU0v9WAUrLrnOj5kQMv/ng==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr1262709wmg.174.1600725255030;
        Mon, 21 Sep 2020 14:54:15 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id t124sm1282200wmg.31.2020.09.21.14.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:54:14 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/5] atomisp: Fixes and cleanups
Date:   Mon, 21 Sep 2020 22:53:49 +0100
Message-Id: <20200921215359.45003-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Over the last month I've sent a few scattered patches to fix various
warnings from static analysers, but they seem to have fallen through the
cracks? I'm reposting them here as a series to make them easier to
review. If you do have any feedback that'd be great :)

Best,
Alex


