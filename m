Return-Path: <linux-media+bounces-57809-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO2YOzobzGnHPgYAu9opvQ
	(envelope-from <linux-media+bounces-57809-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:06:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 866F03705B5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D99E30A6B0D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 19:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103FE3806C4;
	Tue, 31 Mar 2026 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEOydX9d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E937883C
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983754; cv=none; b=bAiGCE38IkSPGRMyQN4wqrfWsXpukzJzqBXGq6jSvuNUdHNd3DSYnOvu+MTySyhE/rpk7iosHEW1COL0cqYjeno7CbtduX8tqHHXfDyliBYWYZnbUTbreOcfBao33z99uBE+ZGBdiydS9oxwsheqQuNYWDSet580JROH3pr3BPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983754; c=relaxed/simple;
	bh=n7pxdP3NutertzQrpcwj+Jq4Eqqy35tZYqnMwDyr290=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MuKGAO3SRQYXNMl/Txm+LVfHoQpBgcXWSiLu/zjOBVCI09ZvWaDlzL69cRrZTAug+HFncdzbzslwJDWzBcSWhWUsaDJYSNNSLsfW0Zz1OWmYQ0YWSlWdTv3Fa1K/E3hrJ06wJvNVefxH5Bzqy2OO0QWUCE3Qf8+HBpEIZnx30vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEOydX9d; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2bb0fe3bbso1255990e87.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774983751; x=1775588551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o+6kHCPf4wlJqyHEaCIPrdqV/gDB1Un5qcKvDT4uk+4=;
        b=kEOydX9diFm5i5PYqboQkWy7WihzDG9GVmqJOfqrBUy0ncIG0QaAopfPHp5u5ndGqF
         6Nn3v5YPjs6/p5wNxqmaXKGDG89y8vvcuGCQewHWLjMcDVpZvrVUuGyxfE1D2Ly3+46X
         TVgHb2dYU6nK8sbmkgMLDcRzvbDN2wjUzaEuIERAvanZ++4spnC8SrgLPPrE7kA64qhy
         +EQl2YujSlU73xl0QkBK3JqTxFVNX/eRH5bzxK5m9OhRxLDI0FGWeAKIT5JFNxMlVYLi
         fmS8Ee8NE7wnruEEnK0cl9wbM9v1xCMaNM7gqOZqqcNk4jdBgmJeN7OvnS6/JglF0qk5
         J96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983751; x=1775588551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+6kHCPf4wlJqyHEaCIPrdqV/gDB1Un5qcKvDT4uk+4=;
        b=pZxCqzb8VlExfzvorDZIYB24b/PlPRTgdIGWW1j0jRP+h3ozVZe82AH5DgogAzQ7+A
         UPkpmEGetDIijHcosxmDGUigdlbvVwz05dljqAQFfW6UGzMNcUSYz2FKuKT05VPLk2tU
         IqG0wQyQcX1kfXIxMNMJ+xxiWV/U2G9oXIBMFRYrF/ov7oDcfTmhOfcUp5cxdAUgnuS0
         yWPC8qHQMFfXWEDsZ1JYVHqL5cH6WWl+I3SYhk83zYXPPC+qbU+5r5aaHqZMpjKM9M6o
         YYn5Gm/WNRzRTWnUiKAWJtE0tFMlCcSqntKAjh38d+s8eJpPn1dDvWOkELKUBoDUOS8O
         tBiA==
X-Forwarded-Encrypted: i=1; AJvYcCUuwfzRjb3Xo/FD7ELOxB7U1/d2zpQuKBo35Vigty3tqz6stcq6tHQmPSqM0CJSRwY9Ma9sWhlvailErQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDtoifxjVSizmXRe4F9HVbUkxSxFhqSw9l/wM6+dMwbTUteV2L
	ieXFzKb3A6zqcbzftGd7opLPwD9WYyytDfszCYYArMHhfEkPYcd198iwpzBLZKXi
X-Gm-Gg: ATEYQzxJtuTbbPSqhHBIxVOfWDA7UVyw26jj8/u29t/zxO6cNHzX+KGNyQLZh/radXt
	0e1JIJxjSG2pze6QGpO8UiuUQ4hsOQXdz+nGK2UYvyEdrdAVHGU+biksng2ehVhvbIJbpJvnMcB
	ochbXwAUmhP2au4a+tpUjXO9smVomYd5aSWohw6TOuM2KO33P3I/7QzERM29wmlExcAxDHqlYoQ
	kUjDADhRHXN/7H4Mhu7E6ePjssWoRc2+0sWyrpCfonzUYDFK4Z7f7A4qr3rLvifH8FW9HeJXKWi
	ai+5ficlUS9TQxsqlJ4lLyyNtcTqSHOItip/5XyUBKhVFKR5MSskEWi6Z1e5T0NyNqEeDX+PrlN
	GaC8j/U6/0QJCnTAtqYh891Bb6nWm2N9JLUWjBtHpGyDiCejMtWvuiLAWx7sOiP68icazr0NFeb
	adqGm6kjsjvAqRykl3uoWOTRa+3cEzvmoC4nTjG34JmF2cwDf5dWHZ6tQu2jMEL/A7ihqbtk7EA
	4lT81f8HRgWbclzYdWojNvo9QWeBKY92r1oqFesIU/Du87pwJUBsnU/0R0E1Rf8yQUZNRPJDwFf
	vhX8Ag==
X-Received: by 2002:a05:6512:a8c:b0:5a2:ae27:c879 with SMTP id 2adb3069b0e04-5a2c1f22265mr173606e87.29.1774983751052;
        Tue, 31 Mar 2026 12:02:31 -0700 (PDT)
Received: from dell16 (h-217-27-177-229.A444.priv.bahnhof.se. [217.27.177.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1406a8fsm2657368e87.31.2026.03.31.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:02:11 -0700 (PDT)
From: Lukas Larson <lukaslarson@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Larson <lukaslarson@gmail.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor quirk for Dell 16 Premium DA16250
Date: Tue, 31 Mar 2026 21:01:43 +0200
Message-ID: <20260331190145.11592-1-lukaslarson@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57809-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukaslarson@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 866F03705B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On the Dell 16 Premium DA16250 laptop, the camera sensor (OVTI02C1) is
mounted upside-down, resulting in a flipped image in userspace
applications.

Add this model to the upside_down_sensor_dmi_ids list to provide the
necessary 180-degree rotation quirk so the image is oriented correctly.

Signed-off-by: Lukas Larson <lukaslarson@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 32cc95a766b7..ec2056c268de 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -104,6 +104,13 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
  * without reporting a rotation of 180° in neither the SSDB nor the _PLD.
  */
 static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 16 Premium DA16250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-- 
2.53.0


