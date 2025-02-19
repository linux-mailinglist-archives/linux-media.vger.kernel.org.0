Return-Path: <linux-media+bounces-26321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA67A3B41A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9CE518987AD
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 08:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91091DE2C6;
	Wed, 19 Feb 2025 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNYbvHPH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D09E1C7019;
	Wed, 19 Feb 2025 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953972; cv=none; b=Q8+9FQOde+v5UYF60DD8iJZlapiulsy5Y+c7Nlv71ZrznmJHhLPR40vsmPlT/h+VVJHbMe9QVuhMNEm6yZ/VViY+E4efzTaGm4p8aCPAlfp1LoC2ENP2ZywZ74zhjk/b9DxHK78N5C9TX7VSeuBmPWOmNxUC9w7gQJyV0dajyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953972; c=relaxed/simple;
	bh=dpp4qyIMyF9Zjj8hBit/kiPWhv8Tsh4yLBwdy/oLV7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+Fa5Pomj16sFvCt/y+mibAHL8uNhhW6MZhzoP+rj5sTrmMh1JXMF/ouxhNPHoPvc4kGRZfki/tKjsu2iLbzTlMz35MTZzXw5VwD7LJ+nWJoWpyx9H0eD0kzRIq4vtHdINHGF8S4Kv0LyvVO81UggSzfBIIiFhInI5nlnvspqqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNYbvHPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8BAC4CEE7;
	Wed, 19 Feb 2025 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739953971;
	bh=dpp4qyIMyF9Zjj8hBit/kiPWhv8Tsh4yLBwdy/oLV7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mNYbvHPHc/9E7jcpK6rMPaBalq+I85teunOusdpmMnnMZBjd3XTE3MLxXbwGn+Khs
	 vifc8SvjP9uNGUSUIZ+/ZHOW9ilPYd5JPnJMLijP9GLQ2o6b7j5VnJaWx89ijc/45R
	 Tf+3heHqLze0H88SxDeIyF/lKCct7/dDsN7FwwqFJLwD/hU9cWTlv5OH4I+vO7UT0G
	 hTtGz6ifQM9/+pVtYFOwRjghkdEhPSa2aUmLa+PymNJtpFaURwMQ/qEBE2IZQXHXLM
	 zsVmT4ReagerAFr6JRgWBZb3LsmICXuEnvFNKwyvUb2WOd+8Ie3ToFAzMtyxoxkf4A
	 19GctKkeKkqJQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tkfVh-0000000Gv4P-48Az;
	Wed, 19 Feb 2025 09:32:49 +0100
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
Subject: [PATCH 02/27] drivers: media: intel-ipu3.h: fix identation on a kernel-doc markup
Date: Wed, 19 Feb 2025 09:32:18 +0100
Message-ID: <8cad70e8f536c1a963c6b827347df1f7052fc5e5.1739952783.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739952783.git.mchehab+huawei@kernel.org>
References: <cover.1739952783.git.mchehab+huawei@kernel.org>
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


