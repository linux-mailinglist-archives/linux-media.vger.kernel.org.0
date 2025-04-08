Return-Path: <linux-media+bounces-29564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55473A7F2D5
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 04:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26E2517A984
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 02:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD9B24E014;
	Tue,  8 Apr 2025 02:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq+Nnda7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101D123ED5B;
	Tue,  8 Apr 2025 02:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080800; cv=none; b=UWN+0pCksXzJTaC3TiZxPRH2zivQCzU0cQfR4dhqck6mZBxZgT3putEPGSKTqUw5BjNsrA+zreRJP/d7FD/6KLdujYB3hoivfH0x9xZ60grWIq4oVZdqFWSAzhta5Cv/IwHNm0OtZAnfD3HcJgLBo40NBkLl44vIPqBGjBF3DH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080800; c=relaxed/simple;
	bh=GlZWLABENJln9JuG0rHtIge7k029ZMQOKPM4RNHoN2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R+AQkJt90O2h4SRpUU+7NQmnBMyitvIt03ZR9CrTpffQdrIWi5zK+MLEvFu+tBfjeFe19I4x3uW6/BvezYWisLABknmRPeJJMadT2MHM4S8UbFRHk5RaAFh0VHzLQ7OnKk1TQFoAdLmd7mLJf9AgH+HPtcROYa5s0ouO/WZ0x68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq+Nnda7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c1138ae5so4970427b3a.3;
        Mon, 07 Apr 2025 19:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744080798; x=1744685598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQaDjxACdPEUQ4vCNuqG8VAARrxNSVjkZ9UiooLYn/c=;
        b=Pq+Nnda7mqFmpC88cRaz6pICygCsaovzBSda3nGEB0CubgfUAEUuJgLpQIN5KHFj2+
         ZoUK+vkhcBBa8S4/87ArBM+Mrx4Y7t/RprtDwuNvmUvMbtOsB5Gc8X7esAz217cm1gHz
         hbMQE3b8y4QAfp/MRr3taImowT5cBio7IU07gvmPQlrN+S0szlfiv0g3eJJCs/nOHm7Y
         MDduW3FWtMaWg40RZcilzntL8wAwqxWrMQ3rH6aa3Akg4xkHS5yYX30u9l5ed8+aulbO
         yVU2EDJBwZzKd29y6QJsVTcrGFLze5dlYL021lB3A3AAXvQV369b+rMmx0+rycMGXIML
         t8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080798; x=1744685598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQaDjxACdPEUQ4vCNuqG8VAARrxNSVjkZ9UiooLYn/c=;
        b=ENQYm0tScuXYi4oA56184qnjnEMG1lTixAbS49/iTl3vfc8SdEPfAMIXmT9JF/8qyt
         MT9XsRMuhFz0JVRlNi9wxsaqCJXyRYy5RC9h5tHtkXNXeahqJ2ijgXSI7EwaODNmCeMz
         i9Rejc2fNCX/zzSxz9y48ksnLgld6PTkTUiFambjr035AHs6j9TXbdm2mwBGeodZAV2X
         RvMuaUoEczAqtC7uD+eGQvMC0vBEF1h9ppS8N78EpYd1ajZLVQm3EvApcM8AUhuPOx9C
         +0RP2WJmQL0ajf46Pb7TmZUFSHZir6mtQ20LGtjn7SY7dmUadfD3cuN3f8qBDFoOpO5+
         RY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1DTqB+JBirGRrQ+RjDIcJj0X4q6G8RdIB9HGxMqh0w6QoZKhT8aHyi0CiM9zg2oWrwYTnNenF1d2pxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZxkrrcpDVSmw4h5QFEX31dmxqt57KkNJbTx04EsJYXQB+W8P6
	Y+abeYyYIFIiQwSEg1BwuGLkMo+vN+LrXFkjxBQ8yQoYyKmoSn3ux3DOqtLh
X-Gm-Gg: ASbGnctCL6CUwpHGdVg7ffF378K9nSfmz2yYxJarkCdpm7yc8YH5h1aIBNxSQdoHOeg
	CsABlPgv9ILJUfXSlSwHDr+Q7ZF9bG4f1uzJElVvBjjlvNnutuj4FAlH0eGZrsX/nVgXrCTmT70
	a+zCmLdcKYPFtDUHyJcm8D1WPsTpDTkPfaKPVk+XA/EYbNehAGxy8JztvEq3ZT8wbjhoIcbheGY
	00bRiQKFZxT8wrNaBUzxqyykIxbOTsK9n+imHeHGYCXtXWYmnEg0EC4zMdgm/SuPA1IEqZ6rYxP
	HolHrVBE3Om6vD1y4rJ3msB9OMj0IYTTbbsnGgXyalCnk4mjbLDY31J9Qn0u2us3mlNaUdRzAAk
	OFiKisRhaFdEpElfNgcSNyK2cTJgkpsfr1Xaj29gIDAKqShwzPqMnO7eTWp6e
X-Google-Smtp-Source: AGHT+IECaHrQ+Szc6+kFfW5D5EOAfNaIogqst7p76eUHcSzRzQmyMnSe3v8/og+7l3p/VwYQwZWQCQ==
X-Received: by 2002:a05:6a00:1147:b0:736:a973:748 with SMTP id d2e1a72fcca58-739e4f79870mr20193054b3a.22.1744080797573;
        Mon, 07 Apr 2025 19:53:17 -0700 (PDT)
Received: from kells-Predator-PTX17-71.. (2001-b400-e33c-bd7e-da8e-dc2a-f3ab-1a8d.emome-ip6.hinet.net. [2001:b400:e33c:bd7e:da8e:dc2a:f3ab:1a8d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9e9db78sm9700148b3a.97.2025.04.07.19.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:53:17 -0700 (PDT)
From: Kells Ping <kellsping@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kellsping@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Dirks to the match table
Date: Tue,  8 Apr 2025 10:53:09 +0800
Message-Id: <20250408105306.1.I4aa60f7aaea0752932636a188eaec8b3c7d44126@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kellsping@gmail.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..a8d31c3126f8 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1


