Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722E1256D24
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 11:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbgH3Jsq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 05:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgH3Jso (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 05:48:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B543C061573;
        Sun, 30 Aug 2020 02:48:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h12so2652318pgm.7;
        Sun, 30 Aug 2020 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JD/yNeyHUsDvJLMZBjT/sYWFLZpY6ahAJFA2kbTEKrw=;
        b=CxOYH1Tf2XZZ7ozhzxcZedMl6ZFeem+ArJRljp/K7NlzSMhFQcB/ID5mJPmpTnwcoK
         x42ftohGFpizC38lPudDUe6v74VoQ7U8/ziZLV9rmODALgdml/Xz8xDKf/nDRP2QrCaC
         vY4bU2KMLw13Fpsw1/3H/VoEhyQREDY+rnlVMFikHk7pwFKHy4ZHSM+xa6FrztIHfS8R
         4dU3XAg2Dnsts5Ben9qF4fosT/ryvaF4jzWD2ESJCxSDYhFXaVtb+vgPDkW21ekTQDxz
         mhtZKzchHCegYPaX/La1qObSySyBs5+Gx0CnqZN3aGyyAi6Oq1Jp2ud3v8HhibhZUCdi
         T3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JD/yNeyHUsDvJLMZBjT/sYWFLZpY6ahAJFA2kbTEKrw=;
        b=W9HQ9ocnplTA0pajrU55vXmraoOUO71MRza2ZgcvDXceALdV8kZ1Q74LQNxn9W7bI8
         4/2e78ZFvGo9xq6S/T/c9/dknQZj/Pz7kT7fyXPZV0pGHCTIlz3Jdhz4SkzyG5Q7CFMW
         3NxELZpVSai2JwAQ+DxuQOGyc/4NNTefR9TVtVyxQzQRASMExDfja9t6dvZjtxMIpv44
         qDZ0mNY1kKvYw8CBsbwyYyYrfPQ3XbG+set2Fk5kFe+hMiGhBg3EuK7u2J2z3o/8hgUs
         3TPsPnN+xCJew6nbnxcrGXAw99gTVzLprZaJWpulII981NjPhwClnC2hItgG6jQVDvFe
         0SSQ==
X-Gm-Message-State: AOAM533El2rYfQDMbHA86lLeF6I+Upa39NPwTChD1n3HC5qkC5pN/WqF
        fmKovMVRcJ/kEIlf5DOHV6U=
X-Google-Smtp-Source: ABdhPJxV1I4M0suxwFIohpp3kBNZ+IJ+cXw5YDJ4m9TuuDZofEkMd1S2uMdN62LO7dyv0DkOAlhjhw==
X-Received: by 2002:a63:c543:: with SMTP id g3mr4820264pgd.203.1598780922842;
        Sun, 30 Aug 2020 02:48:42 -0700 (PDT)
Received: from varodek.localdomain ([223.190.108.199])
        by smtp.gmail.com with ESMTPSA id f13sm4597019pfd.215.2020.08.30.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 02:48:42 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Sean Young <sean@mess.org>, Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] netup_unidvb: drop initialization of PM pointers
Date:   Sun, 30 Aug 2020 15:14:14 +0530
Message-Id: <20200830094413.43816-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200830081004.GA17376@gofer.mess.org>
References: <20200830081004.GA17376@gofer.mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .suspend() and .resume() callbacks are not defined for this driver.
Thus, just the unlisting of PM pointers in the struct initializer will make
no change in its behavior. Still unlisting is necessary so as to get rid of
.suspend and .resume pointers as they are part of the legacy framework and
should not be used in the driver code explicitly.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index 80a7c41baa90..6f3125c2d097 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -1016,8 +1016,6 @@ static struct pci_driver netup_unidvb_pci_driver = {
 	.id_table = netup_unidvb_pci_tbl,
 	.probe    = netup_unidvb_initdev,
 	.remove   = netup_unidvb_finidev,
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 module_pci_driver(netup_unidvb_pci_driver);
-- 
2.28.0

