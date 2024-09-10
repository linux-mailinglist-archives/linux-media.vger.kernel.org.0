Return-Path: <linux-media+bounces-18075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD89738F5
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 15:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12A04B22FB1
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCB2192D86;
	Tue, 10 Sep 2024 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+Q5dYwk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC3B757EB;
	Tue, 10 Sep 2024 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975874; cv=none; b=MvJ9zvloFf8DJlKM3wgDBBnw7erxoN8BbaCnFRzHg8AwbCqs8FdVPbMBjHOpOQlraSqgwvQDAlkeFGu8gp7MvqYhrRnGSgdwdLOfZfpNLTEpgUsKjTF9/ZviA1pZ3/NzCbW6Ou0jet6MyrWbgUoHuFfVKpnzgjNeMai/618SbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975874; c=relaxed/simple;
	bh=DXByzTTy/f415QVKdUTEQ3xm+xTMxU/+02D0OFJZ4Ao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T7AN1xECd4SuI12VJBqwd6hr8L6d6s5Zy6VaK+E/jzyfUZ5YyPKOTEj1ihUJ969xBZRRG4ueJ64+EhNvzhRn04W/E0kGbCwFaTTHwIMJp8U0Wu3gWR6BcZftXN5K9c88cXLQpron81eioWfKpZl7q7va8eyw1PW4rfHPckujpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+Q5dYwk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so24184966b.1;
        Tue, 10 Sep 2024 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725975871; x=1726580671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbzSAdtntG8KY2qP52HGIskbSqDIE6ROJSa5o88LDvA=;
        b=g+Q5dYwkBWTr8BDfH7gLNdh3AskCYYjbiEj2quOMV694sCl8Rqj6QyK0XICWsLWbGI
         JEyiWMtDq8yfjs/A1/ky2XF0aHRYVipK0qQ/BfKXB/+qpuS86UYPxwwG0BaqtkR7Q1IN
         zKHE5Rqn+KpVGE5qZYF5QL/hh+Cjzk2C+YZzHN7Z+Adp8ppCTZKDUNItYs/Pjikg0RgT
         013Tf+2LxkUn44KJaR9v8G6VksF3gjzijVyFUSxde17vKs6I6gLdwMUgBZ8jApbs1OCN
         MphwUTV+9ah3/O0AvgpGZc8jaKZ6XOZnFNayLfg2NykRqgZPefDNrI9zBKpJB6O1ho9u
         KYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725975871; x=1726580671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbzSAdtntG8KY2qP52HGIskbSqDIE6ROJSa5o88LDvA=;
        b=UKJzsZXOBVJK3ko2UhS0H0GIWAF+LPkBkinhS+1hcwjXkPLA97v9hlRDmzxWvx+cGd
         /VB/TZdgUPCDXvCJADsBte8vJ0EfmWy+Th1wB4RywEjuqk9fZhiiI3cGTGGXWkrQgvyH
         6KzeJ5hMZjmCMK2kgEj5ufYoKE18E/pQt+6f4sQLyzAv4mk74QO6+g4k6Nmbklb9hpQa
         KNthLOD5oXJm74Po97rY/jeyWFyRKmJ0V4g0LsQBNv+WS3BuLF3OWChrRymQ7zLTfGDy
         zDyrnLhEieO9tMQMTu5rACXziBOHTfSHLMAI5yQy41iaCLaDGfBkklJwrDLrzpz3HUX6
         p5sA==
X-Forwarded-Encrypted: i=1; AJvYcCUir83aJKCpsfvke7lVaJ+nxzUVSXbn0WQrdwSitu+RqpK58ooLdnxdBBPEsn6nJ6ZYtA9jeeaTHECiC6k=@vger.kernel.org, AJvYcCVyo6FWQAsmlPTYtZjVzt5FqALIoSPB05CraA1C7TSXdUphAYYhNNHjpZ3lbRh9o5/duO+dATBnqOLU9cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvsPB9MqpTRfIOIITYnsi/7u4CPxW1M36pQZNyrFS5neebLpGf
	upRmaFnOtAqPGVxkSyQRSttIq7M1alhEked3m2L0bM7JX23vftKI
X-Google-Smtp-Source: AGHT+IGRz8xECKskw1nSSSppCMSPIUw6qv+o8Z3vn6OMWZUihaDcaFcxSGXDnMsbGuw00YMKTcmBSA==
X-Received: by 2002:a17:906:f597:b0:a8a:71bb:e9ef with SMTP id a640c23a62f3a-a8ffae0418amr104584166b.20.1725975870754;
        Tue, 10 Sep 2024 06:44:30 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d65cf6sm481182966b.222.2024.09.10.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:44:30 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: max96714/max96717
Date: Tue, 10 Sep 2024 15:44:26 +0200
Message-Id: <20240910134428.795273-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,
This patchset add missing HAS_EVENTS flags to max96714/max96717 drivers.

"If HAS_DEVNODE is set, and there are controls, then HAS_EVENTS
must be set and you have to be able to (un)subscribe to events.
Because the controls can be exposed to userspace via a v4l-subdevX device, and
userspace has to be able to subscribe to control events so that it is
notified when the control changes value."

References:
 - https://www.spinics.net/lists/linux-media/msg220721.html

Regards,
Tommaso

Tommaso Merciai (2):
  media: i2c: max96714: add HAS_EVENTS subdev flag
  media: i2c: max96717: add HAS_EVENTS subdev flag

 drivers/media/i2c/max96714.c | 3 ++-
 drivers/media/i2c/max96717.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1


