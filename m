Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82B7014F869
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 16:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgBAPRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 10:17:30 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37752 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgBAPRa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Feb 2020 10:17:30 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so12221519wru.4;
        Sat, 01 Feb 2020 07:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+otQPp3zrLVa556OXUQ5za+rzKaIU/8Fg4cHoOtwPQg=;
        b=Ryd5+M9FGBT1T6AB5pgQCRYXIbywi9PFzEv3qtvxsJv3BdrMYRZCWAUR4NUuMnjNV1
         G+7yZUh/s4Wi99D2oLCdJwaCeen1Ir6KeHlpr4IDYj0AAoMcEjxu5bumAexcD611QlsD
         X2jCj/3/VQlvgHqhuRTIMvtgrAWXcXc6KSBPL79l+YDAUqIeIZ9x2hMSTIGLNj+qini2
         mtwSD7aICoeeLV55+ABIlgjjoNKLJwRV56lGaRqFdj/0zpUHjo3w7Hhqjf38+bf2UoAY
         9Ea5H/fiCbF1COFMth83oyqyT+YCG6Rc+B21NlGCkeYVZr9vBP00Jk3ak0FQ6K+l+zv9
         lVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+otQPp3zrLVa556OXUQ5za+rzKaIU/8Fg4cHoOtwPQg=;
        b=KhRJ/uCkMcn2B6YBOWqTO6l0yizW3FtPIHSgOroN8zRNn3bAoIKVFZohuXWlPM6ZHb
         i0HI6N8jNjGYBWOeOthvFI8IvY8V2BF/bjucy0EAu/mto/m6cl8whs1VFu1z+OC1cJna
         INPluJxqeziXz8Nk+iCSxjiv8Ol8xHzjMZYbZsAP2XcAb+sRWNgq6ibWudfII2B6oAZS
         UWtI4HN+0elcaha+r8i6DfIcuLyttqcdyDrEl7fkF1lsGM2PpHDOsoS14QB0Zu28gEou
         hW6WjB6j7ymqBmccGnvRkhLKi+syq7bCPiMPHGa+PMUVhMb+Zc35qFZ+Ww3M+htYXLv0
         tsQg==
X-Gm-Message-State: APjAAAUq0bp0Q1rb5elSENC4ucSRfp0EtiQZCyXi5MqivjPN8j9oxn78
        cOuO7ruDqDRe6IRvhugbKIw=
X-Google-Smtp-Source: APXvYqyGdXFFw+L1DBGkw1sSnNRY2sDzKNevjHnOe5Us0iROPI340tlOcL7XRD1zX2UfSlr1hCdduw==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr5259458wrv.302.1580570248225;
        Sat, 01 Feb 2020 07:17:28 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d5f:200:619d:5ce8:4d82:51eb])
        by smtp.gmail.com with ESMTPSA id y7sm18881156wmd.1.2020.02.01.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 07:17:27 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: correct entry in TI VPE/CAL DRIVERS section
Date:   Sat,  1 Feb 2020 16:17:14 +0100
Message-Id: <20200201151714.26754-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

perl scripts/parse-maintainers.pl complains:

Odd non-pattern line '  Documentation/devicetree/bindings/media/ti,cal.yaml
' for 'TI VPE/CAL DRIVERS' at scripts/parse-maintainers.pl line 147,
<$file> line 16742.

Commit 2099ef02c6c0 ("media: dt-bindings: media: cal: convert binding to
yaml") introduced this ill-formed line into MAINTAINERS.

Rectify it now.

Fixes: 2099ef02c6c0 ("media: dt-bindings: media: cal: convert binding to yaml")
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20200131
Benoit, please ack or pick this patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f77fb8cdde3..e6890fa280d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16738,7 +16738,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 S:	Maintained
 F:	drivers/media/platform/ti-vpe/
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
-	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,cal.yaml
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.17.1

