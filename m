Return-Path: <linux-media+bounces-60682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG9sDMSQ+2m/cgMAu9opvQ
	(envelope-from <linux-media+bounces-60682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 21:04:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EDB4DF97D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 21:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D64E1301C6F6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 19:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981DE28B4FA;
	Wed,  6 May 2026 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwkfVMUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E972E76026
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778094265; cv=none; b=jEKqx7X3UxaTAGHbcJNGMIkjKIpKiElRCQW1s9czeB0vd2pv395nXaslv2BzbH+jI/+SDvwPA1MxHRytrQzxJCIhFTzLrKLGhd8m9jAZbCj5o72ag/AY1Q8IEE+CqWYNcKCqcebYJSvs3WQNHF88UD6mQDctp3v/5+ww+zWRV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778094265; c=relaxed/simple;
	bh=Qm47VOHilI0Ekcg9Bgb7zRDq/m8oX4UXAkYaFL3YqOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aOaP1xp5sejAgyUXL4dVaMleybX7aQneGsAuBb3CtRKYpiXYbeLXLCUvHTDoLu5+S9/cJ7/9EBF8Q7T6ja72jA08a+P1df4aelI8IG0ryU+wb3xXFJ8rjz9Js4OWpfy19GImlTKIBuuVzPMKDo+IihpabVypKDJuedbvVs5T0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwkfVMUY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-835386ff122so3898288b3a.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778094263; x=1778699063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xr8j6cYh4BuqZiBygDpRH8RzfRjXC+SyaJhk/f1cXX4=;
        b=QwkfVMUYhvRigNRDyr1rhCzgRsN5a5RXtJ2Do/eIW7x84ynYfLuD1lIc7fydjQrWdi
         MDOX2kJfo0lrzOKDKFRZdUuRA1+NnTrXkgOcNstSnKwdK6YCnxDjVROUUPWWakmcUAgn
         49Wcbomumvjvlr9eQeMebGYMqa5ivL9Gjrew+PdvhZyPVGqRDu5o+K5+1sphNkSO/anB
         6t7JSC+9ghYBacn67gbRkq9tTta+SX33bK7ASTcGqgof5YJeI038kpByjOoafxRXUoil
         3XQLeOnr9b+tqMwOCfUrR99uxbC9+RVthmEEdFyIDZNkVVYQv8cU7Db2Um/BSBwAxUY3
         KvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778094263; x=1778699063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr8j6cYh4BuqZiBygDpRH8RzfRjXC+SyaJhk/f1cXX4=;
        b=ABPWPk2fK0fcTaib8e3ryD800ZUGE7i2W6t0RsSdvFoJg/gozq87usvahK2aPDrv4U
         OzEQ+gYYPLPN6EebMd01hC5Dm7oriUAq24JJ9Ju7hIZiH/ro3jjIumzKn542DrnorVuH
         1CNu47i9nU4OC1EiQtSEhzI4hRSjoKpVoSAv7O7WpLgto1P9wHJHCkHUTArdrvEC8zyi
         bcfqfzUf54uMuj3DA9NgdG7W0TJAxl1i7ACzGkx9jGQFYLaGqkGH0Dt+wacuxoI2v9OJ
         sWqR9/wrNq8tpc0kfd2tqw389UNWVQrj0nVnb82ojHQcP2grUve0ptqDmGKcrzC5BBX3
         J9uA==
X-Forwarded-Encrypted: i=1; AFNElJ+M1Cc9i6GR51Jgrw6WAa7gXccxKa9AEwrJ2L9TFv6300jO8uRJEG78/VhqA04kIGEWKyjC8nKglzt8GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfkULohPljQGTOTsOarObWly01i0FbpFpUQlAEQKrxX/EgpusG
	el66oHW63LFG4slYGFLGkPeRpVoVVGGX+7w/LeS0e7gXfDwMQk0lZ6g5
X-Gm-Gg: AeBDietXEWTG0lQPtCRaoPEe3nleCp/gTQZYYDIVKPz0cGbyXfKsDDyj4Z6Cxbb5643
	wP1VLWkg+nTtrEyWmqstBu423Kn8eDOmRP1Kj/b5iNzACPbXISoDIPS0LX3JYqO+IgXl7tBjVrr
	gwlk2pyrfZeDtDk6Ww8O8+4/jrn7fB/VzjgT5u810dtFzqzQ2PHG5jpyDSasMKZ4DI/hr2Jgq4X
	8DEu/I0xFqqhYCC1h/ug9HzWuJNRtfI2el9hxFWs2y/H3eJuVY9uMDhAbbNaOaDcV9bvxYFoIdL
	hcFZAnPjHnpCLRFQJw4Y4UGwFkC889ocSUKPWmooLhMELaZLwkmnYl+ES5/lH/RSClllYUUq1/q
	McyYxfzhKTWJIXulCqsJVE871PUdi3qo1EaNNeCRugnaUX35nr/BTsjSJhG35oGu2vY0GcJimI8
	DwGZZopnDOMDoaeDRFagftJCtmmKYs0oF78bV/HdA8wbyMGtsJRaw5yWzOcs1vOAko0i+G9odis
	K0lj2WRsuWurZKULvcPLXbtuYulviZEV1phptkbYGQ=
X-Received: by 2002:a05:6a20:938e:b0:38b:d9b5:5de2 with SMTP id adf61e73a8af0-3aa5ac51514mr5193061637.50.1778094263002;
        Wed, 06 May 2026 12:04:23 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242ac9146sm3063347a12.8.2026.05.06.12.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:04:22 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: atomisp: mark pmic_name array as const
Date: Thu,  7 May 2026 00:33:40 +0530
Message-ID: <20260506190341.272469-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 96EDB4DF97D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60682-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The pmic_name array is not modified after initialization and is only used
for used for lookup. Mark it as 'static const char *const' to place it in
read-only memory and prevent accidental modification.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..d32d98720455 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char *const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.43.0


