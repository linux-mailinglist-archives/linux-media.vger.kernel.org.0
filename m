Return-Path: <linux-media+bounces-64296-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vw1BMpkOKGrm9AIAu9opvQ
	(envelope-from <linux-media+bounces-64296-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:01:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 894AE660561
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:01:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=UhT3PFX+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64296-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64296-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C36D9308FCB7
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 12:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C68040FDA5;
	Tue,  9 Jun 2026 12:49:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687C3264D7
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 12:49:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009392; cv=none; b=FT3pwVjp+iZVnowv3N+Igidar5kVoGfy/NkVhSa+ljHpwLCmA+Or1OBld0dzzPuzr0LFjf7jL0/QqC88TgiRZXuOtVpIb4cCXPPqkw5MEh4YqvOucoALKTAXRQEeHgIClmYkjoakpNWWm2dYhA2OFNpoTMKRN9Fmn+rr15ajpO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009392; c=relaxed/simple;
	bh=yWG1//6eSYCf6Ceiqu0BknpGk9v9Eya1CawzugXlns0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQjUKtUJtmIdYRvLrBngMTictMJhokkdUWvJCImDCBamKAGnQVDOOeR612x7eev4QbKjM7cP2n6UWHkUpRehBtTaQyn8+jiU03JGLDukG+iP4/2/WcTMjmc6hH92asDfa0I8sCH6Y3LBEw+U2dPKZ+s1+a5CQ/LfEr2CvmRaWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UhT3PFX+; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781009390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SOdBE7oL952SjO08s2bJ9ASsmbCIRDtKBu1NVQQCy3o=;
	b=UhT3PFX+eVmaexF4saBc2I4hrcbSFLXSs6+B/0uhgijdWTl25MlMaM2pYNHtXVeFIKxGyW
	6YwCuRZ1HnBgvzIEEqoroO6Zt0LpnNn5vq4BOGzoOlLqPtDRyMui0uMzfBnYC2dq//YV80
	BM3ocdB+Ol3WCyo56hoD27kUPoCaFhE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-_eCmcTiMNWubbQa72F6HyA-1; Tue,
 09 Jun 2026 08:49:47 -0400
X-MC-Unique: _eCmcTiMNWubbQa72F6HyA-1
X-Mimecast-MFC-AGG-ID: _eCmcTiMNWubbQa72F6HyA_1781009385
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C4261955EAA;
	Tue,  9 Jun 2026 12:49:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.87])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CEBBE3008B38;
	Tue,  9 Jun 2026 12:49:40 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v4 0/3] Add Sony IMX471 camera sensor driver
Date: Tue,  9 Jun 2026 20:49:23 +0800
Message-ID: <20260609124926.1038981-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hpa@redhat.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64296-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,siliconsignals.io,gmail.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-media@vger.kernel.org:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 894AE660561

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

Changes in v4:
1. Add TBE20A0 (found on Lenovo X1 Carbon G14) to the supported sensors list.
2. Revert the sensor upside-down list to v1.
3. Decrease the max analog gain to 800 to mitigate the image flickering problem.
4. Return the error value when __v4l2_ctrl_modify_range() fails.
5. Fix indentation issue in Kconfig.
6. Fix the cci error value issue.
7. Drop unnecessary comments.
8. Drop unused link_freq control variable.

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
  media: ipu-bridge: Add Sony IMX471 for Lenovo X1 Carbon G14
  media: i2c: imx471: Add Sony IMX471 image sensor driver

 MAINTAINERS                          |   6 +
 drivers/media/i2c/Kconfig            |  10 +
 drivers/media/i2c/Makefile           |   1 +
 drivers/media/i2c/imx471.c           | 949 +++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |  34 +
 5 files changed, 1000 insertions(+)
 create mode 100644 drivers/media/i2c/imx471.c

-- 
2.54.0


