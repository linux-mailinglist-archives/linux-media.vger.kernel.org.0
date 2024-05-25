Return-Path: <linux-media+bounces-11870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF458CF09F
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 19:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5FDDB20F3C
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 17:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630AF1272BC;
	Sat, 25 May 2024 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="rBjnjjvr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6D86ADC;
	Sat, 25 May 2024 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659569; cv=none; b=kaEkNU2LZqR50aLQIW3XgvAarGLRF4+ujT+tcjpr7Ud4PO1VyfCMeOncad/15sxuuQzLhSWZpkm2h9NpVT+iNJ0uQIzVBTb+ji5XMeRf2kd7LUR/m9uAlAq1Y/2yNxDQQq/R0xCHc8EC3vHpVKZqDAtjPdravn/D8YrotWGdAdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659569; c=relaxed/simple;
	bh=Om3NZvCxtJY1djqmk8YtJZ7Skx1MOPWZ7sgcR0GhLHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVgYfsIcetsGVf7cTrjHz50V+aG6VUZnyv9qnil6wueficYE8BNfHoLanf1pn7/Xo7N/wdvM2RSE/qssViZdpmmuf2tCjH7U3glLaxtlUEi7nGHqiQj0gHUPS5UqSc+VGGtfntI02JKuc4NBdsTh3+vHeKNsCVDbx+feh6SDPZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=rBjnjjvr; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=oWsQx0IDBOMXWjuLHkl6MC19+E3d1lV6BmWExbD0hPI=; b=rBjnjjvrc5shsG+h
	hepbld+Eau7vDbTA7ZAq9UMNAWSV4xrlZiZugTXNxDlGT4s8kUSbJVO3LLf8r6Zalq6mNGrNET8YL
	86J8dSdzzYC+4P7AK6RLzXsoMZ11zWl99YtFhrnuRvaE6aGexXFrQRwqj0/xidRi4YkG0q71xmjCo
	cnPnSWdGalKd0eruKhhymhZc4e8vSpVvvxbS787FIiw/7URf3ZOlZdyEVtFGYGu9vKqsQYdOlmL6X
	ZFNwE8xTfEDgvAlVjCLew657zHCJadqFO1SAOOCcw4azTJ+k5CIirARttzhvRPJOXe3xj/B7ro5cn
	Hxp2UxTMErmBQCrADg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAvZP-002Wcl-1c;
	Sat, 25 May 2024 17:52:40 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	charles-antoine.couret@nexvision.fr,
	isely@pobox.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] media: gs1662: remove unused struct 'gs_reg_fmt_custom'
Date: Sat, 25 May 2024 18:52:27 +0100
Message-ID: <20240525175229.100559-2-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240525175229.100559-1-linux@treblig.org>
References: <20240525175229.100559-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'gs_reg_fmt_custom' is unused since the original
commit 7aae6e2df127 ("[media] Add GS1662 driver, a video
serializer").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/spi/gs1662.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/spi/gs1662.c b/drivers/media/spi/gs1662.c
index dc5c4c055d29..7adf55fd0707 100644
--- a/drivers/media/spi/gs1662.c
+++ b/drivers/media/spi/gs1662.c
@@ -55,14 +55,6 @@ struct gs_reg_fmt {
 	struct v4l2_dv_timings format;
 };
 
-struct gs_reg_fmt_custom {
-	u16 reg_value;
-	__u32 width;
-	__u32 height;
-	__u64 pixelclock;
-	__u32 interlaced;
-};
-
 static const struct spi_device_id gs_id[] = {
 	{ "gs1662", 0 },
 	{ }
-- 
2.45.1


