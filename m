Return-Path: <linux-media+bounces-48958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C26CC6678
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DC5631152F3
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C5A33EB1D;
	Wed, 17 Dec 2025 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="JzcildxI"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60333E371;
	Wed, 17 Dec 2025 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956785; cv=none; b=ZYeJzgJgvaVygPzhjJKdrLYwbFcB+5jqWaayzHDebQZgBQNDE4GGp4C/mcasX1qkwxMsobk5bl7AQH4Fxu1kROJGRIyv2CSzneuR3N9Mq7eU6nJ0bzsm3mW4ztsrVyaCl7Ji+7nPtfjmQ3LOz3J31fDCIMtySdmMMdd8Es2xPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956785; c=relaxed/simple;
	bh=ULVZe8rtj/kVw6eMiuJ3+YF2+r9T6slmKP8Ml5Gjqr8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z2Tes0CAowRMrtY/jXJOApB4W/q2wjk5frQFV9D+h4XaqeNuh7wtHbTZmQgk2BUGurtJr4E43l1j4+i1L2s1jaMpMdmPs9HIo8tFFVR6626qE8JoKReszZ/Ol3HdRG60YAWXdOTaFlFi26l2ZltDfQLYPR8NZfff8enXJ+y3Wok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=JzcildxI; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uYag+waXNsN5EZQZZINBQSyGkMb9oF8+wzlxHMer1pE=; b=JzcildxIelPPE9DOkfgJS4NTmf
	n0kErtLimHWvTssFmGkLoTtYBZbCbzYy4HOl53ihfawt97FK1vQ99q1r57lMYarhS2nT/5ITouxy/
	HeKoOk8ICExjrqSzW50qXJYxZhycpB0q1ldj4GCKw1xivauwZD6mmo4b9jhSIm6fKgHU=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:58335 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vVlbl-00DjfJ-Di; Wed, 17 Dec 2025 08:06:01 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH 0/3] drivers: media: imx283 extensions
Date: Wed, 17 Dec 2025 08:05:59 +0100
Message-Id: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdWQmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3czcCiMLY93UihJdU0szi0QzU4uUpFQzJaCGgqLUtMwKsGHRsbW
 1AKv0tzhcAAAA
X-Change-ID: 20251216-imx283-ext-5968a658dbe6
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Add support for selecting the MIPI clock mode (continuous, non-continuous)
and general register debugging.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Matthias Fend (3):
      media: dt-bindings: imx283: add clock-noncontinuous
      media: i2c: imx283: add support for non-continuous MIPI clock mode
      media: i2c: imx283: implement {g,s}_register

 .../devicetree/bindings/media/i2c/sony,imx283.yaml |  2 +
 drivers/media/i2c/imx283.c                         | 56 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
---
base-commit: f7231cff1f3ff8259bef02dc4999bc132abf29cf
change-id: 20251216-imx283-ext-5968a658dbe6

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


