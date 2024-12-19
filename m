Return-Path: <linux-media+bounces-23833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA959F8425
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 464DB7A2854
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17F41A2389;
	Thu, 19 Dec 2024 19:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qi1tUvDy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922A1ABED8
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636336; cv=none; b=BktrJQrzKLIkCBWicRb8x578gYIYZIRJOjzMPBQbS7lSR1BFrMvAR7H7IvasFOsFonXT01Gp6pI/l/PBsJpqqFi+S6N3Pry36/uA//3+Ff8dr0pAA4iC4zb3RdMDHHrjBUBl0TiP/rABuYca0uQL/FeAJ6f9mpMdEYURJ92E4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636336; c=relaxed/simple;
	bh=hpiRGdZ8w4Jjriu1LltuJczFalxglTcNtuN8woVIMKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SMoIun+/wNLPMqlepWSWC6w9vsQj8K48T1jIl+bU3Bx4ka6Yt8AtumcX/TKBu6gVTcEgLENBV4DBVyHl9s4y8/Q8/vePA5bKVkFxZMJCTyEZ2aJzbmxHZpJMI3oVfzBmJVse8f16Qb0mQJJg5iWMKs8RGubJNxJbaSlkJMr13w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qi1tUvDy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734636333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dVhqKLV1rWOusPydcdv9RP/ToD/CsuzqBxPeQ21koWM=;
	b=Qi1tUvDyNdZFjwtRsBm7okUvQwGGl5z/atxO0tpgid1SvW+A2JL41J5WIlGXKB/1T8U81Y
	huxwJ/qPFQzetbsNiLHkVdTbUyElsY6i8N6btTsNRlgcgX0Y6D3MezuBd9pkLpWlqoUQ69
	nyoi787PClO+bP7SG+i+Qy659R6ltbY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-kynEscrJOI6YGFZxyvbEEw-1; Thu,
 19 Dec 2024 14:25:31 -0500
X-MC-Unique: kynEscrJOI6YGFZxyvbEEw-1
X-Mimecast-MFC-AGG-ID: kynEscrJOI6YGFZxyvbEEw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC3D61955F44;
	Thu, 19 Dec 2024 19:25:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB17B19560A2;
	Thu, 19 Dec 2024 19:25:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: ov08x40: Error logging improvements
Date: Thu, 19 Dec 2024 20:25:25 +0100
Message-ID: <20241219192527.45561-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi All,

Here are 2 small ov08x40 driver error logging improvements.

Note these 2 patches apply on top of my series from earlier today:
https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/

Regards,

Hans


Hans de Goede (2):
  media: ov08x40: Add missing '\n' to ov08x40_check_hwcfg() error
    messages
  media: ov08x40: Don't log ov08x40_check_hwcfg() errors twice

 drivers/media/i2c/ov08x40.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

-- 
2.47.1


