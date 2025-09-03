Return-Path: <linux-media+bounces-41647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5179B419FF
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96BB8683A3D
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AB42F1FCA;
	Wed,  3 Sep 2025 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zQdYIfra"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC7D2F0C6A
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891687; cv=none; b=ToArChk+vHxrFbwdTis9PR4bsm/hA7vRx8jDii20GfjqghlAtABW2A/Uw2YmMUzLOH7Ub6SGgojo4JIalNLc8UmfiK43t8oa3SRGBum2Z9roesiQ2d4/Cx01vPj17kO3aw9t4hnKMAEq45VJ9P5XezS3J0DvkXJyYIqj9Fsw/80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891687; c=relaxed/simple;
	bh=RDTKu9h7P2J8owWSAM18mx6quxofHLD1wpX6bUaKLbQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=X2QNw5OfkbCFxhqlklbq2DuAlV9k4ZV7npUPc0yEs4u6MRSed+N9Zuyg7v9hMZZaxaKfjsUl2c9fuyGP2zvenpKvmW0Xev9XkT1r+LqC0AruV1OQ2YPNthg7IJ3fuQj4nZYhMiDthYdxnWteLlbBkbaLo5UlwSpVDn53GxNFva8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zQdYIfra; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b042eb3ac03so193205366b.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756891684; x=1757496484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TiPNCvnjapcrlxfeGYfsAXzGtFUSy9Sla5QKQ86OmtE=;
        b=zQdYIfrawp+Tqv86ghfr2nDkUq1UVAcpALUXaeG5DubS7s/2sU263H2at9WDyuNK/n
         lUT79fIJRhUW3TdgKbMpAdkGsrMlbCuYgN2t8803x4CcQprG97I84T7NcgLRTnUosUk8
         vgR085vkcCBf7q4krX1MnNRCettNMoOnG+TrtF5LIr2tKRMrjuj/V6GWb3WFjDuhJqlt
         siuvsFiZCEZvZLMZ1TB/Yduvp+IWAdnZN0xcxRRlfCt/GKBQ6ZawsNyQT55cWQB++d3b
         u5bmYOtXW9C7zwCvkeOazRHcPamUSF9lrE+q1WaWjer8byk4CCKQFizp/wj5W5UljFau
         H9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891684; x=1757496484;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiPNCvnjapcrlxfeGYfsAXzGtFUSy9Sla5QKQ86OmtE=;
        b=qoW3KrFx1KivpnLRDC66WWCzYb+QKuGskx95iH4bq8wZEP6cfR93lI4yfduuQ1GMiF
         t/wPHnwL2sIgbxxK+Mq/8Ezmy9frKYAiQYVywuNGueLhSjsMbXkxOXIqL3BuZPy5uoe2
         bUT3OHGJmk3OqYomvBFFB09zgvi89XpBPDjwV+9G2JW570gxXF6TXjsDXFTCxWLBtdFM
         RPnpUR1cHE5ky0qzJFcic44ze2TAyHgHAi4IPKVJSaxB+lPz60DmraO6mtOx+QmUf6gV
         3HosVKahnXHTRqM42nPNP1w/ROTl5CIGiMJ48J2UhbH9GknjILmmDnsVMU106TftiBKA
         HRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYEjmkUOeaBOPg8M9KVQMW5NRftbFixpaIpQn0iIIxQR07+uXglHHHVcqzXJvg4uyq7x+P0WV5bYkfJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Wrb0VWUv/8FamT6ZOSQO7NNJZTOr/MHv1Bju9DjCip4pjxGi
	bjaCqaEgjtJ2Sa65QsKdD+i8e10VrUrcvOmNVBrzA0kXehM92KLloNg1ILC3WGD34QxvKh7HNPJ
	R6AFrnIT0fQ==
X-Google-Smtp-Source: AGHT+IFH5XwKUXYHk/3S5VJI7dgKyWD/UZ8O7WJTKCucvA63LhSVX1nX4l6gGeMpjYHCtQk+b/SuYYxHvsCs
X-Received: from ejclj9.prod.google.com ([2002:a17:907:1889:b0:b04:54de:8bcb])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9494:b0:afc:a18f:65e9
 with SMTP id a640c23a62f3a-b01d8c9018fmr1590592566b.27.1756891684064; Wed, 03
 Sep 2025 02:28:04 -0700 (PDT)
Date: Wed,  3 Sep 2025 09:27:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250903092754.2751556-1-abarnas@google.com>
Subject: [RFC PATCH v2 0/2] staging: media: atomisp: Refactor bit logic
 helpers in vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Refactor proposition for bit operation in vmem.c.
* Previous name for function "inv_subword()" for me is not telling what
function acctualy does - it clears bit specified by subword, so renamed
to clear_subword()
* Added a helper to create a proper bitmask for a subword, without using
GENMASK(end-1, start) which was claimed to be unsafe
* Simplified subword() and clear_subword() to be more readable.

Continuation of https://lore.kernel.org/linux-staging/20250902073841.233856=
8-1-abarnas@google.com/=20

Adrian Barna=C5=9B (2):
  staging: media: atomisp: Change name to better follow its behavior
  staging: media: atomisp: Simplify logic in vmem.c

 .../pci/hive_isp_css_common/host/vmem.c       | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

--=20
2.51.0.355.g5224444f11-goog


