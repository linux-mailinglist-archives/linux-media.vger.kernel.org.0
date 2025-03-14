Return-Path: <linux-media+bounces-28201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8EA60E64
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 11:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA323BC81B
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECE61EF09A;
	Fri, 14 Mar 2025 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jg+VM00z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5C11EEA4E
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947103; cv=none; b=I/lEZIVXsrWcawuTyJzRUNwjRsLYiEWciA0m1wf4bqRj/w2Q+gAP3+xwlBW7xXpee/FShN0TYz0rzCL2oLBzIHjCxjJsCGQVjYX1sjFJlp4NpyVsglSAOMmXNNDPNu+fnCD0LHpodTtCxi/RgRLcK6Fy2TybkoVTGV6t6kMwyxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947103; c=relaxed/simple;
	bh=kTVPwgOugGkT5Jrg0Yo5pirbfTvjX9UerUHDE9tqU+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+9uKIen5E84v6/R7JdvCQ2KrvBZN0TLJ/4yajhHV48Xw3jiP2JWN8Qj/Ap2OdAhzr15azwl409xnpt8rQg/HF4mKL5fL2VyoY6o8N5RP6q0wE0MFdMasoiK+IL6XGzLd87V92w81k3CAkFEUnbVz1UJC7XGi0M/LQ/aMHvZd0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jg+VM00z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741947100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xdlhtp/fKVcdydo3NdWZOFw3Vtmlm/vm+N2N2Yf61KU=;
	b=Jg+VM00z386CPAYjPL+IXwo3GAaYa1O2U8upfV84xuPD/2bVgq93LMpQAswklsgf4NiApM
	AXz1lI9jovA7vWIMbMZILMBTiLQKNsQWetFYxF8OGYh+j8HWsmOSkGrJ4Ydq0um/umjZIS
	TquOcIIGRTnp6XhrZEy5WVOP+24LPL4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-Np8FQZKfP4agz8OLm3KQCQ-1; Fri,
 14 Mar 2025 06:11:37 -0400
X-MC-Unique: Np8FQZKfP4agz8OLm3KQCQ-1
X-Mimecast-MFC-AGG-ID: Np8FQZKfP4agz8OLm3KQCQ_1741947096
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D344418001E1;
	Fri, 14 Mar 2025 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.225.107])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 27582180175A;
	Fri, 14 Mar 2025 10:11:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v9 0/1] media: i2c: Add Omnivision OV02C10 sensor driver
Date: Fri, 14 Mar 2025 11:11:24 +0100
Message-ID: <20250314101125.9853-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi All,

Here is v9 of the patch to upstream the OV02C10 sensor driver originally
writen by Intel.

This is the same as v8, but then with everything squashed back together
into a single patch again.

Changes in v8:
- Many changes, so many that this has been posted as an incremental
  series on top of v7. See individual commits for change details:
  https://lore.kernel.org/linux-media/20250313184314.91410-1-hdegoede@redhat.com/

Changes in v9:
- Squashed everything back into a single patch again
- Dropped Heimir's and Stanislaw's Tested-by tags since much
  has changed since v7

Regards,

Hans


Heimir Thor Sverrisson (1):
  media: i2c: Add Omnivision OV02C10 sensor driver

 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ov02c10.c | 1012 +++++++++++++++++++++++++++++++++++
 3 files changed, 1023 insertions(+)
 create mode 100644 drivers/media/i2c/ov02c10.c

-- 
2.48.1


