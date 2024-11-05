Return-Path: <linux-media+bounces-20949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76289BD26B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 17:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D97A51C2233E
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AE21D8E1A;
	Tue,  5 Nov 2024 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=nicemail.eu header.i=@nicemail.eu header.b="EENh0dyl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC910154BEE
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730824508; cv=none; b=cZvS/TqF4YTp0IPVfeZ+fgXbMxiSdk2Lw7F1UoGIz07JFBkr9J+oGyXuoSSqpBSeHZe7Izz8aHqjFdk/7+8Pq2Y85D+7KxbWCZ5kPRilDORDCQaFuSqTQvtItMgrHplMFl6Jx2yJTmbkbcOVi2YpBB0jDshZqyfMX91IT8VQZXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730824508; c=relaxed/simple;
	bh=aEfjPuaTlvPbZPwuw/xir/EwKuDCvloG2ecMCqONHCU=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=ivXyPcSrHMtcCc1b+33WIKTgE+L28exgpsYvbE+RrJn7JQ8JR0ZVWlg4Sucm+Q/Hsccf6oCwid1Ks2oTSgRD/+CtHnJxWe0CdAFHLlOcctcfWCEm0AkFfg0/Ve6JqTd6zV+FtGtZd27y8jUDED5lZLRlQlnHM1c61hX09m6Cldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nicemail.eu; spf=pass smtp.mailfrom=nicemail.eu; dkim=pass (4096-bit key) header.d=nicemail.eu header.i=@nicemail.eu header.b=EENh0dyl; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nicemail.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nicemail.eu
Received: from hermippe.uberspace.de (hermippe.uberspace.de [185.26.156.84])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id BAAAE1801EB
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 17:26:10 +0100 (CET)
Received: (qmail 21398 invoked by uid 988); 5 Nov 2024 16:26:10 -0000
Authentication-Results: hermippe.uberspace.de;
	auth=pass (login)
Received: from unknown (HELO unkown) (::1)
	by hermippe.uberspace.de (Haraka/3.0.1) with ESMTPSA; Tue, 05 Nov 2024 17:26:10 +0100
Date: Tue, 5 Nov 2024 17:26:08 +0100 (GMT+01:00)
From: rayquaza-intermittent-comb@nicemail.eu
To: linux-media@vger.kernel.org
Message-ID: <a379eec2-b57b-4dd8-97cf-2018893670b3@nicemail.eu>
Subject: Infrared Nuvoton w836x7hg - TX possible?
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <a379eec2-b57b-4dd8-97cf-2018893670b3@nicemail.eu>
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.001859) SUBJECT_ENDS_QUESTION(1) MIME_GOOD(-0.1)
X-Rspamd-Score: 0.89814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=nicemail.eu; s=uberspace;
	h=from:to:subject:date;
	bh=aEfjPuaTlvPbZPwuw/xir/EwKuDCvloG2ecMCqONHCU=;
	b=EENh0dylI7GQRSDTryEFfJFAaG85EKM1pqkE2e39yCfNZSN4xAKaxVOcQKwFFVLEw1G7STo01j
	vZMD6sUWIFolox5L/CgtlGvZvF7SABSLAnTpz3N0f8EBtYiLZ35Gc9PuClZoP4ixbYoSCIV7WQ5t
	K/GcEbd6PbUH9EVq+4zCLP3GZXE86USgZk0i1wbxTV4vH6Js76JOwZh0Qi7Ql/oAlur4M2YdGe67
	Z2PtHlxu4SSmY2NjqSJU6CACn8Q3AAXjBodlg3NwxZELiCsRQsCX6QTOAVVrT0MKMA2HLjxoTI62
	G3lJD2LonghJnJgeF1qAav4uDwEUUufd+94YPQX50sTlUHjlDwi4GKY6eRqyO3mNbN6SWAlrfaW2
	eRzd+BEfb11VLg0mqBq8+a18Ft+diFjjlSAEkDNAeJT6Gd6JsIEPUL5uYAPELow1FaDTMAcR6i8j
	FoBRYkCDtPMsFCeUA80kIKGrt2PQz5b1KFrwkJ2Z+H392CAkayYskjOQrUG/4rQwQSJ1CU4Yeu6T
	HrrcJqkufeduIvdYPLnrbw9PocOGhn9XFFap35PUbPVdP9befRFyZl3TwwGz/9uFXEcg/UKUEngB
	yOknXpccNlHLlT4MfMuSV8MUlu6NtSqPnsNeR7JDfpCrnFZO5poC000X75LzRTNCBG2mW8iVNjSL
	w=

Morning,

I want to automate some weird things and I have an old intel thing with such an infrared chip around.
Lirc freshly installed on Debian finds the device and receives stuff from remotes. But lirc says the hardware can not transmit. Could this be by config or does that mean the hardware is definitely not capable of transmitting?

