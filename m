Return-Path: <linux-media+bounces-26774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF54A41849
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1503A2CE6
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0250E24BBE3;
	Mon, 24 Feb 2025 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/9u3+jR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E760245014;
	Mon, 24 Feb 2025 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740388143; cv=none; b=T1+SzYiNWDbHRWwx2dtxN1T6/XAxaFHLvfwNj/xt0NNZWMzzMgvq82aVrB29Q3M3HPUOwcWPdIDwTHAmmLlp2MIPVu2CmWPcTUS3PdZxuxN1JH4YA+Rh41ldCOuSoXcFHaKI5y8oXWgR0L5ahLTEK8ST3L+HxLZyKjU7TI1zWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740388143; c=relaxed/simple;
	bh=dpp4qyIMyF9Zjj8hBit/kiPWhv8Tsh4yLBwdy/oLV7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRv5uvk0H6Vs/fT9G479FRsUFKKHxbz0vG0T+7nwE2k+KAkmCdz/Hx8VhIbro8waXarqotTE3SjVDnLHyDuhJQFpxQNZJAW8vNjrcDYrDBfPMk/8rDCxp1FQ09IOUlT2Jolq/5Rq29EN6w5B2e9rj7q5FF777LWXmIpm4TuN+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/9u3+jR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1B1C4CEE6;
	Mon, 24 Feb 2025 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740388142;
	bh=dpp4qyIMyF9Zjj8hBit/kiPWhv8Tsh4yLBwdy/oLV7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a/9u3+jRgg6iZd8RCVDU+IBEo+pwPqDyjRQVV2RdAGuGPfurluMpA+Y2BBJjlXrWG
	 7uOAuoV/LB/ccvKauo+xSZ9RLRIYFvUIySR+SdVqXHGJehljnHZ75cCTzzLEMOkgsN
	 YddazHOJSy9OBTaBlBt6dDDjz/kiE1dCRbm8cLF8rBSWdby1F+U/6SzwsRKV1Ikpe/
	 3QpPCpmnB2650/O9z7K2Gm7v/aVnLXk1W4Z9h0UFe3e6fGMdOkyMkUNMo4QMJERHbo
	 uiOnqLOlo9FR1k/ceIZvs5ihY71TM/MRpvLpIa9LUu028gRG7K97RvDUWxSJzj90uN
	 7K4e7TDpZM9rg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tmUSS-00000003p3Y-3V3g;
	Mon, 24 Feb 2025 10:09:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 02/39] drivers: media: intel-ipu3.h: fix identation on a kernel-doc markup
Date: Mon, 24 Feb 2025 10:08:08 +0100
Message-ID: <96cd1068aa8ec0a072528082670ccb8aa3704f70.1740387599.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740387599.git.mchehab+huawei@kernel.org>
References: <cover.1740387599.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The "Rule" description is part of y_calc parameter. Having a line
starting at the beginning makes it part of the function description
instead, which is not the original intent.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index 4aa2797f5e3c..8b85524beb59 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -322,7 +322,8 @@ struct ipu3_uapi_ae_config {
  *			0: positive, 1: negative, default 0.
  * @y_calc:	Pre-processing that converts Bayer quad to RGB+Y values to be
  *		used for building histogram. Range [0, 32], default 8.
- * Rule:
+ *
+ *		Rule:
  *		y_gen_rate_gr + y_gen_rate_r + y_gen_rate_b + y_gen_rate_gb = 32
  *		A single Y is calculated based on sum of Gr/R/B/Gb based on
  *		their contribution ratio.
-- 
2.48.1


