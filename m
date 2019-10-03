Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553E8C9EBB
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbfJCMpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:45:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53242 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbfJCMpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:45:50 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so2178688wmh.2;
        Thu, 03 Oct 2019 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fsP3cZqmFOpdaGYxxpYbN4dztYokivLUizeDopvF2Jk=;
        b=FkjmAdLEuwWuX2q7hwt6yjHPb2HiLHCYK9FJmsjxGOx7/KamhQpBriKzCLnHngt5OI
         4cz0NdZ2BitH5aLrWz/PQtu+gaFs14gKVU8NNxKJ0AJg4uuCjSoeRd+htU2n1K4ey4eF
         ATfBY2wq1wE0OOhgteka7F6kBqywZh+H+WPUrUD9e3z2NmKyneAdi3KSZuaCwlBBkipY
         QsOnBhFJ/DvzvotrF5e2th/cgzeNY0eGaGnWazx9fHHroxP7pg4hHmHjGI1Qz7kEuivg
         SHxXx/t18YNm69EVW8bu06U/KWlnUDAYa7/e17LD/4mYt4N2sDS8Y2TfmV995VY1BN91
         RfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fsP3cZqmFOpdaGYxxpYbN4dztYokivLUizeDopvF2Jk=;
        b=SOEbq85AV/Y12W45sfpOpouHz761z2tlG1kToaak8Vb5skivIyKduPQKqXj5ZrzEDs
         ciz4ElHrXlm9JV3C3vkJaQWK5Hz9uuOcz9mR0VLlyabqS7dNVKlhkvdd9WpNw/Ul4Raq
         hYA1VEJ5Toq2piTrlG+ETc0KLBA3+aFjPgknlc4QqMjsQze2UiXybXoNraszEnYef3wl
         YHzz4QaGf7orMIzkzmrRY4N1rhsqSRBuezHyNa7ga8rh2bskKZ22DqELEGT7AKrdBKxo
         VQc/EEkZLCjo3CfqGLwN2FlnAtOW8Km/0vWZYqQ/db9w7wMsHpWxGq9yFpq9Lm8sHug3
         roLw==
X-Gm-Message-State: APjAAAVYiH1OLFQTvRjLXal1/OdNuMpABCsJAcWzqVj8/zJb3VwlmSA/
        Uzj5m/rNridsaeavnmN5L7/FmEko8Xk=
X-Google-Smtp-Source: APXvYqycbt37vdd4ERJbV1fj5BjmylITE0M1F2w40YExNd03ARYXVgP02Pvmdyw3Q3uIJoW2nLmduA==
X-Received: by 2002:a7b:c203:: with SMTP id x3mr7178029wmi.8.1570106748107;
        Thu, 03 Oct 2019 05:45:48 -0700 (PDT)
Received: from localhost.localdomain ([46.114.33.103])
        by smtp.googlemail.com with ESMTPSA id y3sm12880507wmg.2.2019.10.03.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 05:45:47 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 3/3] [PATCH] af9035: Add Logilink VG0022A id.
Date:   Thu,  3 Oct 2019 14:45:32 +0200
Message-Id: <20191003124532.10945-4-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003122027.GA2674@Limone>
References: <20191003122027.GA2674@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Original patch from Andreas Kemnade.

Signed-off-by: Gon Solo <gonsolo@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 7828f8567da0..a02cafadfb49 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -2122,6 +2122,8 @@ static const struct usb_device_id af9035_id_table[] = {
 	/* IT930x devices */
 	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
 		&it930x_props, "ITE 9303 Generic", NULL) },
+	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
+		&it930x_props, "Logilink VG0022A", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
 		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
 	{ }
-- 
2.20.1

