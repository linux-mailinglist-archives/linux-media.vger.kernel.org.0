Return-Path: <linux-media+bounces-38870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FAB1A8BC
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 19:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25BD9180138
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9392264C5;
	Mon,  4 Aug 2025 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAMEhejm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1081CDFAC;
	Mon,  4 Aug 2025 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754329751; cv=none; b=tICE8pRuvoPAfoaCnIVOKCjUxUt29Ba3AVrJb704Rwek+xRadyUYQQs+Yq8kujLGmR5zW2YWzW6eqZ61NHS1+ncMfCwH7fK1qz0hAJDc0mnH/6znXjqodNmleZYp3NzINHjLVI8FGexnMPE7uHnP/0nJnHFsyXewwgwfueNl9I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754329751; c=relaxed/simple;
	bh=v4pUmsqMa6OFko8oVu9RDVTG4nJaK5RpK2KGBLtv8XY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OnIltGy+KqFTKPBFiX1oQ7L5Xd5a21CuM/i3c3szA/8J/kAJh9mVfwvb8r3PcjFqmDNVpskkJnf0CmMHFi5RSyrNuwJpef4iohuiMWcFO7L+5KUVk5OGpOSTtscrSo5Jaqc9+DrBvXZquXiZSS9RRd0b8pHlBv//xcrtll/yL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAMEhejm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-458ba079338so16421615e9.1;
        Mon, 04 Aug 2025 10:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754329748; x=1754934548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0PNg9gSDjOiob/s8QaN8PpDUNVskdCO9RYGBdtiZaAo=;
        b=OAMEhejmVmuFQFq38lk8jDjtqevsjHWzfNxs91/CvJmewbGqK5yJJYj3GTeWjmJTvk
         QoPo00rInxoeRc5wJJnAnenR6nmsW6ROESB1K5jC3/4Yl8hDH0/AwMh42zAwxeP81V6J
         HWF+TBogtQC4+LLClaerjkkAjrfXW7r7TII/ei5QCcyiPTyks41uT3kAj6lQYjGDgJ5r
         a7loaHCU2+by9ceG39jzbvYPPs8j0FNgS3Xk+1FZMjHNQzh5kjYoyyFbhCz+KhgsGWBo
         bwbLhF0a4BcdYp84YH4Y8iuDsTrErpPEs4LCKkBQZiQaZRMSD8ShoPRZPP0RI3u3zz+3
         +FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754329748; x=1754934548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PNg9gSDjOiob/s8QaN8PpDUNVskdCO9RYGBdtiZaAo=;
        b=hi9HKIuGbWyZF1sEIFdFEEMgAb2NyU8r74kuxmVIXYeW+7ODW+JBTp25J+mT1EyrEe
         t4lEfz8fieu4jcaEwSyhLC1tyw6V3vE8v88PqgLO0ZsIwgQ+Oah5/MTdZR9yp9hxsgrh
         cnIMvS7aw+Jx6qwL8sbS7pynfYFvCKS0/C9MlBCzrLzGheDbKAgzIEOcpJa8u6GOhW2n
         vmX3vl9PT0i++w3HDcpT3bNblavi61+WtgnyVElkUEN21klaKa8SGOu711J4sBGelFl7
         IISCcQ+PFD/XalidMe2usgYNG8gpo1yQOigCFJrgfv/Y2y6KBkW5WWCZ+KM1pkI4JgHJ
         hDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX6IWuuK3A7qpYCAy6QZ34WK+ukM9wJCLu3ZzUu89i9KdWJw4/Xzuht5sVhlsjxptsf3W9toIIbFYdg1A=@vger.kernel.org, AJvYcCVsRer8BKgL13oSlEh1i1Mu4SUvl+FLwXQAJH+0B2gyBHcTclzHIOQ5GymtOManCLulO1LeORJ97g1J2dw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eu1Zo3BshDaPAJuUhh6jcU44YyXTJzOU7DgX21piUgLl9oXT
	PO4yXUMhwN+fQH1bI5OBcsHkwqVCXJmIEFma+RFLqXU+AT0VpQLk/1tJ
X-Gm-Gg: ASbGncuBKiUa30888WqxsERDa0laC8dW3jhTcIcxUq+R6lFiRWF9ZiyUffh57XmVEbb
	ezwEgQRXtiiYvDlgzB0kOqhFoU0w7c+qPIF8GI8yNwj9df7Dp1ZH1JDepV5dVztPrc2/pk11Wd3
	kojrSZyipC9jJtUGIHHoNQmYgDgBZtmyz/GmVRmZhY0nHkYi4R8RxFOX7bcZaq1FrunLTfGmpyE
	+YNfWfBfh6INDTBodj+4MBNC9s4NrAjJrBRi0XQY/URSyTs+iOfAHciLvmRlrX+BleQDgNzoL8g
	mKMrPngmF+X/VFeuVFjpBmSAw3HIx0yrxbzd2YrQWmhpGv/WL3OdlupGRYQq7Rc5lhXvJ1Y90GG
	wPN+uaELBqbSnsYy01O+x5oEENf+v4MmwEPWho3zxSXjs/+opgpO0i9M=
X-Google-Smtp-Source: AGHT+IFOOE3AXvqzuEIjTYw9u2iDlmZZpzl0a6bpUDI2FU8kwx1CCcCcT3KRIH5cRtf3YuJwjOSfuQ==
X-Received: by 2002:a05:600c:c119:b0:456:15be:d113 with SMTP id 5b1f17b1804b1-459e0cbf682mr3528715e9.1.1754329747710;
        Mon, 04 Aug 2025 10:49:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:16a2:6713:7d00:3d48:427d:c564:e107])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4595cffdb28sm76021935e9.32.2025.08.04.10.49.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 Aug 2025 10:49:07 -0700 (PDT)
From: Osama Albahrani <osalbahr@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Osama Albahrani <osalbahr@gmail.com>
Subject: [PATCH] media: av7110: Fix warning 'unsigned' -> 'unsigned int'
Date: Mon,  4 Aug 2025 20:48:59 +0300
Message-Id: <20250804174859.9419-1-osalbahr@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warning:

av7110_ca.c:29: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Osama Albahrani <osalbahr@gmail.com>
---
 drivers/staging/media/av7110/av7110_ca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
index fce4023c9dea..63d9c97a5190 100644
--- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -26,7 +26,7 @@
 
 void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 {
-	unsigned slot_num;
+	unsigned int slot_num;
 
 	dprintk(8, "av7110:%p\n", av7110);
 
-- 
2.39.5 (Apple Git-154)


