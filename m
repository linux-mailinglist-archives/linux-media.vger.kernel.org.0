Return-Path: <linux-media+bounces-62553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APVpABrLD2obPwYAu9opvQ
	(envelope-from <linux-media+bounces-62553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 05:18:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A75AE49E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 05:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF70F304D71C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 03:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CB0313E24;
	Fri, 22 May 2026 03:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqHzF6oG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4F285058
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 03:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779419506; cv=none; b=dEio31a5bmyGlhc5E9QW0UnxIzFHxsP3u68fjGc9WSSsxc4i4wjvU2VB2kyHD33hYkGkcwvUrAN66hziii03CFGgfUMVXFeTSg5ISdGk/YMp5qQi5VXqvF+p+7Rksx2p1rRSa86LHZoFrV2JlO0m+2GtIv7OusiLBZyqauiE0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779419506; c=relaxed/simple;
	bh=D3vHqPLuIGGyEhyIojoaxdhyH4N1KjdLgY0iTJL4i6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=II/Kv4s8x+ad9Ig9jOF3L7wd7OWIMkTz4cvCejHl7FKLZ3qkwTYQVRwm24xoe0HTnM9sG59MnIRX6FhilVqNGmFjYr0w4Np+SmgjjA9lTnjqH3Fpyq0hXuJeMXC//0We3dZ1JOXJT04Do3URosGKRkASGuzGdN6cwufddp4v3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqHzF6oG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779419502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5tO5Ng0FXj7mZMqmWHnptwAYgii2rUGDhjpFXTYlcn8=;
	b=bqHzF6oGsc10A4Ei+70aI00wFTgU4g9gVV+dPjm31l+ynto1kMG4FaV4hMAfFVOUKy/7JW
	Gkr7oxsLeKAeb69ofsXnQFhrPIKEdVUoyr9QUx1LNoO5FyvN7DKdQ9vnVAkp/9VF/F8s9N
	n8JJ6QDL7KWO6bcjgwyeOZzFG8L+CJk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-OhuiFOqWNQqb1RypQdCwAA-1; Thu,
 21 May 2026 23:11:38 -0400
X-MC-Unique: OhuiFOqWNQqb1RypQdCwAA-1
X-Mimecast-MFC-AGG-ID: OhuiFOqWNQqb1RypQdCwAA_1779419495
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09CEE1800451;
	Fri, 22 May 2026 03:11:35 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.61])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D25CC19560A3;
	Fri, 22 May 2026 03:11:30 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 0/3] Add Sony IMX471 camera sensor driver
Date: Fri, 22 May 2026 11:11:18 +0800
Message-ID: <20260522031121.11968-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62553-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6F5A75AE49E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset adds the Sony IMX471 camera sensor driver to the Linux
kernel and resolves the IPU7 camera can't work issueon Lenovo X9
laptops [1].

The patchset contains two patches:
1. Add DMI information of Lenovo X9 to the image upside-down list
2. Add Sony IMX471 image sensor driver

The IMX471 driver can be found in the Intel ipu6-drivers repository [2].
To comply with the sensor driver implementation, the clean-up work
includes:

1. Use CCI register helpers.

2. Enable and disable streams using enable_streams and disable_streams
   functions in struct v4l2_subdev_pad_ops. Invoke
   v4l2_subdev_s_stream_helper() to manage the streaming state.

3. Get rotation information from fwnode properties using
   v4l2_fwnode_device_parse().

4. Finalizes the initialization of the subdev, including allocation of
   the active state using v4l2_subdev_init_finalize().

5. Add the IMX471 driver to the Makefile and Kconfig file.

6. The mutex lock is managed by the V4l2 core.

7. Replace the supported link frequency with v4l2_link_freq_to_bitmap().

8. Drop unused codes.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2454119
[2] https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c

Changes in v3:
1. Naming the register addresses and set up the value with the correct value length.
2. Implement the .get_selection().
3. Drop "identified" field from struct imx471.
4. Drop "streaming" field from struct imx471 and use the __v4l2_ctrl_grab() instead.
5. Moreover, The naming for the register can be found in a seperated patch. If we
   agree with the patch, I will squash it into one patch.

Changes in v2:
1. Change the Bayer format setting according to the vertical and horizontal flip settings.
2. Replace the self-owned mutex with the v4l2 subdev state.
3. Rework the flip control.
4. Manage the regulators using devm_regulator_bulk_get|disable|enbale API
5. Invoke devm_v4l2_sensor_clk_get to get clock-frequency


Kate Hsuan (3):
  media: ipu-bridge: Add DMI information of Lenovo X9 to the image
    upside-down list
  media: i2c: imx471: Add Sony IMX471 image sensor driver
  media: i2c: imx471: Naming the register

 MAINTAINERS                          |    6 +
 drivers/media/i2c/Kconfig            |   10 +
 drivers/media/i2c/Makefile           |    1 +
 drivers/media/i2c/imx471.c           | 1010 ++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |   14 +
 5 files changed, 1041 insertions(+)
 create mode 100644 drivers/media/i2c/imx471.c

-- 
2.54.0


