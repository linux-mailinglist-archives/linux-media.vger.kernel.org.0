Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4BFF36117
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 18:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbfFEQT5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 12:19:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37364 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfFEQTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 12:19:44 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so2927213wmg.2
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
        b=xSvGQ9SIw52V+xJMZSJu1t5JISloHTwQ/WcAqny7yeQQZs1S1UcR0Y4sA80dMU38y2
         GM6DmHjk9PmL6JZaXLxXOBZdJrwYcAju226VUJyhkORsLc2qHDvJDwNPAOuow/WANc+E
         oUSD+9NxBoOjnoS3Po5Z0EKMmRNKI7L6wDIBjxmxNVfNcuift44HPNGuHNE7Z9iOju1K
         K8ZqdQyUtq/DUKZ0/ICjCuEL0kPB8rNlVPDATjnZAiYnBuCeYFptndmVC6KLQzkHMyiy
         f7auDVsLTJ8PxPn+kGauN3fZHPjISBgiclFUj9Ek14U5Yy7ebiCeRSNUSX8MwOZ6yUrE
         0p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
        b=bXlAsGzSl1xDx+knXsLPilEVgGZq9BSqXei2RJ8JEwHsVFT3ayV1PnTT9CgiiZc8Od
         iqgUaGGRmmE4IBLGqu9O5iOWzXdnTyUijno68IdsLrf2feXRDl8UlV8jbUqB0ndxK8Fi
         4lyLP7Ff6GyzRirhKuq5LdlcfUh0OGyTiFblYOq7trPomDwXckVoTj21aNEXlaFPbG1t
         dN0Hsk4j2QwGtqcYrUwles2cjuukM9OXIFbMijRKWO0AvZSGtAOt7KouB1/OSJThOt0g
         dPoYG5mAWLdtSZ+/WQq333UFNTb0D2gPz7xbcSEhuqYL7sZCpEcXWzD3AUx+9LY+qAo6
         /1rw==
X-Gm-Message-State: APjAAAUe4fmiirSMFFgEXtrKUy1eTK4uwkwYIRm5N7JP+4BfcrfNgLcb
        BlzdEYoG2P0mcn6+P1lBuNtFcw==
X-Google-Smtp-Source: APXvYqwmf+UWLALwoDRIoedcMvv5gTJrZReDlb+XPS5jcOrSEieCWO3wlZSFz74KYV9MywZPz2GGww==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr20301333wml.97.1559751582725;
        Wed, 05 Jun 2019 09:19:42 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id 95sm40062336wrk.70.2019.06.05.09.19.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 09:19:42 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v8 3/3] MAINTAINERS: Add meson video decoder
Date:   Wed,  5 Jun 2019 18:18:58 +0200
Message-Id: <20190605161858.29372-4-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605161858.29372-1-mjourdan@baylibre.com>
References: <20190605161858.29372-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an entry for the meson video decoder for amlogic SoCs.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8fbf41865c2..7cf3ece9f0cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10222,6 +10222,14 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/meson_*
 F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 
+MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS
+M:	Maxime Jourdan <mjourdan@baylibre.com>
+L:	linux-media@lists.freedesktop.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+F:	drivers/staging/media/meson/vdec/
+T:	git git://linuxtv.org/media_tree.git
+
 METHODE UDPU SUPPORT
 M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
-- 
2.21.0

