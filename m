Return-Path: <linux-media+bounces-18816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA6298A1AF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5D2284E02
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F73919AD8C;
	Mon, 30 Sep 2024 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="baLfaxYC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880FB19C570
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697903; cv=none; b=rACUdespowXEq4ZL8xM1MYd7jH9c5vYQr/kk7A1EFiF+OmRMI/7iCjIcAK6ihdkvJlZdWK049uZbBkhdToPLHVDMbl7SGtjZzGFzf2j/zl3UvsHxwBsMkJoUQEXPCHCTDAYB4RPDdGMy9fXzRYh+nAWzYxhgQ6XWe2pZa7YjwzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697903; c=relaxed/simple;
	bh=eMOK5aR0wLanv4sEh7pDMzrsrhbN/JSAh3wt+zLwIY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpwOzD5XMdW31pnPxOHTxORr3t2qvlJEV2n7yXLJ8+dWTkMYVPNmJhMMLhr+Cnp7jWUat8Mft7Pwb7eCx081Ej15iajTylyKPDug7/F+26GsO1UffS1v/Sf/GSuiukQRPhjr8Fjac+YgZIDmkOgdS8cufCiF4uKrDOHP8ncVjJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=baLfaxYC; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6cb2824ddc2so34593606d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697900; x=1728302700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtS18Z/ph+22OpFMjBj6PDOp8BDjMiQU1mRrp+tqPao=;
        b=baLfaxYCmqV9bOlT/i4LHX+6b51SXbHa35IqdE3o62GoQm6mPIywmevVUYOjqdsDhF
         4SqhLrP40/WhATl8ZaZrFjCRR6hn3k98hgbDBwvKoT3f04DplgWsWTfUN6fiaRX1zEA8
         eV1+azmqSOUERKeWqIeUml3r9wN1kHqNoHtUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697900; x=1728302700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtS18Z/ph+22OpFMjBj6PDOp8BDjMiQU1mRrp+tqPao=;
        b=rYpPEvSYtVOuK3NjReYxG0GMyAZerUS0g5nKdW5KeXubE8T3pKgEbt35WBdqCegvx8
         F/ubkmgWnWz/a204muqIAoR6F7NWhqK09DJUfyon2dQlVEJj8ArmQHmd0IWim5YPUQtS
         0918wwOjHcxt+Hf13EgWepYcXugs93LNCXB82L5rIe79Hownk0qSBl1TXVabjm46Wb0Z
         +L0MDYH6/TnkrM4dnQJrr8qcb5ZAvqYo1dTOCPkDlFYSxMfnzStV7iBHKv1EGOzkiszz
         yWkSL1DoWdT+jubcrpDQYOE/PZk8ARgHbIcdrDGlTa21lMdc86heDmMQBmi0Kn0wxZa1
         zwOQ==
X-Gm-Message-State: AOJu0YynVMdm5o0cKG4m4VTtKbt131B0uJg8y58zScTjI34raI10du+6
	aeaAFL4KdbcXvMFm7AgH5rBKFf3v5sc9TgeQVClWG0FqVCqiCb2NbMvbSx6dLw==
X-Google-Smtp-Source: AGHT+IHa6kByUW3tXKJTo1om4uBb1NLh+sbjdquYal1McTRlR2Y5X69QcY3HAZ4VU5M0CeLNOC2NrA==
X-Received: by 2002:a05:6214:448c:b0:6c4:6217:da9c with SMTP id 6a1803df08f44-6cb3b5da202mr213240066d6.17.1727697900493;
        Mon, 30 Sep 2024 05:05:00 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:23 +0000
Subject: [PATCH 28/45] media: b2c2: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-28-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/common/b2c2/flexcop-hw-filter.c:119:20-25: opportunity for str_on_off(onoff)
drivers/media/common/b2c2/flexcop-hw-filter.c:12:35-40: opportunity for str_on_off(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/b2c2/flexcop-hw-filter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop-hw-filter.c b/drivers/media/common/b2c2/flexcop-hw-filter.c
index c5a3345c99e9..d64a03452e22 100644
--- a/drivers/media/common/b2c2/flexcop-hw-filter.c
+++ b/drivers/media/common/b2c2/flexcop-hw-filter.c
@@ -9,7 +9,7 @@
 static void flexcop_rcv_data_ctrl(struct flexcop_device *fc, int onoff)
 {
 	flexcop_set_ibi_value(ctrl_208, Rcv_Data_sig, onoff);
-	deb_ts("rcv_data is now: '%s'\n", onoff ? "on" : "off");
+	deb_ts("rcv_data is now: '%s'\n", str_on_off(onoff));
 }
 
 void flexcop_smc_ctrl(struct flexcop_device *fc, int onoff)
@@ -116,7 +116,7 @@ static void flexcop_pid_control(struct flexcop_device *fc,
 		return;
 
 	deb_ts("setting pid: %5d %04x at index %d '%s'\n",
-			pid, pid, index, onoff ? "on" : "off");
+			pid, pid, index, str_on_off(onoff));
 
 	/* First 6 can be buggy - skip over them if option set */
 	if (fc->skip_6_hw_pid_filter)

-- 
2.46.1.824.gd892dcdcdd-goog


