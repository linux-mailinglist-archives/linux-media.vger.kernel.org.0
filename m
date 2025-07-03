Return-Path: <linux-media+bounces-36714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F33AF8229
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89FA1C8787B
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DF12BE64A;
	Thu,  3 Jul 2025 20:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aTtiHxly";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F0pq2BS3"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FA298CB6;
	Thu,  3 Jul 2025 20:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575982; cv=none; b=ayn9f01VTU46G2V7SOmFaxoiHpGYeepWD9MnhRDOTKm+cTzMEccMtc1yzdVJ4vjw7GLTEpJQD2t4g11Gm69oM8kiOXGrI8B5osERca8QgcEliOTd/vCURA1KXSahksJ6LVvJ97dhY+NEKCskRzMqrIRMGItBwQ2zkHWnayqcnmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575982; c=relaxed/simple;
	bh=R6R/S55UsbkkGyc3/ira+vsu7IRUs/aFqOW9KQrKCds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rs7dKKuONeoWD76CYo8VCbIURgTxI3jSnRyVE7LdqxVzK6dNiLwT5rBarsfBCgUQa6/VqC7VPsj/TSArFHdov6WRq4Ap6XUcTCZMyKiTnPSUynqINfWfFGrPbAnca6iKDxL1euGcTLcSOrorQ8lzRolS6KnGgbf4IUU7hYSUSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aTtiHxly; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F0pq2BS3; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1D5B61400DE6;
	Thu,  3 Jul 2025 16:52:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 03 Jul 2025 16:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575979;
	 x=1751662379; bh=cGeV1/HGwhkpV8llnrIrhiXYEpfRD8O6gX8LVao7tsk=; b=
	aTtiHxlyOI4i59MQzhE+VzeCVZvZeKLGtDrV7jY/pyNNd95mOCr1WITLOHocgxRl
	QV79c3sCd3KWMYZr6k+HXblmldFbDwjXqQsHQtVEbG3uAyG/aNlUp/s65D1vDfQk
	ec4IFzfy6P2fDuCsru3/1hpwH7whFIrLjIgVit8A9IWedz4LXAtAmlUtGwN9NbIh
	Ueh9aQvQP1YeRCAbBkL3v8Fe1XWVafA8tc7+ZZUmoJmwdbwU/VKE23Xr5V9Eq0jl
	oqp0kMYoHodv4IEll06XwXKTx3MOa2F8y/OyugZ2wRASrjPP2KDk6+6+hE9586Oe
	2njEhB1SGMXhCnuXqEwcBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575979; x=
	1751662379; bh=cGeV1/HGwhkpV8llnrIrhiXYEpfRD8O6gX8LVao7tsk=; b=F
	0pq2BS3cm1lYIRPKhTvYbFklrSpFgnlNHdo2NWqmkpqnze8uZXqZGEZRgmWt6Axg
	UISe8j/HpYQ+sYSGmQ1NIyt0drRsEaKBPf2rUMOTr8v7N/tAUFrFM+lKDU466UOY
	9ZIYVML6zKYiw9xDKDYc4kukHFv2+EDm0XvhOd1oeSbT4mXTcK+OGfpht5Roxq0i
	M5AowkrhjxFO08CcopzdTeY9Snu9ZqXv4cbr90lUcq2RGdV7zvwh2rgWzEM1BJCN
	yp5hP/0Eq55LLHpx0khfffjqdCZufDuNPuBd69TT6XofgxiesiUlWwM3U9GTEr0l
	AMnXbGjJRaVMuTP9mqv4w==
X-ME-Sender: <xms:qu1maEHiNmr6ytep9SOdWOf0cQyIBvGiHSqbMk9xdTltcIzQKRaTDg>
    <xme:qu1maNXXhsIR2ZWYJMKxOh4p9Dtt8FTv5-u5MY38ZYFWa3N7bt6C1O3StJb-vxjSz
    1sb6YEq6T2nChcTJl4>
X-ME-Received: <xmr:qu1maOKbD5907bQO5fc2GBh2sm-76Kp0ylsdDTCjlsM4t3eyEVyds7m-z26AAu8cNTO8kFXKuW8ksexlhZixfYt91w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:qu1maGHX7bRBCGli17kHCvv5DoH7bbC9Q0g9gFNxWkhwLFxyJbZYQQ>
    <xmx:qu1maKWedaAqaPHoJCMTtDiRjpOVvYuOthXBZ4fVzY96Ic6lLdM4Wg>
    <xmx:qu1maJNmn9WmQS87VewtMgIewKnnDphtDI30Bl4YGWcgpaR93OQppQ>
    <xmx:qu1maB1QKKdOEzmghd4uJHf5s9xHKjGAUM4qMjX7nEJHzKKUd4lvMA>
    <xmx:q-1maIaFHlLmnWh4yiewEbD5xaBbJ4o2tll9kd4-FeoDLAaKUnj1P1MB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:52:58 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 02/11] media: adv7180: Add missing lock in suspend callback
Date: Thu,  3 Jul 2025 22:52:14 +0200
Message-ID: <20250703205223.2810806-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The adv7180_set_power() utilizes adv7180_write() which in turn requires
the state mutex to be held, take it before calling adv7180_set_power()
to avoid tripping a lockdep_assert_held().

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 2519bc53333c..0c5511a7667d 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1565,6 +1565,8 @@ static int adv7180_suspend(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct adv7180_state *state = to_state(sd);
 
+	guard(mutex)(&state->mutex);
+
 	return adv7180_set_power(state, false);
 }
 
-- 
2.50.0


